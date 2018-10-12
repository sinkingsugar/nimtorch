import ../../torch
import init, functional
import math

{.experimental: "callOperator".}

type
  Module* = ref object of RootObj
    forward*: proc(input: varargs[Tensor]): Tensor

  LinearModuleBase* = ref object of Module
    in_features*: int
    out_features*: int
    weight*: Tensor
    bias*: Tensor

  LinearModule* = ref object of LinearModuleBase

  BilinearModule* = ref object of LinearModule
    in2_features: int

proc `()`*(m: Module; input: varargs[Tensor]): Tensor {.inline.} = m.forward(input)

method cpu*(m: Module) {.base.} = discard

method cuda*(m: Module) {.base.} = discard

method parameters*(self: Module): seq[Tensor] {.base.} = discard

method reset_parameters*(m: Module) {.base.} = discard

proc zero_grad*(self: Module) =
  when not defined inference:
    for param in self.parameters():
      if not param.isNil and not param.grad.isNil:
        param.grad.detach_inplace()
        param.grad.zero_inplace()
  
  else:
    raiseAssert("zero_grad is not supported in inference mode")

method reset_parameters*(m: LinearModuleBase) =
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
    linear(input[0], m.weight, m.bias)

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

  m.forward = proc (input: varargs[Tensor]): Tensor =
    return bilinear(input[0], input[1], m.weight, m.bias)

  m.reset_parameters()
  
  return m

when isMainModule:
  let
    m = nn.Linear(2, 10)
    inputs = tensor([[1.0, 2.0]])
    res = m(inputs)
  print(res)
