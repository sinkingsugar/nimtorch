# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

import math
import ../torch
import autograd_helpers

const M_PI = math.PI

autograd abs(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("abs", self.tensor).to(ATensor).newTensor()
  self: grad * self.sign()

autograd abs(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("abs").to(ATensor).newTensor()
  self: grad * self.sign()

autograd acos(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("acos", self.tensor).to(ATensor).newTensor()
  self: grad * -((-self * self + 1).rsqrt())

autograd acos(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("acos").to(ATensor).newTensor()
  self: grad * -((-self * self + 1).rsqrt())

autograd add(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("add", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: maybe_multiply(grad, alpha)

autograd add(self: Tensorself: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("add", other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: maybe_multiply(grad, alpha)

autograd add(ty: TensorType; self: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("add", self.tensor, other, alpha).to(ATensor).newTensor()
  self: grad

autograd add(self: Tensorself: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("add", other, alpha).to(ATensor).newTensor()
  self: grad

autograd addbmm(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha

autograd addbmm(self: Tensorself: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("addbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha

autograd addcdiv(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addcdiv", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * value / tensor2
  tensor2: -grad * value * tensor1 / (tensor2 * tensor2)

autograd addcdiv(self: Tensorself: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: self.dynamicCppCall("addcdiv", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * value / tensor2
  tensor2: -grad * value * tensor1 / (tensor2 * tensor2)

autograd addcmul(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addcmul", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * tensor2 * value
  tensor2: grad * tensor1 * value

autograd addcmul(self: Tensorself: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: self.dynamicCppCall("addcmul", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * tensor2 * value
  tensor2: grad * tensor1 * value

autograd th_addmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat1: mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  mat2: mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

autograd th_addmm(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: dynamicCCall("at::th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat1: mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  mat2: mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

autograd s_native_addmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat1: mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  mat2: mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

autograd s_native_addmm(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: dynamicCCall("at::s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat1: mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  mat2: mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

autograd u_addmv(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat: grad.ger(vec) * alpha
  vec: mat.t().mv(grad) * alpha

autograd u_addmv(self: Tensorself: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("_addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat: grad.ger(vec) * alpha
  vec: mat.t().mv(grad) * alpha

autograd u_addr(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  vec1: grad.mv(vec2) * alpha
  vec2: grad.t().mv(vec1) * alpha

autograd u_addr(self: Tensorself: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("_addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  vec1: grad.mv(vec2) * alpha
  vec2: grad.t().mv(vec1) * alpha

autograd alias(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("alias", self.tensor).to(ATensor).newTensor()
  self: grad

autograd alias(self: Tensor) -> Tensor:
  result: dynamicCCall("at::alias", self.tensor).to(ATensor).newTensor()
  self: grad

autograd asin(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("asin", self.tensor).to(ATensor).newTensor()
  self: grad * (-self * self + 1).rsqrt()

autograd asin(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("asin").to(ATensor).newTensor()
  self: grad * (-self * self + 1).rsqrt()

autograd atan(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("atan", self.tensor).to(ATensor).newTensor()
  self: grad / (self * self + 1)

autograd atan(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("atan").to(ATensor).newTensor()
  self: grad / (self * self + 1)

autograd atan2(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("atan2", self.tensor, other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd atan2(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("atan2", other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd baddbmm(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("baddbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad) * alpha

autograd baddbmm(self: Tensorself: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("baddbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad) * alpha

autograd bernoulli(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("bernoulli", self.tensor, p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd bernoulli(self: Tensorself: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("bernoulli", p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd bmm(ty: TensorType; self: Tensor, mat2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("bmm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: grad.bmm(mat2.transpose(1, 2))
  mat2: self.transpose(1, 2).bmm(grad)

autograd bmm(self: Tensorself: Tensor, mat2: Tensor) -> Tensor:
  result: self.dynamicCppCall("bmm", mat2.tensor).to(ATensor).newTensor()
  self: grad.bmm(mat2.transpose(1, 2))
  mat2: self.transpose(1, 2).bmm(grad)

autograd cauchy_u(ty: TensorType; self: Tensor, median: float64 = 0, sigma: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("cauchy_", self.tensor, median, sigma, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd cauchy_u(self: Tensorself: Tensor, median: float64 = 0, sigma: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("cauchy_", median, sigma, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd ceil(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ceil", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd ceil(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("ceil").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd clamp_min(ty: TensorType; self: Tensor, min: float) -> Tensor:
  result: ty.dynamicCppCall("clamp_min", self.tensor, min).to(ATensor).newTensor()
  self: grad * (self >= min).type_as(grad)

autograd clamp_min(self: Tensorself: Tensor, min: float) -> Tensor:
  result: self.dynamicCppCall("clamp_min", min).to(ATensor).newTensor()
  self: grad * (self >= min).type_as(grad)

autograd clamp_max(ty: TensorType; self: Tensor, max: float) -> Tensor:
  result: ty.dynamicCppCall("clamp_max", self.tensor, max).to(ATensor).newTensor()
  self: grad * (self <= max).type_as(grad)

autograd clamp_max(self: Tensorself: Tensor, max: float) -> Tensor:
  result: self.dynamicCppCall("clamp_max", max).to(ATensor).newTensor()
  self: grad * (self <= max).type_as(grad)

autograd clone(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("clone", self.tensor).to(ATensor).newTensor()
  self: grad

autograd clone(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("clone").to(ATensor).newTensor()
  self: grad

autograd cos(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cos", self.tensor).to(ATensor).newTensor()
  self: grad * -self.sin()

autograd cos(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("cos").to(ATensor).newTensor()
  self: grad * -self.sin()

autograd cosh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cosh", self.tensor).to(ATensor).newTensor()
  self: grad * self.sinh()

autograd cosh(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("cosh").to(ATensor).newTensor()
  self: grad * self.sinh()

autograd cross(ty: TensorType; self: Tensor, other: Tensor, dim: int64 = -1) -> Tensor:
  result: ty.dynamicCppCall("cross", self.tensor, other.tensor, dim).to(ATensor).newTensor()
  self: other.cross(grad, dim)
  other: grad.cross(self, dim)

autograd cross(self: Tensorself: Tensor, other: Tensor, dim: int64 = -1) -> Tensor:
  result: self.dynamicCppCall("cross", other.tensor, dim).to(ATensor).newTensor()
  self: other.cross(grad, dim)
  other: grad.cross(self, dim)

autograd conv_tbc(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, pad: int64) -> Tensor:
  result: ty.dynamicCppCall("conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd conv_tbc(self: Tensor, weight: Tensor, bias: Tensor, pad: int64) -> Tensor:
  result: dynamicCCall("at::conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd u_ctc_loss(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: u_ctc_loss_backward(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank)

autograd u_ctc_loss(log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: u_ctc_loss_backward(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank)

autograd adiv(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("div", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad / other
  other: -grad * self / (other * other)

autograd adiv(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("div", other.tensor).to(ATensor).newTensor()
  self: grad / other
  other: -grad * self / (other * other)

autograd adiv(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("div", self.tensor, other).to(ATensor).newTensor()
  self: grad / other

autograd adiv(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("div", other).to(ATensor).newTensor()
  self: grad / other

autograd dot(ty: TensorType; self: Tensor, tensor: Tensor) -> Tensor:
  result: ty.dynamicCppCall("dot", self.tensor, tensor.tensor).to(ATensor).newTensor()
  self: grad * tensor
  tensor: grad * self

autograd dot(self: Tensorself: Tensor, tensor: Tensor) -> Tensor:
  result: self.dynamicCppCall("dot", tensor.tensor).to(ATensor).newTensor()
  self: grad * tensor
  tensor: grad * self

autograd eq_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("eq_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd eq_u(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("eq_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd eq_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("eq_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd eq_u(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("eq_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd erf(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erf", self.tensor).to(ATensor).newTensor()
  self: 2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd erf(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("erf").to(ATensor).newTensor()
  self: 2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd erfc(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erfc", self.tensor).to(ATensor).newTensor()
  self: -2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd erfc(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("erfc").to(ATensor).newTensor()
  self: -2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd erfinv(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erfinv", self.tensor).to(ATensor).newTensor()
  self: 0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad

autograd erfinv(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("erfinv").to(ATensor).newTensor()
  self: 0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad

autograd exp(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("exp", self.tensor).to(ATensor).newTensor()
  self: grad * fwd_result

autograd exp(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("exp").to(ATensor).newTensor()
  self: grad * fwd_result

autograd expm1(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("expm1", self.tensor).to(ATensor).newTensor()
  self: grad * (fwd_result + 1)

autograd expm1(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("expm1").to(ATensor).newTensor()
  self: grad * (fwd_result + 1)

autograd exponential_u(ty: TensorType; self: Tensor, lambd: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("exponential_", self.tensor, lambd, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd exponential_u(self: Tensorself: Tensor, lambd: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("exponential_", lambd, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd fill_u(ty: TensorType; self: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("fill_", self.tensor, value).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd fill_u(self: Tensorself: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("fill_", value).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd fill_u(ty: TensorType; self: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("fill_", self.tensor, value.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)
  value: grad.sum()

autograd fill_u(self: Tensorself: Tensor, value: Tensor) -> Tensor:
  result: self.dynamicCppCall("fill_", value.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)
  value: grad.sum()

autograd floor(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("floor", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd floor(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("floor").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd fmod(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("fmod", self.tensor, other).to(ATensor).newTensor()
  self: grad

autograd fmod(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("fmod", other).to(ATensor).newTensor()
  self: grad

autograd fmod(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("fmod", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad

autograd fmod(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("fmod", other.tensor).to(ATensor).newTensor()
  self: grad

autograd frac(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("frac", self.tensor).to(ATensor).newTensor()
  self: grad

autograd frac(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("frac").to(ATensor).newTensor()
  self: grad

autograd ge_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("ge_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ge_u(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("ge_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ge_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ge_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd ge_u(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("ge_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd geometric_u(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("geometric_", self.tensor, p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd geometric_u(self: Tensorself: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("geometric_", p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd ger(ty: TensorType; self: Tensor, vec2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ger", self.tensor, vec2.tensor).to(ATensor).newTensor()
  self: grad.mv(vec2)
  vec2: grad.t().mv(self)

autograd ger(self: Tensorself: Tensor, vec2: Tensor) -> Tensor:
  result: self.dynamicCppCall("ger", vec2.tensor).to(ATensor).newTensor()
  self: grad.mv(vec2)
  vec2: grad.t().mv(self)

autograd grid_sampler_2d(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: ty.dynamicCppCall("grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_2d(input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: dynamicCCall("at::grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: ty.dynamicCppCall("grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d(input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: dynamicCCall("at::grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd gt_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("gt_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd gt_u(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("gt_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd gt_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("gt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd gt_u(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("gt_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd index_add_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_add_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad
  source: grad.index_select(dim, index)

autograd index_add_u(self: Tensorself: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: self.dynamicCppCall("index_add_", dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad
  source: grad.index_select(dim, index)

autograd index_copy_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_copy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)
  source: grad.index_select(dim, index)

autograd index_copy_u(self: Tensorself: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: self.dynamicCppCall("index_copy_", dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)
  source: grad.index_select(dim, index)

autograd index_fill_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)

autograd index_fill_u(self: Tensorself: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("index_fill_", dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)

autograd index_fill_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)
  value: grad.index_select(dim, index).sum()

autograd index_fill_u(self: Tensorself: Tensor, dim: int64, index: Tensor, value: Tensor) -> Tensor:
  result: self.dynamicCppCall("index_fill_", dim, index.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)
  value: grad.index_select(dim, index).sum()

autograd inverse(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("inverse", self.tensor).to(ATensor).newTensor()
  self: -mm(fwd_result.t(), mm(grad, fwd_result.t()))

autograd inverse(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("inverse").to(ATensor).newTensor()
  self: -mm(fwd_result.t(), mm(grad, fwd_result.t()))

autograd le_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("le_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd le_u(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("le_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd le_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("le_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd le_u(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("le_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd lgamma(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("lgamma", self.tensor).to(ATensor).newTensor()
  self: grad * digamma(self)

autograd lgamma(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("lgamma").to(ATensor).newTensor()
  self: grad * digamma(self)

autograd digamma(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("digamma", self.tensor).to(ATensor).newTensor()
  self: grad * polygamma(1, self)

autograd digamma(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("digamma").to(ATensor).newTensor()
  self: grad * polygamma(1, self)

autograd polygamma(ty: TensorType; n: int64, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("polygamma", n, self.tensor).to(ATensor).newTensor()
  self: grad * polygamma(n + 1, self)

autograd log(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log", self.tensor).to(ATensor).newTensor()
  self: grad.adiv(self)

autograd log(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("log").to(ATensor).newTensor()
  self: grad.adiv(self)

autograd log10(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log10", self.tensor).to(ATensor).newTensor()
  self: grad / (self * 2.3025850929940456)

autograd log10(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("log10").to(ATensor).newTensor()
  self: grad / (self * 2.3025850929940456)

autograd log2(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log2", self.tensor).to(ATensor).newTensor()
  self: grad / (self * 0.6931471805599453)

autograd log2(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("log2").to(ATensor).newTensor()
  self: grad / (self * 0.6931471805599453)

autograd log_normal_u(ty: TensorType; self: Tensor, mean: float64 = 1, std: float64 = 2, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("log_normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd log_normal_u(self: Tensorself: Tensor, mean: float64 = 1, std: float64 = 2, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("log_normal_", mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd lt_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("lt_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd lt_u(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("lt_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd lt_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("lt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd lt_u(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("lt_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd masked_fill_u(ty: TensorType; self: Tensor, mask: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(mask, 0)

autograd masked_fill_u(self: Tensorself: Tensor, mask: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("masked_fill_", mask.tensor, value).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(mask, 0)

autograd masked_fill_u(ty: TensorType; self: Tensor, mask: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(mask, 0)
  value: where(mask, grad, zeros_like(grad)).sum()

autograd masked_fill_u(self: Tensorself: Tensor, mask: Tensor, value: Tensor) -> Tensor:
  result: self.dynamicCppCall("masked_fill_", mask.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(mask, 0)
  value: where(mask, grad, zeros_like(grad)).sum()

autograd masked_select(ty: TensorType; self: Tensor, mask: Tensor) -> Tensor:
  result: ty.dynamicCppCall("masked_select", self.tensor, mask.tensor).to(ATensor).newTensor()
  self: zeros_like(self).masked_scatter_u(mask, grad)

autograd masked_select(self: Tensorself: Tensor, mask: Tensor) -> Tensor:
  result: self.dynamicCppCall("masked_select", mask.tensor).to(ATensor).newTensor()
  self: zeros_like(self).masked_scatter_u(mask, grad)

autograd max(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("max", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(self <= other, 0)
  other: grad.clone().masked_fill_u(self > other, 0)

autograd max(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("max", other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(self <= other, 0)
  other: grad.clone().masked_fill_u(self > other, 0)

autograd mean(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mean", self.tensor).to(ATensor).newTensor()
  self: grad.expand(self.sizes()) / self.numel()

autograd mean(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("mean").to(ATensor).newTensor()
  self: grad.expand(self.sizes()) / self.numel()

autograd min(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("min", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(self >= other, 0)
  other: grad.clone().masked_fill_u(self < other, 0)

autograd min(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("min", other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(self >= other, 0)
  other: grad.clone().masked_fill_u(self < other, 0)

autograd u_mm(ty: TensorType; self: Tensor, mat2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_mm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  mat2: mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)

autograd u_mm(self: Tensorself: Tensor, mat2: Tensor) -> Tensor:
  result: self.dynamicCppCall("_mm", mat2.tensor).to(ATensor).newTensor()
  self: mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  mat2: mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)

autograd mul(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mul", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad * other
  other: grad * self

autograd mul(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("mul", other.tensor).to(ATensor).newTensor()
  self: grad * other
  other: grad * self

autograd mul(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("mul", self.tensor, other).to(ATensor).newTensor()
  self: grad * other

autograd mul(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("mul", other).to(ATensor).newTensor()
  self: grad * other

autograd mv(ty: TensorType; self: Tensor, vec: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mv", self.tensor, vec.tensor).to(ATensor).newTensor()
  self: grad.ger(vec)
  vec: self.t().mv(grad)

autograd mv(self: Tensorself: Tensor, vec: Tensor) -> Tensor:
  result: self.dynamicCppCall("mv", vec.tensor).to(ATensor).newTensor()
  self: grad.ger(vec)
  vec: self.t().mv(grad)

autograd ne_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("ne_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ne_u(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("ne_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ne_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ne_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd ne_u(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("ne_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd neg(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("neg", self.tensor).to(ATensor).newTensor()
  self: grad.neg()

autograd neg(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("neg").to(ATensor).newTensor()
  self: grad.neg()

autograd normal_u(ty: TensorType; self: Tensor, mean: float64 = 0, std: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd normal_u(self: Tensorself: Tensor, mean: float64 = 0, std: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("normal_", mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd poisson(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("poisson", self.tensor, generator).to(ATensor).newTensor()
  self: zeros_like(self)

autograd poisson(self: Tensor, generator: pointer = nil) -> Tensor:
  result: dynamicCCall("at::poisson", self.tensor, generator).to(ATensor).newTensor()
  self: zeros_like(self)

autograd pow(ty: TensorType; self: Tensor, exponent: float) -> Tensor:
  result: ty.dynamicCppCall("pow", self.tensor, exponent).to(ATensor).newTensor()
  self: pow_backward(grad, self, exponent)

autograd pow(self: Tensorself: Tensor, exponent: float) -> Tensor:
  result: self.dynamicCppCall("pow", exponent).to(ATensor).newTensor()
  self: pow_backward(grad, self, exponent)

autograd pow(ty: TensorType; self: Tensor, exponent: Tensor) -> Tensor:
  result: ty.dynamicCppCall("pow", self.tensor, exponent.tensor).to(ATensor).newTensor()
  self: pow_backward_self(grad, self, exponent)
  exponent: pow_backward_exponent(grad, self, exponent)

autograd pow(self: Tensorself: Tensor, exponent: Tensor) -> Tensor:
  result: self.dynamicCppCall("pow", exponent.tensor).to(ATensor).newTensor()
  self: pow_backward_self(grad, self, exponent)
  exponent: pow_backward_exponent(grad, self, exponent)

autograd put_u(ty: TensorType; self: Tensor, index: Tensor, source: Tensor, accumulate: bool = false) -> Tensor:
  result: ty.dynamicCppCall("put_", self.tensor, index.tensor, source.tensor, accumulate).to(ATensor).newTensor()
  self: grad.clone().put_u(index, zeros_like(source), accumulate)
  source: grad.take(index)

autograd put_u(self: Tensorself: Tensor, index: Tensor, source: Tensor, accumulate: bool = false) -> Tensor:
  result: self.dynamicCppCall("put_", index.tensor, source.tensor, accumulate).to(ATensor).newTensor()
  self: grad.clone().put_u(index, zeros_like(source), accumulate)
  source: grad.take(index)

autograd random_u(ty: TensorType; self: Tensor, afrom: int64, ato: int64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, afrom, ato, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_u(self: Tensorself: Tensor, afrom: int64, ato: int64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("random_", afrom, ato, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_u(ty: TensorType; self: Tensor, ato: int64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, ato, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_u(self: Tensorself: Tensor, ato: int64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("random_", ato, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_u(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_u(self: Tensorself: Tensor, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("random_", generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd reciprocal(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("reciprocal", self.tensor).to(ATensor).newTensor()
  self: -grad * fwd_result * fwd_result

autograd reciprocal(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("reciprocal").to(ATensor).newTensor()
  self: -grad * fwd_result * fwd_result

autograd remainder(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("remainder", self.tensor, other).to(ATensor).newTensor()
  self: grad

autograd remainder(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("remainder", other).to(ATensor).newTensor()
  self: grad

autograd remainder(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("remainder", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad

autograd remainder(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("remainder", other.tensor).to(ATensor).newTensor()
  self: grad

autograd RoiPooling2d_forward(ty: TensorType; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1])

autograd RoiPooling2d_forward(input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1])

autograd round(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("round", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd round(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("round").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd rsqrt(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("rsqrt", self.tensor).to(ATensor).newTensor()
  self: -0.5 * grad * fwd_result.pow(3)

autograd rsqrt(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("rsqrt").to(ATensor).newTensor()
  self: -0.5 * grad * fwd_result.pow(3)

autograd scatter_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad.clone().scatter_u(dim, index, 0)
  src: grad.gather(dim, index)

autograd scatter_u(self: Tensorself: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: self.dynamicCppCall("scatter_", dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad.clone().scatter_u(dim, index, 0)
  src: grad.gather(dim, index)

autograd scatter_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().scatter_u(dim, index, 0)

autograd scatter_u(self: Tensorself: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("scatter_", dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().scatter_u(dim, index, 0)

autograd scatter_add_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: ty.dynamicCppCall("scatter_add_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad
  src: grad.gather(dim, index)

autograd scatter_add_u(self: Tensorself: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: self.dynamicCppCall("scatter_add_", dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad
  src: grad.gather(dim, index)

autograd sigmoid(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sigmoid", self.tensor).to(ATensor).newTensor()
  self: u_sigmoid_backward(grad, fwd_result)

autograd sigmoid(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sigmoid").to(ATensor).newTensor()
  self: u_sigmoid_backward(grad, fwd_result)

autograd sign(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sign", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd sign(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sign").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd sin(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sin", self.tensor).to(ATensor).newTensor()
  self: grad * self.cos()

autograd sin(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sin").to(ATensor).newTensor()
  self: grad * self.cos()

autograd sinh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sinh", self.tensor).to(ATensor).newTensor()
  self: grad * self.cosh()

autograd sinh(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sinh").to(ATensor).newTensor()
  self: grad * self.cosh()

autograd sqrt(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sqrt", self.tensor).to(ATensor).newTensor()
  self: grad / (2 * fwd_result)

autograd sqrt(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sqrt").to(ATensor).newTensor()
  self: grad / (2 * fwd_result)

autograd sub(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("sub", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: -grad * alpha

autograd sub(self: Tensorself: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("sub", other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: -grad * alpha

autograd sub(ty: TensorType; self: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("sub", self.tensor, other, alpha).to(ATensor).newTensor()
  self: grad

autograd sub(self: Tensorself: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("sub", other, alpha).to(ATensor).newTensor()
  self: grad

autograd u_sum(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_sum", self.tensor).to(ATensor).newTensor()
  self: grad.expand(self.sizes())

autograd u_sum(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("_sum").to(ATensor).newTensor()
  self: grad.expand(self.sizes())

autograd t(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("t", self.tensor).to(ATensor).newTensor()
  self: grad.t()

autograd t(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("t").to(ATensor).newTensor()
  self: grad.t()

autograd flip(ty: TensorType; self: Tensor, dims: IntList) -> Tensor:
  result: ty.dynamicCppCall("flip", self.tensor, dims).to(ATensor).newTensor()
  self: grad.flip(dims)

autograd flip(self: Tensorself: Tensor, dims: IntList) -> Tensor:
  result: self.dynamicCppCall("flip", dims).to(ATensor).newTensor()
  self: grad.flip(dims)

autograd rot90(ty: TensorType; self: Tensor, k: int64 = 1, dims: IntList) -> Tensor:
  result: ty.dynamicCppCall("rot90", self.tensor, k, dims).to(ATensor).newTensor()
  self: grad.rot90(-k, dims)

autograd rot90(self: Tensorself: Tensor, k: int64 = 1, dims: IntList) -> Tensor:
  result: self.dynamicCppCall("rot90", k, dims).to(ATensor).newTensor()
  self: grad.rot90(-k, dims)

autograd take(ty: TensorType; self: Tensor, index: Tensor) -> Tensor:
  result: ty.dynamicCppCall("take", self.tensor, index.tensor).to(ATensor).newTensor()
  self: zeros_like(self).put_u(index, grad, true)

autograd take(self: Tensorself: Tensor, index: Tensor) -> Tensor:
  result: self.dynamicCppCall("take", index.tensor).to(ATensor).newTensor()
  self: zeros_like(self).put_u(index, grad, true)

autograd tan(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("tan", self.tensor).to(ATensor).newTensor()
  self: grad * (1 + fwd_result.pow(2))

autograd tan(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("tan").to(ATensor).newTensor()
  self: grad * (1 + fwd_result.pow(2))

autograd tanh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("tanh", self.tensor).to(ATensor).newTensor()
  self: u_tanh_backward(grad, fwd_result)

autograd tanh(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("tanh").to(ATensor).newTensor()
  self: u_tanh_backward(grad, fwd_result)

autograd transpose(ty: TensorType; self: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: ty.dynamicCppCall("transpose", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd transpose(self: Tensorself: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: self.dynamicCppCall("transpose", dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd transpose_u(ty: TensorType; self: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: ty.dynamicCppCall("transpose_", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd transpose_u(self: Tensorself: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: self.dynamicCppCall("transpose_", dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd tril(ty: TensorType; self: Tensor, diagonal: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("tril", self.tensor, diagonal).to(ATensor).newTensor()
  self: grad.tril(diagonal)

autograd tril(self: Tensorself: Tensor, diagonal: int64 = 0) -> Tensor:
  result: self.dynamicCppCall("tril", diagonal).to(ATensor).newTensor()
  self: grad.tril(diagonal)

autograd triu(ty: TensorType; self: Tensor, diagonal: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("triu", self.tensor, diagonal).to(ATensor).newTensor()
  self: grad.triu(diagonal)

autograd triu(self: Tensorself: Tensor, diagonal: int64 = 0) -> Tensor:
  result: self.dynamicCppCall("triu", diagonal).to(ATensor).newTensor()
  self: grad.triu(diagonal)

autograd trunc(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("trunc", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd trunc(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("trunc").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd uniform_u(ty: TensorType; self: Tensor, afrom: float64 = 0, ato: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("uniform_", self.tensor, afrom, ato, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd uniform_u(self: Tensorself: Tensor, afrom: float64 = 0, ato: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("uniform_", afrom, ato, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd u_unsafe_view(ty: TensorType; self: Tensor, size: IntList) -> Tensor:
  result: ty.dynamicCppCall("_unsafe_view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd u_unsafe_view(self: Tensor, size: IntList) -> Tensor:
  result: dynamicCCall("at::_unsafe_view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd unsqueeze(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("unsqueeze", self.tensor, dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd unsqueeze(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("unsqueeze", dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd unsqueeze_u(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("unsqueeze_", self.tensor, dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd unsqueeze_u(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("unsqueeze_", dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd view(ty: TensorType; self: Tensor, size: IntList) -> Tensor:
  result: ty.dynamicCppCall("view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd view(self: Tensorself: Tensor, size: IntList) -> Tensor:
  result: self.dynamicCppCall("view", size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd u_s_where(ty: TensorType; condition: Tensor, self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()
  self: where(condition, grad, zeros_like(grad))
  other: where(condition, zeros_like(grad), grad)

autograd u_s_where(self: Tensorcondition: Tensor, self: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("_s_where", condition.tensor, other.tensor).to(ATensor).newTensor()
  self: where(condition, grad, zeros_like(grad))
  other: where(condition, zeros_like(grad), grad)

autograd zero_u(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("zero_", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd zero_u(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("zero_").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd u_standard_gamma(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("_standard_gamma", self.tensor, generator).to(ATensor).newTensor()
  self: grad * self.u_standard_gamma_grad(fwd_result)

autograd u_standard_gamma(self: Tensorself: Tensor, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("_standard_gamma", generator).to(ATensor).newTensor()
  self: grad * self.u_standard_gamma_grad(fwd_result)

autograd binary_cross_entropy(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: binary_cross_entropy_backward(grad, self, target, weight, reduction)

autograd binary_cross_entropy(self: Tensor, target: Tensor, weight: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: binary_cross_entropy_backward(grad, self, target, weight, reduction)

autograd embedding(ty: TensorType; weight: Tensor, indices: Tensor, padding_idx: int64 = -1, scale_grad_by_freq: bool = false, sparse: bool = false) -> Tensor:
  result: ty.dynamicCppCall("embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)

autograd embedding(weight: Tensor, indices: Tensor, padding_idx: int64 = -1, scale_grad_by_freq: bool = false, sparse: bool = false) -> Tensor:
  result: dynamicCCall("at::embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)

autograd u_embedding_bag(ty: TensorType; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]:
  result: ty.dynamicCppCall("_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: u_embedding_bag_backward(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse)

autograd u_embedding_bag(weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]:
  result: dynamicCCall("at::_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: u_embedding_bag_backward(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse)

autograd l1_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: l1_loss_backward(grad, self, target, reduction)

autograd l1_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: l1_loss_backward(grad, self, target, reduction)

autograd mse_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: mse_loss_backward(grad, self, target, reduction)

autograd mse_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: mse_loss_backward(grad, self, target, reduction)

autograd multi_margin_loss(ty: TensorType; self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)

autograd multi_margin_loss(self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)

autograd multilabel_margin_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> tuple[output: Tensor, is_target: Tensor]:
  result: ty.dynamicCppCall("multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target)

autograd multilabel_margin_loss(self: Tensor, target: Tensor, reduction: int64) -> tuple[output: Tensor, is_target: Tensor]:
  result: dynamicCCall("at::multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target)

autograd nll_loss(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: ty.dynamicCppCall("nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd nll_loss(self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: dynamicCCall("at::nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd nll_loss2d(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: ty.dynamicCppCall("nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd nll_loss2d(self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: dynamicCCall("at::nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd smooth_l1_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: smooth_l1_loss_backward(grad, self, target, reduction)

autograd smooth_l1_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: smooth_l1_loss_backward(grad, self, target, reduction)

autograd soft_margin_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: soft_margin_loss_backward(grad, self, target, reduction)

autograd soft_margin_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: soft_margin_loss_backward(grad, self, target, reduction)

autograd relu(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("relu", self.tensor).to(ATensor).newTensor()
  self: threshold_backward(grad, self, 0, 0)

autograd relu(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("relu").to(ATensor).newTensor()
  self: threshold_backward(grad, self, 0, 0)

autograd elu(ty: TensorType; self: Tensor, alpha: float, scale: float, input_scale: float) -> Tensor:
  result: ty.dynamicCppCall("elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: elu_backward(grad, alpha, scale, input_scale, fwd_result)

autograd elu(self: Tensor, alpha: float, scale: float, input_scale: float) -> Tensor:
  result: dynamicCCall("at::elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: elu_backward(grad, alpha, scale, input_scale, fwd_result)

autograd glu(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: glu_backward(grad, self, dim)

autograd glu(self: Tensor, dim: int64) -> Tensor:
  result: dynamicCCall("at::glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: glu_backward(grad, self, dim)

autograd hardshrink(ty: TensorType; self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("hardshrink", self.tensor, lambd).to(ATensor).newTensor()
  self: hardshrink_backward(grad, self, lambd)

autograd hardshrink(self: Tensorself: Tensor, lambd: float) -> Tensor:
  result: self.dynamicCppCall("hardshrink", lambd).to(ATensor).newTensor()
  self: hardshrink_backward(grad, self, lambd)

autograd hardshrink_backward(ty: TensorType; grad_out: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("hardshrink_backward", grad_out.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_out: hardshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd hardshrink_backward(self: Tensorgrad_out: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: self.dynamicCppCall("hardshrink_backward", grad_out.tensor, lambd).to(ATensor).newTensor()
  grad_out: hardshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd hardtanh(ty: TensorType; self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, self, min_val, max_val)

autograd hardtanh(self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: dynamicCCall("at::hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, self, min_val, max_val)

autograd hardtanh_u(ty: TensorType; self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, fwd_result, min_val, max_val)

autograd hardtanh_u(self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: dynamicCCall("at::hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, fwd_result, min_val, max_val)

autograd leaky_relu(ty: TensorType; self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, self, negative_slope)

autograd leaky_relu(self: Tensor, negative_slope: float) -> Tensor:
  result: dynamicCCall("at::leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, self, negative_slope)

autograd leaky_relu_u(ty: TensorType; self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_forward_", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, fwd_result, negative_slope)

autograd leaky_relu_u(self: Tensor, negative_slope: float) -> Tensor:
  result: dynamicCCall("at::leaky_relu_forward_", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, fwd_result, negative_slope)

autograd log_sigmoid(ty: TensorType; self: Tensor) -> tuple[output: Tensor, buffer: Tensor]:
  result: ty.dynamicCppCall("log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: log_sigmoid_backward(grad, self, fwd_result.buffer)

autograd log_sigmoid(self: Tensor) -> tuple[output: Tensor, buffer: Tensor]:
  result: dynamicCCall("at::log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: log_sigmoid_backward(grad, self, fwd_result.buffer)

autograd log_softmax(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("log_softmax", self.tensor, dim).to(ATensor).newTensor()
  self: log_softmax_backward_data(grad, fwd_result, dim, self)

autograd log_softmax(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("log_softmax", dim).to(ATensor).newTensor()
  self: log_softmax_backward_data(grad, fwd_result, dim, self)

autograd prelu(ty: TensorType; self: Tensor, weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("prelu_forward", self.tensor, weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight, grad_input_mask)

autograd prelu(self: Tensor, weight: Tensor) -> Tensor:
  result: dynamicCCall("at::prelu_forward", self.tensor, weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight, grad_input_mask)

autograd rrelu_with_noise(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)

autograd rrelu_with_noise(self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: dynamicCCall("at::rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)

autograd rrelu_with_noise_u(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)

autograd rrelu_with_noise_u(self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: dynamicCCall("at::rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)

autograd softmax(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("softmax", self.tensor, dim).to(ATensor).newTensor()
  self: softmax_backward_data(grad, fwd_result, dim, self)

autograd softmax(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("softmax", dim).to(ATensor).newTensor()
  self: softmax_backward_data(grad, fwd_result, dim, self)

autograd softplus(ty: TensorType; self: Tensor, beta: float, threshold: float) -> Tensor:
  result: ty.dynamicCppCall("softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: softplus_backward(grad, self, beta, threshold, fwd_result)

autograd softplus(self: Tensor, beta: float, threshold: float) -> Tensor:
  result: dynamicCCall("at::softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: softplus_backward(grad, self, beta, threshold, fwd_result)

autograd softshrink(ty: TensorType; self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: softshrink_backward(grad, self, lambd)

autograd softshrink(self: Tensor, lambd: float) -> Tensor:
  result: dynamicCCall("at::softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: softshrink_backward(grad, self, lambd)

autograd threshold(ty: TensorType; self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, self, threshold, value)

autograd threshold(self: Tensor, threshold: float, value: float) -> Tensor:
  result: dynamicCCall("at::threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, self, threshold, value)

autograd threshold_u(ty: TensorType; self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_forward_", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, fwd_result, threshold, value)

autograd threshold_u(self: Tensor, threshold: float, value: float) -> Tensor:
  result: dynamicCCall("at::threshold_forward_", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, fwd_result, threshold, value)

autograd reflection_pad1d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad1d_backward(grad, self, padding)

autograd reflection_pad1d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad1d_backward(grad, self, padding)

autograd reflection_pad2d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad2d_backward(grad, self, padding)

autograd reflection_pad2d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad2d_backward(grad, self, padding)

autograd replication_pad1d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad1d_backward(grad, self, padding)

autograd replication_pad1d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad1d_backward(grad, self, padding)

autograd replication_pad2d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad2d_backward(grad, self, padding)

autograd replication_pad2d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad2d_backward(grad, self, padding)

autograd replication_pad3d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad3d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad3d_backward(grad, self, padding)

autograd replication_pad3d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad3d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad3d_backward(grad, self, padding)

autograd upsample_linear1d(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_linear1d(self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_bilinear2d(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_bilinear2d(self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_trilinear3d(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_trilinear3d(self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_nearest1d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest1d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest1d_backward(grad, output_size, self.sizes())

autograd upsample_nearest1d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest1d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest1d_backward(grad, output_size, self.sizes())

autograd upsample_nearest2d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest2d_backward(grad, output_size, self.sizes())

autograd upsample_nearest2d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest2d_backward(grad, output_size, self.sizes())

autograd upsample_nearest3d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest3d_backward(grad, output_size, self.sizes())

autograd upsample_nearest3d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest3d_backward(grad, output_size, self.sizes())

autograd adaptive_avg_pool2d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool2d_backward(grad, self)

autograd adaptive_avg_pool2d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool2d_backward(grad, self)

autograd adaptive_avg_pool3d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool3d_backward(grad, self)

autograd adaptive_avg_pool3d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool3d_backward(grad, self)

autograd adaptive_max_pool2d(ty: TensorType; self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool2d_backward(grad, self, fwd_result.indices)

autograd adaptive_max_pool2d(self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool2d_backward(grad, self, fwd_result.indices)

autograd adaptive_max_pool3d(ty: TensorType; self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool3d_backward(grad, self, fwd_result.indices)

autograd adaptive_max_pool3d(self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool3d_backward(grad, self, fwd_result.indices)

autograd avg_pool2d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd avg_pool2d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd avg_pool3d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd avg_pool3d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd fractional_max_pool2d(ty: TensorType; self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices)

autograd fractional_max_pool2d(self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices)

autograd max_pool2d_with_indices(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_pool2d_with_indices(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_pool3d_with_indices(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_pool3d_with_indices(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_unpool2d(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  self: max_unpool2d_backward(grad, self, indices, output_size)

autograd max_unpool2d(self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  self: max_unpool2d_backward(grad, self, indices, output_size)

autograd max_unpool3d(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()
  self: max_unpool3d_backward(grad, self, indices, output_size, stride, padding)

autograd max_unpool3d(self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList) -> Tensor:
  result: dynamicCCall("at::max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()
  self: max_unpool3d_backward(grad, self, indices, output_size, stride, padding)

autograd thnn_batch_norm(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64) -> tuple[output: Tensor, save_mean: Tensor, save_std: Tensor]:
  result: ty.dynamicCppCall("thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_batch_norm(self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64) -> tuple[output: Tensor, save_mean: Tensor, save_std: Tensor]:
  result: dynamicCCall("at::thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_conv_transpose2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: dynamicCCall("at::thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose3d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_transpose3d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: dynamicCCall("at::thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: dynamicCCall("at::thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_depthwise2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> Tensor:
  result: ty.dynamicCppCall("thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1)

autograd thnn_conv_depthwise2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> Tensor:
  result: dynamicCCall("at::thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1)

autograd thnn_conv3d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv3d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: dynamicCCall("at::thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_dilated2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: dynamicCCall("at::thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: dynamicCCall("at::thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd adaptive_avg_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd adaptive_avg_pool2d_backward(grad_output: Tensor, self: Tensor) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd adaptive_avg_pool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd adaptive_avg_pool3d_backward(grad_output: Tensor, self: Tensor) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd avg_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd avg_pool2d_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd avg_pool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd avg_pool3d_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd hardtanh_backward(ty: TensorType; grad_output: Tensor, self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: hardtanh_backward(grad, self, min_val, max_val)
  self: zeros_like(grad)

autograd hardtanh_backward(grad_output: Tensor, self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: dynamicCCall("at::hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: hardtanh_backward(grad, self, min_val, max_val)
  self: zeros_like(grad)

autograd leaky_relu_backward(ty: TensorType; grad_output: Tensor, self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: leaky_relu_backward(grad, self, negative_slope)
  self: zeros_like(grad)

autograd leaky_relu_backward(grad_output: Tensor, self: Tensor, negative_slope: float) -> Tensor:
  result: dynamicCCall("at::leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: leaky_relu_backward(grad, self, negative_slope)
  self: zeros_like(grad)

autograd max_unpool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  grad_output: max_unpool2d(grad, indices, output_size)
  self: zeros_like(self)

autograd max_unpool2d_backward(grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  grad_output: max_unpool2d(grad, indices, output_size)
  self: zeros_like(self)

autograd nll_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd nll_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: dynamicCCall("at::nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd nll_loss2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss2d(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd nll_loss2d_backward(grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: dynamicCCall("at::nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss2d(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd rrelu_with_noise_backward(ty: TensorType; grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  self: zeros_like(grad)

autograd rrelu_with_noise_backward(grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool) -> Tensor:
  result: dynamicCCall("at::rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  self: zeros_like(grad)

autograd reflection_pad1d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad1d(grad, padding)
  self: zeros_like(self)

autograd reflection_pad1d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad1d(grad, padding)
  self: zeros_like(self)

autograd reflection_pad2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad2d(grad, padding)
  self: zeros_like(self)

autograd reflection_pad2d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad2d(grad, padding)
  self: zeros_like(self)

autograd replication_pad1d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad1d(grad, padding)
  self: zeros_like(self)

autograd replication_pad1d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad1d(grad, padding)
  self: zeros_like(self)

autograd replication_pad2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad2d(grad, padding)
  self: zeros_like(self)

autograd replication_pad2d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad2d(grad, padding)
  self: zeros_like(self)

autograd replication_pad3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad3d(grad, padding)
  self: zeros_like(self)

autograd replication_pad3d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad3d(grad, padding)
  self: zeros_like(self)

autograd softshrink_backward(ty: TensorType; grad_output: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: softshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd softshrink_backward(grad_output: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: dynamicCCall("at::softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: softshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd threshold_backward(ty: TensorType; grad_output: Tensor, self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: threshold_backward(grad, self, threshold, value)
  self: zeros_like(grad)

autograd threshold_backward(grad_output: Tensor, self: Tensor, threshold: float, value: float) -> Tensor:
  result: dynamicCCall("at::threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: threshold_backward(grad, self, threshold, value)
  self: zeros_like(grad)

autograd upsample_linear1d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_linear1d(grad, output_size, align_corners)

autograd upsample_linear1d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_linear1d(grad, output_size, align_corners)

autograd upsample_bilinear2d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_bilinear2d(grad, output_size, align_corners)

autograd upsample_bilinear2d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_bilinear2d(grad, output_size, align_corners)

autograd upsample_trilinear3d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_trilinear3d(grad, output_size, align_corners)

autograd upsample_trilinear3d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_trilinear3d(grad, output_size, align_corners)

autograd upsample_nearest1d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest1d(grad, output_size)

autograd upsample_nearest1d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest1d(grad, output_size)

autograd upsample_nearest2d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest2d(grad, output_size)

autograd upsample_nearest2d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest2d(grad, output_size)

autograd upsample_nearest3d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest3d(grad, output_size)

autograd upsample_nearest3d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest3d(grad, output_size)

autograd u_sigmoid_backward(ty: TensorType; grad_output: Tensor, output: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: u_sigmoid_backward(grad, fwd_result)
  output: grad * grad_output * (-2 * fwd_result + 1)

autograd u_sigmoid_backward(grad_output: Tensor, output: Tensor) -> Tensor:
  result: dynamicCCall("at::_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: u_sigmoid_backward(grad, fwd_result)
  output: grad * grad_output * (-2 * fwd_result + 1)

autograd u_tanh_backward(ty: TensorType; grad_output: Tensor, output: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: u_tanh_backward(grad, fwd_result)
  output: -2 * fwd_result * grad * grad_output

autograd u_tanh_backward(grad_output: Tensor, output: Tensor) -> Tensor:
  result: dynamicCCall("at::_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: u_tanh_backward(grad, fwd_result)
  output: -2 * fwd_result * grad * grad_output

autograd u_cudnn_ctc_loss(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: fwd_result[1]

autograd u_cudnn_ctc_loss(log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: fwd_result[1]

autograd cudnn_convolution_transpose(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: ty.dynamicCppCall("cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution_transpose(self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: dynamicCCall("at::cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: ty.dynamicCppCall("cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution(self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: dynamicCCall("at::cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_grid_sampler(ty: TensorType; self: Tensor, grid: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd cudnn_grid_sampler(self: Tensor, grid: Tensor) -> Tensor:
  result: dynamicCCall("at::cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd cudnn_affine_grid_generator(ty: TensorType; theta: Tensor, N: int64, C: int64, H: int64, W: int64) -> Tensor:
  result: ty.dynamicCppCall("cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: cudnn_affine_grid_generator_backward(grad, N, C, H, W)

autograd cudnn_affine_grid_generator(theta: Tensor, N: int64, C: int64, H: int64, W: int64) -> Tensor:
  result: dynamicCCall("at::cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: cudnn_affine_grid_generator_backward(grad, N, C, H, W)

autograd cudnn_batch_norm(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor]:
  result: ty.dynamicCppCall("cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)

autograd cudnn_batch_norm(input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor]:
  result: dynamicCCall("at::cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)

autograd mkldnn_convolution(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64) -> Tensor:
  result: ty.dynamicCppCall("mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd mkldnn_convolution(self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64) -> Tensor:
  result: dynamicCCall("at::mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd stack(ty: TensorType; tensors: TensorList, dim: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("stack", tensors, dim).to(ATensor).newTensor()
  tensors: unbind(grad, dim)

autograd stack(tensors: TensorList, dim: int64 = 0) -> Tensor:
  result: dynamicCCall("at::stack", tensors, dim).to(ATensor).newTensor()
  tensors: unbind(grad, dim)

autograd u_thnn_fused_gru_cell(ty: TensorType; input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())

autograd u_thnn_fused_gru_cell(input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())

