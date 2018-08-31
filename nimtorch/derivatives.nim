# Automatically generated, to update run again the generator from the torch root path
# nim c -r nimtorch/generator.nim

import math
import ../nimtorch

const M_PI = math.PI

proc abs_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * self.sign()
  result.self = self_result

proc acos_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * -((-self * self + 1).rsqrt())
  result.self = self_result

proc add_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor, alpha: float): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.maybe_multiply(grad, alpha)
  result.other = other_result

proc add_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float, alpha: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc addbmm_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  discard cppctor(addr(result.batch1))
  let batch1_result = grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  result.batch1 = batch1_result
  discard cppctor(addr(result.batch2))
  let batch2_result = batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha
  result.batch2 = batch2_result

proc addcdiv_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result
  discard cppctor(addr(result.tensor1))
  let tensor1_result = grad * value / tensor2
  result.tensor1 = tensor1_result
  discard cppctor(addr(result.tensor2))
  let tensor2_result = -grad * value * tensor1 / (tensor2 * tensor2)
  result.tensor2 = tensor2_result

proc addcmul_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result
  discard cppctor(addr(result.tensor1))
  let tensor1_result = grad * tensor2 * value
  result.tensor1 = tensor1_result
  discard cppctor(addr(result.tensor2))
  let tensor2_result = grad * tensor1 * value
  result.tensor2 = tensor2_result

proc th_addmm_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  discard cppctor(addr(result.mat1))
  let mat1_result = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat1 = mat1_result
  discard cppctor(addr(result.mat2))
  let mat2_result = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)
  result.mat2 = mat2_result

proc s_native_addmm_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  discard cppctor(addr(result.mat1))
  let mat1_result = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat1 = mat1_result
  discard cppctor(addr(result.mat2))
  let mat2_result = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)
  result.mat2 = mat2_result

proc u_addmv_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat: Tensor, vec: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  discard cppctor(addr(result.mat))
  let mat_result = grad.ger(vec) * alpha
  result.mat = mat_result
  discard cppctor(addr(result.vec))
  let vec_result = mat.t().mv(grad) * alpha
  result.vec = vec_result

proc u_addr_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float, alpha: float): tuple[self: Tensor, vec1: Tensor, vec2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  discard cppctor(addr(result.vec1))
  let vec1_result = grad.mv(vec2) * alpha
  result.vec1 = vec1_result
  discard cppctor(addr(result.vec2))
  let vec2_result = grad.t().mv(vec1) * alpha
  result.vec2 = vec2_result

proc alias_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc asin_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * (-self * self + 1).rsqrt()
  result.self = self_result

proc atan_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad / (self * self + 1)
  result.self = self_result

proc baddbmm_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  discard cppctor(addr(result.batch1))
  let batch1_result = grad.bmm(batch2.transpose(1, 2)) * alpha
  result.batch1 = batch1_result
  discard cppctor(addr(result.batch2))
  let batch2_result = batch1.transpose(1, 2).bmm(grad) * alpha
  result.batch2 = batch2_result

proc bernoulli_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc bmm_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.bmm(mat2.transpose(1, 2))
  result.self = self_result
  discard cppctor(addr(result.mat2))
  let mat2_result = self.transpose(1, 2).bmm(grad)
  result.mat2 = mat2_result

proc cauchy_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, median: float64, sigma: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc ceil_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc clamp_min_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, min: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * (self >= min).type_as(grad)
  result.self = self_result

proc clamp_max_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, max: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * (self <= max).type_as(grad)
  result.self = self_result

proc clone_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc cos_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * -self.sin()
  result.self = self_result

proc cosh_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * self.sinh()
  result.self = self_result

proc cross_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor, dim: int64): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = other.cross(grad, dim)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = grad.cross(self, dim)
  result.other = other_result

proc conv_tbc_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, weight: Tensor, bias: Tensor, pad: int64): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.conv_tbc_backward(grad, self, weight, bias, pad)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc u_ctc_loss_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor], log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64): tuple[log_probs: Tensor] =
  discard cppctor(addr(result.log_probs))
  let log_probs_result = torch.u_ctc_loss_backward(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank)
  result.log_probs = log_probs_result

proc adiv_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad / other
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = -grad * self / (other * other)
  result.other = other_result

proc adiv_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad / other
  result.self = self_result

