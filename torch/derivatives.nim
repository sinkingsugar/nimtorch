# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

import math
import ../torch
import autograd_helpers

const M_PI = math.PI

#[ proc abs_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * self.sign()
  result.self = self_result
 ]#
autograd abs(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("abs", self.tensor).to(ATensor).newTensor()
  self: grad * self.sign()

#[ proc acos_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * -((-self * self + 1).rsqrt())
  result.self = self_result
 ]#
autograd acos(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("acos", self.tensor).to(ATensor).newTensor()
  self: grad * -((-self * self + 1).rsqrt())

#[ proc add_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
  let other_result = torch.maybe_multiply(grad, alpha)
  result.other = other_result
 ]#
autograd add(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("add", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: torch.maybe_multiply(grad, alpha)

#[ proc add_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd add(ty: TensorType; self: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("add", self.tensor, other, alpha).to(ATensor).newTensor()
  self: grad

#[ proc addbmm_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] {.inline, noinit.} =
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  let batch1_result = grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  result.batch1 = batch1_result
  let batch2_result = batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha
  result.batch2 = batch2_result
 ]#
autograd addbmm(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: torch.maybe_multiply(grad, beta)
  batch1: grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha

#[ proc addcdiv_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
  let tensor1_result = grad * value / tensor2
  result.tensor1 = tensor1_result
  let tensor2_result = -grad * value * tensor1 / (tensor2 * tensor2)
  result.tensor2 = tensor2_result
 ]#
autograd addcdiv(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addcdiv", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * value / tensor2
  tensor2: -grad * value * tensor1 / (tensor2 * tensor2)

#[ proc addcmul_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, tensor1: Tensor, tensor2: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
  let tensor1_result = grad * tensor2 * value
  result.tensor1 = tensor1_result
  let tensor2_result = grad * tensor1 * value
  result.tensor2 = tensor2_result
 ]#
autograd addcmul(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addcmul", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * tensor2 * value
  tensor2: grad * tensor1 * value

#[ proc th_addmm_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] {.inline, noinit.} =
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  let mat1_result = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat1 = mat1_result
  let mat2_result = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)
  result.mat2 = mat2_result
 ]#
autograd th_addmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: torch.maybe_multiply(grad, beta)
  mat1: torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  mat2: torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

#[ proc s_native_addmm_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, mat1: Tensor, mat2: Tensor] {.inline, noinit.} =
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  let mat1_result = torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  result.mat1 = mat1_result
  let mat2_result = torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)
  result.mat2 = mat2_result
 ]#
autograd s_native_addmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: torch.maybe_multiply(grad, beta)
  mat1: torch.mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha)
  mat2: torch.mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha)

#[ proc u_addmv_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, mat: Tensor, vec: Tensor] {.inline, noinit.} =
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  let mat_result = grad.ger(vec) * alpha
  result.mat = mat_result
  let vec_result = mat.t().mv(grad) * alpha
  result.vec = vec_result
 ]#
autograd u_addmv(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: torch.maybe_multiply(grad, beta)
  mat: grad.ger(vec) * alpha
  vec: mat.t().mv(grad) * alpha

#[ proc u_addr_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, vec1: Tensor, vec2: Tensor] {.inline, noinit.} =
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  let vec1_result = grad.mv(vec2) * alpha
  result.vec1 = vec1_result
  let vec2_result = grad.t().mv(vec1) * alpha
  result.vec2 = vec2_result
 ]#
autograd u_addr(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: torch.maybe_multiply(grad, beta)
  vec1: grad.mv(vec2) * alpha
  vec2: grad.t().mv(vec1) * alpha

#[ proc alias_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd alias(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("alias", self.tensor).to(ATensor).newTensor()
  self: grad

#[ proc asin_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * (-self * self + 1).rsqrt()
  result.self = self_result
 ]#
autograd asin(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("asin", self.tensor).to(ATensor).newTensor()
  self: grad * (-self * self + 1).rsqrt()

#[ proc atan_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad / (self * self + 1)
  result.self = self_result
 ]#
autograd atan(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("atan", self.tensor).to(ATensor).newTensor()
  self: grad / (self * self + 1)

#[ proc atan2_bwd*(grad: Tensor; fwd_result: Tensor, grad_input_mask: StdArray): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = torch.atan2_backward(grad, self, other, grad_input_mask)
  result.self = self_result[0]
  result.other = self_result[1]
 ]#
autograd atan2(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("atan2", self.tensor, other.tensor).to(ATensor).newTensor()
  self: torch.atan2_backward(grad, self, other, grad_input_mask)
  other: torch.atan2_backward(grad, self, other, grad_input_mask)

#[ proc baddbmm_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, batch1: Tensor, batch2: Tensor] {.inline, noinit.} =
  let self_result = torch.maybe_multiply(grad, beta)
  result.self = self_result
  let batch1_result = grad.bmm(batch2.transpose(1, 2)) * alpha
  result.batch1 = batch1_result
  let batch2_result = batch1.transpose(1, 2).bmm(grad) * alpha
  result.batch2 = batch2_result
 ]#
autograd baddbmm(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("baddbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: torch.maybe_multiply(grad, beta)
  batch1: grad.bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad) * alpha

#[ proc bernoulli_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd bernoulli(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("bernoulli", self.tensor, p, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc bmm_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, mat2: Tensor] {.inline, noinit.} =
  let self_result = grad.bmm(mat2.transpose(1, 2))
  result.self = self_result
  let mat2_result = self.transpose(1, 2).bmm(grad)
  result.mat2 = mat2_result
 ]#
autograd bmm(ty: TensorType; self: Tensor, mat2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("bmm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: grad.bmm(mat2.transpose(1, 2))
  mat2: self.transpose(1, 2).bmm(grad)

#[ proc cauchy_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd cauchy_u(ty: TensorType; self: Tensor, median: float64 = 0, sigma: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("cauchy_", self.tensor, median, sigma, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc ceil_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd ceil(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ceil", self.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc clamp_min_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * (self >= min).type_as(grad)
  result.self = self_result
 ]#
autograd clamp_min(ty: TensorType; self: Tensor, min: float) -> Tensor:
  result: ty.dynamicCppCall("clamp_min", self.tensor, min).to(ATensor).newTensor()
  self: grad * (self >= min).type_as(grad)

#[ proc clamp_max_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * (self <= max).type_as(grad)
  result.self = self_result
 ]#
autograd clamp_max(ty: TensorType; self: Tensor, max: float) -> Tensor:
  result: ty.dynamicCppCall("clamp_max", self.tensor, max).to(ATensor).newTensor()
  self: grad * (self <= max).type_as(grad)

#[ proc clone_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd clone(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("clone", self.tensor).to(ATensor).newTensor()
  self: grad

