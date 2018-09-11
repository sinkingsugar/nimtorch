# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

import math
const M_PI = math.PI

autograd masked_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor = 
    ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))

autograd masked_fill_inplace:
  proc forward*(self: Tensor; mask: Tensor; value: float): Tensor = 
    self.tensor.dynamicCppCall("masked_fill_", mask.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))

autograd masked_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor = 
    ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))
  value: firstOrSelf(where(mask, grad, zeros_like(grad)).sum())

autograd masked_fill_inplace:
  proc forward*(self: Tensor; mask: Tensor; value: Tensor): Tensor = 
    self.tensor.dynamicCppCall("masked_fill_", mask.tensor, value.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))
  value: firstOrSelf(where(mask, grad, zeros_like(grad)).sum())

autograd masked_select:
  proc forward*(ty: TensorType; self: Tensor; mask: Tensor): Tensor = 
    ty.dynamicCppCall("masked_select", self.tensor, mask.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self).masked_scatter_inplace(mask, grad))

autograd masked_select:
  proc forward*(self: Tensor; mask: Tensor): Tensor = 
    self.tensor.dynamicCppCall("masked_select", mask.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self).masked_scatter_inplace(mask, grad))

autograd view:
  proc forward*(ty: TensorType; self: Tensor; size: IntList): Tensor = 
    ty.dynamicCppCall("view", self.tensor, size).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd view:
  proc forward*(self: Tensor; size: IntList): Tensor = 
    self.tensor.dynamicCppCall("view", size).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd take:
  proc forward*(ty: TensorType; self: Tensor; index: Tensor): Tensor = 
    ty.dynamicCppCall("take", self.tensor, index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self).put_inplace(index, grad, true))

autograd take:
  proc forward*(self: Tensor; index: Tensor): Tensor = 
    self.tensor.dynamicCppCall("take", index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self).put_inplace(index, grad, true))

autograd put_inplace:
  proc forward*(ty: TensorType; self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor = 
    ty.dynamicCppCall("put_", self.tensor, index.tensor, source.tensor, accumulate).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().put_inplace(index, zeros_like(source), accumulate))
  source: firstOrSelf(grad.take(index))

autograd put_inplace:
  proc forward*(self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor = 
    self.tensor.dynamicCppCall("put_", index.tensor, source.tensor, accumulate).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().put_inplace(index, zeros_like(source), accumulate))
  source: firstOrSelf(grad.take(index))

autograd index_add_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor = 
    ty.dynamicCppCall("index_add_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  source: firstOrSelf(grad.index_select(dim, index))

autograd index_add_inplace:
  proc forward*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor = 
    self.tensor.dynamicCppCall("index_add_", dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  source: firstOrSelf(grad.index_select(dim, index))

autograd index_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: float): Tensor = 
    ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))

autograd index_fill_inplace:
  proc forward*(self: Tensor; dim: int64; index: Tensor; value: float): Tensor = 
    self.tensor.dynamicCppCall("index_fill_", dim, index.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))

autograd index_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: Tensor): Tensor = 
    ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  value: firstOrSelf(grad.index_select(dim, index).sum())

autograd index_fill_inplace:
  proc forward*(self: Tensor; dim: int64; index: Tensor; value: Tensor): Tensor = 
    self.tensor.dynamicCppCall("index_fill_", dim, index.tensor, value.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  value: firstOrSelf(grad.index_select(dim, index).sum())

autograd scatter_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor = 
    ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))
  src: firstOrSelf(grad.gather(dim, index))

autograd scatter_inplace:
  proc forward*(self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor = 
    self.tensor.dynamicCppCall("scatter_", dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))
  src: firstOrSelf(grad.gather(dim, index))

autograd scatter_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: float): Tensor = 
    ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))

autograd scatter_inplace:
  proc forward*(self: Tensor; dim: int64; index: Tensor; value: float): Tensor = 
    self.tensor.dynamicCppCall("scatter_", dim, index.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))