proc dot_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, tensor: Tensor): tuple[self: Tensor, tensor: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * tensor
  result.self = self_result
  discard cppctor(addr(result.tensor))
  let tensor_result = grad * self
  result.tensor = tensor_result

proc eq_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc eq_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.zeros_like(other)
  result.other = other_result

proc erf_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = 2.0 / torch.sqrt(M_PI) * torch.exp(-(self.pow(2))) * grad
  result.self = self_result

proc erfc_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = -2.0 / torch.sqrt(M_PI) * torch.exp(-(self.pow(2))) * grad
  result.self = self_result

proc erfinv_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = 0.5 * torch.sqrt(M_PI) * torch.exp(self.erfinv().pow(2)) * grad
  result.self = self_result

proc exp_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * fwd_result
  result.self = self_result

proc expm1_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * (fwd_result + 1)
  result.self = self_result

proc exponential_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, lambd: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc fill_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc fill_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result
  discard cppctor(addr(result.value))
  let value_result = grad.sum()
  result.value = value_result

proc floor_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc fmod_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc fmod_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc frac_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc gather_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros(self.sizes(), grad.getType()).scatter_add_u(dim, index, grad)
  result.self = self_result

proc ge_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc ge_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.zeros_like(other)
  result.other = other_result

proc geometric_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc ger_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, vec2: Tensor): tuple[self: Tensor, vec2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.mv(vec2)
  result.self = self_result
  discard cppctor(addr(result.vec2))
  let vec2_result = grad.t().mv(self)
  result.vec2 = vec2_result

proc grid_sampler_2d_bwd*(grad: Tensor; fwd_result: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[input: Tensor, grid: Tensor] =
  discard cppctor(addr(result.input))
  let input_result = torch.grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)
  result.input = input_result[0]
  discard cppctor(addr(result.grid))
  result.grid = input_result[1]

proc grid_sampler_3d_bwd*(grad: Tensor; fwd_result: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[input: Tensor, grid: Tensor] =
  discard cppctor(addr(result.input))
  let input_result = torch.grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)
  result.input = input_result[0]
  discard cppctor(addr(result.grid))
  result.grid = input_result[1]

proc gt_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc gt_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.zeros_like(other)
  result.other = other_result

proc index_add_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result
  discard cppctor(addr(result.source))
  let source_result = grad.index_select(dim, index)
  result.source = source_result

proc index_copy_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().index_fill_u(dim, index, 0)
  result.self = self_result
  discard cppctor(addr(result.source))
  let source_result = grad.index_select(dim, index)
  result.source = source_result

proc index_fill_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().index_fill_u(dim, index, 0)
  result.self = self_result

proc index_fill_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().index_fill_u(dim, index, 0)
  result.self = self_result
  discard cppctor(addr(result.value))
  let value_result = grad.index_select(dim, index).sum()
  result.value = value_result

proc index_select_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros(self.sizes(), grad.getType()).index_add_u(dim, index, grad)
  result.self = self_result

proc inverse_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = -torch.mm(fwd_result.t(), torch.mm(grad, fwd_result.t()))
  result.self = self_result

proc le_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc le_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.zeros_like(other)
  result.other = other_result

proc lgamma_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * torch.digamma(self)
  result.self = self_result

proc digamma_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * torch.polygamma(1, self)
  result.self = self_result

proc polygamma_bwd*(grad: Tensor; fwd_result: Tensor, n: int64, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * torch.polygamma(n + 1, self)
  result.self = self_result

proc log_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.adiv(self)
  result.self = self_result

proc log10_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad / (self * 2.3025850929940456)
  result.self = self_result

proc log2_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad / (self * 0.6931471805599453)
  result.self = self_result

proc log_normal_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc lt_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc lt_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.zeros_like(other)
  result.other = other_result

proc masked_fill_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mask: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().masked_fill_u(mask, 0)
  result.self = self_result

proc masked_fill_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mask: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().masked_fill_u(mask, 0)
  result.self = self_result
  discard cppctor(addr(result.value))
  let value_result = torch.where(mask, grad, torch.zeros_like(grad)).sum()
  result.value = value_result

proc masked_select_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mask: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self).masked_scatter_u(mask, grad)
  result.self = self_result

proc max_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().masked_fill_u(self <= other, 0)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = grad.clone().masked_fill_u(self > other, 0)
  result.other = other_result

proc mean_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.expand(self.sizes()) / self.numel()
  result.self = self_result

proc min_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().masked_fill_u(self >= other, 0)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = grad.clone().masked_fill_u(self < other, 0)
  result.other = other_result

proc u_mm_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  result.self = self_result
  discard cppctor(addr(result.mat2))
  let mat2_result = torch.mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)
  result.mat2 = mat2_result

