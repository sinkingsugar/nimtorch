import ../../../torch, ../modules, ../functional
import math

type
  ConvolutionModule* = ref object of LinearModuleBase
    kernel_size: seq[int]
    stride: seq[int]
    padding: seq[int]
    dilation: seq[int]
    transposed: bool
    output_padding: seq[int]
    groups: int

proc ConvNd*(in_channels, out_channels: int; kernel_size, stride, padding, dilation: openarray[int]; transposed: bool; output_padding: openarray[int], groups: int, bias: bool): ConvolutionModule =

  assert(in_channels mod groups == 0, "in_channels must be divisible by groups")
  assert(out_channels mod groups == 0, "out_channels must be divisible by groups")

  new result
  let m = result

  m.in_features = in_channels
  m.out_features = out_channels
  m.kernel_size = @kernel_size
  m.stride = @stride
  m.padding = @padding
  m.dilation = @dilation
  m.transposed = transposed
  m.output_padding = @output_padding
  m.groups = groups

  if transposed:
    m.weight = zeros(@[in_channels, out_channels div groups] & m.kernel_size)
  else:
    m.weight = zeros(@[out_channels, in_channels div groups] & m.kernel_size)
    m.weight.requires_grad = true

  if bias:
    m.bias = zeros([out_channels])
    m.bias.requires_grad = true

  m.forward = proc(input: varargs[Tensor]): Tensor =
    convolution(input[0], m.weight, m.bias, m.stride, m.padding, m.dilation, m.transposed, m.output_padding, m.groups)

  m.reset_parameters()

method reset_parameters*(self: ConvolutionModule) =
  var n = self.in_features
  for k in self.kernel_size: n *= k

  let stdv = 1 / sqrt(n.float)
  self.weight.data.uniform_inplace(-stdv, stdv)
  if not self.bias.isNil:
    self.bias.data.uniform_inplace(-stdv, stdv)

proc Conv1d*(in_channels, out_channels, kernel_size: int; stride: int = 1; padding: int = 0; dilation: int = 1; output_padding: int = 0, groups: int = 1, bias: bool = true): ConvolutionModule =
  ConvNd(in_channels, out_channels, [kernel_size], [stride], [padding], [dilation], false, [output_padding], groups, bias)

proc Conv2d*(in_channels, out_channels: int;
  kernel_size: openarray[int]; stride: openarray[int] = [1, 1]; padding: openarray[int] = [0, 0];
  dilation: openarray[int] = [1, 1]; output_padding: openarray[int] = [0, 0],
  groups: int = 1; bias: bool = true): ConvolutionModule =
  ConvNd(in_channels, out_channels, kernel_size, stride, padding, dilation, false, output_padding, groups, bias)

proc Conv3d*(in_channels, out_channels: int;
  kernel_size: openarray[int]; stride: openarray[int] = [1, 1, 1]; padding: openarray[int] = [0, 0, 0];
  dilation: openarray[int] = [1, 1, 1]; output_padding: openarray[int] = [0, 0, 0],
  groups: int = 1; bias: bool = true): ConvolutionModule = 
  ConvNd(in_channels, out_channels, kernel_size, stride, padding, dilation, false, output_padding, groups, bias)

proc ConvTranspose1d*(in_channels, out_channels, kernel_size: int; stride: int = 1; padding: int = 0; dilation: int = 1; output_padding: int = 0, groups: int = 1, bias: bool = true): ConvolutionModule =
  ConvNd(in_channels, out_channels, [kernel_size], [stride], [padding], [dilation], true, [output_padding], groups, bias)

proc ConvTranspose2d*(in_channels, out_channels: int;
  kernel_size: openarray[int]; stride: openarray[int] = [1, 1]; padding: openarray[int] = [0, 0];
  dilation: openarray[int] = [1, 1]; output_padding: openarray[int] = [0, 0],
  groups: int = 1; bias: bool = true): ConvolutionModule =
  ConvNd(in_channels, out_channels, kernel_size, stride, padding, dilation, true, output_padding, groups, bias)

proc ConvTranspose3d*(in_channels, out_channels: int;
  kernel_size: openarray[int]; stride: openarray[int] = [1, 1, 1]; padding: openarray[int] = [0, 0, 0];
  dilation: openarray[int] = [1, 1, 1]; output_padding: openarray[int] = [0, 0, 0],
  groups: int = 1; bias: bool = true): ConvolutionModule = 
  ConvNd(in_channels, out_channels, kernel_size, stride, padding, dilation, true, output_padding, groups, bias)

when isMainModule:
  let
    m = Conv1d(1, 2, 5)
    inputs = ones([1, 1, 10])
    res = m(inputs)
  print(res)
