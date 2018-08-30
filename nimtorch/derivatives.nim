# Automatically generated, to update run again the generator from the torch root path
# nim c -r nimtorch/generator.nim

import math
import ../nimtorch

const M_PI = math.PI

proc abs_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * self.sign()

proc acos_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * -((-self * self + 1).rsqrt())

proc add_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor, alpha: float): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad
  discard cppctor(addr(result.other))
  result.other = torch.maybe_multiply(grad, alpha)

proc add_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float, alpha: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc addbmm_bwd*(grad, fwd_result: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.maybe_multiply(grad, beta)
  discard cppctor(addr(result.batch1))
  result.batch1 = grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  discard cppctor(addr(result.batch2))
  result.batch2 = batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha

proc addcdiv_bwd*(grad, fwd_result: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad
  discard cppctor(addr(result.tensor1))
  result.tensor1 = grad * value / tensor2
  discard cppctor(addr(result.tensor2))
  result.tensor2 = -grad * value * tensor1 / (tensor2 * tensor2)

proc addcmul_bwd*(grad, fwd_result: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad
  discard cppctor(addr(result.tensor1))
  result.tensor1 = grad * tensor2 * value
  discard cppctor(addr(result.tensor2))
  result.tensor2 = grad * tensor1 * value

proc th_addmm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.maybe_multiply(grad, beta)
  discard cppctor(addr(result.mat1))
  result.mat1 = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  discard cppctor(addr(result.mat2))
  result.mat2 = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

proc s_native_addmm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.maybe_multiply(grad, beta)
  discard cppctor(addr(result.mat1))
  result.mat1 = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  discard cppctor(addr(result.mat2))
  result.mat2 = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

proc u_addmv_bwd*(grad, fwd_result: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat: Tensor, vec: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.maybe_multiply(grad, beta)
  discard cppctor(addr(result.mat))
  result.mat = grad.ger(vec) * alpha
  discard cppctor(addr(result.vec))
  result.vec = mat.t().mv(grad) * alpha

proc u_addr_bwd*(grad, fwd_result: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float, alpha: float): tuple[self: Tensor, vec1: Tensor, vec2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.maybe_multiply(grad, beta)
  discard cppctor(addr(result.vec1))
  result.vec1 = grad.mv(vec2) * alpha
  discard cppctor(addr(result.vec2))
  result.vec2 = grad.t().mv(vec1) * alpha

proc alias_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc asin_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * (-self * self + 1).rsqrt()

proc atan_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad / (self * self + 1)

proc baddbmm_bwd*(grad, fwd_result: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.maybe_multiply(grad, beta)
  discard cppctor(addr(result.batch1))
  result.batch1 = grad.bmm(batch2.transpose(1, 2)) * alpha
  discard cppctor(addr(result.batch2))
  result.batch2 = batch1.transpose(1, 2).bmm(grad) * alpha

proc bernoulli_bwd*(grad, fwd_result: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc bmm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.bmm(mat2.transpose(1, 2))
  discard cppctor(addr(result.mat2))
  result.mat2 = self.transpose(1, 2).bmm(grad)

proc cauchy_u_bwd*(grad, fwd_result: Tensor, self: Tensor, median: float64, sigma: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc ceil_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc clamp_min_bwd*(grad, fwd_result: Tensor, self: Tensor, min: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * (self >= min).type_as(grad)

proc clamp_max_bwd*(grad, fwd_result: Tensor, self: Tensor, max: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * (self <= max).type_as(grad)

proc clone_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc cos_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * -self.sin()

proc cosh_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * self.sinh()

proc cross_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor, dim: int64): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = other.cross(grad, dim)
  discard cppctor(addr(result.other))
  result.other = grad.cross(self, dim)

proc adiv_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad / other
  discard cppctor(addr(result.other))
  result.other = -grad * self / (other * other)

proc adiv_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad / other

proc dot_bwd*(grad, fwd_result: Tensor, self: Tensor, tensor: Tensor): tuple[self: Tensor, tensor: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * tensor
  discard cppctor(addr(result.tensor))
  result.tensor = grad * self

proc eq_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc eq_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)
  discard cppctor(addr(result.other))
  result.other = torch.zeros_like(other)

proc erf_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = 2.0 / torch.sqrt(M_PI) * torch.exp(-(self.pow(2))) * grad

proc erfc_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = -2.0 / torch.sqrt(M_PI) * torch.exp(-(self.pow(2))) * grad

proc erfinv_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = 0.5 * torch.sqrt(M_PI) * torch.exp(self.erfinv().pow(2)) * grad

proc exp_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * fwd_result

proc expm1_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * (fwd_result + 1)

proc exponential_u_bwd*(grad, fwd_result: Tensor, self: Tensor, lambd: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)
  discard cppctor(addr(result.value))
  result.value = grad.sum()

proc floor_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc fmod_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc fmod_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc frac_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc gather_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros(self.sizes(), grad.getType()).scatter_add_u(dim, index, grad)

proc ge_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc ge_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)
  discard cppctor(addr(result.other))
  result.other = torch.zeros_like(other)

proc geometric_u_bwd*(grad, fwd_result: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc ger_bwd*(grad, fwd_result: Tensor, self: Tensor, vec2: Tensor): tuple[self: Tensor, vec2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.mv(vec2)
  discard cppctor(addr(result.vec2))
  result.vec2 = grad.t().mv(self)

proc gt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc gt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)
  discard cppctor(addr(result.other))
  result.other = torch.zeros_like(other)

proc index_add_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad
  discard cppctor(addr(result.source))
  result.source = grad.index_select(dim, index)

proc index_copy_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().index_fill_u(dim, index, 0)
  discard cppctor(addr(result.source))
  result.source = grad.index_select(dim, index)

proc index_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().index_fill_u(dim, index, 0)

proc index_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().index_fill_u(dim, index, 0)
  discard cppctor(addr(result.value))
  result.value = grad.index_select(dim, index).sum()

proc index_select_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros(self.sizes(), grad.getType()).index_add_u(dim, index, grad)

proc inverse_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = -torch.mm(fwd_result.t(), torch.mm(grad, fwd_result.t()))

proc le_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc le_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)
  discard cppctor(addr(result.other))
  result.other = torch.zeros_like(other)

proc lgamma_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * torch.digamma(self)

proc digamma_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * torch.polygamma(1, self)

proc polygamma_bwd*(grad, fwd_result: Tensor, n: int64, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * torch.polygamma(n + 1, self)

proc log_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.adiv(self)

proc log10_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad / (self * 2.3025850929940456)

proc log2_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad / (self * 0.6931471805599453)

proc log_normal_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc lt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc lt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)
  discard cppctor(addr(result.other))
  result.other = torch.zeros_like(other)

proc masked_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mask: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().masked_fill_u(mask, 0)

proc masked_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mask: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().masked_fill_u(mask, 0)
  discard cppctor(addr(result.value))
  result.value = torch.where(mask, grad, torch.zeros_like(grad)).sum()

proc masked_select_bwd*(grad, fwd_result: Tensor, self: Tensor, mask: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self).masked_scatter_u(mask, grad)

proc max_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().masked_fill_u(self <= other, 0)
  discard cppctor(addr(result.other))
  result.other = grad.clone().masked_fill_u(self > other, 0)

proc mean_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.expand(self.sizes()) / self.numel()

proc min_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().masked_fill_u(self >= other, 0)
  discard cppctor(addr(result.other))
  result.other = grad.clone().masked_fill_u(self < other, 0)

proc u_mm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  discard cppctor(addr(result.mat2))
  result.mat2 = torch.mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)

proc mul_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * other
  discard cppctor(addr(result.other))
  result.other = grad * self

proc mul_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * other

proc mv_bwd*(grad, fwd_result: Tensor, self: Tensor, vec: Tensor): tuple[self: Tensor, vec: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.ger(vec)
  discard cppctor(addr(result.vec))
  result.vec = self.t().mv(grad)

proc ne_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc ne_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)
  discard cppctor(addr(result.other))
  result.other = torch.zeros_like(other)

proc neg_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.neg()

proc normal_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc normal_bwd*(grad, fwd_result: Tensor, mean: Tensor, std: float64, generator: pointer): tuple[mean: Tensor] =
  discard cppctor(addr(result.mean))
  result.mean = torch.zeros(mean.sizes(), grad.getType())

proc normal_bwd*(grad, fwd_result: Tensor, mean: float64, std: Tensor, generator: pointer): tuple[std: Tensor] =
  discard cppctor(addr(result.std))
  result.std = torch.zeros(std.sizes(), grad.getType())

proc normal_bwd*(grad, fwd_result: Tensor, mean: Tensor, std: Tensor, generator: pointer): tuple[mean: Tensor, std: Tensor] =
  discard cppctor(addr(result.mean))
  result.mean = torch.zeros(mean.sizes(), grad.getType())
  discard cppctor(addr(result.std))
  result.std = torch.zeros(std.sizes(), grad.getType())

proc poisson_bwd*(grad, fwd_result: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc put_u_bwd*(grad, fwd_result: Tensor, self: Tensor, index: Tensor, source: Tensor, accumulate: bool): tuple[self: Tensor, source: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().put_u(index, torch.zeros_like(source), accumulate)
  discard cppctor(addr(result.source))
  result.source = grad.take(index)

proc random_u_bwd*(grad, fwd_result: Tensor, self: Tensor, afrom: int64, ato: int64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc random_u_bwd*(grad, fwd_result: Tensor, self: Tensor, ato: int64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc random_u_bwd*(grad, fwd_result: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc reciprocal_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = -grad * fwd_result * fwd_result

proc remainder_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc remainder_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc round_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc rsqrt_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = -0.5 * grad * fwd_result.pow(3)

proc scatter_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, src: Tensor): tuple[self: Tensor, src: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().scatter_u(dim, index, 0)
  discard cppctor(addr(result.src))
  result.src = grad.gather(dim, index)

proc scatter_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.clone().scatter_u(dim, index, 0)

proc scatter_add_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, src: Tensor): tuple[self: Tensor, src: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad
  discard cppctor(addr(result.src))
  result.src = grad.gather(dim, index)

proc sigmoid_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.u_sigmoid_backward(grad, fwd_result)

proc sign_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc sin_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * self.cos()

proc sinh_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * self.cosh()

proc sqrt_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad / (2 * fwd_result)

proc sub_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor, alpha: float): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad
  discard cppctor(addr(result.other))
  result.other = -grad * alpha

proc sub_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float, alpha: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad

proc u_sum_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.expand(self.sizes())

proc t_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.t()

proc flip_bwd*(grad, fwd_result: Tensor, self: Tensor, dims: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.flip(dims)

proc rot90_bwd*(grad, fwd_result: Tensor, self: Tensor, k: int64, dims: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.rot90(-k, dims)

proc take_bwd*(grad, fwd_result: Tensor, self: Tensor, index: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self).put_u(index, grad, true)

proc tan_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * (1 + fwd_result.pow(2))

proc tanh_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.u_tanh_backward(grad, fwd_result)

proc transpose_bwd*(grad, fwd_result: Tensor, self: Tensor, dim0: int64, dim1: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.transpose(dim0, dim1)

proc transpose_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim0: int64, dim1: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.transpose(dim0, dim1)

proc tril_bwd*(grad, fwd_result: Tensor, self: Tensor, diagonal: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.tril(diagonal)

proc triu_bwd*(grad, fwd_result: Tensor, self: Tensor, diagonal: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.triu(diagonal)

proc trunc_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc uniform_u_bwd*(grad, fwd_result: Tensor, self: Tensor, afrom: float64, ato: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc u_unsafe_view_bwd*(grad, fwd_result: Tensor, self: Tensor, size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.reshape(self.sizes())

proc unsqueeze_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.squeeze(dim)

proc unsqueeze_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.squeeze(dim)

proc view_bwd*(grad, fwd_result: Tensor, self: Tensor, size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad.reshape(self.sizes())

proc u_s_where_bwd*(grad, fwd_result: Tensor, self: Tensor, condition: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.where(condition, grad, torch.zeros_like(grad))
  discard cppctor(addr(result.other))
  result.other = torch.where(condition, torch.zeros_like(grad), grad)

proc zero_u_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc u_standard_gamma_bwd*(grad, fwd_result: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = grad * self.u_standard_gamma_grad(fwd_result)

proc binary_cross_entropy_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.binary_cross_entropy_backward(grad, self, target, weight, reduction)

proc embedding_bwd*(grad, fwd_result: Tensor, weight: Tensor, indices: Tensor, padding_idx: int64, scale_grad_by_freq: bool, sparse: bool): tuple[weight: Tensor] =
  discard cppctor(addr(result.weight))
  result.weight = torch.embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)

proc l1_loss_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.l1_loss_backward(grad, self, target, reduction)

proc mse_loss_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.mse_loss_backward(grad, self, target, reduction)

proc multi_margin_loss_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)

proc smooth_l1_loss_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.smooth_l1_loss_backward(grad, self, target, reduction)

proc soft_margin_loss_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.soft_margin_loss_backward(grad, self, target, reduction)

proc relu_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.threshold_backward(grad, self, 0, 0)

proc elu_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, alpha: float, scale: float, input_scale: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.elu_backward(grad, alpha, scale, input_scale, fwd_result)

proc glu_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.glu_backward(grad, self, dim)

proc hardshrink_bwd*(grad, fwd_result: Tensor, self: Tensor, lambd: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.hardshrink_backward(grad, self, lambd)

proc hardshrink_backward_bwd*(grad, fwd_result: Tensor, self: Tensor, grad_out: Tensor, lambd: float): tuple[grad_out: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_out))
  result.grad_out = torch.hardshrink_backward(grad, self, lambd)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc hardtanh_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, min_val: float, max_val: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.hardtanh_backward(grad, self, min_val, max_val)

proc hardtanh_forward_u_bwd*(grad, fwd_result: Tensor, self: Tensor, min_val: float, max_val: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.hardtanh_backward(grad, fwd_result, min_val, max_val)

proc leaky_relu_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, negative_slope: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.leaky_relu_backward(grad, self, negative_slope)

proc leaky_relu_forward_u_bwd*(grad, fwd_result: Tensor, self: Tensor, negative_slope: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.leaky_relu_backward(grad, fwd_result, negative_slope)

proc log_softmax_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.log_softmax_backward_data(grad, fwd_result, dim, self)

proc rrelu_with_noise_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)

proc rrelu_with_noise_forward_u_bwd*(grad, fwd_result: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)

proc softmax_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.softmax_backward_data(grad, fwd_result, dim, self)

proc softplus_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, beta: float, threshold: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.softplus_backward(grad, self, beta, threshold, fwd_result)

proc softshrink_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, lambd: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.softshrink_backward(grad, self, lambd)

proc threshold_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, threshold: float, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.threshold_backward(grad, self, threshold, value)

proc threshold_forward_u_bwd*(grad, fwd_result: Tensor, self: Tensor, threshold: float, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.threshold_backward(grad, fwd_result, threshold, value)

proc reflection_pad1d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.reflection_pad1d_backward(grad, self, padding)

proc reflection_pad2d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.reflection_pad2d_backward(grad, self, padding)

proc replication_pad1d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.replication_pad1d_backward(grad, self, padding)

proc replication_pad2d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.replication_pad2d_backward(grad, self, padding)

proc replication_pad3d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.replication_pad3d_backward(grad, self, padding)

proc upsample_linear1d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)

proc upsample_bilinear2d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)

proc upsample_trilinear3d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)

proc upsample_nearest1d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.upsample_nearest1d_backward(grad, output_size, self.sizes())

proc upsample_nearest2d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.upsample_nearest2d_backward(grad, output_size, self.sizes())

proc upsample_nearest3d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.upsample_nearest3d_backward(grad, output_size, self.sizes())

proc adaptive_avg_pool2d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.adaptive_avg_pool2d_backward(grad, self)

proc adaptive_avg_pool3d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.adaptive_avg_pool3d_backward(grad, self)

proc avg_pool2d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

proc avg_pool3d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

proc max_unpool2d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, indices: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.max_unpool2d_backward(grad, self, indices, output_size)

proc max_unpool3d_forward_bwd*(grad, fwd_result: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  result.self = torch.max_unpool3d_backward(grad, self, indices, output_size, stride, padding)

proc adaptive_avg_pool2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc adaptive_avg_pool3d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc avg_pool2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc avg_pool3d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc hardtanh_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, min_val: float, max_val: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.hardtanh_backward(grad, self, min_val, max_val)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc leaky_relu_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, negative_slope: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.leaky_relu_backward(grad, self, negative_slope)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc max_unpool2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.max_unpool2d(grad, indices, output_size)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc nll_loss_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.nll_loss(grad, target, weight, reduction, ignore_index)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc nll_loss2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.nll_loss2d(grad, target, weight, reduction, ignore_index)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc rrelu_with_noise_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc reflection_pad1d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.reflection_pad1d(grad, padding)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc reflection_pad2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.reflection_pad2d(grad, padding)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc replication_pad1d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.replication_pad1d(grad, padding)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc replication_pad2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.replication_pad2d(grad, padding)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc replication_pad3d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.replication_pad3d(grad, padding)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(self)

proc softshrink_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, lambd: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.softshrink_backward(grad, self, lambd)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc threshold_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, self: Tensor, threshold: float, value: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.threshold_backward(grad, self, threshold, value)
  discard cppctor(addr(result.self))
  result.self = torch.zeros_like(grad)

proc upsample_linear1d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.upsample_linear1d(grad, output_size, align_corners)

proc upsample_bilinear2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.upsample_bilinear2d(grad, output_size, align_corners)

proc upsample_trilinear3d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.upsample_trilinear3d(grad, output_size, align_corners)

proc upsample_nearest1d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.upsample_nearest1d(grad, output_size)

proc upsample_nearest2d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.upsample_nearest2d(grad, output_size)

proc upsample_nearest3d_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.upsample_nearest3d(grad, output_size)

proc u_sigmoid_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output: Tensor): tuple[grad_output: Tensor, output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.u_sigmoid_backward(grad, fwd_result)
  discard cppctor(addr(result.output))
  result.output = grad * grad_output * (-2 * fwd_result + 1)

proc u_tanh_backward_bwd*(grad, fwd_result: Tensor, grad_output: Tensor, output: Tensor): tuple[grad_output: Tensor, output: Tensor] =
  discard cppctor(addr(result.grad_output))
  result.grad_output = torch.u_tanh_backward(grad, fwd_result)
  discard cppctor(addr(result.output))
  result.output = -2 * fwd_result * grad * grad_output

proc cudnn_affine_grid_generator_bwd*(grad, fwd_result: Tensor, theta: Tensor, N: int64, C: int64, H: int64, W: int64): tuple[theta: Tensor] =
  discard cppctor(addr(result.theta))
  result.theta = torch.cudnn_affine_grid_generator_backward(grad, N, C, H, W)

proc stack_bwd*(grad, fwd_result: Tensor, tensors: TensorList, dim: int64): tuple[tensors: TensorList] =
  discard cppctor(addr(result.tensors))
  result.tensors = torch.unbind(grad, dim)

