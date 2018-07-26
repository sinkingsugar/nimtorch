import ../torch as torch

# WIP

{.experimental: "callOperator".}

type
  Module = object of RootObj
    f: proc(input: Tensor): Tensor

proc `()`*(m: Module; input: Tensor): Tensor {.inline.} = m.f(input)

proc Linear*(in_features, out_features: int; bias: bool = true): Module =
  discard

when isMainModule:
  var
    m = nn.Linear(2, 10)
    inputs = torch.tensor([[1.0, 2.0]])
    res = m(inputs)