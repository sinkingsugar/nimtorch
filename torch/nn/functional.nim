import ../../torch

proc linear*(input, weight: Tensor): Tensor {.inline.} = input.matmul(weight.t())

proc linear*(input, weight, bias: Tensor): Tensor {.inline.} = input.matmul(weight.t()) + bias

proc conv1d*(input, weight: Tensor; bias: Tensor = nil; stride: int = 1; padding: int = 0; dilation: int = 1; groups: int = 1): Tensor =
  convolution(input, weight, bias, [stride], [padding], [dilation], false, [0], groups)

proc conv2d*(input, weight, bias: Tensor; stride: openarray[int] = [1, 1]; padding: openarray[int] = [0, 0]; dilation: openarray[int] = [1, 1]; groups: int = 1): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, false, [0, 0], groups)

proc conv3d*(input, weight, bias: Tensor; stride: openarray[int] = [1, 1, 1]; padding: openarray[int] = [0, 0, 0]; dilation: openarray[int] = [1, 1, 1]; groups: int = 1): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, false, [0, 0, 0], groups)

proc conv_transpose1d*(input, weight, bias: Tensor; stride: int = 1; padding: int = 0; output_padding: int = 0, groups: int = 1, dilation: int = 1): Tensor =
  convolution(input, weight, bias, [stride], [padding], [dilation], true, [output_padding], groups)

proc conv_transpose2d*(input, weight, bias: Tensor; stride: openarray[int] = [1, 1]; padding: openarray[int] = [0, 0]; output_padding: openarray[int] = [0, 0], groups: int = 1, dilation: openarray[int] = [1, 1]): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, true, output_padding, groups)

proc conv_transpose3d*(input, weight, bias: Tensor; stride: openarray[int] = [1, 1, 1]; padding: openarray[int] = [0, 0, 0]; output_padding: openarray[int] = [0, 0, 0], groups: int = 1, dilation: openarray[int] = [1, 1, 1]): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, true, output_padding, groups)

when isMainModule:
  var
    x = tensor([
      [ 0.1,  0.2,  0.3,  0.4],
      [-0.1, -0.2, -0.3, -0.4],
      [ 0.5,  0.6,  0.7,  0.8]
    ])

    w_input = tensor([
      [0.9, 0.8, 0.7, 0.6],
      [0.8, 0.7, 0.6, 0.5],
      [0.7, 0.6, 0.5, 0.4],
      [0.6, 0.5, 0.4, 0.3],
      [0.5, 0.4, 0.3, 0.2],
      [0.4, 0.3, 0.2, 0.1]
    ])
  
    res = linear(x, w_input)
  res.print()