#[ proc cos_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * -self.sin()
  result.self = self_result
 ]#
autograd cos(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cos", self.tensor).to(ATensor).newTensor()
  self: grad * -self.sin()

#[ proc cosh_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * self.sinh()
  result.self = self_result
 ]#
autograd cosh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cosh", self.tensor).to(ATensor).newTensor()
  self: grad * self.sinh()

#[ proc cross_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = other.cross(grad, dim)
  result.self = self_result
  let other_result = grad.cross(self, dim)
  result.other = other_result
 ]#
autograd cross(ty: TensorType; self: Tensor, other: Tensor, dim: int64 = -1) -> Tensor:
  result: ty.dynamicCppCall("cross", self.tensor, other.tensor, dim).to(ATensor).newTensor()
  self: other.cross(grad, dim)
  other: grad.cross(self, dim)

#[ proc conv_tbc_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.conv_tbc_backward(grad, self, weight, bias, pad)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd conv_tbc(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, pad: int64) -> Tensor:
  result: ty.dynamicCppCall("conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  self: torch.conv_tbc_backward(grad, self, weight, bias, pad)
  weight: torch.conv_tbc_backward(grad, self, weight, bias, pad)
  bias: torch.conv_tbc_backward(grad, self, weight, bias, pad)

#[ proc u_ctc_loss_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor]): tuple[log_probs: Tensor] {.inline, noinit.} =
  let log_probs_result = torch.u_ctc_loss_backward(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank)
  result.log_probs = log_probs_result
 ]#
autograd u_ctc_loss(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: torch.u_ctc_loss_backward(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank)

#[ proc adiv_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = grad / other
  result.self = self_result
  let other_result = -grad * self / (other * other)
  result.other = other_result
 ]#
autograd adiv(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("div", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad / other
  other: -grad * self / (other * other)

#[ proc adiv_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad / other
  result.self = self_result
 ]#
autograd adiv(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("div", self.tensor, other).to(ATensor).newTensor()
  self: grad / other

#[ proc dot_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, tensor: Tensor] {.inline, noinit.} =
  let self_result = grad * tensor
  result.self = self_result
  let tensor_result = grad * self
  result.tensor = tensor_result
 ]#
autograd dot(ty: TensorType; self: Tensor, tensor: Tensor) -> Tensor:
  result: ty.dynamicCppCall("dot", self.tensor, tensor.tensor).to(ATensor).newTensor()
  self: grad * tensor
  tensor: grad * self

#[ proc eq_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd eq_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("eq_", self.tensor, other).to(ATensor).newTensor()
  self: torch.zeros_like(self)

#[ proc eq_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
  let other_result = torch.zeros_like(other)
  result.other = other_result
 ]#
autograd eq_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("eq_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self)
  other: torch.zeros_like(other)

#[ proc erf_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = 2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad
  result.self = self_result
 ]#
autograd erf(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erf", self.tensor).to(ATensor).newTensor()
  self: 2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

#[ proc erfc_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = -2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad
  result.self = self_result
 ]#
autograd erfc(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erfc", self.tensor).to(ATensor).newTensor()
  self: -2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

#[ proc erfinv_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = 0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad
  result.self = self_result
 ]#
autograd erfinv(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erfinv", self.tensor).to(ATensor).newTensor()
  self: 0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad

#[ proc exp_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * fwd_result
  result.self = self_result
 ]#
autograd exp(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("exp", self.tensor).to(ATensor).newTensor()
  self: grad * fwd_result

#[ proc expm1_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * (fwd_result + 1)
  result.self = self_result
 ]#
autograd expm1(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("expm1", self.tensor).to(ATensor).newTensor()
  self: grad * (fwd_result + 1)

#[ proc exponential_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd exponential_u(ty: TensorType; self: Tensor, lambd: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("exponential_", self.tensor, lambd, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc fill_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd fill_u(ty: TensorType; self: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("fill_", self.tensor, value).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc fill_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, value: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
  let value_result = grad.sum()
  result.value = value_result
 ]#
autograd fill_u(ty: TensorType; self: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("fill_", self.tensor, value.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(grad)
  value: grad.sum()

#[ proc floor_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd floor(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("floor", self.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc fmod_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd fmod(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("fmod", self.tensor, other).to(ATensor).newTensor()
  self: grad

#[ proc fmod_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd fmod(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("fmod", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad

#[ proc frac_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd frac(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("frac", self.tensor).to(ATensor).newTensor()
  self: grad

#[ proc ge_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd ge_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("ge_", self.tensor, other).to(ATensor).newTensor()
  self: torch.zeros_like(self)

#[ proc ge_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
  let other_result = torch.zeros_like(other)
  result.other = other_result
 ]#
autograd ge_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ge_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self)
  other: torch.zeros_like(other)

#[ proc geometric_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd geometric_u(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("geometric_", self.tensor, p, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc ger_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, vec2: Tensor] {.inline, noinit.} =
  let self_result = grad.mv(vec2)
  result.self = self_result
  let vec2_result = grad.t().mv(self)
  result.vec2 = vec2_result
 ]#
autograd ger(ty: TensorType; self: Tensor, vec2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ger", self.tensor, vec2.tensor).to(ATensor).newTensor()
  self: grad.mv(vec2)
  vec2: grad.t().mv(self)

#[ proc grid_sampler_2d_bwd*(grad: Tensor; fwd_result: Tensor): tuple[input: Tensor, grid: Tensor] {.inline, noinit.} =
  let input_result = torch.grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)
  result.input = input_result[0]
  result.grid = input_result[1]
 ]#
autograd grid_sampler_2d(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: ty.dynamicCppCall("grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  input: torch.grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)
  grid: torch.grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

#[ proc grid_sampler_3d_bwd*(grad: Tensor; fwd_result: Tensor): tuple[input: Tensor, grid: Tensor] {.inline, noinit.} =
  let input_result = torch.grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)
  result.input = input_result[0]
  result.grid = input_result[1]
 ]#
autograd grid_sampler_3d(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: ty.dynamicCppCall("grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  input: torch.grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)
  grid: torch.grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

#[ proc gt_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd gt_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("gt_", self.tensor, other).to(ATensor).newTensor()
  self: torch.zeros_like(self)

#[ proc gt_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
  let other_result = torch.zeros_like(other)
  result.other = other_result
 ]#
autograd gt_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("gt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self)
  other: torch.zeros_like(other)

#[ proc index_add_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, source: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
  let source_result = grad.index_select(dim, index)
  result.source = source_result
 ]#
autograd index_add_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_add_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad
  source: grad.index_select(dim, index)

#[ proc index_copy_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, source: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().index_fill_u(dim, index, 0)
  result.self = self_result
  let source_result = grad.index_select(dim, index)
  result.source = source_result
 ]#
