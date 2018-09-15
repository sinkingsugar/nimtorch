# extremely wip , dont use

import ../nimtorch
import nn/init
import math

{.experimental: "callOperator".}

type
  Module = ref object of RootObj
    forward: proc(input: varargs[Tensor]): Tensor

  LinearModule = ref object of Module
    in_features: int
    out_features: int
    weight*: Tensor
    bias*: Tensor

  BilinearModule = ref object of LinearModule
    in2_features: int

proc `()`*(m: Module; input: varargs[Tensor]): Tensor {.inline.} = m.forward(input)

proc reset_parameters*(m: LinearModule) =
  m.weight = init.kaiming_uniform(m.weight, a = math.sqrt(5.float))
  
  if not m.bias.isNil:
    let
      (fan_in, _) = init.calculate_fan_in_and_fan_out(m.weight)
      bound = 1 / math.sqrt(fan_in.float)
    m.bias = init.uniform(m.bias, -bound, bound)

proc Linear*(in_features, out_features: int; bias: bool = true): LinearModule =
  var m: LinearModule
  new m
  
  m.in_features = in_features
  m.out_features = out_features
  
  m.weight = torch.zeros(@[out_features, in_features])
  if bias:
    m.bias = torch.zeros(@[out_features])
  
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

proc reset_parameters*(m: BilinearModule) =
  let bound = 1 / math.sqrt(m.weight.size(1).float)
  
  m.weight = init.uniform(m.weight, -bound, bound)

  if not m.bias.isNil:
    m.bias = init.uniform(m.bias, -bound, bound)

proc Bilinear*(in1_features, in2_features, out_features: int; bias: bool = true): BilinearModule =
  var m: BilinearModule
  new m
  
  m.in_features = in1_features
  m.in2_features = in2_features
  m.out_features = out_features
  
  m.weight = torch.zeros(@[out_features, in1_features, in2_features])
  if bias:
    m.bias = torch.zeros(@[out_features])
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