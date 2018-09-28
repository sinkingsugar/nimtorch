import macros
import tensors

proc requires_grad*(self: not Tensor): bool = false

template capture*(name: untyped): untyped =
  when name is openarray | varargs:
    let name = @`name`

macro autograd*(head, body: untyped): untyped =

  result = newStmtList()

  let
    name = head
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
      if x.name.basename != ident"forward":
        error("Only a proc named 'forward' is allowed", x)

      # TODO: Handle non-expressions
      let forwardExpr = x.body
      x.name = nnkPostfix.newTree(ident"*", name)
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
            `gradInputMaskIdent`[`i`] = `inputIdent`.requires_grad
          inc resultIndex

      let gradExpr = x[1]
      backwardBody.add quote do:
        when type(`gradExpr`) isnot TensorList:
          #if `varIdent`.requires_grad: `resultIdent`[`resultIndex`] = `gradExpr`
          `resultExpr` = `gradExpr`
        else:
          `resultIdent`.add(`gradExpr`)


  # Propagate whether gradient is needed or not
  var requiresGradExpr: NimNode
  for i, inputIdent in inputIdents:
    if i == 0:
      requiresGradExpr = quote do:
        `inputIdent`.requires_grad
    else:
      requiresGradExpr = quote do:
        `requiresGradExpr` or `inputIdent`.requires_grad

  forwardBody.add quote do:
    when not defined inference:
      if is_grad_enabled() and `requiresGradExpr`:

        let grad_fn = new BackwardFunction
        grad_fn.apply = proc(`gradsIdent`: openarray[Tensor]): seq[Tensor] =
          `resultIdent`.setLen(`resultIndex`)
          `backwardBody`

        when compiles(grad_fn.inputs.add(`inputIdents`)):
          grad_fn.inputs.add(`inputIdents`)

        when `resultIdent` is Tensor:
          grad_fn.outputs = @[`resultIdent`]
          `resultIdent`.requires_grad = true
          `resultIdent`.grad_fn = grad_fn

        else:
          when `resultIdent` is tuple:
            for k, f in `resultIdent`.fieldPairs:
              when f is Tensor:
                grad_fn.outputs.add(f)
                f.requires_grad = true
                f.grad_fn = grad_fn

          elif `resultIdent` is seq:
            grad_fn.outputs = `resultIdent`
            for i in 0 ..< `resultIdent`.len:
              let r = `resultIdent`[i]
              when r is Tensor:
                r.requires_grad = true
                r.grad_fn = grad_fn