autograd index_copy_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_copy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)
  source: grad.index_select(dim, index)

#[ proc index_fill_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().index_fill_u(dim, index, 0)
  result.self = self_result
 ]#
autograd index_fill_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)

#[ proc index_fill_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, value: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().index_fill_u(dim, index, 0)
  result.self = self_result
  let value_result = grad.index_select(dim, index).sum()
  result.value = value_result
 ]#
autograd index_fill_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_u(dim, index, 0)
  value: grad.index_select(dim, index).sum()

#[ proc inverse_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = -mm(fwd_result.t(), mm(grad, fwd_result.t()))
  result.self = self_result
 ]#
autograd inverse(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("inverse", self.tensor).to(ATensor).newTensor()
  self: -mm(fwd_result.t(), mm(grad, fwd_result.t()))

#[ proc le_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd le_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("le_", self.tensor, other).to(ATensor).newTensor()
  self: torch.zeros_like(self)

#[ proc le_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
  let other_result = torch.zeros_like(other)
  result.other = other_result
 ]#
autograd le_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("le_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self)
  other: torch.zeros_like(other)

#[ proc lgamma_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * digamma(self)
  result.self = self_result
 ]#
autograd lgamma(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("lgamma", self.tensor).to(ATensor).newTensor()
  self: grad * digamma(self)

#[ proc digamma_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * polygamma(1, self)
  result.self = self_result
 ]#
autograd digamma(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("digamma", self.tensor).to(ATensor).newTensor()
  self: grad * polygamma(1, self)

#[ proc polygamma_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * polygamma(n + 1, self)
  result.self = self_result
 ]#
autograd polygamma(ty: TensorType; n: int64, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("polygamma", n, self.tensor).to(ATensor).newTensor()
  self: grad * polygamma(n + 1, self)

#[ proc log_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.adiv(self)
  result.self = self_result
 ]#
autograd log(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log", self.tensor).to(ATensor).newTensor()
  self: grad.adiv(self)

#[ proc log10_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad / (self * 2.3025850929940456)
  result.self = self_result
 ]#
autograd log10(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log10", self.tensor).to(ATensor).newTensor()
  self: grad / (self * 2.3025850929940456)

#[ proc log2_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad / (self * 0.6931471805599453)
  result.self = self_result
 ]#
autograd log2(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log2", self.tensor).to(ATensor).newTensor()
  self: grad / (self * 0.6931471805599453)

#[ proc log_normal_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd log_normal_u(ty: TensorType; self: Tensor, mean: float64 = 1, std: float64 = 2, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("log_normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc lt_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd lt_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("lt_", self.tensor, other).to(ATensor).newTensor()
  self: torch.zeros_like(self)

#[ proc lt_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
  let other_result = torch.zeros_like(other)
  result.other = other_result
 ]#
autograd lt_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("lt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self)
  other: torch.zeros_like(other)

#[ proc masked_fill_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().masked_fill_u(mask, 0)
  result.self = self_result
 ]#
autograd masked_fill_u(ty: TensorType; self: Tensor, mask: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(mask, 0)

#[ proc masked_fill_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, value: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().masked_fill_u(mask, 0)
  result.self = self_result
  let value_result = where(mask, grad, torch.zeros_like(grad)).sum()
  result.value = value_result
 ]#
autograd masked_fill_u(ty: TensorType; self: Tensor, mask: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(mask, 0)
  value: where(mask, grad, torch.zeros_like(grad)).sum()

#[ proc masked_select_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self).masked_scatter_u(mask, grad)
  result.self = self_result
 ]#
autograd masked_select(ty: TensorType; self: Tensor, mask: Tensor) -> Tensor:
  result: ty.dynamicCppCall("masked_select", self.tensor, mask.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self).masked_scatter_u(mask, grad)

#[ proc max_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().masked_fill_u(self <= other, 0)
  result.self = self_result
  let other_result = grad.clone().masked_fill_u(self > other, 0)
  result.other = other_result
 ]#
autograd max(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("max", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(self <= other, 0)
  other: grad.clone().masked_fill_u(self > other, 0)

#[ proc mean_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.expand(self.sizes()) / self.numel()
  result.self = self_result
 ]#
autograd mean(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mean", self.tensor).to(ATensor).newTensor()
  self: grad.expand(self.sizes()) / self.numel()

#[ proc min_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().masked_fill_u(self >= other, 0)
  result.self = self_result
  let other_result = grad.clone().masked_fill_u(self < other, 0)
  result.other = other_result
 ]#
autograd min(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("min", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_u(self >= other, 0)
  other: grad.clone().masked_fill_u(self < other, 0)

#[ proc u_mm_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, mat2: Tensor] {.inline, noinit.} =
  let self_result = torch.mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  result.self = self_result
  let mat2_result = torch.mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)
  result.mat2 = mat2_result
 ]#
autograd u_mm(ty: TensorType; self: Tensor, mat2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_mm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: torch.mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1)
  mat2: torch.mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1)

#[ proc mul_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = grad * other
  result.self = self_result
  let other_result = grad * self
  result.other = other_result
 ]#
autograd mul(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mul", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad * other
  other: grad * self

#[ proc mul_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * other
  result.self = self_result
 ]#
autograd mul(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("mul", self.tensor, other).to(ATensor).newTensor()
  self: grad * other

#[ proc mv_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, vec: Tensor] {.inline, noinit.} =
  let self_result = grad.ger(vec)
  result.self = self_result
  let vec_result = self.t().mv(grad)
  result.vec = vec_result
 ]#
autograd mv(ty: TensorType; self: Tensor, vec: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mv", self.tensor, vec.tensor).to(ATensor).newTensor()
  self: grad.ger(vec)
  vec: self.t().mv(grad)

#[ proc ne_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd ne_u(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("ne_", self.tensor, other).to(ATensor).newTensor()
  self: torch.zeros_like(self)

#[ proc ne_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
  let other_result = torch.zeros_like(other)
  result.other = other_result
 ]#
autograd ne_u(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ne_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self)
  other: torch.zeros_like(other)

#[ proc neg_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.neg()
  result.self = self_result
 ]#
autograd neg(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("neg", self.tensor).to(ATensor).newTensor()
  self: grad.neg()

#[ proc normal_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd normal_u(ty: TensorType; self: Tensor, mean: float64 = 0, std: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc poisson_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd poisson(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("poisson", self.tensor, generator).to(ATensor).newTensor()
  self: torch.zeros_like(self)

#[ proc pow_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.pow_backward(grad, self, exponent)
  result.self = self_result
 ]#
autograd pow(ty: TensorType; self: Tensor, exponent: float) -> Tensor:
  result: ty.dynamicCppCall("pow", self.tensor, exponent).to(ATensor).newTensor()
  self: torch.pow_backward(grad, self, exponent)

