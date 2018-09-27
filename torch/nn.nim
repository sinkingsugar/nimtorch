import ../torch
import nn/init
import math

{.experimental: "callOperator".}

type
  Reduction* {.pure.} = enum
    None
    ElementwiseMean
    Sum

  LossFunction* = proc(a, b: Tensor): Tensor

proc MSELoss*(reduction: Reduction = Reduction.ElementwiseMean): LossFunction =
  return proc(a, b: Tensor): Tensor = mse_loss(a, b, reduction.ord)

type
  Module* = ref object of RootObj
    forward: proc(input: varargs[Tensor]): Tensor

  LinearModuleBase* = ref object of Module
    in_features: int
    out_features: int
    weight*: Tensor
    bias*: Tensor

  LinearModule* = ref object of LinearModuleBase

  BilinearModule* = ref object of LinearModule
    in2_features: int

proc `()`*(m: Module; input: varargs[Tensor]): Tensor {.inline.} = m.forward(input)

method cpu*(m: Module) {.base.} = discard

method cuda*(m: Module) {.base.} = discard

method parameters*(self: Module): seq[Tensor] {.base.} = discard

proc zero_grad*(self: Module) =
  when not defined inference:
    for param in self.parameters():
      if not param.isNil and not param.grad.isNil:
        param.grad.detach_inplace()
        param.grad.zero_inplace()
  
  else:
    raiseAssert("zero_grad is not supported in inference mode")

method reset_parameters*(m: LinearModuleBase) {.base.} =
  m.weight = kaiming_uniform(m.weight, a = math.sqrt(5.float))
  
  if not m.bias.isNil:
    let
      (fan_in, _) = calculate_fan_in_and_fan_out(m.weight)
      bound = 1 / math.sqrt(fan_in.float)
    m.bias = uniform(m.bias, -bound, bound)

method cuda*(m: LinearModuleBase) =
  m.weight = m.weight.cuda()
  if not m.bias.isNil:
    m.bias = m.bias.cuda()

method cpu*(m: LinearModuleBase) =
  m.weight = m.weight.cpu()
  if not m.bias.isNil:
    m.bias = m.bias.cpu()

proc Linear*(in_features, out_features: int; bias: bool = true): LinearModule =
  var m: LinearModule
  new m
  
  m.in_features = in_features
  m.out_features = out_features
  
  m.weight = zeros(@[out_features, in_features])
  m.weight.requires_grad = true
  if bias:
    m.bias = zeros(@[out_features])
    m.bias.requires_grad = true
  
  m.forward = proc (input: varargs[Tensor]): Tensor =
    assert(not m.bias.isNil)
    assert(not m.weight.isNil)
    let step1 = input[0].matmul(m.weight.t())
    if not m.bias.isNil:
      return step1 + m.bias
    else:
      return step1

  m.reset_parameters()
  
  return m

method parameters*(self: LinearModuleBase): seq[Tensor] = @[self.weight, self.bias]

method reset_parameters*(m: BilinearModule) =
  let bound = 1 / math.sqrt(m.weight.size(1).float)
  
  m.weight = init.uniform(m.weight, -bound, bound)
  m.weight.requires_grad = true

  if not m.bias.isNil:
    m.bias = init.uniform(m.bias, -bound, bound)
    m.bias.requires_grad = true

proc Bilinear*(in1_features, in2_features, out_features: int; bias: bool = true): BilinearModule =
  var m: BilinearModule
  new m
  
  m.in_features = in1_features
  m.in2_features = in2_features
  m.out_features = out_features
  
  m.weight = zeros(@[out_features, in1_features, in2_features])
  m.weight.requires_grad = true
  if bias:
    m.bias = zeros(@[out_features])
    m.bias.requires_grad = true
  else:
    var emptyList: IntList
    m.bias = zeros(emptyList)
  
  m.forward = proc (input: varargs[Tensor]): Tensor =
    return bilinear(input[0], input[1], m.weight, m.bias)

  m.reset_parameters()
  
  return m

type
  ConvolutionModule = ref object of LinearModuleBase
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

  let stdv = 1 / math.sqrt(n.float)
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
  block:
    let
      m = nn.Linear(2, 10)
      inputs = tensor([[1.0, 2.0]])
      res = m(inputs)
    print(res)

  block:
    let
      m = nn.Conv1d(1, 2, 5)
      inputs = ones([1, 1, 10])
      res = m(inputs)
    print(res)
  