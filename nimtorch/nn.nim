# extremely wip , dont use

import ../nimtorch
import nn/init
import math

{.experimental: "callOperator".}

type
  Module = object of RootObj
    forward: proc(input: Tensor): Tensor

  LinearModule = object of Module
    in_features: int
    out_features: int
    weight: Tensor
    bias: Tensor

proc `()`*(m: Module; input: Tensor): Tensor {.inline.} = m.forward(input)

proc reset_parameters*(m: var LinearModule) =
  m.weight = init.kaiming_uniform(m.weight, a = math.sqrt(5.float))
  
  if not m.bias.isNil:
    let
      (fan_in, _) = init.calculate_fan_in_and_fan_out(m.weight)
      bound = 1 / math.sqrt(fan_in.float)
    m.bias = init.uniform(m.bias, -bound, bound)

proc Linear*(in_features, out_features: int; bias: bool = true): LinearModule =
  var m: LinearModule
  
  m.in_features = in_features
  m.out_features = out_features
  
  m.weight = torch.zeros(@[out_features, in_features])
  if bias:
    m.bias = torch.zeros(@[out_features])
  
  m.forward = proc (input: Tensor): Tensor =
    let step1 = input.matmul(m.weight.t())
    if not m.bias.isNil:
      return step1 + m.bias
    else:
      return step1

  m.reset_parameters()
  
  return m

when isMainModule:
  var
    m = nn.Linear(2, 10)
    inputs = torch.tensor([[1.0, 2.0]])
    res = m(inputs)
  print(res)