# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

import math
import ../nimtorch

const M_PI = math.PI

proc abs_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * self.sign()

proc acos_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * -((-self * self + 1).rsqrt())

proc add_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor, alpha: float): tuple[self: Tensor, other: Tensor] =
  result.self = grad
  result.other = torch.maybe_multiply(grad, alpha)

proc add_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float, alpha: float): tuple[self: Tensor] =
  result.self = grad

proc addbmm_bwd*(grad, fwd_result: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  result.self = torch.maybe_multiply(grad, beta)
  result.batch1 = grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  result.batch2 = batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha

proc addcdiv_bwd*(grad, fwd_result: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  result.self = grad
  result.tensor1 = grad * value / tensor2
  result.tensor2 = -grad * value * tensor1 / (tensor2 * tensor2)

proc addcmul_bwd*(grad, fwd_result: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  result.self = grad
  result.tensor1 = grad * tensor2 * value
  result.tensor2 = grad * tensor1 * value

proc th_addmm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  result.self = torch.maybe_multiply(grad, beta)
  result.mat1 = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat2 = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

proc s_native_addmm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  result.self = torch.maybe_multiply(grad, beta)
  result.mat1 = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat2 = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

proc u_addmv_bwd*(grad, fwd_result: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat: Tensor, vec: Tensor] =
  result.self = torch.maybe_multiply(grad, beta)
  result.mat = grad.ger(vec) * alpha
  result.vec = mat.t().mv(grad) * alpha

proc u_addr_bwd*(grad, fwd_result: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float, alpha: float): tuple[self: Tensor, vec1: Tensor, vec2: Tensor] =
  result.self = torch.maybe_multiply(grad, beta)
  result.vec1 = grad.mv(vec2) * alpha
  result.vec2 = grad.t().mv(vec1) * alpha

proc alias_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad

proc asin_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * (-self * self + 1).rsqrt()

proc atan_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad / (self * self + 1)

proc baddbmm_bwd*(grad, fwd_result: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  result.self = torch.maybe_multiply(grad, beta)
  result.batch1 = grad.bmm(batch2.transpose(1, 2)) * alpha
  result.batch2 = batch1.transpose(1, 2).bmm(grad) * alpha

proc bernoulli_bwd*(grad, fwd_result: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc bmm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  result.self = grad.bmm(mat2.transpose(1, 2))
  result.mat2 = self.transpose(1, 2).bmm(grad)

proc cauchy_u_bwd*(grad, fwd_result: Tensor, self: Tensor, median: float64, sigma: float64, generator: pointer): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc ceil_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc clamp_min_bwd*(grad, fwd_result: Tensor, self: Tensor, min: float): tuple[self: Tensor] =
  result.self = grad * (self >= min).type_as(grad)

proc clamp_max_bwd*(grad, fwd_result: Tensor, self: Tensor, max: float): tuple[self: Tensor] =
  result.self = grad * (self <= max).type_as(grad)

proc clone_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad

proc cos_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * -self.sin()

proc cosh_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * self.sinh()

proc cross_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor, dim: int64): tuple[self: Tensor, other: Tensor] =
  result.self = other.cross(grad, dim)
  result.other = grad.cross(self, dim)

proc conv_tbc_bwd*(grad, fwd_result: Tensor, self: Tensor, weight: Tensor, bias: Tensor, pad: int64): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  result.self = torch.conv_tbc_backward(grad, self, weight, bias, pad)
  result.weight = torch.conv_tbc_backward(grad, self, weight, bias, pad)
  result.bias = torch.conv_tbc_backward(grad, self, weight, bias, pad)

proc adiv_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad / other
  result.other = -grad * self / (other * other)

proc adiv_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = grad / other

proc dot_bwd*(grad, fwd_result: Tensor, self: Tensor, tensor: Tensor): tuple[self: Tensor, tensor: Tensor] =
  result.self = grad * tensor
  result.tensor = grad * self

proc eq_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = torch.zeros_like(self)

proc eq_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = torch.zeros_like(self)
  result.other = torch.zeros_like(other)

proc erf_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = 2.0 / torch.sqrt(M_PI) * torch.exp(-(self.pow(2))) * grad

proc erfc_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = -2.0 / torch.sqrt(M_PI) * torch.exp(-(self.pow(2))) * grad

proc erfinv_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = 0.5 * torch.sqrt(M_PI) * torch.exp(self.erfinv().pow(2)) * grad

proc exp_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * fwd_result

proc expm1_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * (fwd_result + 1)

proc exponential_u_bwd*(grad, fwd_result: Tensor, self: Tensor, lambd: float64, generator: pointer): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, value: float): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  result.self = torch.zeros_like(grad)
  result.value = grad.sum()

proc floor_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc fmod_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = grad

proc fmod_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor] =
  result.self = grad

proc frac_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad

proc gather_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor): tuple[self: Tensor] =
  result.self = torch.zeros(self.sizes(), grad.getType()).scatter_add_u(dim, index, grad)

proc ge_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = torch.zeros_like(self)

proc ge_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = torch.zeros_like(self)
  result.other = torch.zeros_like(other)

proc geometric_u_bwd*(grad, fwd_result: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc ger_bwd*(grad, fwd_result: Tensor, self: Tensor, vec2: Tensor): tuple[self: Tensor, vec2: Tensor] =
  result.self = grad.mv(vec2)
  result.vec2 = grad.t().mv(self)

proc grid_sampler_2d_bwd*(grad, fwd_result: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[input: Tensor, grid: Tensor] =
  result.input = torch.grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)
  result.grid = torch.grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

proc grid_sampler_3d_bwd*(grad, fwd_result: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[input: Tensor, grid: Tensor] =
  result.input = torch.grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)
  result.grid = torch.grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

proc gt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = torch.zeros_like(self)

proc gt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = torch.zeros_like(self)
  result.other = torch.zeros_like(other)

proc index_add_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  result.self = grad
  result.source = grad.index_select(dim, index)

proc index_copy_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  result.self = grad.clone().index_fill_u(dim, index, 0)
  result.source = grad.index_select(dim, index)

proc index_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: float): tuple[self: Tensor] =
  result.self = grad.clone().index_fill_u(dim, index, 0)

proc index_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  result.self = grad.clone().index_fill_u(dim, index, 0)
  result.value = grad.index_select(dim, index).sum()

proc index_select_bwd*(grad, fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor): tuple[self: Tensor] =
  result.self = torch.zeros(self.sizes(), grad.getType()).index_add_u(dim, index, grad)

proc inverse_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = -torch.mm(fwd_result.t(), torch.mm(grad, fwd_result.t()))

proc le_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = torch.zeros_like(self)

proc le_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = torch.zeros_like(self)
  result.other = torch.zeros_like(other)

proc lgamma_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * torch.digamma(self)

proc digamma_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * torch.polygamma(1, self)

proc polygamma_bwd*(grad, fwd_result: Tensor, n: int64, self: Tensor): tuple[self: Tensor] =
  result.self = grad * torch.polygamma(n + 1, self)

proc log_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.adiv(self)

proc log10_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad / (self * 2.3025850929940456)

proc log2_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad / (self * 0.6931471805599453)

proc log_normal_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc lt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = torch.zeros_like(self)

proc lt_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = torch.zeros_like(self)
  result.other = torch.zeros_like(other)

proc masked_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mask: Tensor, value: float): tuple[self: Tensor] =
  result.self = grad.clone().masked_fill_u(mask, 0)