proc mul_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * other
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = grad * self
  result.other = other_result

proc mul_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * other
  result.self = self_result

proc mv_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, vec: Tensor): tuple[self: Tensor, vec: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.ger(vec)
  result.self = self_result
  discard cppctor(addr(result.vec))
  let vec_result = self.t().mv(grad)
  result.vec = vec_result

proc ne_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc ne_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.zeros_like(other)
  result.other = other_result

proc neg_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.neg()
  result.self = self_result

proc normal_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc normal_bwd*(grad: Tensor; fwd_result: Tensor, mean: Tensor, std: float64, generator: pointer): tuple[mean: Tensor] =
  discard cppctor(addr(result.mean))
  let mean_result = torch.zeros(mean.sizes(), grad.getType())
  result.mean = mean_result

proc normal_bwd*(grad: Tensor; fwd_result: Tensor, mean: float64, std: Tensor, generator: pointer): tuple[std: Tensor] =
  discard cppctor(addr(result.std))
  let std_result = torch.zeros(std.sizes(), grad.getType())
  result.std = std_result

proc normal_bwd*(grad: Tensor; fwd_result: Tensor, mean: Tensor, std: Tensor, generator: pointer): tuple[mean: Tensor, std: Tensor] =
  discard cppctor(addr(result.mean))
  let mean_result = torch.zeros(mean.sizes(), grad.getType())
  result.mean = mean_result
  discard cppctor(addr(result.std))
  let std_result = torch.zeros(std.sizes(), grad.getType())
  result.std = std_result

proc poisson_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc put_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, index: Tensor, source: Tensor, accumulate: bool): tuple[self: Tensor, source: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().put_u(index, torch.zeros_like(source), accumulate)
  result.self = self_result
  discard cppctor(addr(result.source))
  let source_result = grad.take(index)
  result.source = source_result

proc random_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, afrom: int64, ato: int64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc random_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, ato: int64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc random_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc reciprocal_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = -grad * fwd_result * fwd_result
  result.self = self_result

proc remainder_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc remainder_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc RoiPooling2d_forward_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor], input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64): tuple[input: Tensor] =
  discard cppctor(addr(result.input))
  let input_result = torch.RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1])
  result.input = input_result

proc round_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc rsqrt_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = -0.5 * grad * fwd_result.pow(3)
  result.self = self_result

proc scatter_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, src: Tensor): tuple[self: Tensor, src: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().scatter_u(dim, index, 0)
  result.self = self_result
  discard cppctor(addr(result.src))
  let src_result = grad.gather(dim, index)
  result.src = src_result

proc scatter_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.clone().scatter_u(dim, index, 0)
  result.self = self_result

proc scatter_add_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64, index: Tensor, src: Tensor): tuple[self: Tensor, src: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result
  discard cppctor(addr(result.src))
  let src_result = grad.gather(dim, index)
  result.src = src_result

proc sigmoid_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.u_sigmoid_backward(grad, fwd_result)
  result.self = self_result

proc sign_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc sin_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * self.cos()
  result.self = self_result

proc sinh_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * self.cosh()
  result.self = self_result

proc sqrt_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad / (2 * fwd_result)
  result.self = self_result

proc sub_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: Tensor, alpha: float): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = -grad * alpha
  result.other = other_result

proc sub_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, other: float, alpha: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad
  result.self = self_result

proc u_sum_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.expand(self.sizes())
  result.self = self_result

proc t_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.t()
  result.self = self_result

proc flip_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dims: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.flip(dims)
  result.self = self_result

proc rot90_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, k: int64, dims: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.rot90(-k, dims)
  result.self = self_result

proc take_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, index: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self).put_u(index, grad, true)
  result.self = self_result

proc tan_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * (1 + fwd_result.pow(2))
  result.self = self_result

proc tanh_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.u_tanh_backward(grad, fwd_result)
  result.self = self_result