#[ proc pow_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, exponent: Tensor] {.inline, noinit.} =
  let self_result = torch.pow_backward_self(grad, self, exponent)
  result.self = self_result
  let exponent_result = torch.pow_backward_exponent(grad, self, exponent)
  result.exponent = exponent_result
 ]#
autograd pow(ty: TensorType; self: Tensor, exponent: Tensor) -> Tensor:
  result: ty.dynamicCppCall("pow", self.tensor, exponent.tensor).to(ATensor).newTensor()
  self: torch.pow_backward_self(grad, self, exponent)
  exponent: torch.pow_backward_exponent(grad, self, exponent)

#[ proc put_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, source: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().put_u(index, torch.zeros_like(source), accumulate)
  result.self = self_result
  let source_result = grad.take(index)
  result.source = source_result
 ]#
autograd put_u(ty: TensorType; self: Tensor, index: Tensor, source: Tensor, accumulate: bool = false) -> Tensor:
  result: ty.dynamicCppCall("put_", self.tensor, index.tensor, source.tensor, accumulate).to(ATensor).newTensor()
  self: grad.clone().put_u(index, torch.zeros_like(source), accumulate)
  source: grad.take(index)

#[ proc random_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd random_u(ty: TensorType; self: Tensor, afrom: int64, ato: int64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, afrom, ato, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc random_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd random_u(ty: TensorType; self: Tensor, ato: int64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, ato, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc random_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd random_u(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc reciprocal_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = -grad * fwd_result * fwd_result
  result.self = self_result
 ]#
autograd reciprocal(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("reciprocal", self.tensor).to(ATensor).newTensor()
  self: -grad * fwd_result * fwd_result

#[ proc remainder_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd remainder(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("remainder", self.tensor, other).to(ATensor).newTensor()
  self: grad

#[ proc remainder_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd remainder(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("remainder", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad

#[ proc RoiPooling2d_forward_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor]): tuple[input: Tensor] {.inline, noinit.} =
  let input_result = torch.RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1])
  result.input = input_result
 ]#
autograd RoiPooling2d_forward(ty: TensorType; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: torch.RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1])

#[ proc round_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd round(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("round", self.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc rsqrt_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = -0.5 * grad * fwd_result.pow(3)
  result.self = self_result
 ]#
autograd rsqrt(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("rsqrt", self.tensor).to(ATensor).newTensor()
  self: -0.5 * grad * fwd_result.pow(3)

#[ proc scatter_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, src: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().scatter_u(dim, index, 0)
  result.self = self_result
  let src_result = grad.gather(dim, index)
  result.src = src_result
 ]#
autograd scatter_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad.clone().scatter_u(dim, index, 0)
  src: grad.gather(dim, index)

#[ proc scatter_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.clone().scatter_u(dim, index, 0)
  result.self = self_result
 ]#
autograd scatter_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().scatter_u(dim, index, 0)

#[ proc scatter_add_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, src: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
  let src_result = grad.gather(dim, index)
  result.src = src_result
 ]#
autograd scatter_add_u(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: ty.dynamicCppCall("scatter_add_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad
  src: grad.gather(dim, index)

#[ proc sigmoid_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.u_sigmoid_backward(grad, fwd_result)
  result.self = self_result
 ]#
autograd sigmoid(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sigmoid", self.tensor).to(ATensor).newTensor()
  self: torch.u_sigmoid_backward(grad, fwd_result)

#[ proc sign_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd sign(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sign", self.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc sin_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * self.cos()
  result.self = self_result
 ]#
autograd sin(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sin", self.tensor).to(ATensor).newTensor()
  self: grad * self.cos()

#[ proc sinh_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * self.cosh()
  result.self = self_result
 ]#
autograd sinh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sinh", self.tensor).to(ATensor).newTensor()
  self: grad * self.cosh()

#[ proc sqrt_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad / (2 * fwd_result)
  result.self = self_result
 ]#
autograd sqrt(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sqrt", self.tensor).to(ATensor).newTensor()
  self: grad / (2 * fwd_result)

#[ proc sub_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
  let other_result = -grad * alpha
  result.other = other_result
 ]#
autograd sub(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("sub", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: -grad * alpha

#[ proc sub_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad
  result.self = self_result
 ]#
autograd sub(ty: TensorType; self: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("sub", self.tensor, other, alpha).to(ATensor).newTensor()
  self: grad

#[ proc u_sum_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.expand(self.sizes())
  result.self = self_result
 ]#
autograd u_sum(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_sum", self.tensor).to(ATensor).newTensor()
  self: grad.expand(self.sizes())

#[ proc t_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.t()
  result.self = self_result
 ]#
autograd t(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("t", self.tensor).to(ATensor).newTensor()
  self: grad.t()

#[ proc flip_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.flip(dims)
  result.self = self_result
 ]#
autograd flip(ty: TensorType; self: Tensor, dims: IntList) -> Tensor:
  result: ty.dynamicCppCall("flip", self.tensor, dims).to(ATensor).newTensor()
  self: grad.flip(dims)

#[ proc rot90_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.rot90(-k, dims)
  result.self = self_result
 ]#
autograd rot90(ty: TensorType; self: Tensor, k: int64 = 1, dims: IntList) -> Tensor:
  result: ty.dynamicCppCall("rot90", self.tensor, k, dims).to(ATensor).newTensor()
  self: grad.rot90(-k, dims)

#[ proc take_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(self).put_u(index, grad, true)
  result.self = self_result
 ]#
autograd take(ty: TensorType; self: Tensor, index: Tensor) -> Tensor:
  result: ty.dynamicCppCall("take", self.tensor, index.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(self).put_u(index, grad, true)

#[ proc tan_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * (1 + fwd_result.pow(2))
  result.self = self_result
 ]#
autograd tan(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("tan", self.tensor).to(ATensor).newTensor()
  self: grad * (1 + fwd_result.pow(2))

#[ proc tanh_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.u_tanh_backward(grad, fwd_result)
  result.self = self_result
 ]#
autograd tanh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("tanh", self.tensor).to(ATensor).newTensor()
  self: torch.u_tanh_backward(grad, fwd_result)

#[ proc transpose_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.transpose(dim0, dim1)
  result.self = self_result
 ]#
