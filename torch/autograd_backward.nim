import sets, sequtils
import tensors, tensor_ops

iterator reverse*[T](a: openarray[T]): T =
  for i in countdown(a.high, 0):
    yield a[i]

proc backward*(tensors, grads: openarray[Tensor]; retain_graph = false; create_graph = false) =

  when defined inference:
    raiseAssert("Backward pass is not supported in inference mode")

  else:
    for i, tensor in tensors:
      assert(tensor.requires_grad, "Input " & $i & " has no gradient information. Did you use a non-differentiable function?")

    var
      sortedNodes: seq[Tensor]
      gradFuncs: HashSet[pointer]

    gradFuncs.init()

    proc visit(node: Tensor) =
      # Gradient along this path is not needed
      if not node.requires_grad:
        return

      # Gradient is not defined, so don't evaluate inputs
      if node.grad_fn == nil:
        return

      # Already executed this backward function through this node,
      # or another output of this function
      if gradFuncs.containsOrIncl(cast[pointer](node.grad_fn)):
        return

      for input in node.grad_fn.inputs:
        visit(input)

      sortedNodes.add(node)

    # Topologically sort the graph
    for node in tensors:
      visit(node)

    # Set initial gradients
    for i, tensor in tensors:
      tensor.grad = grads[i]

    # Accumulate grads
    set_grad_enabled(create_graph):
      for node in sortedNodes.reverse:

        # Consume intermediate gradients
        var grad_outputs: seq[Tensor]
        for output in node.grad_fn.outputs:
          grad_outputs.add(output.grad)
          output.grad = nil

        let grad_inputs = node.grad_fn.apply(grad_outputs)
        for i, input in node.grad_fn.inputs:
          if input.requires_grad:

            # Undo broadcast that might have occured in the forward pass
            let grad = grad_inputs[i].sum_to(input.sizes)

            # Sum up gradient or initialize it if not present
            if input.grad.isNil:
              input.grad = grad
            elif not create_graph:
              input.grad.add_inplace(grad)
            else:
              input.grad += grad

        # Free the graph
        # TODO: Check if this behavior matches pytorch properly
        if not create_graph and not retain_graph:
          # Encourage garbage collection
          node.grad_fn.outputs = @[]
          node.grad_fn.inputs = @[]
          node.grad_fn = nil
    
    # Issue #16, GC being lazy about cleaning up garbage
    when not defined useRealtimeGC:
      GC_fullCollect()

proc backward*(tensor, grad: Tensor; retain_graph = false; create_graph = false) =
  backward([tensor], [grad], retain_graph, create_graph)

proc backward*(tensor: Tensor; retain_graph = false; create_graph = false) =
  backward(tensor, ones_like(tensor), retain_graph, create_graph)