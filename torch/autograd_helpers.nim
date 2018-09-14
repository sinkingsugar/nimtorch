import fragments/ffi/cpp as cpp
import sequtils

# TODO: Workaround for int instead of IntList
proc sum(self: Tensor; dim: int): Tensor =
  self.sum(@[dim])

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

proc maybe_wrap_dim(dim, size: int64): int {.inline.} =
  return dynamicCCall("at::maybe_wrap_dim", dim, size).to(int)

proc split_with_sizes_backward*(grads: openarray[Tensor]; split_sizes: openarray[SomeInteger]; dim: int64; sizes: IntList; tensorType: TensorType): Tensor {.noinit.} =
  let ndim = maybe_wrap_dim(dim, sizes.len())
  var allDefinedList: TensorList
  for i in 0..grads.high:
    let grad = grads[i]
    if grad.is_defined():
      allDefinedList.add(grad)
    else:
      let length = split_sizes[i]
      var grad_size = sizes 
      grad_size[dim.int] = length.int
      allDefinedList.add(torch.zeros(grad_size, tensorType))
  result = torch.cat(allDefinedList, ndim)

proc split_backward*(grads: openarray[Tensor]; split_size, dim: int64; sizes: IntList; tensorType: TensorType): Tensor {.noinit.} =
  let
    ndim = maybe_wrap_dim(dim, sizes.len())
    dim_size = sizes[ndim]
    num_splits = grads.len
  var split_sizes = newSeqWith(num_splits, split_size.int)
  split_sizes[num_splits - 1] = split_size.int - (split_size.int * num_splits - dim_size)
  result = split_with_sizes_backward(grads, split_sizes, ndim, sizes, tensorType)

proc unsqueeze_to(self: Tensor; sizes: openarray[SomeInteger]): Tensor =
  result = self
  for dim, size in sizes:
    if size == 1:
      result = result.unsqueeze(dim.int64)

proc unsqueeze_to(self: Tensor; dim: int64; sizes: openarray[SomeInteger]): Tensor =
  let dim = maybe_wrap_dim(dim.int, sizes.len)
  # in NumPy it's not an error to unsqueeze a scalar, but we still need to avoided
  # unsqueezing in the backward.
  if sizes.len > 0 and sizes[dim.int] == 1:
    return self.unsqueeze(dim.int64)
  return self

proc dim_list_to_bitset(dims: openarray[SomeInteger]; ndims: int64; wrap_scalar: bool = true): set[0..63] =
  assert(ndims <= 64, "only tensors with up to 64 dims are supported")
  for i in 0 ..< dims.len:
    let dim = maybe_wrap_dim(dims[i].int, ndims.int)
    assert(dim in result, "dim " & $dim & " appears multiple times in the list of dims")
    result.incl(dim)

proc sum_backward(grad: Tensor; sizes: openarray[SomeInteger]; dims: openarray[SomeInteger]; keepdim: bool): Tensor =
  if not keepdim and sizes.len > 0:
    if dims.len == 1:
      return grad.unsqueeze(dims[0]).expand(sizes)
    else:
      let dims_to_unsqueeze = dim_list_to_bitset(dims, sizes.len)
      result = grad
      for i in 0 ..< sizes.len:
        if i in dims_to_unsqueeze:
          result = result.unsqueeze(i)
      result = result.expand(sizes)
  else:
    return grad.expand(sizes)

proc legacy_cat_wrap_dim(dim: int; tensor_sizes: seq[seq[int]]): int =
  for sizes in tensor_sizes:
    if sizes.len != 1 or sizes[0] != 0:
      return maybe_wrap_dim(dim, sizes.len);
  return dim

proc cat_tensors_backward(grad: Tensor; sizes: seq[seq[int]]; dim: int64): TensorList =
  let dim = legacy_cat_wrap_dim(dim.int, sizes)
  result.setLen(sizes.len)
  var accumulate = 0

  for i, shape in sizes:
    # If input was empty tensor, gradInput should be empty tensor.
    if shape.len == 1 and shape[0] == 0:
      result[i] = zeros([0], grad.options())
      continue

    let size = shape[dim]
    accumulate += size
    result[i] = grad.narrow(dim, (accumulate - size).int64, size.int64)

proc to_args_sizes(tensors: openarray[Tensor]): seq[seq[int]] =
  result.setLen(tensors.len)
  for i, tensor in tensors:
    result[i] = tensor.sizes()