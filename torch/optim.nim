import tables, math
import ../torch

type
  # TODO: Different parameter type per optimizer
  ParameterGroup = object
    params: seq[Tensor]
    lr: float
    weight_decay: float
    momentum: float
    dampening: float
    nesterov: bool

    betas: (float, float)
    eps: float
    amsgrad: bool

  ParameterState = object
    momentum_buffer: Tensor

    step: int
    exp_avg: Tensor
    exp_avg_sq: Tensor
    max_exp_avg_sq: Tensor

  Optimizer* = ref object of RootObj
    param_groups: seq[ParameterGroup]
    state: Table[pointer, ParameterState]
    defaults: ParameterGroup

  SgdOptimizer* = ref object of Optimizer

  AdamOptimizer* = ref object of Optimizer

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

method step*(self: Optimizer) {.base.} = discard

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

method step*(self: SgdOptimizer) =

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

proc Adam*(params: openarray[Tensor]; lr: float = 1e-3; betas: (float, float) = (0.9, 0.999); eps: float = 1e-8; weight_decay: float = 0; amsgrad: bool = false): AdamOptimizer =
  new result
  
  assert(0.0 <= lr, "Invalid learning rate: " & $lr)
  assert(0.0 <= eps,"Invalid epsilon value: " & $eps)
  assert(0.0 <= betas[0] and betas[0] < 1.0, "Invalid beta parameter at index 0: " & $betas[0])
  assert(0.0 <= betas[1] and betas[0] < 1.0, "Invalid beta parameter at index 1: " & $betas[1])

  let defaults = ParameterGroup(
    lr: lr,
    betas: betas,
    eps: eps,
    weight_decay: weight_decay,
    amsgrad: amsgrad
  )

  result.init(params, defaults)

method step*(self: AdamOptimizer) =

  for group in self.param_groups:
    for i, p in group.params:
      if p.grad.isNil:
        continue

      var d_p = p.grad.data
      if group.weight_decay != 0:
        d_p.add_inplace(group.weight_decay, p.data)

      assert(not p.grad.is_sparse, "Adam does not support sparse gradients, please consider SparseAdam instead")
    
      let state = addr self.state.mgetOrPut(cast[pointer](p), ParameterState())

      # State initialization
      if state.exp_avg.isNil:
        # Exponential moving average of gradient values
        state.exp_avg = zeros_like(p.data)
        # Exponential moving average of squared gradient values
        state.exp_avg_sq = zeros_like(p.data)
        if group.amsgrad:
          # Maintains max of all exp. moving avg. of sq. grad. values
          state.max_exp_avg_sq = zeros_like(p.data)

      if group.amsgrad:
        state.max_exp_avg_sq = state.max_exp_avg_sq

      inc state.step

      if group.weight_decay != 0:
        p.grad.add_inplace(group.weight_decay, p.data)

      let (beta1, beta2) = group.betas

      # Decay the first and second moment running average coefficient
      state.exp_avg.mul_inplace(beta1).add_inplace(1 - beta1, p.grad.data)
      state.exp_avg_sq.mul_inplace(beta2).addcmul_inplace(p.grad.data, p.grad.data, 1 - beta2)
      var denom: Tensor
      if group.amsgrad:
        # Maintains the maximum of all 2nd moment running avg. till now
        state.max_exp_avg_sq = torch.max(state.max_exp_avg_sq, state.exp_avg_sq)
        # Use the max. for normalizing running avg. of gradient
        denom = state.max_exp_avg_sq.sqrt().add_inplace(group.eps)
      else:
        denom = state.exp_avg_sq.sqrt().add_inplace(group.eps)

      let
        bias_correction1 = 1 - pow(beta1, state.step.float)
        bias_correction2 = 1 - pow(beta2, state.step.float)
        step_size = group.lr * sqrt(bias_correction2) / bias_correction1

      p.data.addcdiv_inplace(state.exp_avg, denom, -step_size)