autograd transpose(ty: TensorType; self: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: ty.dynamicCppCall("transpose", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

#[ proc transpose_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.transpose(dim0, dim1)
  result.self = self_result
 ]#
autograd transpose_u(ty: TensorType; self: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: ty.dynamicCppCall("transpose_", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

#[ proc tril_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.tril(diagonal)
  result.self = self_result
 ]#
autograd tril(ty: TensorType; self: Tensor, diagonal: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("tril", self.tensor, diagonal).to(ATensor).newTensor()
  self: grad.tril(diagonal)

#[ proc triu_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.triu(diagonal)
  result.self = self_result
 ]#
autograd triu(ty: TensorType; self: Tensor, diagonal: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("triu", self.tensor, diagonal).to(ATensor).newTensor()
  self: grad.triu(diagonal)

#[ proc trunc_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd trunc(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("trunc", self.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc uniform_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd uniform_u(ty: TensorType; self: Tensor, afrom: float64 = 0, ato: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("uniform_", self.tensor, afrom, ato, generator).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc u_unsafe_view_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.reshape(self.sizes())
  result.self = self_result
 ]#
autograd u_unsafe_view(ty: TensorType; self: Tensor, size: IntList) -> Tensor:
  result: ty.dynamicCppCall("_unsafe_view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

#[ proc unsqueeze_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.squeeze(dim)
  result.self = self_result
 ]#
autograd unsqueeze(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("unsqueeze", self.tensor, dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

#[ proc unsqueeze_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.squeeze(dim)
  result.self = self_result
 ]#
autograd unsqueeze_u(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("unsqueeze_", self.tensor, dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

#[ proc view_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad.reshape(self.sizes())
  result.self = self_result
 ]#
autograd view(ty: TensorType; self: Tensor, size: IntList) -> Tensor:
  result: ty.dynamicCppCall("view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

#[ proc u_s_where_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, other: Tensor] {.inline, noinit.} =
  let self_result = where(condition, grad, torch.zeros_like(grad))
  result.self = self_result
  let other_result = where(condition, torch.zeros_like(grad), grad)
  result.other = other_result
 ]#
autograd u_s_where(ty: TensorType; condition: Tensor, self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()
  self: where(condition, grad, torch.zeros_like(grad))
  other: where(condition, torch.zeros_like(grad), grad)

#[ proc zero_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd zero_u(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("zero_", self.tensor).to(ATensor).newTensor()
  self: torch.zeros_like(grad)

#[ proc u_standard_gamma_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = grad * self.u_standard_gamma_grad(fwd_result)
  result.self = self_result
 ]#
autograd u_standard_gamma(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("_standard_gamma", self.tensor, generator).to(ATensor).newTensor()
  self: grad * self.u_standard_gamma_grad(fwd_result)

#[ proc binary_cross_entropy_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.binary_cross_entropy_backward(grad, self, target, weight, reduction)
  result.self = self_result
 ]#
autograd binary_cross_entropy_forward(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: torch.binary_cross_entropy_backward(grad, self, target, weight, reduction)

#[ proc embedding_bwd*(grad: Tensor; fwd_result: Tensor): tuple[weight: Tensor] {.inline, noinit.} =
  let weight_result = torch.embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)
  result.weight = weight_result
 ]#
autograd embedding(ty: TensorType; weight: Tensor, indices: Tensor, padding_idx: int64 = -1, scale_grad_by_freq: bool = false, sparse: bool = false) -> Tensor:
  result: ty.dynamicCppCall("embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: torch.embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)

#[ proc u_embedding_bag_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]): tuple[weight: Tensor] {.inline, noinit.} =
  let weight_result = torch.u_embedding_bag_backward(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse)
  result.weight = weight_result
 ]#
autograd u_embedding_bag(ty: TensorType; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]:
  result: ty.dynamicCppCall("_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: torch.u_embedding_bag_backward(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse)

#[ proc l1_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.l1_loss_backward(grad, self, target, reduction)
  result.self = self_result
 ]#
autograd l1_loss_forward(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: torch.l1_loss_backward(grad, self, target, reduction)

#[ proc mse_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.mse_loss_backward(grad, self, target, reduction)
  result.self = self_result
 ]#
autograd mse_loss_forward(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: torch.mse_loss_backward(grad, self, target, reduction)

#[ proc multi_margin_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)
  result.self = self_result
 ]#
autograd multi_margin_loss_forward(ty: TensorType; self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: torch.multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)

#[ proc multilabel_margin_loss_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, is_target: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target)
  result.self = self_result
 ]#
autograd multilabel_margin_loss_forward(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> tuple[output: Tensor, is_target: Tensor]:
  result: ty.dynamicCppCall("multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target)

#[ proc nll_loss_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, total_weight: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)
  result.self = self_result
 ]#
autograd nll_loss_forward(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: ty.dynamicCppCall("nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

#[ proc nll_loss2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, total_weight: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)
  result.self = self_result
 ]#
autograd nll_loss2d_forward(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: ty.dynamicCppCall("nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

#[ proc smooth_l1_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.smooth_l1_loss_backward(grad, self, target, reduction)
  result.self = self_result
 ]#
autograd smooth_l1_loss_forward(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: torch.smooth_l1_loss_backward(grad, self, target, reduction)

#[ proc soft_margin_loss_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.soft_margin_loss_backward(grad, self, target, reduction)
  result.self = self_result
 ]#
autograd soft_margin_loss_forward(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: torch.soft_margin_loss_backward(grad, self, target, reduction)

#[ proc relu_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.threshold_backward(grad, self, 0, 0)
  result.self = self_result
 ]#
autograd relu(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("relu", self.tensor).to(ATensor).newTensor()
  self: torch.threshold_backward(grad, self, 0, 0)

#[ proc elu_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.elu_backward(grad, alpha, scale, input_scale, fwd_result)
  result.self = self_result
 ]#
autograd elu_forward(ty: TensorType; self: Tensor, alpha: float, scale: float, input_scale: float) -> Tensor:
  result: ty.dynamicCppCall("elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: torch.elu_backward(grad, alpha, scale, input_scale, fwd_result)

#[ proc glu_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.glu_backward(grad, self, dim)
  result.self = self_result
 ]#
autograd glu_forward(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: torch.glu_backward(grad, self, dim)

#[ proc hardshrink_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = hardshrink_backward(grad, self, lambd)
  result.self = self_result
 ]#
autograd hardshrink(ty: TensorType; self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("hardshrink", self.tensor, lambd).to(ATensor).newTensor()
  self: hardshrink_backward(grad, self, lambd)

#[ proc hardshrink_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_out: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_out_result = hardshrink_backward(grad, self, lambd)
  result.grad_out = grad_out_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd hardshrink_backward(ty: TensorType; grad_out: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("hardshrink_backward", grad_out.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_out: hardshrink_backward(grad, self, lambd)
  self: torch.zeros_like(grad)

#[ proc hardtanh_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.hardtanh_backward(grad, self, min_val, max_val)
  result.self = self_result
 ]#
autograd hardtanh_forward(ty: TensorType; self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: torch.hardtanh_backward(grad, self, min_val, max_val)

#[ proc hardtanh_forward_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.hardtanh_backward(grad, fwd_result, min_val, max_val)
  result.self = self_result
 ]#
autograd hardtanh_forward_u(ty: TensorType; self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: torch.hardtanh_backward(grad, fwd_result, min_val, max_val)

#[ proc leaky_relu_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.leaky_relu_backward(grad, self, negative_slope)
  result.self = self_result
 ]#
autograd leaky_relu_forward(ty: TensorType; self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: torch.leaky_relu_backward(grad, self, negative_slope)

#[ proc leaky_relu_forward_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.leaky_relu_backward(grad, fwd_result, negative_slope)
  result.self = self_result
 ]#
autograd leaky_relu_forward_u(ty: TensorType; self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_forward_", self.tensor, negative_slope).to(ATensor).newTensor()
  self: torch.leaky_relu_backward(grad, fwd_result, negative_slope)

#[ proc log_sigmoid_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, buffer: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.log_sigmoid_backward(grad, self, fwd_result.buffer)
  result.self = self_result
 ]#
autograd log_sigmoid_forward(ty: TensorType; self: Tensor) -> tuple[output: Tensor, buffer: Tensor]:
  result: ty.dynamicCppCall("log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.log_sigmoid_backward(grad, self, fwd_result.buffer)

#[ proc log_softmax_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.log_softmax_backward_data(grad, fwd_result, dim, self)
  result.self = self_result
 ]#
autograd log_softmax(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("log_softmax", self.tensor, dim).to(ATensor).newTensor()
  self: torch.log_softmax_backward_data(grad, fwd_result, dim, self)

#[ proc prelu_forward_bwd*(grad: Tensor; fwd_result: Tensor, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} =
  let self_result = torch.prelu_backward(grad, self, weight, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
 ]#
autograd prelu_forward(ty: TensorType; self: Tensor, weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("prelu_forward", self.tensor, weight.tensor).to(ATensor).newTensor()
  self: torch.prelu_backward(grad, self, weight, grad_input_mask)
  weight: torch.prelu_backward(grad, self, weight, grad_input_mask)

#[ proc rrelu_with_noise_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  result.self = self_result
 ]#
autograd rrelu_with_noise_forward(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)

#[ proc rrelu_with_noise_forward_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)
  result.self = self_result
 ]#
autograd rrelu_with_noise_forward_u(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: torch.rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)

#[ proc softmax_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.softmax_backward_data(grad, fwd_result, dim, self)
  result.self = self_result
 ]#
autograd softmax(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("softmax", self.tensor, dim).to(ATensor).newTensor()
  self: torch.softmax_backward_data(grad, fwd_result, dim, self)

#[ proc softplus_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.softplus_backward(grad, self, beta, threshold, fwd_result)
  result.self = self_result
 ]#
autograd softplus_forward(ty: TensorType; self: Tensor, beta: float, threshold: float) -> Tensor:
  result: ty.dynamicCppCall("softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: torch.softplus_backward(grad, self, beta, threshold, fwd_result)

#[ proc softshrink_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.softshrink_backward(grad, self, lambd)
  result.self = self_result
 ]#
autograd softshrink_forward(ty: TensorType; self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: torch.softshrink_backward(grad, self, lambd)

#[ proc threshold_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.threshold_backward(grad, self, threshold, value)
  result.self = self_result
 ]#
autograd threshold_forward(ty: TensorType; self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: torch.threshold_backward(grad, self, threshold, value)

#[ proc threshold_forward_u_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.threshold_backward(grad, fwd_result, threshold, value)
  result.self = self_result
 ]#
autograd threshold_forward_u(ty: TensorType; self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_forward_", self.tensor, threshold, value).to(ATensor).newTensor()
  self: torch.threshold_backward(grad, fwd_result, threshold, value)

#[ proc reflection_pad1d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.reflection_pad1d_backward(grad, self, padding)
  result.self = self_result
 ]#
autograd reflection_pad1d_forward(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: torch.reflection_pad1d_backward(grad, self, padding)

#[ proc reflection_pad2d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.reflection_pad2d_backward(grad, self, padding)
  result.self = self_result
 ]#
autograd reflection_pad2d_forward(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: torch.reflection_pad2d_backward(grad, self, padding)

#[ proc replication_pad1d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.replication_pad1d_backward(grad, self, padding)
  result.self = self_result
 ]#
autograd replication_pad1d_forward(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: torch.replication_pad1d_backward(grad, self, padding)

#[ proc replication_pad2d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.replication_pad2d_backward(grad, self, padding)
  result.self = self_result
 ]#
autograd replication_pad2d_forward(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: torch.replication_pad2d_backward(grad, self, padding)

#[ proc replication_pad3d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.replication_pad3d_backward(grad, self, padding)
  result.self = self_result
 ]#
autograd replication_pad3d_forward(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad3d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: torch.replication_pad3d_backward(grad, self, padding)

#[ proc upsample_linear1d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)
  result.self = self_result
 ]#
autograd upsample_linear1d_forward(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: torch.upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)

#[ proc upsample_bilinear2d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)
  result.self = self_result
 ]#
autograd upsample_bilinear2d_forward(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: torch.upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)

#[ proc upsample_trilinear3d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)
  result.self = self_result
 ]#
autograd upsample_trilinear3d_forward(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: torch.upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)

#[ proc upsample_nearest1d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.upsample_nearest1d_backward(grad, output_size, self.sizes())
  result.self = self_result
 ]#
autograd upsample_nearest1d_forward(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest1d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: torch.upsample_nearest1d_backward(grad, output_size, self.sizes())

#[ proc upsample_nearest2d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.upsample_nearest2d_backward(grad, output_size, self.sizes())
  result.self = self_result
 ]#
autograd upsample_nearest2d_forward(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: torch.upsample_nearest2d_backward(grad, output_size, self.sizes())

#[ proc upsample_nearest3d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.upsample_nearest3d_backward(grad, output_size, self.sizes())
  result.self = self_result
 ]#
autograd upsample_nearest3d_forward(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: torch.upsample_nearest3d_backward(grad, output_size, self.sizes())

#[ proc adaptive_avg_pool2d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.adaptive_avg_pool2d_backward(grad, self)
  result.self = self_result
 ]#
autograd adaptive_avg_pool2d_forward(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: torch.adaptive_avg_pool2d_backward(grad, self)

#[ proc adaptive_avg_pool3d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.adaptive_avg_pool3d_backward(grad, self)
  result.self = self_result
 ]#
autograd adaptive_avg_pool3d_forward(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: torch.adaptive_avg_pool3d_backward(grad, self)

#[ proc adaptive_max_pool2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.adaptive_max_pool2d_backward(grad, self, fwd_result.indices)
  result.self = self_result
 ]#
autograd adaptive_max_pool2d_forward(ty: TensorType; self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.adaptive_max_pool2d_backward(grad, self, fwd_result.indices)

#[ proc adaptive_max_pool3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.adaptive_max_pool3d_backward(grad, self, fwd_result.indices)
  result.self = self_result
 ]#
autograd adaptive_max_pool3d_forward(ty: TensorType; self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.adaptive_max_pool3d_backward(grad, self, fwd_result.indices)

#[ proc avg_pool2d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.self = self_result
 ]#
autograd avg_pool2d_forward(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: torch.avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

#[ proc avg_pool3d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.self = self_result
 ]#
autograd avg_pool3d_forward(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: torch.avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

#[ proc fractional_max_pool2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices)
  result.self = self_result
 ]#
autograd fractional_max_pool2d_forward(ty: TensorType; self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices)

#[ proc max_pool2d_with_indices_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)
  result.self = self_result
 ]#
autograd max_pool2d_with_indices_forward(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

#[ proc max_pool3d_with_indices_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, indices: Tensor]): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)
  result.self = self_result
 ]#
autograd max_pool3d_with_indices_forward(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

#[ proc max_unpool2d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.max_unpool2d_backward(grad, self, indices, output_size)
  result.self = self_result
 ]#
autograd max_unpool2d_forward(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  self: torch.max_unpool2d_backward(grad, self, indices, output_size)

#[ proc max_unpool3d_forward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor] {.inline, noinit.} =
  let self_result = torch.max_unpool3d_backward(grad, self, indices, output_size, stride, padding)
  result.self = self_result
 ]#
autograd max_unpool3d_forward(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()
  self: torch.max_unpool3d_backward(grad, self, indices, output_size, stride, padding)

#[ proc thnn_batch_norm_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, save_mean: Tensor, save_std: Tensor], grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd thnn_batch_norm_forward(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64) -> tuple[output: Tensor, save_mean: Tensor, save_std: Tensor]:
  result: ty.dynamicCppCall("thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)
  weight: torch.thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)
  bias: torch.thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

#[ proc thnn_conv_transpose2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, columns: Tensor, ones: Tensor], grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd thnn_conv_transpose2d_forward(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  weight: torch.thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  bias: torch.thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

#[ proc thnn_conv_transpose3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor], grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd thnn_conv_transpose3d_forward(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  weight: torch.thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  bias: torch.thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

#[ proc thnn_conv2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor], grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd thnn_conv2d_forward(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  weight: torch.thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  bias: torch.thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

#[ proc thnn_conv_depthwise2d_forward_bwd*(grad: Tensor; fwd_result: Tensor, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  let bias_result = grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1)
  result.bias = bias_result
 ]#
autograd thnn_conv_depthwise2d_forward(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> Tensor:
  result: ty.dynamicCppCall("thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor).newTensor()
  self: torch.thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  weight: torch.thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1)

#[ proc thnn_conv3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor], grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd thnn_conv3d_forward(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  weight: torch.thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)
  bias: torch.thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

#[ proc thnn_conv_dilated2d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, columns: Tensor, ones: Tensor], grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd thnn_conv_dilated2d_forward(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  weight: torch.thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  bias: torch.thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

#[ proc thnn_conv_dilated3d_forward_bwd*(grad: Tensor; fwd_result: tuple[output: Tensor, columns: Tensor, ones: Tensor], grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd thnn_conv_dilated3d_forward(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  self: torch.thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  weight: torch.thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)
  bias: torch.thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

#[ proc adaptive_avg_pool2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd adaptive_avg_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: torch.adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  self: torch.zeros_like(self)

#[ proc adaptive_avg_pool3d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd adaptive_avg_pool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: torch.adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  self: torch.zeros_like(self)

#[ proc avg_pool2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd avg_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: torch.avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: torch.zeros_like(self)

#[ proc avg_pool3d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd avg_pool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: torch.avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: torch.zeros_like(self)

#[ proc hardtanh_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.hardtanh_backward(grad, self, min_val, max_val)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd hardtanh_backward(ty: TensorType; grad_output: Tensor, self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: torch.hardtanh_backward(grad, self, min_val, max_val)
  self: torch.zeros_like(grad)

#[ proc leaky_relu_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.leaky_relu_backward(grad, self, negative_slope)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd leaky_relu_backward(ty: TensorType; grad_output: Tensor, self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: torch.leaky_relu_backward(grad, self, negative_slope)
  self: torch.zeros_like(grad)

#[ proc max_unpool2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.max_unpool2d(grad, indices, output_size)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd max_unpool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  grad_output: torch.max_unpool2d(grad, indices, output_size)
  self: torch.zeros_like(self)

#[ proc nll_loss_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.nll_loss(grad, target, weight, reduction, ignore_index)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd nll_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: torch.nll_loss(grad, target, weight, reduction, ignore_index)
  self: torch.zeros_like(grad)

#[ proc nll_loss2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.nll_loss2d(grad, target, weight, reduction, ignore_index)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd nll_loss2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: torch.nll_loss2d(grad, target, weight, reduction, ignore_index)
  self: torch.zeros_like(grad)

#[ proc rrelu_with_noise_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd rrelu_with_noise_backward(ty: TensorType; grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: torch.rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  self: torch.zeros_like(grad)

#[ proc reflection_pad1d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.reflection_pad1d(grad, padding)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd reflection_pad1d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: torch.reflection_pad1d(grad, padding)
  self: torch.zeros_like(self)

#[ proc reflection_pad2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.reflection_pad2d(grad, padding)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd reflection_pad2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: torch.reflection_pad2d(grad, padding)
  self: torch.zeros_like(self)

#[ proc replication_pad1d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.replication_pad1d(grad, padding)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd replication_pad1d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: torch.replication_pad1d(grad, padding)
  self: torch.zeros_like(self)

#[ proc replication_pad2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.replication_pad2d(grad, padding)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd replication_pad2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: torch.replication_pad2d(grad, padding)
  self: torch.zeros_like(self)

#[ proc replication_pad3d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.replication_pad3d(grad, padding)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(self)
  result.self = self_result
 ]#
autograd replication_pad3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: torch.replication_pad3d(grad, padding)
  self: torch.zeros_like(self)

#[ proc softshrink_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.softshrink_backward(grad, self, lambd)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd softshrink_backward(ty: TensorType; grad_output: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: torch.softshrink_backward(grad, self, lambd)
  self: torch.zeros_like(grad)

#[ proc threshold_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, self: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.threshold_backward(grad, self, threshold, value)
  result.grad_output = grad_output_result
  let self_result = torch.zeros_like(grad)
  result.self = self_result
 ]#
autograd threshold_backward(ty: TensorType; grad_output: Tensor, self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: torch.threshold_backward(grad, self, threshold, value)
  self: torch.zeros_like(grad)

#[ proc upsample_linear1d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.upsample_linear1d(grad, output_size, align_corners)
  result.grad_output = grad_output_result
 ]#
autograd upsample_linear1d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: torch.upsample_linear1d(grad, output_size, align_corners)

#[ proc upsample_bilinear2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.upsample_bilinear2d(grad, output_size, align_corners)
  result.grad_output = grad_output_result
 ]#