proc transpose_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim0: int64, dim1: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.transpose(dim0, dim1)
  result.self = self_result

proc transpose_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim0: int64, dim1: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.transpose(dim0, dim1)
  result.self = self_result

proc tril_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, diagonal: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.tril(diagonal)
  result.self = self_result

proc triu_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, diagonal: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.triu(diagonal)
  result.self = self_result

proc trunc_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc uniform_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, afrom: float64, ato: float64, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc u_unsafe_view_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.reshape(self.sizes())
  result.self = self_result

proc unsqueeze_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.squeeze(dim)
  result.self = self_result

proc unsqueeze_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.squeeze(dim)
  result.self = self_result

proc view_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad.reshape(self.sizes())
  result.self = self_result

proc u_s_where_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, condition: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.where(condition, grad, torch.zeros_like(grad))
  result.self = self_result
  discard cppctor(addr(result.other))
  let other_result = torch.where(condition, torch.zeros_like(grad), grad)
  result.other = other_result

proc zero_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc u_standard_gamma_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = grad * self.u_standard_gamma_grad(fwd_result)
  result.self = self_result

proc binary_cross_entropy_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.binary_cross_entropy_backward(grad, self, target, weight, reduction)
  result.self = self_result

proc embedding_bwd*(grad: Tensor; fwd_result: Tensor, weight: Tensor, indices: Tensor, padding_idx: int64, scale_grad_by_freq: bool, sparse: bool): tuple[weight: Tensor] =
  discard cppctor(addr(result.weight))
  let weight_result = torch.embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)
  result.weight = weight_result

proc u_embedding_bag_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor], weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool, mode: int64, sparse: bool): tuple[weight: Tensor] =
  discard cppctor(addr(result.weight))
  let weight_result = torch.u_embedding_bag_backward(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse)
  result.weight = weight_result

proc l1_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.l1_loss_backward(grad, self, target, reduction)
  result.self = self_result

proc mse_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.mse_loss_backward(grad, self, target, reduction)
  result.self = self_result

proc multi_margin_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)
  result.self = self_result

proc multilabel_margin_loss_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, is_target: Tensor], self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target)
  result.self = self_result

proc nll_loss_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, total_weight: Tensor], self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)
  result.self = self_result

proc nll_loss2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, total_weight: Tensor], self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)
  result.self = self_result

proc smooth_l1_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.smooth_l1_loss_backward(grad, self, target, reduction)
  result.self = self_result

proc soft_margin_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.soft_margin_loss_backward(grad, self, target, reduction)
  result.self = self_result

proc relu_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.threshold_backward(grad, self, 0, 0)
  result.self = self_result

proc elu_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, alpha: float, scale: float, input_scale: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.elu_backward(grad, alpha, scale, input_scale, fwd_result)
  result.self = self_result

proc glu_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.glu_backward(grad, self, dim)
  result.self = self_result

proc hardshrink_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, lambd: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.hardshrink_backward(grad, self, lambd)
  result.self = self_result

proc hardshrink_backward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, grad_out: Tensor, lambd: float): tuple[grad_out: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_out))
  let grad_out_result = torch.hardshrink_backward(grad, self, lambd)
  result.grad_out = grad_out_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc hardtanh_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, min_val: float, max_val: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.hardtanh_backward(grad, self, min_val, max_val)
  result.self = self_result

proc hardtanh_forward_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, min_val: float, max_val: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.hardtanh_backward(grad, fwd_result, min_val, max_val)
  result.self = self_result

proc leaky_relu_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, negative_slope: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.leaky_relu_backward(grad, self, negative_slope)
  result.self = self_result

proc leaky_relu_forward_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, negative_slope: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.leaky_relu_backward(grad, fwd_result, negative_slope)
  result.self = self_result

proc log_sigmoid_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, buffer: Tensor], self: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.log_sigmoid_backward(grad, self, fwd_result.buffer)
  result.self = self_result

proc log_softmax_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.log_softmax_backward_data(grad, fwd_result, dim, self)
  result.self = self_result

proc prelu_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, weight: Tensor, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.prelu_backward(grad, self, weight, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]

proc rrelu_with_noise_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  result.self = self_result

proc rrelu_with_noise_forward_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)
  result.self = self_result

proc softmax_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.softmax_backward_data(grad, fwd_result, dim, self)
  result.self = self_result

