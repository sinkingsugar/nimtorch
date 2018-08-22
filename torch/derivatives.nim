# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

import math
import ../torch

const M_PI = math.PI

proc abs_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * self.sign()

proc acos_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * -((-self * self + 1).rsqrt())

proc add_bwd*(grad: Tensor, self: Tensor, other: Tensor, alpha: float): tuple[self: Tensor, other: Tensor] =
  result.self = grad
  result.other = maybe_multiply(grad, alpha)

proc add_bwd*(grad: Tensor, self: Tensor, other: float, alpha: float): tuple[self: Tensor] =
  result.self = grad

proc addbmm_bwd*(grad: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  result.self = maybe_multiply(grad, beta)
  result.batch1 = grad.unsqueeze(0).expand({ batch1.size(0), batch1.size(1), batch2.size(2) }).bmm(batch2.transpose(1, 2)) * alpha
  result.batch2 = batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand({ batch1.size(0), batch1.size(1), batch2.size(2) })) * alpha

proc addcdiv_bwd*(grad: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  result.self = grad
  result.tensor1 = grad * value / tensor2
  result.tensor2 = -grad * value * tensor1 / (tensor2 * tensor2)

proc addcmul_bwd*(grad: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] =
  result.self = grad
  result.tensor1 = grad * tensor2 * value
  result.tensor2 = grad * tensor1 * value

proc th_addmm_bwd*(grad: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  result.self = maybe_multiply(grad, beta)
  result.mat1 = mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat2 = mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

proc s_native_addmm_bwd*(grad: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] =
  result.self = maybe_multiply(grad, beta)
  result.mat1 = mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat2 = mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

proc u_addmv_bwd*(grad: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float, alpha: float): tuple[self: Tensor, mat: Tensor, vec: Tensor] =
  result.self = maybe_multiply(grad, beta)
  result.mat = grad.ger(vec) * alpha
  result.vec = mat.t().mv(grad) * alpha

proc u_addr_bwd*(grad: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float, alpha: float): tuple[self: Tensor, vec1: Tensor, vec2: Tensor] =
  result.self = maybe_multiply(grad, beta)
  result.vec1 = grad.mv(vec2) * alpha
  result.vec2 = grad.t().mv(vec1) * alpha

proc alias_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad

proc asin_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * (-self * self + 1).rsqrt()

proc atan_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad / (self * self + 1)

proc baddbmm_bwd*(grad: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float, alpha: float): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] =
  result.self = maybe_multiply(grad, beta)
  result.batch1 = grad.bmm(batch2.transpose(1, 2)) * alpha
  result.batch2 = batch1.transpose(1, 2).bmm(grad) * alpha

proc bernoulli_bwd*(grad: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc bmm_bwd*(grad: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  result.self = grad.bmm(mat2.transpose(1, 2))
  result.mat2 = self.transpose(1, 2).bmm(grad)

proc cauchy_u_bwd*(grad: Tensor, self: Tensor, median: float64, sigma: float64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc ceil_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc clamp_min_bwd*(grad: Tensor, self: Tensor, min: float): tuple[self: Tensor] =
  result.self = grad * (self >= min).type_as(grad)

proc clamp_max_bwd*(grad: Tensor, self: Tensor, max: float): tuple[self: Tensor] =
  result.self = grad * (self <= max).type_as(grad)

proc clone_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad

proc cos_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * -self.sin()

proc cosh_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * self.sinh()

proc cross_bwd*(grad: Tensor, self: Tensor, other: Tensor, dim: int64): tuple[self: Tensor, other: Tensor] =
  result.self = other.cross(grad, dim)
  result.other = grad.cross(self, dim)

proc adiv_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad / other
  result.other = -grad * self / (other * other)

proc adiv_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = grad / other

proc dot_bwd*(grad: Tensor, self: Tensor, tensor: Tensor): tuple[self: Tensor, tensor: Tensor] =
  result.self = grad * tensor
  result.tensor = grad * self

proc eq_u_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = zeros_like(self)

proc eq_u_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = zeros_like(self)
  result.other = zeros_like(other)

proc erf_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = 2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

proc erfc_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = -2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

proc erfinv_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = 0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad

proc exp_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * self

proc expm1_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * (self + 1)

proc exponential_u_bwd*(grad: Tensor, self: Tensor, lambd: float64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc fill_u_bwd*(grad: Tensor, self: Tensor, value: float): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc fill_u_bwd*(grad: Tensor, self: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  result.self = zeros_like(grad)
  result.value = grad.sum()

proc floor_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc fmod_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = grad

proc fmod_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor] =
  result.self = grad

proc frac_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad

proc ge_u_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = zeros_like(self)

proc ge_u_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = zeros_like(self)
  result.other = zeros_like(other)

proc geometric_u_bwd*(grad: Tensor, self: Tensor, p: float64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc ger_bwd*(grad: Tensor, self: Tensor, vec2: Tensor): tuple[self: Tensor, vec2: Tensor] =
  result.self = grad.mv(vec2)
  result.vec2 = grad.t().mv(self)

proc gt_u_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = zeros_like(self)

proc gt_u_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = zeros_like(self)
  result.other = zeros_like(other)

proc index_add_u_bwd*(grad: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  result.self = grad
  result.source = grad.index_select(dim, index)

proc index_copy_u_bwd*(grad: Tensor, self: Tensor, dim: int64, index: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  result.self = grad.clone().index_fill_u(dim, index, 0)
  result.source = grad.index_select(dim, index)

proc index_fill_u_bwd*(grad: Tensor, self: Tensor, dim: int64, index: Tensor, value: float): tuple[self: Tensor] =
  result.self = grad.clone().index_fill_u(dim, index, 0)

proc index_fill_u_bwd*(grad: Tensor, self: Tensor, dim: int64, index: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  result.self = grad.clone().index_fill_u(dim, index, 0)
  result.value = grad.index_select(dim, index).sum()

proc inverse_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = -mm(self.t(), mm(grad, self.t()))

proc le_u_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = zeros_like(self)

proc le_u_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = zeros_like(self)
  result.other = zeros_like(other)

proc lgamma_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * digamma(self)

# proc digamma_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
#   result.self = grad * polygamma(1, self)

# proc polygamma_bwd*(grad: Tensor, self: Tensor, n: int64): tuple[self: Tensor] =
#   result.self = grad * polygamma(n + 1, self)

proc log_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.adiv(self)

proc log10_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad / (self * 2.3025850929940456)

proc log2_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad / (self * 0.6931471805599453)

proc log_normal_u_bwd*(grad: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc lt_u_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = zeros_like(self)

proc lt_u_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = zeros_like(self)
  result.other = zeros_like(other)

proc masked_fill_u_bwd*(grad: Tensor, self: Tensor, mask: Tensor, value: float): tuple[self: Tensor] =
  result.self = grad.clone().masked_fill_u(mask, 0)

proc masked_fill_u_bwd*(grad: Tensor, self: Tensor, mask: Tensor, value: Tensor): tuple[self: Tensor, value: Tensor] =
  result.self = grad.clone().masked_fill_u(mask, 0)
  result.value = where(mask, grad, zeros_like(grad)).sum()

proc masked_scatter_u_bwd*(grad: Tensor, self: Tensor, mask: Tensor, source: Tensor): tuple[self: Tensor, source: Tensor] =
  result.self = grad.clone().masked_fill_u(mask, 0)

proc masked_select_bwd*(grad: Tensor, self: Tensor, mask: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(self).masked_scatter_u(mask, grad)

proc max_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad.clone().masked_fill_u(self <= other, 0)
  result.other = grad.clone().masked_fill_u(self > other, 0)

proc mean_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.expand(self.sizes()) / self.numel()

proc min_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad.clone().masked_fill_u(self >= other, 0)
  result.other = grad.clone().masked_fill_u(self < other, 0)

proc u_mm_bwd*(grad: Tensor, self: Tensor, mat2: Tensor): tuple[self: Tensor, mat2: Tensor] =
  result.self = mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  result.mat2 = mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)

proc mul_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = grad * other
  result.other = grad * self

proc mul_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = grad * other

proc mv_bwd*(grad: Tensor, self: Tensor, vec: Tensor): tuple[self: Tensor, vec: Tensor] =
  result.self = grad.ger(vec)
  result.vec = self.t().mv(grad)

proc ne_u_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = zeros_like(self)

proc ne_u_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = zeros_like(self)
  result.other = zeros_like(other)

proc neg_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.neg()

proc normal_u_bwd*(grad: Tensor, self: Tensor, mean: float64, std: float64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc poisson_bwd*(grad: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(self)

proc put_u_bwd*(grad: Tensor, self: Tensor, index: Tensor, source: Tensor, accumulate: bool): tuple[self: Tensor, source: Tensor] =
  result.self = grad.clone().put_u(index, zeros_like(source), accumulate)
  result.source = grad.take(index)

proc random_u_bwd*(grad: Tensor, self: Tensor, afrom: int64, ato: int64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc random_u_bwd*(grad: Tensor, self: Tensor, ato: int64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc random_u_bwd*(grad: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc reciprocal_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = -grad * self * self

proc remainder_bwd*(grad: Tensor, self: Tensor, other: float): tuple[self: Tensor] =
  result.self = grad

proc remainder_bwd*(grad: Tensor, self: Tensor, other: Tensor): tuple[self: Tensor] =
  result.self = grad

proc round_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc rsqrt_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = -0.5 * grad * self.pow(3)

proc scatter_u_bwd*(grad: Tensor, self: Tensor, dim: int64, index: Tensor, src: Tensor): tuple[self: Tensor, src: Tensor] =
  result.self = grad.clone().scatter_u(dim, index, 0)
  result.src = grad.gather(dim, index)

proc scatter_u_bwd*(grad: Tensor, self: Tensor, dim: int64, index: Tensor, value: float): tuple[self: Tensor] =
  result.self = grad.clone().scatter_u(dim, index, 0)

proc scatter_add_u_bwd*(grad: Tensor, self: Tensor, dim: int64, index: Tensor, src: Tensor): tuple[self: Tensor, src: Tensor] =
  result.self = grad
  result.src = grad.gather(dim, index)

proc sigmoid_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = u_sigmoid_backward(grad, self)

proc sign_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc sin_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * self.cos()

proc sinh_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * self.cosh()

proc sqrt_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad / (2 * self)

proc sub_bwd*(grad: Tensor, self: Tensor, other: Tensor, alpha: float): tuple[self: Tensor, other: Tensor] =
  result.self = grad
  result.other = -grad * alpha

proc sub_bwd*(grad: Tensor, self: Tensor, other: float, alpha: float): tuple[self: Tensor] =
  result.self = grad

proc u_sum_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.expand(self.sizes())

proc t_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad.t()

proc flip_bwd*(grad: Tensor, self: Tensor, dims: IntList): tuple[self: Tensor] =
  result.self = grad.flip(dims)

proc rot90_bwd*(grad: Tensor, self: Tensor, k: int64, dims: IntList): tuple[self: Tensor] =
  result.self = grad.rot90(-k, dims)

proc take_bwd*(grad: Tensor, self: Tensor, index: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(self).put_u(index, grad, true)

proc tan_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = grad * (1 + self.pow(2))

proc tanh_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = u_tanh_backward(grad, self)

proc transpose_bwd*(grad: Tensor, self: Tensor, dim0: int64, dim1: int64): tuple[self: Tensor] =
  result.self = grad.transpose(dim0, dim1)

proc transpose_u_bwd*(grad: Tensor, self: Tensor, dim0: int64, dim1: int64): tuple[self: Tensor] =
  result.self = grad.transpose(dim0, dim1)

proc tril_bwd*(grad: Tensor, self: Tensor, diagonal: int64): tuple[self: Tensor] =
  result.self = grad.tril(diagonal)

proc triu_bwd*(grad: Tensor, self: Tensor, diagonal: int64): tuple[self: Tensor] =
  result.self = grad.triu(diagonal)

proc trunc_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc uniform_u_bwd*(grad: Tensor, self: Tensor, afrom: float64, ato: float64, generator: pointer): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc u_unsafe_view_bwd*(grad: Tensor, self: Tensor, size: IntList): tuple[self: Tensor] =
  result.self = grad.reshape(self.sizes())

proc unsqueeze_bwd*(grad: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  result.self = grad.squeeze(dim)

proc unsqueeze_u_bwd*(grad: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  result.self = grad.squeeze(dim)

proc view_bwd*(grad: Tensor, self: Tensor, size: IntList): tuple[self: Tensor] =
  result.self = grad.reshape(self.sizes())

proc u_s_where_bwd*(grad: Tensor, self: Tensor, condition: Tensor, other: Tensor): tuple[self: Tensor, other: Tensor] =
  result.self = where(condition, grad, zeros_like(grad))
  result.other = where(condition, zeros_like(grad), grad)

proc zero_u_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = zeros_like(grad)

proc u_standard_gamma_bwd*(grad: Tensor, self: Tensor, generator: pointer): tuple[self: Tensor] =
  result.self = grad * self.u_standard_gamma_grad(self)

proc binary_cross_entropy_forward_bwd*(grad: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): tuple[self: Tensor] =
  result.self = binary_cross_entropy_backward(grad, self, target, weight, reduction)

proc embedding_bwd*(grad: Tensor, weight: Tensor, indices: Tensor, padding_idx: int64, scale_grad_by_freq: bool, sparse: bool): tuple[weight: Tensor] =
  result.weight = embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)

proc kl_div_forward_bwd*(grad: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor, target: Tensor] =
  result.self = kl_div_backward(grad, self, target, reduction)

proc l1_loss_forward_bwd*(grad: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  result.self = l1_loss_backward(grad, self, target, reduction)

proc mse_loss_forward_bwd*(grad: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  result.self = mse_loss_backward(grad, self, target, reduction)

proc multi_margin_loss_forward_bwd*(grad: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): tuple[self: Tensor] =
  result.self = multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)

proc smooth_l1_loss_forward_bwd*(grad: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  result.self = smooth_l1_loss_backward(grad, self, target, reduction)

proc soft_margin_loss_forward_bwd*(grad: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[self: Tensor] =
  result.self = soft_margin_loss_backward(grad, self, target, reduction)

proc relu_bwd*(grad: Tensor, self: Tensor): tuple[self: Tensor] =
  result.self = threshold_backward(grad, self, 0, 0)

# proc elu_forward_bwd*(grad: Tensor, self: Tensor, alpha: float, scale: float, input_scale: float): tuple[self: Tensor] =
#   result.self = elu_backward(grad, alpha, scale, input_scale, output)

proc glu_forward_bwd*(grad: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  result.self = glu_backward(grad, self, dim)

proc hardshrink_bwd*(grad: Tensor, self: Tensor, lambd: float): tuple[self: Tensor] =
  result.self = hardshrink_backward(grad, self, lambd)

proc hardshrink_backward_bwd*(grad: Tensor, self: Tensor, grad_out: Tensor, lambd: float): tuple[grad_out: Tensor, self: Tensor] =
  result.grad_out = hardshrink_backward(grad, self, lambd)
  result.self = zeros_like(grad)

proc hardtanh_forward_bwd*(grad: Tensor, self: Tensor, min_val: float, max_val: float): tuple[self: Tensor] =
  result.self = hardtanh_backward(grad, self, min_val, max_val)

# proc hardtanh_forward_u_bwd*(grad: Tensor, self: Tensor, min_val: float, max_val: float): tuple[self: Tensor] =
#   result.self = hardtanh_backward(grad, output, min_val, max_val)

proc leaky_relu_forward_bwd*(grad: Tensor, self: Tensor, negative_slope: float): tuple[self: Tensor] =
  result.self = leaky_relu_backward(grad, self, negative_slope)

# proc leaky_relu_forward_u_bwd*(grad: Tensor, self: Tensor, negative_slope: float): tuple[self: Tensor] =
#   result.self = leaky_relu_backward(grad, output, negative_slope)

proc log_softmax_bwd*(grad: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  result.self = log_softmax_backward_data(grad, self, dim, self)

proc rrelu_with_noise_forward_bwd*(grad: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer): tuple[self: Tensor] =
  result.self = rrelu_with_noise_backward(grad, self, noise, lower, upper, training)

# proc rrelu_with_noise_forward_u_bwd*(grad: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer): tuple[self: Tensor] =
#   result.self = rrelu_with_noise_backward(grad, output, noise, lower, upper, training)

proc softmax_bwd*(grad: Tensor, self: Tensor, dim: int64): tuple[self: Tensor] =
  result.self = softmax_backward_data(grad, self, dim, self)

proc softplus_forward_bwd*(grad: Tensor, self: Tensor, beta: float, threshold: float): tuple[self: Tensor] =
  result.self = softplus_backward(grad, self, beta, threshold, output)

proc softshrink_forward_bwd*(grad: Tensor, self: Tensor, lambd: float): tuple[self: Tensor] =
  result.self = softshrink_backward(grad, self, lambd)

proc threshold_forward_bwd*(grad: Tensor, self: Tensor, threshold: float, value: float): tuple[self: Tensor] =
  result.self = threshold_backward(grad, self, threshold, value)

proc threshold_forward_u_bwd*(grad: Tensor, self: Tensor, threshold: float, value: float): tuple[self: Tensor] =
  result.self = threshold_backward(grad, output, threshold, value)

proc reflection_pad1d_forward_bwd*(grad: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  result.self = reflection_pad1d_backward(grad, self, padding)

proc reflection_pad2d_forward_bwd*(grad: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  result.self = reflection_pad2d_backward(grad, self, padding)

proc replication_pad1d_forward_bwd*(grad: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  result.self = replication_pad1d_backward(grad, self, padding)

proc replication_pad2d_forward_bwd*(grad: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  result.self = replication_pad2d_backward(grad, self, padding)

proc replication_pad3d_forward_bwd*(grad: Tensor, self: Tensor, padding: IntList): tuple[self: Tensor] =
  result.self = replication_pad3d_backward(grad, self, padding)

proc upsample_linear1d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  result.self = upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)

proc upsample_bilinear2d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  result.self = upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)

proc upsample_trilinear3d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList, align_corners: bool): tuple[self: Tensor] =
  result.self = upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)

proc upsample_nearest1d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  result.self = upsample_nearest1d_backward(grad, output_size, self.sizes())

proc upsample_nearest2d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  result.self = upsample_nearest2d_backward(grad, output_size, self.sizes())

proc upsample_nearest3d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  result.self = upsample_nearest3d_backward(grad, output_size, self.sizes())

proc adaptive_avg_pool2d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  result.self = adaptive_avg_pool2d_backward(grad, self)

proc adaptive_avg_pool3d_forward_bwd*(grad: Tensor, self: Tensor, output_size: IntList): tuple[self: Tensor] =
  result.self = adaptive_avg_pool3d_backward(grad, self)

proc avg_pool2d_forward_bwd*(grad: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[self: Tensor] =
  result.self = avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

proc avg_pool3d_forward_bwd*(grad: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[self: Tensor] =
  result.self = avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

proc max_unpool2d_forward_bwd*(grad: Tensor, self: Tensor, indices: Tensor, output_size: IntList): tuple[self: Tensor] =
  result.self = max_unpool2d_backward(grad, self, indices, output_size)

proc max_unpool3d_forward_bwd*(grad: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): tuple[self: Tensor] =
  result.self = max_unpool3d_backward(grad, self, indices, output_size, stride, padding)

# proc adaptive_avg_pool2d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor): tuple[grad_output: Tensor, self: Tensor] =
#   result.grad_output = adaptive_avg_pool2d(grad, { grad_output.size(-2), grad_output.size(-1) })
#   result.self = zeros_like(self)

# proc adaptive_avg_pool3d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor): tuple[grad_output: Tensor, self: Tensor] =
#   result.grad_output = adaptive_avg_pool3d(grad, { grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) })
#   result.self = zeros_like(self)

proc avg_pool2d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.self = zeros_like(self)

proc avg_pool3d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.self = zeros_like(self)

proc elu_backward_bwd*(grad: Tensor, grad_output: Tensor, alpha: float, scale: float, input_scale: float, output: Tensor): tuple[grad_output: Tensor, output: Tensor] =
  result.grad_output = elu_backward(grad, alpha, scale, input_scale, output)

proc hardtanh_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, min_val: float, max_val: float): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = hardtanh_backward(grad, self, min_val, max_val)
  result.self = zeros_like(grad)

proc log_sigmoid_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, buffer: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = log_sigmoid_backward(grad, self, buffer)

proc log_softmax_backward_data_bwd*(grad: Tensor, self: Tensor, grad_output: Tensor, output: Tensor, dim: int64): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = grad - (grad * output.exp()).sum(dim, true)

proc leaky_relu_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, negative_slope: float): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = leaky_relu_backward(grad, self, negative_slope)
  result.self = zeros_like(grad)

proc max_unpool2d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = max_unpool2d(grad, indices, output_size)
  result.self = zeros_like(self)

proc nll_loss_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = nll_loss(grad, target, weight, reduction, ignore_index)
  result.self = zeros_like(grad)

proc nll_loss2d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = nll_loss2d(grad, target, weight, reduction, ignore_index)
  result.self = zeros_like(grad)

proc rrelu_with_noise_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  result.self = zeros_like(grad)

proc reflection_pad1d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = reflection_pad1d(grad, padding)
  result.self = zeros_like(self)

proc reflection_pad2d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = reflection_pad2d(grad, padding)
  result.self = zeros_like(self)

proc replication_pad1d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = replication_pad1d(grad, padding)
  result.self = zeros_like(self)

proc replication_pad2d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = replication_pad2d(grad, padding)
  result.self = zeros_like(self)

proc replication_pad3d_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = replication_pad3d(grad, padding)
  result.self = zeros_like(self)

proc softplus_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, beta: float, threshold: float, output: Tensor): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = softplus_backward(grad, self, beta, threshold, output)

proc softmax_backward_data_bwd*(grad: Tensor, self: Tensor, grad_output: Tensor, output: Tensor, dim: int64): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = softmax_backward_data(grad, output, dim, self)

proc softshrink_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, lambd: float): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = softshrink_backward(grad, self, lambd)
  result.self = zeros_like(grad)

proc threshold_backward_bwd*(grad: Tensor, grad_output: Tensor, self: Tensor, threshold: float, value: float): tuple[grad_output: Tensor, self: Tensor] =
  result.grad_output = threshold_backward(grad, self, threshold, value)
  result.self = zeros_like(grad)

proc upsample_linear1d_backward_bwd*(grad: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  result.grad_output = upsample_linear1d(grad, output_size, align_corners)

proc upsample_bilinear2d_backward_bwd*(grad: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  result.grad_output = upsample_bilinear2d(grad, output_size, align_corners)

proc upsample_trilinear3d_backward_bwd*(grad: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): tuple[grad_output: Tensor] =
  result.grad_output = upsample_trilinear3d(grad, output_size, align_corners)

proc upsample_nearest1d_backward_bwd*(grad: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  result.grad_output = upsample_nearest1d(grad, output_size)

proc upsample_nearest2d_backward_bwd*(grad: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  result.grad_output = upsample_nearest2d(grad, output_size)

proc upsample_nearest3d_backward_bwd*(grad: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): tuple[grad_output: Tensor] =
  result.grad_output = upsample_nearest3d(grad, output_size)

proc u_sigmoid_backward_bwd*(grad: Tensor, grad_output: Tensor, output: Tensor): tuple[grad_output: Tensor, output: Tensor] =
  result.grad_output = u_sigmoid_backward(grad, output)
  result.output = grad * grad_output * (-2 * output + 1)

proc u_tanh_backward_bwd*(grad: Tensor, grad_output: Tensor, output: Tensor): tuple[grad_output: Tensor, output: Tensor] =
  result.grad_output = u_tanh_backward(grad, output)
  result.output = -2 * output * grad * grad_output

proc cudnn_affine_grid_generator_bwd*(grad: Tensor, theta: Tensor, N: int64, C: int64, H: int64, W: int64): tuple[theta: Tensor] =
  result.theta = cudnn_affine_grid_generator_backward(grad, N, C, H, W)

proc stack_bwd*(grad: Tensor, tensors: TensorList, dim: int64): tuple[tensors: TensorList] =
  result.tensors = unbind(grad, dim)