autograd upsample_bilinear2d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: torch.upsample_bilinear2d(grad, output_size, align_corners)

#[ proc upsample_trilinear3d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.upsample_trilinear3d(grad, output_size, align_corners)
  result.grad_output = grad_output_result
 ]#
autograd upsample_trilinear3d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: torch.upsample_trilinear3d(grad, output_size, align_corners)

#[ proc upsample_nearest1d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.upsample_nearest1d(grad, output_size)
  result.grad_output = grad_output_result
 ]#
autograd upsample_nearest1d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: torch.upsample_nearest1d(grad, output_size)

#[ proc upsample_nearest2d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.upsample_nearest2d(grad, output_size)
  result.grad_output = grad_output_result
 ]#
autograd upsample_nearest2d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: torch.upsample_nearest2d(grad, output_size)

#[ proc upsample_nearest3d_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.upsample_nearest3d(grad, output_size)
  result.grad_output = grad_output_result
 ]#
autograd upsample_nearest3d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: torch.upsample_nearest3d(grad, output_size)

#[ proc u_sigmoid_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.u_sigmoid_backward(grad, fwd_result)
  result.grad_output = grad_output_result
  let output_result = grad * grad_output * (-2 * fwd_result + 1)
  result.output = output_result
 ]#
autograd u_sigmoid_backward(ty: TensorType; grad_output: Tensor, output: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: torch.u_sigmoid_backward(grad, fwd_result)
  output: grad * grad_output * (-2 * fwd_result + 1)

#[ proc u_tanh_backward_bwd*(grad: Tensor; fwd_result: Tensor): tuple[grad_output: Tensor, output: Tensor] {.inline, noinit.} =
  let grad_output_result = torch.u_tanh_backward(grad, fwd_result)
  result.grad_output = grad_output_result
  let output_result = -2 * fwd_result * grad * grad_output
  result.output = output_result
 ]#