proc softplus_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, beta: float, threshold: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.softplus_backward(grad, self, beta, threshold, fwd_result)
  result.self = self_result

proc softshrink_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, lambd: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.softshrink_backward(grad, self, lambd)
  result.self = self_result

proc threshold_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, threshold: float, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.threshold_backward(grad, self, threshold, value)
  result.self = self_result

proc threshold_forward_u_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, threshold: float, value: float): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.threshold_backward(grad, fwd_result, threshold, value)
  result.self = self_result

proc reflection_pad1d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.reflection_pad1d_backward(grad, self, padding)
  result.self = self_result

proc reflection_pad2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.reflection_pad2d_backward(grad, self, padding)
  result.self = self_result

proc replication_pad1d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.replication_pad1d_backward(grad, self, padding)
  result.self = self_result

proc replication_pad2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.replication_pad2d_backward(grad, self, padding)
  result.self = self_result

proc replication_pad3d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.replication_pad3d_backward(grad, self, padding)
  result.self = self_result

proc upsample_linear1d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)
  result.self = self_result

proc upsample_bilinear2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)
  result.self = self_result

proc upsample_trilinear3d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)
  result.self = self_result

proc upsample_nearest1d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.upsample_nearest1d_backward(grad, output_size, self.sizes())
  result.self = self_result

proc upsample_nearest2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.upsample_nearest2d_backward(grad, output_size, self.sizes())
  result.self = self_result

proc upsample_nearest3d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.upsample_nearest3d_backward(grad, output_size, self.sizes())
  result.self = self_result

proc adaptive_avg_pool2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.adaptive_avg_pool2d_backward(grad, self)
  result.self = self_result

proc adaptive_avg_pool3d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.adaptive_avg_pool3d_backward(grad, self)
  result.self = self_result

proc adaptive_max_pool2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor], self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.adaptive_max_pool2d_backward(grad, self, fwd_result.indices)
  result.self = self_result

proc adaptive_max_pool3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor], self: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.adaptive_max_pool3d_backward(grad, self, fwd_result.indices)
  result.self = self_result

proc avg_pool2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.self = self_result

proc avg_pool3d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.self = self_result

proc fractional_max_pool2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor], self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices)
  result.self = self_result

proc max_pool2d_with_indices_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor], self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)
  result.self = self_result

proc max_pool3d_with_indices_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor], self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)
  result.self = self_result

proc max_unpool2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, indices: Tensor, output_size: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.max_unpool2d_backward(grad, self, indices, output_size)
  result.self = self_result

proc max_unpool3d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): tuple[self: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.max_unpool3d_backward(grad, self, indices, output_size, stride, padding)
  result.self = self_result

proc thnn_batch_norm_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, save_mean: Tensor, save_std: Tensor], self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc thnn_conv_transpose2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, columns: Tensor, ones: Tensor], self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc thnn_conv_transpose3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor], self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc thnn_conv2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor], self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc thnn_conv_depthwise2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  let bias_result = grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1)
  result.bias = bias_result

proc thnn_conv3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor], self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc thnn_conv_dilated2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, columns: Tensor, ones: Tensor], self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc thnn_conv_dilated3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, columns: Tensor, ones: Tensor], self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc adaptive_avg_pool2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc adaptive_avg_pool3d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc avg_pool2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc avg_pool3d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc hardtanh_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, min_val: float, max_val: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.hardtanh_backward(grad, self, min_val, max_val)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc leaky_relu_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, negative_slope: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.leaky_relu_backward(grad, self, negative_slope)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc max_unpool2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.max_unpool2d(grad, indices, output_size)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc nll_loss_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.nll_loss(grad, target, weight, reduction, ignore_index)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc nll_loss2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.nll_loss2d(grad, target, weight, reduction, ignore_index)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc rrelu_with_noise_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc reflection_pad1d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.reflection_pad1d(grad, padding)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc reflection_pad2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.reflection_pad2d(grad, padding)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc replication_pad1d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.replication_pad1d(grad, padding)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc replication_pad2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.replication_pad2d(grad, padding)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc replication_pad3d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.replication_pad3d(grad, padding)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(self)
  result.self = self_result

proc softshrink_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, lambd: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.softshrink_backward(grad, self, lambd)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc threshold_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, self: Tensor, threshold: float, value: float): tuple[grad_output: Tensor, self: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.threshold_backward(grad, self, threshold, value)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.self))
  let self_result = torch.zeros_like(grad)
  result.self = self_result

