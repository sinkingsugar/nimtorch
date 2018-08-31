import ../nimtorch

proc maybe_multiply*(_: typedesc[torch]; a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  discard cppctor(addr(result))
  if b.float == 1.0:
    return a
  else:
    return a * b

proc mm_mat1_backward*(_: typedesc[torch]; grad, mat2: Tensor; sizes, strides: IntList; alpha: float): Tensor {.inline, noinit.} =
  discard cppctor(addr(result))
  if strides[0] == 1 and strides[1] == sizes[0]:
    return torch.maybe_multiply(mat2.mm(grad.t()).t(), alpha)
  else:
    return torch.maybe_multiply(grad.mm(mat2.t()), alpha)

proc mm_mat2_backward*(_: typedesc[torch]; grad, mat1: Tensor; sizes, strides: IntList; alpha: float): Tensor {.inline, noinit.} =
  discard cppctor(addr(result))
  if strides[0] == 1 and strides[1] == sizes[0]:
    return torch.maybe_multiply(grad.t().mm(mat1).t(), alpha)
  else:
    return torch.maybe_multiply(mat1.t().mm(grad), alpha)

proc pow_backward*(_: typedesc[torch]; grad, self: Tensor; exponent: float): Tensor {.inline, noinit.} =
  discard cppctor(addr(result))
  if exponent == 0.0:
    return torch.zeros_like(self)
  else:
    return grad * exponent * self.pow(exponent - 1)

proc pow_backward_self*(_: typedesc[torch]; grad, self, exponent: Tensor): Tensor {.inline, noinit.} =
  discard cppctor(addr(result))
  var l: IntList
  return torch.where(exponent == 0.0, torch.zeros(l, grad.getType()), grad * exponent * torch.pow(self, exponent - 1))

proc pow_backward_exponent*(_: typedesc[torch]; grad, self, exponent: Tensor): Tensor {.inline, noinit.} =
  discard cppctor(addr(result))
  return grad * torch.pow(self, exponent) * self.log()

proc atan2_backward*(_: typedesc[torch]; grad, self, other: Tensor; outputMask: StdArray[bool, 2]): (Tensor, Tensor) {.inline, noinit.} =
  discard cppctor(addr(result[0]))
  discard cppctor(addr(result[1]))
  let recip = (self * self + other * other).reciprocal()
  if output_mask[0]:
    result[0] = grad * other * recip
  if output_mask[1]:
    result[1] = grad * -self * recip