proc masked_fill_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mask: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  result.self = grad.clone().masked_fill_u(mask, 0)
  result.value = torch.where(mask, grad, torch.zeros_like(grad)).sum()

proc masked_select_bwd*(grad, fwd_result: Tensor, self: Tensor, mask: Tensor): tuple[self: Tensor] =
  result.self = torch.zeros_like(self).masked_scatter_u(mask, grad)

proc max_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad.clone().masked_fill_u(self <= other, 0)
  result.other = grad.clone().masked_fill_u(self > other, 0)

proc mean_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.expand(self.sizes()) / self.numel()

proc min_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad.clone().masked_fill_u(self >= other, 0)
  result.other = grad.clone().masked_fill_u(self < other, 0)

proc u_mm_bwd*(grad, fwd_result: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  result.self = torch.mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  result.mat2 = torch.mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)

proc mul_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad * other
  result.other = grad * self

proc mul_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = grad * other

proc mv_bwd*(grad, fwd_result: Tensor, self: Tensor, vec: Tensor): tuple[self: Tensor, vec: Tensor] =
  result.self = grad.ger(vec)
  result.vec = self.t().mv(grad)

proc ne_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = torch.zeros_like(self)

proc ne_u_bwd*(grad, fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = torch.zeros_like(self)
  result.other = torch.zeros_like(other)

proc neg_bwd*(grad, fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.neg()

proc normal_u_bwd*(grad, fwd_result: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  result.self = torch.zeros_like(grad)

proc normal_bwd*(grad, fwd_result: Tensor, mean: Tensor, std: float64, generator: pointer): tuple[mean: Tensor] =
  result.mean = torch.zeros(mean.sizes(), grad.getType())

proc normal_bwd*(grad, fwd_result: Tensor, mean: float64, std: Tensor, generator: pointer): tuple[std: Tensor] =
  result.std = torch.zeros(std.sizes(), grad.getType())

proc normal_bwd*(grad, fwd_result: Tensor, mean: Tensor, std: Tensor, generator: pointer): tuple[mean: Tensor, std: Tensor] =
  result.mean = torch.zeros(mean.sizes(), grad.getType())
  result.std = torch.zeros(std.sizes(), grad.getType())

proc poisson_bwd*(grad, fwd_result: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  result.self = torch.zeros_like(self)

proc put_u_bwd*(grad, fwd_result: Tensor, self: Tensor, index: Tensor, source: Tensor, accumulate: bool): tuple[self: Tensor, source: Tensor] =
  result.self = grad.clone().put_u(index, torch.zeros_like(source), accumulate)
  result.source = grad.take(index)

proc random_u_bwd*(grad, fw