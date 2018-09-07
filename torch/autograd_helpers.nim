import ../nimtorch
import fragments/ffi/cpp as cpp

proc maybe_multiply*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  if b.float == 1.0:
    return a
  else:
    return a * b

proc mm_mat1_backward*(grad, mat2: Tensor; sizes, strides: IntList; alpha: float): Tensor {.inline, noinit.} =
  if strides[0] == 1 and strides[1] == sizes[0]:
    return torch.maybe_multiply(mat2.mm(grad.t()).t(), alpha)
  else:
    return torch.maybe_multiply(grad.mm(mat2.t()), alpha)

proc mm_mat2_backward*(grad, mat1: Tensor; sizes, strides: IntList; alpha: float): Tensor {.inline, noinit.} =
  if strides[0] == 1 and strides[1] == sizes[0]:
    return torch.maybe_multiply(grad.t().mm(mat1).t(), alpha)
  else:
    return torch.maybe_multiply(mat1.t().mm(grad), alpha)

proc pow_backward*(grad, self: Tensor; exponent: float): Tensor {.inline, noinit.} =
  if exponent == 0.0:
    return torch.zeros_like(self)
  else:
    return grad * exponent * self.pow(exponent - 1)

proc pow_backward_self*(grad, self, exponent: Tensor): Tensor {.inline, noinit.} =
  var l: IntList
  return torch.where(exponent == 0.0, torch.zeros(l, grad.getType()), grad * exponent * torch.pow(self, exponent - 1))

proc pow_backward_exponent*(grad, self, exponent: Tensor): Tensor {.inline, noinit.} =
  return grad * torch.pow(self, exponent) * self.log()

proc atan2_backward*(grad, self, other: Tensor; outputMask: StdArray[bool, 2]): (Tensor, Tensor) {.inline, noinit.} =
  let recip = (self * self + other * other).reciprocal()
  if output_mask[0]:
    result[0] = grad * other * recip
  if output_mask[1]:
    result[1] = grad * -self * recip

proc maybe_wrap_dim(dim, size: int): int {.inline.} =
  return dynamicCCall("at::maybe_wrap_dim", dim, size).to(int)

proc split_with_sizes_backward*(grads: TensorList; split_sizes: IntList; dim: int; sizes: IntList; tensorType: TensorType): Tensor {.noinit.} =
  let ndim = maybe_wrap_dim(dim, sizes.len())
  var allDefinedList: TensorList
  for i in 0..grads.high:
    let grad = grads[i]
    if grad.is_defined():
      allDefinedList.add(grad)
    else:
      let
        length = split_sizes[i]
        grad_size = sizes 
      grad_size[dim] = length
      allDefinedList.add(torch.zeros(grad_size, tensorType))
  result = torch.cat(allDefinedList, ndim)

proc split_backward*(grads: TensorList; split_size, dim: int; sizes: IntList; tensorType: TensorType): Tensor {.noinit.} =
  let
    ndim = maybe_wrap_dim(dim, sizes.len())
    dim_size = sizes[ndim]
    num_splits = grads.len()
    split_sizes: IntList = @[num_splits, split_size]
  split_sizes[num_splits - 1] = split_size - (split_size * num_splits - dim_size)
  result = split_with_sizes_backward(grads, split_sizes, ndim, sizes, tensorType)