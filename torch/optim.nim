import tables
import ../torch

type
  ParameterGroup = object
    lr: float
    weight_decay: float
    momentum: float
    dampening: float
    nesterov: bool
    params: seq[Tensor]

  ParameterState = object
    momentum_buffer: Tensor

  Optimizer* = ref object of RootObj
    param_groups: seq[ParameterGroup]
    state: Table[pointer, ParameterState]
    defaults: ParameterGroup

  SgdOptimizer* = ref object of Optimizer

proc init(self: Optimizer; params: openarray[Tensor]; defaults: ParameterGroup) =
  self.state = initTable[pointer, ParameterState]()
  self.defaults = defaults
  self.param_groups = @[defaults]
  self.param_groups[0].params = @params

proc zero_grad*(self: Optimizer) =
  for group in self.param_groups:
    for p in group.params:
      if not p.grad.isNil:
        p.grad.detach_inplace()
        p.grad.zero_inplace()

method step*(self: Optimizer; closure: proc(): Tensor = nil) {.base.} = discard

proc SGD*(params: openarray[Tensor]; lr: float; momentum: float = 0; dampening: float = 0; weight_decay: float = 0; nesterov: bool = false): SgdOptimizer =
  new result

  assert(lr >= 0.0, "Invalid learning rate: " & $lr)
  assert(momentum >= 0.0, "Invalid momentum value: " & $momentum)
  assert(weight_decay >= 0.0, "Invalid weight_decay value: " & $weight_decay)
  assert(not nesterov or (momentum > 0.0 or dampening == 0.0), "Nesterov momentum requires a momentum and zero dampening")
    
  let defaults = ParameterGroup(
    lr: lr,
    momentum: momentum,
    dampening: dampening,
    weight_decay: weight_decay,
    nesterov: nesterov
  )

  result.Optimizer.init(params, defaults)

proc step*(self: SgdOptimizer; closure: proc(): Tensor = nil): Tensor =

  if closure != nil:
    result = closure()

  for group in self.param_groups:
    let
      weight_decay = group.weight_decay
      momentum = group.momentum
      dampening = group.dampening
      nesterov = group.nesterov

    for i, p in group.params:
      if p.grad.isNil:
        continue

      var d_p = p.grad.data
      if weight_decay != 0:
        d_p.add_inplace(weight_decay, p.data)

      if momentum != 0:
        let param_state = addr self.state.mgetOrPut(cast[pointer](p), ParameterState())
        var buf: Tensor
        if param_state.momentum_buffer.isNil:
          buf = zeros_like(p.data)
          param_state.momentum_buffer = buf
          buf.mul_inplace(momentum).add_inplace(d_p)
        else:
          buf = param_state.momentum_buffer
          buf.mul_inplace(momentum).add_inplace(1 - dampening, d_p)

        if nesterov:
          d_p = d_p.add(momentum, buf)
        else:
          d_p = buf

      p.data.add_inplace(-group.lr, d_p)
