import ../../nimtorch

proc linear*(input, weight: Tensor): Tensor {.inline.} = input.matmul(weight.t())

proc linear*(input, weight, bias: Tensor): Tensor {.inline.} = input.matmul(weight.t()) + bias

when isMainModule:
  var
    x = torch.tensor([
      [ 0.1,  0.2,  0.3,  0.4],
      [-0.1, -0.2, -0.3, -0.4],
      [ 0.5,  0.6,  0.7,  0.8]
    ])

    w_input = torch.tensor([
      [0.9, 0.8, 0.7, 0.6],
      [0.8, 0.7, 0.6, 0.5],
      [0.7, 0.6, 0.5, 0.4],
      [0.6, 0.5, 0.4, 0.3],
      [0.5, 0.4, 0.3, 0.2],
      [0.4, 0.3, 0.2, 0.1]
    ])
  
    res = linear(x, w_input)
  res.print()
