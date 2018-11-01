import macros
import tensors

proc requires_grad_internal*(self: Tensor): bool {.inline.} = self.requires_grad

proc requires_grad_internal*(self: openarray[Tensor]): bool {.inline.} =
  for tensor in  self:
    if tensor.requires_grad:
      return true

template capture*(name: untyped): untyped =
  when name is openarray | varargs:
    let name = @`name`

macro autograd*(head, body: untyped): untyped =

  result = newStmtList()

  let
    name = head
    gradFnSym = genSym(nskLet)
    resultIdent = ident"result"
    forwardResultIdent = ident"fwd_result"
    gradsIdent = ident"grads"
    gradInputMaskIdent = ident"grad_input_mask"
    forwardBody = newStmtList()
    backwardBody = newStmtList()
    resultExpressions = nnkBracket.newTree()
    inputIdents = nnkBracket.newTree()

  # Make `grad` available in derivative expressions, as alias for `grads[0]`
  backwardBody.add quote do:
    template grad: Tensor = `gradsIdent`[0]
    
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
        let `forwardResultIdent` = `resultIdent`    

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
      var resultExpr: NimNode
      if x[0].kind == nnkIdent:
        resultExpr = quote do: `resultIdent`[`resultIndex`] 
        inputIdents.add(x[0])
        inc resultIndex

      # Deconstruct result tuple
      else:
        let tupleCount = x[0].len
        backwardBody.add quote do:
          var `gradInputMaskIdent`: StdArray[bool, `tupleCount`]

        resultExpr = newPar()
        for i, inputIdent in x[0]:
          inputIdent.expectKind(nnkIdent)
          resultExpr.add quote do: `resultIdent`[`resultIndex`]
          inputIdents.add(inputIdent)
          backwardBody.add quote do:
            `gradInputMaskIdent`[`i`] = `inputIdent`.requires_grad_internal
          inc resultIndex

      let gradExpr = x[1]

      backwardBody.add quote do:
        when type(`gradExpr`) isnot TensorList:
          #if `varIdent`.requires_grad: `resultIdent`[`resultIndex`] = `gradExpr`
          `resultExpr` = `gradExpr`
        else:
          `resultIdent`= `gradExpr`

  # No grads required
  if inputIdents.len == 0:
    return       

  # Propagate whether gradient is needed or not
  var
    requiresGradExpr: NimNode
    addInputsStmts = newStmtList()

  for i, inputIdent in inputIdents:
    if i == 0:
      requiresGradExpr = quote do:
        `inputIdent`.requires_grad_internal
    else:
      requiresGradExpr = quote do:
        `requiresGradExpr` or `inputIdent`.requires_grad_internal

    # Make statements to add the differential inputs to `grad_fn.inputs`
    # TODO: Optimize this, so it doesn't do multiple `add`s for single Tensors,
    # e.g. by making overloaded procs for `inputIdents` of [Tensor], [TensorList], etc.
    addInputsStmts.add quote do:
      `gradFnSym`.inputs.add(`inputIdent`)

  forwardBody.add quote do:
    when not defined inference:
      if is_grad_enabled() and `requiresGradExpr`:

        let `gradFnSym` = new BackwardFunction
        `gradFnSym`.apply = proc(`gradsIdent`: openarray[Tensor]): seq[Tensor] =
          `resultIdent`.setLen(`gradFnSym`.inputs.len)
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