proc upsample_linear1d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.upsample_linear1d(grad, output_size, align_corners)
  result.grad_output = grad_output_result

proc upsample_bilinear2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.upsample_bilinear2d(grad, output_size, align_corners)
  result.grad_output = grad_output_result

proc upsample_trilinear3d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.upsample_trilinear3d(grad, output_size, align_corners)
  result.grad_output = grad_output_result

proc upsample_nearest1d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.upsample_nearest1d(grad, output_size)
  result.grad_output = grad_output_result

proc upsample_nearest2d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.upsample_nearest2d(grad, output_size)
  result.grad_output = grad_output_result

proc upsample_nearest3d_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.upsample_nearest3d(grad, output_size)
  result.grad_output = grad_output_result

proc u_sigmoid_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output: Tensor): tuple[grad_output: Tensor, output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.u_sigmoid_backward(grad, fwd_result)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.output))
  let output_result = grad * grad_output * (-2 * fwd_result + 1)
  result.output = output_result

proc u_tanh_backward_bwd*(grad: Tensor; fwd_result: Tensor, grad_output: Tensor, output: Tensor): tuple[grad_output: Tensor, output: Tensor] =
  discard cppctor(addr(result.grad_output))
  let grad_output_result = torch.u_tanh_backward(grad, fwd_result)
  result.grad_output = grad_output_result
  discard cppctor(addr(result.output))
  let output_result = -2 * fwd_result * grad * grad_output
  result.output = output_result

proc u_cudnn_ctc_loss_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor], log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool): tuple[log_probs: Tensor] =
  discard cppctor(addr(result.log_probs))
  let log_probs_result = fwd_result[1]
  result.log_probs = log_probs_result

proc cudnn_convolution_transpose_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc cudnn_convolution_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc cudnn_grid_sampler_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, grid: Tensor): tuple[self: Tensor, grid: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.cudnn_grid_sampler_backward(self, grid, grad)
  result.self = self_result[0]
  discard cppctor(addr(result.grid))
  result.grid = self_result[1]

proc cudnn_affine_grid_generator_bwd*(grad: Tensor; fwd_result: Tensor, theta: Tensor, N: int64, C: int64, H: int64, W: int64): tuple[theta: Tensor] =
  discard cppctor(addr(result.theta))
  let theta_result = torch.cudnn_affine_grid_generator_backward(grad, N, C, H, W)
  result.theta = theta_result

proc cudnn_batch_norm_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor, result2: Tensor], input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64, grad_input_mask: StdArray): tuple[input: Tensor, weight: Tensor, bias: Tensor] =
  if not training:
    raiseAssert("CuDNN cannot be used to compute backward in evaluation mode")
  discard cppctor(addr(result.input))
  let input_result =  torch.cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : torch.thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)
  result.input = input_result[0]
  discard cppctor(addr(result.weight))
  result.weight = input_result[1]
  discard cppctor(addr(result.bias))
  result.bias = input_result[2]

proc mkldnn_convolution_bwd*(grad: Tensor; fwd_result: Tensor, self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] =
  discard cppctor(addr(result.self))
  let self_result = torch.mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)
  result.self = self_result[0]
  discard cppctor(addr(result.weight))
  result.weight = self_result[1]
  discard cppctor(addr(result.bias))
  result.bias = self_result[2]

proc stack_bwd*(grad: Tensor; fwd_result: Tensor, tensors: TensorList, dim: int64): tuple[tensors: TensorList] =
  discard cppctor(addr(result.tensors))
  let tensors_result = torch.unbind(grad, dim)
  result.tensors = tensors_result

proc u_thnn_fused_gru_cell_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor], input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor): tuple[input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor] =
  discard cppctor(addr(result.input_gates))
  let input_gates_result = torch.u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())
  result.input_gates = input_gates_result[0]
  discard cppctor(addr(result.hidden_gates))
  result.hidden_gates = input_gates_result[1]
  discard cppctor(addr(result.hx))
  result.hx = input_gates_result[2]
  discard cppctor(addr(result.input_bias))
  result.input_bias = input_gates_result[3]
  discard cppctor(addr(result.hidden_bias))
  result.hidden_bias = input_gates_result[4]