autograd u_tanh_backward(ty: TensorType; grad_output: Tensor, output: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: torch.u_tanh_backward(grad, fwd_result)
  output: -2 * fwd_result * grad * grad_output

#[ proc u_cudnn_ctc_loss_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor]): tuple[log_probs: Tensor] {.inline, noinit.} =
  let log_probs_result = fwd_result[1]
  result.log_probs = log_probs_result
 ]#
autograd u_cudnn_ctc_loss(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: fwd_result[1]

#[ proc cudnn_convolution_transpose_bwd*(grad: Tensor; fwd_result: Tensor, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd cudnn_convolution_transpose(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: ty.dynamicCppCall("cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  self: torch.cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  weight: torch.cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  bias: torch.cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

#[ proc cudnn_convolution_bwd*(grad: Tensor; fwd_result: Tensor, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd cudnn_convolution(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: ty.dynamicCppCall("cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  self: torch.cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  weight: torch.cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)
  bias: torch.cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

#[ proc cudnn_grid_sampler_bwd*(grad: Tensor; fwd_result: Tensor): tuple[self: Tensor, grid: Tensor] {.inline, noinit.} =
  let self_result = torch.cudnn_grid_sampler_backward(self, grid, grad)
  result.self = self_result[0]
  result.grid = self_result[1]
 ]#
