import macros
import tensors

proc requires_grad_internal*(self: Tensor): bool {.inline.} =
  not self.isNil and self.requires_grad

proc requires_grad_internal*(self: openarray[Tensor]): bool {.inline.} =
  for tensor in self:
    if not tensor.isNil and tensor.requires_grad:
      return true

template capture*(name: untyped): untyped =
  when name is openarray | varargs:
    let name {.used.} = @`name`

macro autograd*(head, body: untyped): untyped =

  result = newStmtList()

  let
    name = head
    nameText = $name
    gradFnSym = genSym(nskLet)
    resultIdent = ident"result"
    forwardResultIdent = ident"fwd_result"
    gradsIdent = ident"grads"
    gradInputMaskIdent = ident"grad_input_mask"
    forwardBody = newStmtList()
    backwardBody = newStmtList()
    inputIdents = nnkBracket.newTree()

  # Make `grad` available in derivative expressions, as alias for `grads[0]`
  backwardBody.add quote do:
    template grad: Tensor {.used.} = `gradsIdent`[0]
    
  var resultIndex = 0
  for x in body:
    x.expectKind({ nnkCall, nnkPar, nnkProcDef, nnkFuncDef })

    if x.kind in { nnkProcDef, nnkFuncDef }:
      if x.name != ident"forward":
        error("Only a proc named 'forward' is allowed", x)

      # TODO: Handle non-expressions
      let forwardExpr = x.body
      x.name = name
      forwardBody.add quote do:
        `resultIdent` = `forwardExpr`
        let `forwardResultIdent` {.used.} = `resultIdent`    

      # If parameters are non-concrete, captures them as concrete types (e.g. openarray -> seq)
      for i in 1 ..< x.params.len:
        let paramName = x.params[i][0].basename
        forwardBody.add quote do:
          capture(`paramName`)

      x.body = forwardBody

      result.add(x)

    else:
      x[0].expectKind({ nnkIdent, nnkPar })

      # TODO: Handle differentiablility
      if x[0].kind == nnkIdent and $x[0] == "output_differentiability":
        continue

      # Simply assign non-tuples
      var
        requiresGradExpr: NimNode

      let gradExpr = x[1]

      if x[0].kind == nnkIdent:
        let inputIdent = x[0]
        requiresGradExpr = quote do: `inputIdent`.requires_grad_internal
        inputIdents.add(x[0])

        # `gradExpr` is either a Tensor or a TensorList. We can simply add either.
        backwardBody.add quote do:
          if `requiresGradExpr`:
            `resultIdent`.add(`gradExpr`)
          else:
            `resultIdent`.add(nil)

        inc resultIndex

      # Deconstruct result tuple
      else:
        let tupleCount = x[0].len
        backwardBody.add quote do:
          var `gradInputMaskIdent`: StdArray[bool, `tupleCount`]

        var resultExpr = newPar()
        for i, inputIdent in x[0]:
          inputIdent.expectKind(nnkIdent)
          resultExpr.add quote do: `resultIdent`[`resultIndex`]
          requiresGradExpr =
            if requiresGradExpr == nil: quote do: `inputIdent`.requires_grad_internal
            else: quote do: `requiresGradExpr` or `inputIdent`.requires_grad_internal

          inputIdents.add(inputIdent)
          backwardBody.add quote do:
            `gradInputMaskIdent`[`i`] = `inputIdent`.requires_grad_internal
            
          inc resultIndex

        backwardBody.add quote do:
          if `requiresGradExpr`:
            `resultIdent`.setLen(`resultIdent`.len + `tupleCount`)
            `resultExpr` = `gradExpr`

  # No grads required
  if inputIdents.len == 0:
    return       

  # Propagate whether gradient is needed or not
  var
    requiresAnyGradExpr: NimNode
    addInputsStmts = newStmtList()

  for i, inputIdent in inputIdents:
    requiresAnyGradExpr =
      if i == 0: quote do: `inputIdent`.requires_grad_internal
      else: quote do: `requiresAnyGradExpr` or `inputIdent`.requires_grad_internal

    # Make statements to add the differential inputs to `grad_fn.inputs`
    # TODO: Optimize this, so it doesn't do multiple `add`s for single Tensors,
    # e.g. by making overloaded procs for `inputIdents` of [Tensor], [TensorList], etc.
    addInputsStmts.add quote do:
      `gradFnSym`.inputs.add(`inputIdent`)

  forwardBody.add quote do:
    when not defined inference:
      if is_grad_enabled() and `requiresAnyGradExpr`:

        let `gradFnSym` = new BackwardFunction
        `gradFnSym`.apply = proc(`gradsIdent`: openarray[Tensor]): seq[Tensor] =
          `resultIdent` = newSeqOfCap[Tensor](`gradFnSym`.inputs.len)
          `backwardBody`

        `addInputsStmts`

        when `resultIdent` is Tensor:
          `gradFnSym`.outputs = @[`resultIdent`]
          `resultIdent`.requires_grad = true
          `resultIdent`.grad_fn = `gradFnSym`

        else:
          when `resultIdent` is tuple:
            for k, f in `resultIdent`.fieldPairs:
              when f is Tensor:
                `gradFnSym`.outputs.add(f)
                f.requires_grad = true
                f.grad_fn = `gradFnSym`

          elif `resultIdent` is seq:
            `gradFnSym`.outputs = `resultIdent`
            for i in 0 ..< `resultIdent`.len:
              let r = `resultIdent`[i]
              when r is Tensor:
                r.requires_grad = true
                r.grad_fn = `gradFnSym`