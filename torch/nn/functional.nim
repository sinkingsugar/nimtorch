import ../../torch
import strformat

proc linear*(input, weight: Tensor; bias: Tensor = nil): Tensor {.inline.} =
  # Change from PyTorch: Transpose on the last 2 dimensions, so stacked models are supported
  result = input.matmul(weight.transpose(-2, -1))
  if not bias.isNil:
    result = result + bias

proc bilinear*(input1, input2, weight: Tensor; bias: Tensor = nil): Tensor =

  assert(input1.dim() == input2.dim(), fmt"bilinear(): input dimensions do not match: got {input1.dim()} and {input2.dim()}")
  for i in 0 ..< input1.dim() - 1:
    assert(input1.size(i) == input2.size(i),
      fmt"bilinear(): input batch dimensions do not match at dim {i}: got {input1.size(i)} and {input2.size(i)}")

  assert(input1.size(input1.dim() - 1) == weight.size(1), fmt"bilinear(): input1 size does not match weight size: got {input1.size(input1.dim() - 1)} but expected {weight.size(1)}")
  assert(input2.size(input2.dim() - 1) == weight.size(2), fmt"bilinear(): input2 size does not match weight size: got {input2.size(input2.dim() - 1)} but expected {weight.size(2)}")
  assert(not bias.is_defined() or bias.size(0) == weight.size(0), fmt"bilinear(): bias size does not match weight size: got {bias.size(0)} but expected {weight.size(0)}")

  var output_size: seq[int]
  let size1 = input1.sizes()
  for i in 0 ..< size1.len - 1:
    output_size.add(size1[i])
  output_size.add(weight.size(0))

  let
    input1_flattened = input1.view([-1, input1.size(-1)])
    input2_flattened = input2.view([-1, input2.size(-1)])
  result = trilinear_impl(input1_flattened, weight, input2_flattened, [1, 3], [0], [1, 2], [2, 3]).reshape(output_size)
  
  if bias.is_defined():
    result = result + bias

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

proc max_pool1d_with_indices*(input: Tensor; kernel_size: int = 0; stride: int = kernel_size; padding: int = 0; dilation: int = 1; ceil_mode = false): tuple[output, indices: Tensor] =
  let (output, indices) = max_pool2d_with_indices(input.unsqueeze(2), [1, kernel_size], [1, stride], [0, padding], [1, dilation], ceil_mode)
  return (output.squeeze(2), indices.squeeze(2))
 
proc max_pool1d*(input: Tensor; kernel_size: int = 0; stride: int = kernel_size; padding: int = 0; dilation: int = 1; ceil_mode = false): Tensor =
  max_pool1d_with_indices(input, kernel_size, stride, padding, dilation, ceil_mode)[0]

proc adaptive_max_pool1d*(input: Tensor; output_size: int): tuple[output, indices: Tensor] =
  let (output, indices) = adaptive_max_pool2d(input.unsqueeze(2), [1, output_size])
  return (output.squeeze(2), indices.squeeze(2))

proc avg_pool1d*(input: Tensor; kernel_size: int = 0; stride: int = kernel_size; padding: int = 0; ceil_mode = false; count_include_pad: bool = true): Tensor =
  avg_pool2d(input.unsqueeze(2), [1, kernel_size], [1, stride], [0, padding], ceil_mode, count_include_pad)

proc adaptive_avg_pool1d*(input: Tensor; output_size: int): Tensor =
  adaptive_avg_pool2d(input.unsqueeze(2), [1, output_size])
  
proc gru_cell*(input, hidden, w_ih, w_hh, b_ih, b_hh: Tensor): Tensor =
   
  # Change from PyTorch: We handle additionsl dimension, so stacked models are supported
  if input.is_cuda() and input.ndimension == 2:
    let
      igates = matmul(input, w_ih.t())
      hgates = matmul(hidden, w_hh.t())

    # Slice off the workspace argument (it's needed only for AD).
    return thnn_fused_gru_cell_impl(igates, hgates, hidden, b_ih, b_hh)[0]   

  let
    igates = linear(input, w_ih, b_ih)
    hgates = linear(hidden, w_hh, b_hh)
    chunked_igates = igates.chunk(3, -1)
    chunked_hgates = hgates.chunk(3, -1)

    reset_gate = sigmoid(chunked_igates[0] + chunked_hgates[0])
    input_gate = sigmoid(chunked_igates[1] + chunked_hgates[1])
    new_gate = tanh(chunked_igates[2] + reset_gate * chunked_hgates[2])

  return new_gate + input_gate * (hidden - new_gate)

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