autograd cudnn_grid_sampler(ty: TensorType; self: Tensor, grid: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  self: torch.cudnn_grid_sampler_backward(self, grid, grad)
  grid: torch.cudnn_grid_sampler_backward(self, grid, grad)

#[ proc cudnn_affine_grid_generator_bwd*(grad: Tensor; fwd_result: Tensor): tuple[theta: Tensor] {.inline, noinit.} =
  let theta_result = torch.cudnn_affine_grid_generator_backward(grad, N, C, H, W)
  result.theta = theta_result
 ]#
autograd cudnn_affine_grid_generator(ty: TensorType; theta: Tensor, N: int64, C: int64, H: int64, W: int64) -> Tensor:
  result: ty.dynamicCppCall("cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: torch.cudnn_affine_grid_generator_backward(grad, N, C, H, W)

#[ proc cudnn_batch_norm_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor, result2: Tensor], grad_input_mask: StdArray): tuple[input: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  if not training:
    raiseAssert("CuDNN cannot be used to compute backward in evaluation mode")
  let input_result =  torch.cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : torch.thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)
  result.input = input_result[0]
  result.weight = input_result[1]
  result.bias = input_result[2]
 ]#
autograd cudnn_batch_norm(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor]:
  result: ty.dynamicCppCall("cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  input:  torch.cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : torch.thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)
  weight:  torch.cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : torch.thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)
  bias:  torch.cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : torch.thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)

#[ proc mkldnn_convolution_bwd*(grad: Tensor; fwd_result: Tensor, grad_input_mask: StdArray): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} =
  let self_result = torch.mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)
  result.self = self_result[0]
  result.weight = self_result[1]
  result.bias = self_result[2]
 ]#
autograd mkldnn_convolution(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64) -> Tensor:
  result: ty.dynamicCppCall("mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor).newTensor()
  self: torch.mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)
  weight: torch.mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)
  bias: torch.mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

#[ proc stack_bwd*(grad: Tensor; fwd_result: Tensor): tuple[tensors: TensorList] {.inline, noinit.} =
  let tensors_result = unbind(grad, dim)
  result.tensors = tensors_result
 ]#
autograd stack(ty: TensorType; tensors: TensorList, dim: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("stack", tensors, dim).to(ATensor).newTensor()
  tensors: unbind(grad, dim)

#[ proc u_thnn_fused_gru_cell_bwd*(grad: Tensor; fwd_result: tuple[result0: Tensor, result1: Tensor]): tuple[input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor] {.inline, noinit.} =
  let input_gates_result = torch.u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())
  result.input_gates = input_gates_result[0]
  result.hidden_gates = input_gates_result[1]
  result.hx = input_gates_result[2]
  result.input_bias = input_gates_result[3]
  result.hidden_bias = input_gates_result[4]
 ]#
autograd u_thnn_fused_gru_cell(ty: TensorType; input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input_gates: torch.u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())
  hidden_gates: torch.u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())
  hx: torch.u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())
  input_bias: torch.u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())
  hidden_bias: torch.u_thnn_fused_gru_cell_backward(grad, fwd_result[1], input_bias.defined())