autograd scatter_add_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor = 
    ty.dynamicCppCall("scatter_add_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  src: firstOrSelf(grad.gather(dim, index))

autograd scatter_add_inplace:
  proc forward*(self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor = 
    self.tensor.dynamicCppCall("scatter_add_", dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  src: firstOrSelf(grad.gather(dim, index))

autograd lt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("lt_", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd lt_inplace:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("lt_", other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd lt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("lt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd lt_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("lt_", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd gt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("gt_", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd gt_inplace:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("gt_", other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd gt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("gt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd gt_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("gt_", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd le_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("le_", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd le_inplace:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("le_", other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd le_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("le_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd le_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("le_", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ge_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("ge_", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd ge_inplace:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("ge_", other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd ge_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("ge_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ge_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("ge_", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd eq_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("eq_", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd eq_inplace:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("eq_", other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd eq_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("eq_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd eq_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("eq_", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ne_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("ne_", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd ne_inplace:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("ne_", other).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd ne_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("ne_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ne_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("ne_", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd min:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("min", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self >= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self < other, 0))

autograd min:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("min", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self >= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self < other, 0))

autograd max:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("max", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self <= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self > other, 0))

autograd max:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("max", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self <= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self > other, 0))

autograd lgamma:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("lgamma", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * digamma(self))

autograd lgamma:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("lgamma").to(ATensor).newTensor()
  self: firstOrSelf(grad * digamma(self))

autograd digamma:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("digamma", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * polygamma(1, self))

autograd digamma:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("digamma").to(ATensor).newTensor()
  self: firstOrSelf(grad * polygamma(1, self))

autograd polygamma:
  proc forward*(ty: TensorType; n: int64; self: Tensor): Tensor = 
    ty.dynamicCppCall("polygamma", n, self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * polygamma(n + 1, self))

autograd erfinv:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("erfinv", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad)

autograd erfinv:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("erfinv").to(ATensor).newTensor()
  self: firstOrSelf(0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad)

autograd frac:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("frac", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd frac:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("frac").to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd reciprocal:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("reciprocal", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-grad * fwd_result * fwd_result)

autograd reciprocal:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("reciprocal").to(ATensor).newTensor()
  self: firstOrSelf(-grad * fwd_result * fwd_result)

autograd neg:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("neg", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.neg())

autograd neg:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("neg").to(ATensor).newTensor()
  self: firstOrSelf(grad.neg())

autograd atan2:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("atan2", self.tensor, other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd atan2:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("atan2", other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd pow:
  proc forward*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor = 
    ty.dynamicCppCall("pow", self.tensor, exponent.tensor).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward_self(grad, self, exponent))
  exponent: firstOrSelf(pow_backward_exponent(grad, self, exponent))

autograd pow:
  proc forward*(self: Tensor; exponent: Tensor): Tensor = 
    self.tensor.dynamicCppCall("pow", exponent.tensor).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward_self(grad, self, exponent))
  exponent: firstOrSelf(pow_backward_exponent(grad, self, exponent))

autograd sign:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("sign", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd sign:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("sign").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd fmod:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("fmod", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd fmod:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("fmod", other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd fmod:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("fmod", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd fmod:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("fmod", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("remainder", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("remainder", other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("remainder", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("remainder", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd tril:
  proc forward*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor = 
    ty.dynamicCppCall("tril", self.tensor, diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.tril(diagonal))

autograd tril:
  proc forward*(self: Tensor; diagonal: int64 = 0): Tensor = 
    self.tensor.dynamicCppCall("tril", diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.tril(diagonal))

autograd triu:
  proc forward*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor = 
    ty.dynamicCppCall("triu", self.tensor, diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.triu(diagonal))

autograd triu:
  proc forward*(self: Tensor; diagonal: int64 = 0): Tensor = 
    self.tensor.dynamicCppCall("triu", diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.triu(diagonal))

autograd cross:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor; dim: int64 = -1): Tensor = 
    ty.dynamicCppCall("cross", self.tensor, other.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(other.cross(grad, dim))
  other: firstOrSelf(grad.cross(self, dim))

autograd cross:
  proc forward*(self: Tensor; other: Tensor; dim: int64 = -1): Tensor = 
    self.tensor.dynamicCppCall("cross", other.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(other.cross(grad, dim))
  other: firstOrSelf(grad.cross(self, dim))

autograd addmv_internal:
  proc forward*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat: firstOrSelf(grad.ger(vec) * alpha)
  vec: firstOrSelf(mat.t().mv(grad) * alpha)

autograd addmv_internal:
  proc forward*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("_addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat: firstOrSelf(grad.ger(vec) * alpha)
  vec: firstOrSelf(mat.t().mv(grad) * alpha)

autograd addr_internal:
  proc forward*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  vec1: firstOrSelf(grad.mv(vec2) * alpha)
  vec2: firstOrSelf(grad.t().mv(vec1) * alpha)

autograd addr_internal:
  proc forward*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("_addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  vec1: firstOrSelf(grad.mv(vec2) * alpha)
  vec2: firstOrSelf(grad.t().mv(vec1) * alpha)

autograd bmm:
  proc forward*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor = 
    ty.dynamicCppCall("bmm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.bmm(mat2.transpose(1, 2)))
  mat2: firstOrSelf(self.transpose(1, 2).bmm(grad))

autograd bmm:
  proc forward*(self: Tensor; mat2: Tensor): Tensor = 
    self.tensor.dynamicCppCall("bmm", mat2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.bmm(mat2.transpose(1, 2)))
  mat2: firstOrSelf(self.transpose(1, 2).bmm(grad))

autograd addbmm:
  proc forward*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("addbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha)

autograd addbmm:
  proc forward*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("addbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha)

autograd baddbmm:
  proc forward*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("baddbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad) * alpha)

autograd baddbmm:
  proc forward*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("baddbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad) * alpha)

autograd addcmul:
  proc forward*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
    ty.dynamicCppCall("addcmul", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * tensor2 * value)
  tensor2: firstOrSelf(grad * tensor1 * value)

autograd addcmul:
  proc forward*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
    self.tensor.dynamicCppCall("addcmul", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * tensor2 * value)
  tensor2: firstOrSelf(grad * tensor1 * value)

autograd addcdiv:
  proc forward*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
    ty.dynamicCppCall("addcdiv", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * value / tensor2)
  tensor2: firstOrSelf(-grad * value * tensor1 / (tensor2 * tensor2))

autograd addcdiv:
  proc forward*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
    self.tensor.dynamicCppCall("addcdiv", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * value / tensor2)
  tensor2: firstOrSelf(-grad * value * tensor1 / (tensor2 * tensor2))

autograd random_inplace:
  proc forward*(ty: TensorType; self: Tensor; from_name: int64; to_name: int64; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("random_", self.tensor, from_name, to_name, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(self: Tensor; from_name: int64; to_name: int64; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("random_", from_name, to_name, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(ty: TensorType; self: Tensor; to_name: int64; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("random_", self.tensor, to_name, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(self: Tensor; to_name: int64; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("random_", to_name, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(ty: TensorType; self: Tensor; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("random_", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(self: Tensor; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("random_", generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd uniform_inplace:
  proc forward*(ty: TensorType; self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("uniform_", self.tensor, from_name, to_name, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd uniform_inplace:
  proc forward*(self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("uniform_", from_name, to_name, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd normal_inplace:
  proc forward*(ty: TensorType; self: Tensor; mean: float64 = 0; std: float64 = 1; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd normal_inplace:
  proc forward*(self: Tensor; mean: float64 = 0; std: float64 = 1; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("normal_", mean, std, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd cauchy_inplace:
  proc forward*(ty: TensorType; self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("cauchy_", self.tensor, median, sigma, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd cauchy_inplace:
  proc forward*(self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("cauchy_", median, sigma, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd log_normal_inplace:
  proc forward*(ty: TensorType; self: Tensor; mean: float64 = 1; std: float64 = 2; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("log_normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd log_normal_inplace:
  proc forward*(self: Tensor; mean: float64 = 1; std: float64 = 2; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("log_normal_", mean, std, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd exponential_inplace:
  proc forward*(ty: TensorType; self: Tensor; lambd: float64 = 1; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("exponential_", self.tensor, lambd, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd exponential_inplace:
  proc forward*(self: Tensor; lambd: float64 = 1; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("exponential_", lambd, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd geometric_inplace:
  proc forward*(ty: TensorType; self: Tensor; p: float64; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("geometric_", self.tensor, p, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd geometric_inplace:
  proc forward*(self: Tensor; p: float64; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("geometric_", p, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd alias:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("alias", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd alias:
  proc forward*(self: Tensor): Tensor = 
    dynamicCCall("at::alias", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd binary_cross_entropy:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor = 
    ty.dynamicCppCall("binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(binary_cross_entropy_backward(grad, self, target, weight, reduction))

autograd binary_cross_entropy:
  proc forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor = 
    dynamicCCall("at::binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(binary_cross_entropy_backward(grad, self, target, weight, reduction))

autograd l1_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor = 
    ty.dynamicCppCall("l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(l1_loss_backward(grad, self, target, reduction))

autograd l1_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int64): Tensor = 
    dynamicCCall("at::l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(l1_loss_backward(grad, self, target, reduction))

autograd mse_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor = 
    ty.dynamicCppCall("mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(mse_loss_backward(grad, self, target, reduction))

autograd mse_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int64): Tensor = 
    dynamicCCall("at::mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(mse_loss_backward(grad, self, target, reduction))

autograd multi_margin_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor = 
    ty.dynamicCppCall("multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction))

autograd multi_margin_loss:
  proc forward*(self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor = 
    dynamicCCall("at::multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction))

autograd multilabel_margin_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): tuple[output: Tensor, is_target: Tensor] = 
    ty.dynamicCppCall("multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target))

autograd multilabel_margin_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int64): tuple[output: Tensor, is_target: Tensor] = 
    dynamicCCall("at::multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target))

autograd nll_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] = 
    ty.dynamicCppCall("nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss:
  proc forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] = 
    dynamicCCall("at::nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor = 
    ty.dynamicCppCall("nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd nll_loss_backward:
  proc forward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor = 
    dynamicCCall("at::nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd nll_loss2d:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] = 
    ty.dynamicCppCall("nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss2d:
  proc forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] = 
    dynamicCCall("at::nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor = 
    ty.dynamicCppCall("nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss2d(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd nll_loss2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor = 
    dynamicCCall("at::nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss2d(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd smooth_l1_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor = 
    ty.dynamicCppCall("smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(smooth_l1_loss_backward(grad, self, target, reduction))

autograd smooth_l1_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int64): Tensor = 
    dynamicCCall("at::smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(smooth_l1_loss_backward(grad, self, target, reduction))

autograd soft_margin_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor = 
    ty.dynamicCppCall("soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(soft_margin_loss_backward(grad, self, target, reduction))

autograd soft_margin_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int64): Tensor = 
    dynamicCCall("at::soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(soft_margin_loss_backward(grad, self, target, reduction))

autograd elu:
  proc forward*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor = 
    ty.dynamicCppCall("elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: firstOrSelf(elu_backward(grad, alpha, scale, input_scale, fwd_result))

autograd elu:
  proc forward*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor = 
    dynamicCCall("at::elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: firstOrSelf(elu_backward(grad, alpha, scale, input_scale, fwd_result))

autograd glu:
  proc forward*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
    ty.dynamicCppCall("glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(glu_backward(grad, self, dim))

autograd glu:
  proc forward*(self: Tensor; dim: int64): Tensor = 
    dynamicCCall("at::glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(glu_backward(grad, self, dim))

autograd hardtanh:
  proc forward*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor = 
    ty.dynamicCppCall("hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))

autograd hardtanh:
  proc forward*(self: Tensor; min_val: float; max_val: float): Tensor = 
    dynamicCCall("at::hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))

autograd hardtanh_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor = 
    ty.dynamicCppCall("hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))
  self: firstOrSelf(zeros_like(grad))

autograd hardtanh_backward:
  proc forward*(grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor = 
    dynamicCCall("at::hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))
  self: firstOrSelf(zeros_like(grad))

autograd hardtanh_inplace:
  proc forward*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor = 
    ty.dynamicCppCall("hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: firstOrSelf(hardtanh_backward(grad, fwd_result, min_val, max_val))

autograd hardtanh_inplace:
  proc forward*(self: Tensor; min_val: float; max_val: float): Tensor = 
    dynamicCCall("at::hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: firstOrSelf(hardtanh_backward(grad, fwd_result, min_val, max_val))

autograd leaky_relu:
  proc forward*(ty: TensorType; self: Tensor; negative_slope: float): Tensor = 
    ty.dynamicCppCall("leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))

autograd leaky_relu:
  proc forward*(self: Tensor; negative_slope: float): Tensor = 
    dynamicCCall("at::leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))

autograd leaky_relu_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; negative_slope: float): Tensor = 
    ty.dynamicCppCall("leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))
  self: firstOrSelf(zeros_like(grad))

autograd leaky_relu_backward:
  proc forward*(grad_output: Tensor; self: Tensor; negative_slope: float): Tensor = 
    dynamicCCall("at::leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))
  self: firstOrSelf(zeros_like(grad))

autograd leaky_relu_inplace:
  proc forward*(ty: TensorType; self: Tensor; negative_slope: float): Tensor = 
    ty.dynamicCppCall("leaky_relu_forward_", self.tensor, negative_slope).to(ATensor).newTensor()
  self: firstOrSelf(leaky_relu_backward(grad, fwd_result, negative_slope))

autograd leaky_relu_inplace:
  proc forward*(self: Tensor; negative_slope: float): Tensor = 
    dynamicCCall("at::leaky_relu_forward_", self.tensor, negative_slope).to(ATensor).newTensor()
  self: firstOrSelf(leaky_relu_backward(grad, fwd_result, negative_slope))

autograd log_sigmoid:
  proc forward*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] = 
    ty.dynamicCppCall("log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(log_sigmoid_backward(grad, self, fwd_result.buffer))

autograd log_sigmoid:
  proc forward*(self: Tensor): tuple[output: Tensor, buffer: Tensor] = 
    dynamicCCall("at::log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(log_sigmoid_backward(grad, self, fwd_result.buffer))

autograd prelu:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor): Tensor = 
    ty.dynamicCppCall("prelu_forward", self.tensor, weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight, grad_input_mask)

autograd prelu:
  proc forward*(self: Tensor; weight: Tensor): Tensor = 
    dynamicCCall("at::prelu_forward", self.tensor, weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight, grad_input_mask)

autograd rrelu_with_noise:
  proc forward*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor = 
    ty.dynamicCppCall("rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))

autograd rrelu_with_noise:
  proc forward*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor = 
    dynamicCCall("at::rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))

autograd rrelu_with_noise_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor = 
    ty.dynamicCppCall("rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))
  self: firstOrSelf(zeros_like(grad))

autograd rrelu_with_noise_backward:
  proc forward*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor = 
    dynamicCCall("at::rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))
  self: firstOrSelf(zeros_like(grad))

autograd rrelu_with_noise_inplace:
  proc forward*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor = 
    ty.dynamicCppCall("rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: firstOrSelf(rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training))

autograd rrelu_with_noise_inplace:
  proc forward*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor = 
    dynamicCCall("at::rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: firstOrSelf(rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training))

autograd softplus:
  proc forward*(ty: TensorType; self: Tensor; beta: float; threshold: float): Tensor = 
    ty.dynamicCppCall("softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: firstOrSelf(softplus_backward(grad, self, beta, threshold, fwd_result))

autograd softplus:
  proc forward*(self: Tensor; beta: float; threshold: float): Tensor = 
    dynamicCCall("at::softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: firstOrSelf(softplus_backward(grad, self, beta, threshold, fwd_result))

autograd softshrink:
  proc forward*(ty: TensorType; self: Tensor; lambd: float): Tensor = 
    ty.dynamicCppCall("softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: firstOrSelf(softshrink_backward(grad, self, lambd))

autograd softshrink:
  proc forward*(self: Tensor; lambd: float): Tensor = 
    dynamicCCall("at::softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: firstOrSelf(softshrink_backward(grad, self, lambd))

autograd softshrink_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; lambd: float): Tensor = 
    ty.dynamicCppCall("softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: firstOrSelf(softshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd softshrink_backward:
  proc forward*(grad_output: Tensor; self: Tensor; lambd: float): Tensor = 
    dynamicCCall("at::softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: firstOrSelf(softshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd threshold:
  proc forward*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor = 
    ty.dynamicCppCall("threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, threshold, value))

autograd threshold:
  proc forward*(self: Tensor; threshold: float; value: float): Tensor = 
    dynamicCCall("at::threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, threshold, value))

autograd threshold_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor = 
    ty.dynamicCppCall("threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: firstOrSelf(threshold_backward(grad, self, threshold, value))
  self: firstOrSelf(zeros_like(grad))

autograd threshold_backward:
  proc forward*(grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor = 
    dynamicCCall("at::threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: firstOrSelf(threshold_backward(grad, self, threshold, value))
  self: firstOrSelf(zeros_like(grad))

autograd threshold_inplace:
  proc forward*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor = 
    ty.dynamicCppCall("threshold_forward_", self.tensor, threshold, value).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, fwd_result, threshold, value))

autograd threshold_inplace:
  proc forward*(self: Tensor; threshold: float; value: float): Tensor = 
    dynamicCCall("at::threshold_forward_", self.tensor, threshold, value).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, fwd_result, threshold, value))

autograd adaptive_avg_pool2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList): Tensor = 
    ty.dynamicCppCall("adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool2d_backward(grad, self))

autograd adaptive_avg_pool2d:
  proc forward*(self: Tensor; output_size: IntList): Tensor = 
    dynamicCCall("at::adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool2d_backward(grad, self))

autograd adaptive_avg_pool2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor = 
    ty.dynamicCppCall("adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_avg_pool2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor): Tensor = 
    dynamicCCall("at::adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_avg_pool3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList): Tensor = 
    ty.dynamicCppCall("adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool3d_backward(grad, self))

autograd adaptive_avg_pool3d:
  proc forward*(self: Tensor; output_size: IntList): Tensor = 
    dynamicCCall("at::adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool3d_backward(grad, self))

autograd adaptive_avg_pool3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor = 
    ty.dynamicCppCall("adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_avg_pool3d_backward:
  proc forward*(grad_output: Tensor; self: Tensor): Tensor = 
    dynamicCCall("at::adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_max_pool2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList): tuple[output: Tensor, indices: Tensor] = 
    ty.dynamicCppCall("adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool2d_backward(grad, self, fwd_result.indices))

autograd adaptive_max_pool2d:
  proc forward*(self: Tensor; output_size: IntList): tuple[output: Tensor, indices: Tensor] = 
    dynamicCCall("at::adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool2d_backward(grad, self, fwd_result.indices))

autograd adaptive_max_pool3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList): tuple[output: Tensor, indices: Tensor] = 
    ty.dynamicCppCall("adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool3d_backward(grad, self, fwd_result.indices))

autograd adaptive_max_pool3d:
  proc forward*(self: Tensor; output_size: IntList): tuple[output: Tensor, indices: Tensor] = 
    dynamicCCall("at::adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool3d_backward(grad, self, fwd_result.indices))

autograd avg_pool2d:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    ty.dynamicCppCall("avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool2d:
  proc forward*(self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    dynamicCCall("at::avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    ty.dynamicCppCall("avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd avg_pool2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    dynamicCCall("at::avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd avg_pool3d:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    ty.dynamicCppCall("avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool3d:
  proc forward*(self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    dynamicCCall("at::avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    ty.dynamicCppCall("avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd avg_pool3d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; ceil_mode: bool; count_include_pad: bool): Tensor = 
    dynamicCCall("at::avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd fractional_max_pool2d:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: IntList; output_size: IntList; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] = 
    ty.dynamicCppCall("fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices))

autograd fractional_max_pool2d:
  proc forward*(self: Tensor; kernel_size: IntList; output_size: IntList; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] = 
    dynamicCCall("at::fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices))

autograd max_pool2d_with_indices:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; dilation: IntList; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] = 
    ty.dynamicCppCall("max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_pool2d_with_indices:
  proc forward*(self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; dilation: IntList; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] = 
    dynamicCCall("at::max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_pool3d_with_indices:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; dilation: IntList; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] = 
    ty.dynamicCppCall("max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_pool3d_with_indices:
  proc forward*(self: Tensor; kernel_size: IntList; stride: IntList; padding: IntList; dilation: IntList; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] = 
    dynamicCCall("at::max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_unpool2d:
  proc forward*(ty: TensorType; self: Tensor; indices: Tensor; output_size: IntList): Tensor = 
    ty.dynamicCppCall("max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool2d_backward(grad, self, indices, output_size))

autograd max_unpool2d:
  proc forward*(self: Tensor; indices: Tensor; output_size: IntList): Tensor = 
    dynamicCCall("at::max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool2d_backward(grad, self, indices, output_size))

autograd max_unpool2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: IntList): Tensor = 
    ty.dynamicCppCall("max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(max_unpool2d(grad, indices, output_size))
  self: firstOrSelf(zeros_like(self))

autograd max_unpool2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: IntList): Tensor = 
    dynamicCCall("at::max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(max_unpool2d(grad, indices, output_size))
  self: firstOrSelf(zeros_like(self))

autograd max_unpool3d:
  proc forward*(ty: TensorType; self: Tensor; indices: Tensor; output_size: IntList; stride: IntList; padding: IntList): Tensor = 
    ty.dynamicCppCall("max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool3d_backward(grad, self, indices, output_size, stride, padding))

autograd max_unpool3d:
  proc forward*(self: Tensor; indices: Tensor; output_size: IntList; stride: IntList; padding: IntList): Tensor = 
    dynamicCCall("at::max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool3d_backward(grad, self, indices, output_size, stride, padding))

autograd reflection_pad1d:
  proc forward*(ty: TensorType; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("reflection_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad1d_backward(grad, self, padding))

autograd reflection_pad1d:
  proc forward*(self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::reflection_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad1d_backward(grad, self, padding))

autograd reflection_pad1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd reflection_pad1d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd reflection_pad2d:
  proc forward*(ty: TensorType; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("reflection_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad2d_backward(grad, self, padding))

autograd reflection_pad2d:
  proc forward*(self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::reflection_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad2d_backward(grad, self, padding))

autograd reflection_pad2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd reflection_pad2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad1d:
  proc forward*(ty: TensorType; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("replication_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad1d_backward(grad, self, padding))

autograd replication_pad1d:
  proc forward*(self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::replication_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad1d_backward(grad, self, padding))

autograd replication_pad1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad1d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad2d:
  proc forward*(ty: TensorType; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("replication_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad2d_backward(grad, self, padding))

autograd replication_pad2d:
  proc forward*(self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::replication_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad2d_backward(grad, self, padding))

autograd replication_pad2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad3d:
  proc forward*(ty: TensorType; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("replication_pad3d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad3d_backward(grad, self, padding))

autograd replication_pad3d:
  proc forward*(self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::replication_pad3d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad3d_backward(grad, self, padding))

autograd replication_pad3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    ty.dynamicCppCall("replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad3d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad3d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: IntList): Tensor = 
    dynamicCCall("at::replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad3d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd upsample_linear1d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList; align_corners: bool): Tensor = 
    ty.dynamicCppCall("upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_linear1d:
  proc forward*(self: Tensor; output_size: IntList; align_corners: bool): Tensor = 
    dynamicCCall("at::upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_linear1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: IntList; input_size: IntList; align_corners: bool): Tensor = 
    ty.dynamicCppCall("upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_linear1d(grad, output_size, align_corners))

autograd upsample_linear1d_backward:
  proc forward*(grad_output: Tensor; output_size: IntList; input_size: IntList; align_corners: bool): Tensor = 
    dynamicCCall("at::upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_linear1d(grad, output_size, align_corners))

autograd upsample_bilinear2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList; align_corners: bool): Tensor = 
    ty.dynamicCppCall("upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_bilinear2d:
  proc forward*(self: Tensor; output_size: IntList; align_corners: bool): Tensor = 
    dynamicCCall("at::upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_bilinear2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: IntList; input_size: IntList; align_corners: bool): Tensor = 
    ty.dynamicCppCall("upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_bilinear2d(grad, output_size, align_corners))

autograd upsample_bilinear2d_backward:
  proc forward*(grad_output: Tensor; output_size: IntList; input_size: IntList; align_corners: bool): Tensor = 
    dynamicCCall("at::upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_bilinear2d(grad, output_size, align_corners))

autograd upsample_trilinear3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList; align_corners: bool): Tensor = 
    ty.dynamicCppCall("upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_trilinear3d:
  proc forward*(self: Tensor; output_size: IntList; align_corners: bool): Tensor = 
    dynamicCCall("at::upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_trilinear3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: IntList; input_size: IntList; align_corners: bool): Tensor = 
    ty.dynamicCppCall("upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_trilinear3d(grad, output_size, align_corners))

autograd upsample_trilinear3d_backward:
  proc forward*(grad_output: Tensor; output_size: IntList; input_size: IntList; align_corners: bool): Tensor = 
    dynamicCCall("at::upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_trilinear3d(grad, output_size, align_corners))

autograd upsample_nearest1d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList): Tensor = 
    ty.dynamicCppCall("upsample_nearest1d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest1d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest1d:
  proc forward*(self: Tensor; output_size: IntList): Tensor = 
    dynamicCCall("at::upsample_nearest1d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest1d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: IntList; input_size: IntList): Tensor = 
    ty.dynamicCppCall("upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest1d(grad, output_size))

autograd upsample_nearest1d_backward:
  proc forward*(grad_output: Tensor; output_size: IntList; input_size: IntList): Tensor = 
    dynamicCCall("at::upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest1d(grad, output_size))

autograd upsample_nearest2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList): Tensor = 
    ty.dynamicCppCall("upsample_nearest2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest2d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest2d:
  proc forward*(self: Tensor; output_size: IntList): Tensor = 
    dynamicCCall("at::upsample_nearest2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest2d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: IntList; input_size: IntList): Tensor = 
    ty.dynamicCppCall("upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest2d(grad, output_size))

autograd upsample_nearest2d_backward:
  proc forward*(grad_output: Tensor; output_size: IntList; input_size: IntList): Tensor = 
    dynamicCCall("at::upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest2d(grad, output_size))

autograd upsample_nearest3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: IntList): Tensor = 
    ty.dynamicCppCall("upsample_nearest3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest3d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest3d:
  proc forward*(self: Tensor; output_size: IntList): Tensor = 
    dynamicCCall("at::upsample_nearest3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest3d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: IntList; input_size: IntList): Tensor = 
    ty.dynamicCppCall("upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest3d(grad, output_size))

autograd upsample_nearest3d_backward:
  proc forward*(grad_output: Tensor; output_size: IntList; input_size: IntList): Tensor = 
    dynamicCCall("at::upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest3d(grad, output_size))

autograd sigmoid_backward_internal:
  proc forward*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor = 
    ty.dynamicCppCall("_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(sigmoid_backward_internal(grad, fwd_result))
  output: firstOrSelf(grad * grad_output * (-2 * fwd_result + 1))

autograd sigmoid_backward_internal:
  proc forward*(grad_output: Tensor; output: Tensor): Tensor = 
    dynamicCCall("at::_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(sigmoid_backward_internal(grad, fwd_result))
  output: firstOrSelf(grad * grad_output * (-2 * fwd_result + 1))

autograd tanh_backward_internal:
  proc forward*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor = 
    ty.dynamicCppCall("_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(tanh_backward_internal(grad, fwd_result))
  output: firstOrSelf(-2 * fwd_result * grad * grad_output)

autograd tanh_backward_internal:
  proc forward*(grad_output: Tensor; output: Tensor): Tensor = 
    dynamicCCall("at::_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(tanh_backward_internal(grad, fwd_result))
  output: firstOrSelf(-2 * fwd_result * grad * grad_output)

autograd thnn_batch_norm:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] = 
    ty.dynamicCppCall("thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_batch_norm:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] = 
    dynamicCCall("at::thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_conv_transpose2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; output_padding: IntList; dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] = 
    ty.dynamicCppCall("thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; output_padding: IntList; dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] = 
    dynamicCCall("at::thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose3d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; output_padding: IntList; dilation: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] = 
    ty.dynamicCppCall("thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_transpose3d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; output_padding: IntList; dilation: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] = 
    dynamicCCall("at::thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] = 
    ty.dynamicCppCall("thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] = 
    dynamicCCall("at::thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_depthwise2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; dilation: IntList): Tensor = 
    ty.dynamicCppCall("thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: firstOrSelf(grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1))

autograd thnn_conv_depthwise2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; dilation: IntList): Tensor = 
    dynamicCCall("at::thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: firstOrSelf(grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1))

autograd thnn_conv3d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] = 
    ty.dynamicCppCall("thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv3d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] = 
    dynamicCCall("at::thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_dilated2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] = 
    ty.dynamicCppCall("thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] = 
    dynamicCCall("at::thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] = 
    ty.dynamicCppCall("thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: IntList; bias: Tensor; stride: IntList; padding: IntList; dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] = 
    dynamicCCall("at::thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd cudnn_ctc_loss_internal:
  proc forward*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: IntList; target_lengths: IntList; blank: int64; deterministic: bool): tuple[result0: Tensor, result1: Tensor] = 
    ty.dynamicCppCall("_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(fwd_result[1])

autograd cudnn_ctc_loss_internal:
  proc forward*(log_probs: Tensor; targets: Tensor; input_lengths: IntList; target_lengths: IntList; blank: int64; deterministic: bool): tuple[result0: Tensor, result1: Tensor] = 
    dynamicCCall("at::_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(fwd_result[1])

autograd abs:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("abs", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sign())

autograd abs:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("abs").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sign())

autograd acos:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("acos", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * -((-self * self + 1).rsqrt()))

autograd acos:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("acos").to(ATensor).newTensor()
  self: firstOrSelf(grad * -((-self * self + 1).rsqrt()))

autograd add:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("add", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(maybe_multiply(grad, alpha))

autograd add:
  proc forward*(self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("add", other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(maybe_multiply(grad, alpha))

autograd add:
  proc forward*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("add", self.tensor, other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd add:
  proc forward*(self: Tensor; other: float; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("add", other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd asin:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("asin", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * (-self * self + 1).rsqrt())

autograd asin:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("asin").to(ATensor).newTensor()
  self: firstOrSelf(grad * (-self * self + 1).rsqrt())

autograd atan:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("atan", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * self + 1))

autograd atan:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("atan").to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * self + 1))

autograd bernoulli:
  proc forward*(ty: TensorType; self: Tensor; p: float64; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("bernoulli", self.tensor, p, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd bernoulli:
  proc forward*(self: Tensor; p: float64; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("bernoulli", p, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd ceil:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("ceil", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd ceil:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("ceil").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd clamp_max:
  proc forward*(ty: TensorType; self: Tensor; max: float): Tensor = 
    ty.dynamicCppCall("clamp_max", self.tensor, max).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self <= max).type_as(grad))

autograd clamp_max:
  proc forward*(self: Tensor; max: float): Tensor = 
    self.tensor.dynamicCppCall("clamp_max", max).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self <= max).type_as(grad))

autograd clamp_min:
  proc forward*(ty: TensorType; self: Tensor; min: float): Tensor = 
    ty.dynamicCppCall("clamp_min", self.tensor, min).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self >= min).type_as(grad))

autograd clamp_min:
  proc forward*(self: Tensor; min: float): Tensor = 
    self.tensor.dynamicCppCall("clamp_min", min).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self >= min).type_as(grad))

autograd conv_tbc:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; pad: int64): Tensor = 
    ty.dynamicCppCall("conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd conv_tbc:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; pad: int64): Tensor = 
    dynamicCCall("at::conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd cos:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("cos", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * -self.sin())

autograd cos:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("cos").to(ATensor).newTensor()
  self: firstOrSelf(grad * -self.sin())

autograd cosh:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("cosh", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sinh())

autograd cosh:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("cosh").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sinh())

autograd cudnn_affine_grid_generator:
  proc forward*(ty: TensorType; theta: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor = 
    ty.dynamicCppCall("cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: firstOrSelf(cudnn_affine_grid_generator_backward(grad, N, C, H, W))

autograd cudnn_affine_grid_generator:
  proc forward*(theta: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor = 
    dynamicCCall("at::cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: firstOrSelf(cudnn_affine_grid_generator_backward(grad, N, C, H, W))

autograd cudnn_batch_norm:
  proc forward*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
    ty.dynamicCppCall("cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) 

autograd cudnn_batch_norm:
  proc forward*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
    dynamicCCall("at::cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) 

autograd cudnn_convolution:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: IntList; stride: IntList; dilation: IntList; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
    ty.dynamicCppCall("cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: IntList; stride: IntList; dilation: IntList; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
    dynamicCCall("at::cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution_transpose:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: IntList; output_padding: IntList; stride: IntList; dilation: IntList; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
    ty.dynamicCppCall("cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution_transpose:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: IntList; output_padding: IntList; stride: IntList; dilation: IntList; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
    dynamicCCall("at::cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_grid_sampler:
  proc forward*(ty: TensorType; self: Tensor; grid: Tensor): Tensor = 
    ty.dynamicCppCall("cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd cudnn_grid_sampler:
  proc forward*(self: Tensor; grid: Tensor): Tensor = 
    dynamicCCall("at::cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd ctc_loss_internal:
  proc forward*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: IntList; target_lengths: IntList; blank: int64 = 0): tuple[result0: Tensor, result1: Tensor] = 
    ty.dynamicCppCall("_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(ctc_loss_backward_internal(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank))

autograd ctc_loss_internal:
  proc forward*(log_probs: Tensor; targets: Tensor; input_lengths: IntList; target_lengths: IntList; blank: int64 = 0): tuple[result0: Tensor, result1: Tensor] = 
    dynamicCCall("at::_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(ctc_loss_backward_internal(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank))

autograd div_name:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("div", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)
  other: firstOrSelf(-grad * self / (other * other))

autograd div_name:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("div", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)
  other: firstOrSelf(-grad * self / (other * other))

autograd div_name:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("div", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)

autograd div_name:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("div", other).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)

autograd dot:
  proc forward*(ty: TensorType; self: Tensor; tensor: Tensor): Tensor = 
    ty.dynamicCppCall("dot", self.tensor, tensor.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * tensor)
  tensor: firstOrSelf(grad * self)

autograd dot:
  proc forward*(self: Tensor; tensor: Tensor): Tensor = 
    self.tensor.dynamicCppCall("dot", tensor.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * tensor)
  tensor: firstOrSelf(grad * self)

autograd embedding:
  proc forward*(ty: TensorType; weight: Tensor; indices: Tensor; padding_idx: int64 = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor = 
    ty.dynamicCppCall("embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: firstOrSelf(embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse))

autograd embedding:
  proc forward*(weight: Tensor; indices: Tensor; padding_idx: int64 = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor = 
    dynamicCCall("at::embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: firstOrSelf(embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse))

autograd embedding_bag_internal:
  proc forward*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] = 
    ty.dynamicCppCall("_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: firstOrSelf(embedding_bag_backward_internal(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse))

autograd embedding_bag_internal:
  proc forward*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] = 
    dynamicCCall("at::_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: firstOrSelf(embedding_bag_backward_internal(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse))

autograd erf:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("erf", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd erf:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("erf").to(ATensor).newTensor()
  self: firstOrSelf(2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd erfc:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("erfc", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd erfc:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("erfc").to(ATensor).newTensor()
  self: firstOrSelf(-2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd exp:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("exp", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * fwd_result)

autograd exp:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("exp").to(ATensor).newTensor()
  self: firstOrSelf(grad * fwd_result)

autograd expm1:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("expm1", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * (fwd_result + 1))

autograd expm1:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("expm1").to(ATensor).newTensor()
  self: firstOrSelf(grad * (fwd_result + 1))

autograd fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; value: float): Tensor = 
    ty.dynamicCppCall("fill_", self.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd fill_inplace:
  proc forward*(self: Tensor; value: float): Tensor = 
    self.tensor.dynamicCppCall("fill_", value).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; value: Tensor): Tensor = 
    ty.dynamicCppCall("fill_", self.tensor, value.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))
  value: firstOrSelf(grad.sum())

autograd fill_inplace:
  proc forward*(self: Tensor; value: Tensor): Tensor = 
    self.tensor.dynamicCppCall("fill_", value.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))
  value: firstOrSelf(grad.sum())

autograd floor:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("floor", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd floor:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("floor").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd grid_sampler_2d:
  proc forward*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor = 
    ty.dynamicCppCall("grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_2d:
  proc forward*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor = 
    dynamicCCall("at::grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d:
  proc forward*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor = 
    ty.dynamicCppCall("grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d:
  proc forward*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor = 
    dynamicCCall("at::grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd ger:
  proc forward*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor = 
    ty.dynamicCppCall("ger", self.tensor, vec2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.mv(vec2))
  vec2: firstOrSelf(grad.t().mv(self))

autograd ger:
  proc forward*(self: Tensor; vec2: Tensor): Tensor = 
    self.tensor.dynamicCppCall("ger", vec2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.mv(vec2))
  vec2: firstOrSelf(grad.t().mv(self))

autograd index_copy_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor = 
    ty.dynamicCppCall("index_copy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  source: firstOrSelf(grad.index_select(dim, index))

autograd index_copy_inplace:
  proc forward*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor = 
    self.tensor.dynamicCppCall("index_copy_", dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  source: firstOrSelf(grad.index_select(dim, index))

autograd inverse:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("inverse", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-mm(fwd_result.t(), mm(grad, fwd_result.t())))

autograd inverse:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("inverse").to(ATensor).newTensor()
  self: firstOrSelf(-mm(fwd_result.t(), mm(grad, fwd_result.t())))

autograd log:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("log", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.div_name(self))

autograd log:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("log").to(ATensor).newTensor()
  self: firstOrSelf(grad.div_name(self))

autograd log10:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("log10", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 2.3025850929940456))

autograd log10:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("log10").to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 2.3025850929940456))

autograd log2:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("log2", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 0.6931471805599453))

autograd log2:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("log2").to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 0.6931471805599453))

autograd log_softmax:
  proc forward*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
    ty.dynamicCppCall("log_softmax", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(log_softmax_backward_data(grad, fwd_result, dim, self))

autograd log_softmax:
  proc forward*(self: Tensor; dim: int64): Tensor = 
    self.tensor.dynamicCppCall("log_softmax", dim).to(ATensor).newTensor()
  self: firstOrSelf(log_softmax_backward_data(grad, fwd_result, dim, self))

autograd mean:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("mean", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()) / self.numel())

autograd mean:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("mean").to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()) / self.numel())

autograd mkldnn_convolution:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: IntList; stride: IntList; dilation: IntList; groups: int64): Tensor = 
    ty.dynamicCppCall("mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd mkldnn_convolution:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: IntList; stride: IntList; dilation: IntList; groups: int64): Tensor = 
    dynamicCCall("at::mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd mul:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("mul", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)
  other: firstOrSelf(grad * self)

autograd mul:
  proc forward*(self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("mul", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)
  other: firstOrSelf(grad * self)

autograd mul:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor = 
    ty.dynamicCppCall("mul", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)

autograd mul:
  proc forward*(self: Tensor; other: float): Tensor = 
    self.tensor.dynamicCppCall("mul", other).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)

autograd mv:
  proc forward*(ty: TensorType; self: Tensor; vec: Tensor): Tensor = 
    ty.dynamicCppCall("mv", self.tensor, vec.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.ger(vec))
  vec: firstOrSelf(self.t().mv(grad))

autograd mv:
  proc forward*(self: Tensor; vec: Tensor): Tensor = 
    self.tensor.dynamicCppCall("mv", vec.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.ger(vec))
  vec: firstOrSelf(self.t().mv(grad))

autograd RoiPooling2d_forward:
  proc forward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] = 
    ty.dynamicCppCall("RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: firstOrSelf(RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1]))

autograd RoiPooling2d_forward:
  proc forward*(input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] = 
    dynamicCCall("at::RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: firstOrSelf(RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1]))

autograd round:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("round", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd round:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("round").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd relu:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("relu", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, 0, 0))

autograd relu:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("relu").to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, 0, 0))

autograd hardshrink:
  proc forward*(ty: TensorType; self: Tensor; lambd: float): Tensor = 
    ty.dynamicCppCall("hardshrink", self.tensor, lambd).to(ATensor).newTensor()
  self: firstOrSelf(hardshrink_backward(grad, self, lambd))

autograd hardshrink:
  proc forward*(self: Tensor; lambd: float): Tensor = 
    self.tensor.dynamicCppCall("hardshrink", lambd).to(ATensor).newTensor()
  self: firstOrSelf(hardshrink_backward(grad, self, lambd))

autograd hardshrink_backward:
  proc forward*(ty: TensorType; grad_out: Tensor; self: Tensor; lambd: float): Tensor = 
    ty.dynamicCppCall("hardshrink_backward", grad_out.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_out: firstOrSelf(hardshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd hardshrink_backward:
  proc forward*(grad_out: Tensor; self: Tensor; lambd: float): Tensor = 
    self.tensor.dynamicCppCall("hardshrink_backward", grad_out.tensor, lambd).to(ATensor).newTensor()
  grad_out: firstOrSelf(hardshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd rsqrt:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("rsqrt", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-0.5 * grad * fwd_result.pow(3))

autograd rsqrt:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("rsqrt").to(ATensor).newTensor()
  self: firstOrSelf(-0.5 * grad * fwd_result.pow(3))

autograd sigmoid:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("sigmoid", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(sigmoid_backward_internal(grad, fwd_result))

autograd sigmoid:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("sigmoid").to(ATensor).newTensor()
  self: firstOrSelf(sigmoid_backward_internal(grad, fwd_result))

autograd sin:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("sin", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cos())

autograd sin:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("sin").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cos())

autograd sinh:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("sinh", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cosh())

autograd sinh:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("sinh").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cosh())

autograd softmax:
  proc forward*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
    ty.dynamicCppCall("softmax", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(softmax_backward_data(grad, fwd_result, dim, self))

autograd softmax:
  proc forward*(self: Tensor; dim: int64): Tensor = 
    self.tensor.dynamicCppCall("softmax", dim).to(ATensor).newTensor()
  self: firstOrSelf(softmax_backward_data(grad, fwd_result, dim, self))

autograd stack:
  proc forward*(ty: TensorType; tensors: TensorList; dim: int64 = 0): Tensor = 
    ty.dynamicCppCall("stack", tensors, dim).to(ATensor).newTensor()
  tensors: firstOrSelf(unbind(grad, dim))

autograd stack:
  proc forward*(tensors: TensorList; dim: int64 = 0): Tensor = 
    dynamicCCall("at::stack", tensors, dim).to(ATensor).newTensor()
  tensors: firstOrSelf(unbind(grad, dim))

autograd sum_internal:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("_sum", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()))

autograd sum_internal:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("_sum").to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()))

autograd sqrt:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("sqrt", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (2 * fwd_result))

autograd sqrt:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("sqrt").to(ATensor).newTensor()
  self: firstOrSelf(grad / (2 * fwd_result))

autograd t:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("t", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.t())

autograd t:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("t").to(ATensor).newTensor()
  self: firstOrSelf(grad.t())

autograd tan:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("tan", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * (1 + fwd_result.pow(2)))

autograd tan:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("tan").to(ATensor).newTensor()
  self: firstOrSelf(grad * (1 + fwd_result.pow(2)))

autograd tanh:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("tanh", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(tanh_backward_internal(grad, fwd_result))

autograd tanh:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("tanh").to(ATensor).newTensor()
  self: firstOrSelf(tanh_backward_internal(grad, fwd_result))

autograd transpose:
  proc forward*(ty: TensorType; self: Tensor; dim0: int64; dim1: int64): Tensor = 
    ty.dynamicCppCall("transpose", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd transpose:
  proc forward*(self: Tensor; dim0: int64; dim1: int64): Tensor = 
    self.tensor.dynamicCppCall("transpose", dim0, dim1).to(ATensor).newTensor()
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd transpose_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim0: int64; dim1: int64): Tensor = 
    ty.dynamicCppCall("transpose_", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd transpose_inplace:
  proc forward*(self: Tensor; dim0: int64; dim1: int64): Tensor = 
    self.tensor.dynamicCppCall("transpose_", dim0, dim1).to(ATensor).newTensor()
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd flip:
  proc forward*(ty: TensorType; self: Tensor; dims: IntList): Tensor = 
    ty.dynamicCppCall("flip", self.tensor, dims).to(ATensor).newTensor()
  self: firstOrSelf(grad.flip(dims))

autograd flip:
  proc forward*(self: Tensor; dims: IntList): Tensor = 
    self.tensor.dynamicCppCall("flip", dims).to(ATensor).newTensor()
  self: firstOrSelf(grad.flip(dims))

autograd rot90:
  proc forward*(ty: TensorType; self: Tensor; k: int64 = 1; dims: IntList): Tensor = 
    ty.dynamicCppCall("rot90", self.tensor, k, dims).to(ATensor).newTensor()
  self: firstOrSelf(grad.rot90(-k, dims))

autograd rot90:
  proc forward*(self: Tensor; k: int64 = 1; dims: IntList): Tensor = 
    self.tensor.dynamicCppCall("rot90", k, dims).to(ATensor).newTensor()
  self: firstOrSelf(grad.rot90(-k, dims))

autograd trunc:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("trunc", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd trunc:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("trunc").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd unsafe_view_internal:
  proc forward*(ty: TensorType; self: Tensor; size: IntList): Tensor = 
    ty.dynamicCppCall("_unsafe_view", self.tensor, size).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd unsafe_view_internal:
  proc forward*(self: Tensor; size: IntList): Tensor = 
    dynamicCCall("at::_unsafe_view", self.tensor, size).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd unsqueeze:
  proc forward*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
    ty.dynamicCppCall("unsqueeze", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(grad.squeeze(dim))

autograd unsqueeze:
  proc forward*(self: Tensor; dim: int64): Tensor = 
    self.tensor.dynamicCppCall("unsqueeze", dim).to(ATensor).newTensor()
  self: firstOrSelf(grad.squeeze(dim))

autograd unsqueeze_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
    ty.dynamicCppCall("unsqueeze_", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(grad.squeeze(dim))

autograd unsqueeze_inplace:
  proc forward*(self: Tensor; dim: int64): Tensor = 
    self.tensor.dynamicCppCall("unsqueeze_", dim).to(ATensor).newTensor()
  self: firstOrSelf(grad.squeeze(dim))

autograd s_where_internal:
  proc forward*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor = 
    ty.dynamicCppCall("_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(where(condition, grad, zeros_like(grad)))
  other: firstOrSelf(where(condition, zeros_like(grad), grad))

autograd s_where_internal:
  proc forward*(condition: Tensor; self: Tensor; other: Tensor): Tensor = 
    self.tensor.dynamicCppCall("_s_where", condition.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(where(condition, grad, zeros_like(grad)))
  other: firstOrSelf(where(condition, zeros_like(grad), grad))

autograd standard_gamma_internal:
  proc forward*(ty: TensorType; self: Tensor; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("_standard_gamma", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.standard_gamma_grad_internal(fwd_result))

autograd standard_gamma_internal:
  proc forward*(self: Tensor; generator: pointer = nil): Tensor = 
    self.tensor.dynamicCppCall("_standard_gamma", generator).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.standard_gamma_grad_internal(fwd_result))

autograd poisson:
  proc forward*(ty: TensorType; self: Tensor; generator: pointer = nil): Tensor = 
    ty.dynamicCppCall("poisson", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd poisson:
  proc forward*(self: Tensor; generator: pointer = nil): Tensor = 
    dynamicCCall("at::poisson", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd clone:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("clone", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd clone:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("clone").to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd pow:
  proc forward*(ty: TensorType; self: Tensor; exponent: float): Tensor = 
    ty.dynamicCppCall("pow", self.tensor, exponent).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward(grad, self, exponent))

autograd pow:
  proc forward*(self: Tensor; exponent: float): Tensor = 
    self.tensor.dynamicCppCall("pow", exponent).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward(grad, self, exponent))

autograd zero_inplace:
  proc forward*(ty: TensorType; self: Tensor): Tensor = 
    ty.dynamicCppCall("zero_", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd zero_inplace:
  proc forward*(self: Tensor): Tensor = 
    self.tensor.dynamicCppCall("zero_").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd sub:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("sub", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(-grad * alpha)

autograd sub:
  proc forward*(self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("sub", other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(-grad * alpha)

autograd sub:
  proc forward*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor = 
    ty.dynamicCppCall("sub", self.tensor, other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd sub:
  proc forward*(self: Tensor; other: float; alpha: float = 1): Tensor = 
    self.tensor.dynamicCppCall("sub", other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd thnn_fused_gru_cell_internal:
  proc forward*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] = 
    ty.dynamicCppCall("_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): thnn_fused_gru_cell_backward_internal(grad, fwd_result[1], input_bias.defined())

autograd thnn_fused_gru_cell_internal:
  proc forward*(input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] = 
    dynamicCCall("at::_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): thnn_fused_gru_cell_backward_internal(grad, fwd_result[1], input_bias.defined())

