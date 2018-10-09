import ../../torch
  
type
  Reduction* {.pure.} = enum
    None
    ElementwiseMean
    Sum

  LossFunction* = proc(a, b: Tensor): Tensor

proc MSELoss*(reduction: Reduction = Reduction.ElementwiseMean): LossFunction =
  return proc(a, b: Tensor): Tensor = mse_loss(a, b, reduction.ord)