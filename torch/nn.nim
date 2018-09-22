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

  LinearModule* = ref object of Module
    in_features: int
    out_features: int
    weight*: Tensor
    bias*: Tensor

  BilinearModule* = ref object of LinearModule
    in2_features: int

proc `()`*(m: Module; input: varargs[Tensor]): Tensor {.inline.} = m.forward(input)

method cpu*(m: Module) {.base.} = discard

method cuda*(m: Module) {.base.} = discard

method reset_parameters*(m: LinearModule) {.base.} =
  m.weight = init.kaiming_uniform(m.weight, a = math.sqrt(5.float))
  
  if not m.bias.isNil:
    let
      (fan_in, _) = init.calculate_fan_in_and_fan_out(m.weight)
      bound = 1 / math.sqrt(fan_in.float)
    m.bias = init.uniform(m.bias, -bound, bound)

method cuda*(m: LinearModule) =
  m.weight = m.weight.cuda()
  if not m.bias.isNil:
    m.bias = m.bias.cuda()

method cpu*(m: LinearModule) =
  m.weight = m.weight.cpu()
  if not m.bias.isNil:
    m.bias = m.bias.cpu()

proc Linear*(in_features, out_features: int; bias: bool = true): LinearModule =
  var m: LinearModule
  new m
  
  m.in_features = in_features
  m.out_features = out_features
  
  m.weight = torch.zeros(@[out_features, in_features])
  m.weight.requires_grad = true
  if bias:
    m.bias = torch.zeros(@[out_features])
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

# iterator parameters*(self: LinearModule): Tensor =
#   yield self.weight
#   yield self.bias

proc parameters*(self: LinearModule): seq[Tensor] = @[self.weight, self.bias]

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
  
  m.weight = torch.zeros(@[out_features, in1_features, in2_features])
  m.weight.requires_grad = true
  if bias:
    m.bias = torch.zeros(@[out_features])
    m.bias.requires_grad = true
  else:
    var emptyList: IntList
    m.bias = torch.zeros(emptyList)
  
  m.forward = proc (input: varargs[Tensor]): Tensor =
    return torch.bilinear(input[0], input[1], m.weight, m.bias)

  m.reset_parameters()
  
  return m

when isMainModule:
  var
    m = nn.Linear(2, 10)
    inputs = torch.tensor([[1.0, 2.0]])
    res = m(inputs)
  print(res)