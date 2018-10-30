# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim
import math
const M_PI = math.PI
  
template firstOrSelf(self: tuple): untyped = self[0]
template firstOrSelf(self: not tuple): untyped = self

autograd min:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("min", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self >= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self < other, 0))

autograd min:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("min", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self >= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self < other, 0))

autograd max:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("max", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self <= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self > other, 0))

autograd max:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("max", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.clone().masked_fill_inplace(self <= other, 0))
  other: firstOrSelf(grad.clone().masked_fill_inplace(self > other, 0))

autograd pow:
  proc forward*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("pow", self.tensor, exponent.tensor).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward_self(grad, self, exponent))
  exponent: firstOrSelf(pow_backward_exponent(grad, self, exponent))

autograd pow:
  proc forward*(self: Tensor; exponent: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("pow", exponent.tensor).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward_self(grad, self, exponent))
  exponent: firstOrSelf(pow_backward_exponent(grad, self, exponent))

autograd pow:
  proc forward*(ty: TensorType; self: float; exponent: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("pow", self, exponent.tensor).to(ATensor).newTensor()
  exponent: firstOrSelf(pow_backward_exponent(grad, self, exponent))

autograd pow:
  proc forward*(self: float; exponent: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::pow", self, exponent.tensor).to(ATensor).newTensor()
  exponent: firstOrSelf(pow_backward_exponent(grad, self, exponent))

autograd th_addmm:
  proc forward*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat1: firstOrSelf(mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha))
  mat2: firstOrSelf(mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha))

autograd th_addmm:
  proc forward*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: atenFunction("at::th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat1: firstOrSelf(mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha))
  mat2: firstOrSelf(mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha))

autograd addmv_impl:
  proc forward*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat: firstOrSelf(grad.ger(vec) * alpha)
  vec: firstOrSelf(mat.t().mv(grad) * alpha)

autograd addmv_impl:
  proc forward*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: atenFunction("at::_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat: firstOrSelf(grad.ger(vec) * alpha)
  vec: firstOrSelf(mat.t().mv(grad) * alpha)

autograd addr_impl:
  proc forward*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  vec1: firstOrSelf(grad.mv(vec2) * alpha)
  vec2: firstOrSelf(grad.t().mv(vec1) * alpha)

autograd addr_impl:
  proc forward*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: atenFunction("at::_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  vec1: firstOrSelf(grad.mv(vec2) * alpha)
  vec2: firstOrSelf(grad.t().mv(vec1) * alpha)

autograd mm_impl:
  proc forward*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("_mm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1))
  mat2: firstOrSelf(mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1))

autograd mm_impl:
  proc forward*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::_mm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(mm_mat1_backward(grad, mat2, self.sizes(), self.strides(), 1))
  mat2: firstOrSelf(mm_mat2_backward(grad, self, mat2.sizes(), mat2.strides(), 1))

autograd addbmm:
  proc forward*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("addbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.unsqueeze(0).expand([ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand([ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha)

autograd addbmm:
  proc forward*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("addbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.unsqueeze(0).expand([ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand([ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha)

autograd normal:
  proc forward*(ty: TensorType; mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.} = 
    check: ty[].atenMethod("normal", mean.tensor, std, generator).to(ATensor).newTensor()
  mean: firstOrSelf(zeros(mean.sizes(), grad.options()))

autograd normal:
  proc forward*(mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.} = 
    check: atenFunction("at::normal", mean.tensor, std, generator).to(ATensor).newTensor()
  mean: firstOrSelf(zeros(mean.sizes(), grad.options()))

autograd normal:
  proc forward*(ty: TensorType; mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: ty[].atenMethod("normal", mean, std.tensor, generator).to(ATensor).newTensor()
  std: firstOrSelf(zeros(std.sizes(), grad.options()))

autograd normal:
  proc forward*(mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: atenFunction("at::normal", mean, std.tensor, generator).to(ATensor).newTensor()
  std: firstOrSelf(zeros(std.sizes(), grad.options()))

autograd normal:
  proc forward*(ty: TensorType; mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: ty[].atenMethod("normal", mean.tensor, std.tensor, generator).to(ATensor).newTensor()
  mean: firstOrSelf(zeros(mean.sizes(), grad.options()))
  std: firstOrSelf(zeros(std.sizes(), grad.options()))

autograd normal:
  proc forward*(mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: atenFunction("at::normal", mean.tensor, std.tensor, generator).to(ATensor).newTensor()
  mean: firstOrSelf(zeros(mean.sizes(), grad.options()))
  std: firstOrSelf(zeros(std.sizes(), grad.options()))

autograd alias:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("alias", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd alias:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("alias").to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd binary_cross_entropy:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
    check: ty[].atenMethod("binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(binary_cross_entropy_backward(grad, self, target, weight, reduction))

autograd binary_cross_entropy:
  proc forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
    check: atenFunction("at::binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(binary_cross_entropy_backward(grad, self, target, weight, reduction))

autograd l1_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: ty[].atenMethod("l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(l1_loss_backward(grad, self, target, reduction))

autograd l1_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: atenFunction("at::l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(l1_loss_backward(grad, self, target, reduction))

autograd mse_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: ty[].atenMethod("mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(mse_loss_backward(grad, self, target, reduction))

autograd mse_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: atenFunction("at::mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(mse_loss_backward(grad, self, target, reduction))

autograd multi_margin_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
    check: ty[].atenMethod("multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction))

autograd multi_margin_loss:
  proc forward*(self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
    check: atenFunction("at::multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction))

autograd multilabel_margin_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.} = 
    check: ty[].atenMethod("multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target))

autograd multilabel_margin_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.} = 
    check: atenFunction("at::multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target))

autograd nll_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
    check: ty[].atenMethod("nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss:
  proc forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
    check: atenFunction("at::nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd nll_loss_backward:
  proc forward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd nll_loss2d:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
    check: ty[].atenMethod("nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss2d:
  proc forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
    check: atenFunction("at::nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight))

autograd nll_loss2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss2d(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd nll_loss2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(nll_loss2d(grad, target, weight, reduction, ignore_index))
  self: firstOrSelf(zeros_like(grad))

autograd smooth_l1_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: ty[].atenMethod("smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(smooth_l1_loss_backward(grad, self, target, reduction))

autograd smooth_l1_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: atenFunction("at::smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(smooth_l1_loss_backward(grad, self, target, reduction))

autograd soft_margin_loss:
  proc forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: ty[].atenMethod("soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(soft_margin_loss_backward(grad, self, target, reduction))

autograd soft_margin_loss:
  proc forward*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
    check: atenFunction("at::soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: firstOrSelf(soft_margin_loss_backward(grad, self, target, reduction))

autograd elu:
  proc forward*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.} = 
    check: ty[].atenMethod("elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: firstOrSelf(elu_backward(grad, alpha, scale, input_scale, fwd_result))

autograd elu:
  proc forward*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.} = 
    check: atenFunction("at::elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: firstOrSelf(elu_backward(grad, alpha, scale, input_scale, fwd_result))

autograd glu:
  proc forward*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
    check: ty[].atenMethod("glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(glu_backward(grad, self, dim))

autograd glu:
  proc forward*(self: Tensor; dim: int): Tensor {.inline.} = 
    check: atenFunction("at::glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(glu_backward(grad, self, dim))

autograd hardtanh:
  proc forward*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
    check: ty[].atenMethod("hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))

autograd hardtanh:
  proc forward*(self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
    check: atenFunction("at::hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))

autograd hardtanh_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
    check: ty[].atenMethod("hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))
  self: firstOrSelf(zeros_like(grad))

autograd hardtanh_backward:
  proc forward*(grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
    check: atenFunction("at::hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: firstOrSelf(hardtanh_backward(grad, self, min_val, max_val))
  self: firstOrSelf(zeros_like(grad))

autograd hardtanh_inplace:
  proc forward*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("hardtanh_forward_", self.tensor, min_val, max_val).to(void); self
  self: firstOrSelf(hardtanh_backward(grad, fwd_result, min_val, max_val))

autograd hardtanh_inplace:
  proc forward*(self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.} = 
    check: atenFunction("at::hardtanh_forward_", self.tensor, min_val, max_val).to(void); self
  self: firstOrSelf(hardtanh_backward(grad, fwd_result, min_val, max_val))

autograd leaky_relu:
  proc forward*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline.} = 
    check: ty[].atenMethod("leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))

autograd leaky_relu:
  proc forward*(self: Tensor; negative_slope: float): Tensor {.inline.} = 
    check: atenFunction("at::leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))

autograd leaky_relu_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.} = 
    check: ty[].atenMethod("leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))
  self: firstOrSelf(zeros_like(grad))

autograd leaky_relu_backward:
  proc forward*(grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.} = 
    check: atenFunction("at::leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: firstOrSelf(leaky_relu_backward(grad, self, negative_slope))
  self: firstOrSelf(zeros_like(grad))

autograd leaky_relu_inplace:
  proc forward*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("leaky_relu_forward_", self.tensor, negative_slope).to(void); self
  self: firstOrSelf(leaky_relu_backward(grad, fwd_result, negative_slope))

autograd leaky_relu_inplace:
  proc forward*(self: Tensor; negative_slope: float): Tensor {.inline, discardable.} = 
    check: atenFunction("at::leaky_relu_forward_", self.tensor, negative_slope).to(void); self
  self: firstOrSelf(leaky_relu_backward(grad, fwd_result, negative_slope))

autograd log_sigmoid:
  proc forward*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.} = 
    check: ty[].atenMethod("log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(log_sigmoid_backward(grad, self, fwd_result.buffer))

autograd log_sigmoid:
  proc forward*(self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.} = 
    check: atenFunction("at::log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(log_sigmoid_backward(grad, self, fwd_result.buffer))

autograd rrelu_with_noise:
  proc forward*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.} = 
    check: ty[].atenMethod("rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))

autograd rrelu_with_noise:
  proc forward*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.} = 
    check: atenFunction("at::rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))

autograd rrelu_with_noise_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))
  self: firstOrSelf(zeros_like(grad))

autograd rrelu_with_noise_backward:
  proc forward*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.} = 
    check: atenFunction("at::rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: firstOrSelf(rrelu_with_noise_backward(grad, self, noise, lower, upper, training))
  self: firstOrSelf(zeros_like(grad))

autograd rrelu_with_noise_inplace:
  proc forward*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(void); self
  self: firstOrSelf(rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training))

autograd rrelu_with_noise_inplace:
  proc forward*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.} = 
    check: atenFunction("at::rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(void); self
  self: firstOrSelf(rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training))

autograd softplus:
  proc forward*(ty: TensorType; self: Tensor; beta: float; threshold: float): Tensor {.inline.} = 
    check: ty[].atenMethod("softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: firstOrSelf(softplus_backward(grad, self, beta, threshold, fwd_result))

autograd softplus:
  proc forward*(self: Tensor; beta: float; threshold: float): Tensor {.inline.} = 
    check: atenFunction("at::softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: firstOrSelf(softplus_backward(grad, self, beta, threshold, fwd_result))

autograd softshrink:
  proc forward*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.} = 
    check: ty[].atenMethod("softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: firstOrSelf(softshrink_backward(grad, self, lambd))

autograd softshrink:
  proc forward*(self: Tensor; lambd: float): Tensor {.inline.} = 
    check: atenFunction("at::softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: firstOrSelf(softshrink_backward(grad, self, lambd))

autograd softshrink_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
    check: ty[].atenMethod("softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: firstOrSelf(softshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd softshrink_backward:
  proc forward*(grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
    check: atenFunction("at::softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: firstOrSelf(softshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd threshold:
  proc forward*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor {.inline.} = 
    check: ty[].atenMethod("threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, threshold, value))

autograd threshold:
  proc forward*(self: Tensor; threshold: float; value: float): Tensor {.inline.} = 
    check: atenFunction("at::threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, threshold, value))

autograd threshold_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor {.inline.} = 
    check: ty[].atenMethod("threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: firstOrSelf(threshold_backward(grad, self, threshold, value))
  self: firstOrSelf(zeros_like(grad))

autograd threshold_backward:
  proc forward*(grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor {.inline.} = 
    check: atenFunction("at::threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: firstOrSelf(threshold_backward(grad, self, threshold, value))
  self: firstOrSelf(zeros_like(grad))

autograd threshold_inplace:
  proc forward*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("threshold_forward_", self.tensor, threshold, value).to(void); self
  self: firstOrSelf(threshold_backward(grad, fwd_result, threshold, value))

autograd threshold_inplace:
  proc forward*(self: Tensor; threshold: float; value: float): Tensor {.inline, discardable.} = 
    check: atenFunction("at::threshold_forward_", self.tensor, threshold, value).to(void); self
  self: firstOrSelf(threshold_backward(grad, fwd_result, threshold, value))

autograd adaptive_avg_pool2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("adaptive_avg_pool2d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool2d_backward(grad, self))

autograd adaptive_avg_pool2d:
  proc forward*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::adaptive_avg_pool2d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool2d_backward(grad, self))

autograd adaptive_avg_pool2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool2d(grad, [ grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_avg_pool2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool2d(grad, [ grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_avg_pool3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("adaptive_avg_pool3d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool3d_backward(grad, self))

autograd adaptive_avg_pool3d:
  proc forward*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::adaptive_avg_pool3d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(adaptive_avg_pool3d_backward(grad, self))

autograd adaptive_avg_pool3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool3d(grad, [ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_avg_pool3d_backward:
  proc forward*(grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(adaptive_avg_pool3d(grad, [ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ]))
  self: firstOrSelf(zeros_like(self))

autograd adaptive_max_pool2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: ty[].atenMethod("adaptive_max_pool2d_forward", self.tensor, output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool2d_backward(grad, self, fwd_result.indices))

autograd adaptive_max_pool2d:
  proc forward*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: atenFunction("at::adaptive_max_pool2d_forward", self.tensor, output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool2d_backward(grad, self, fwd_result.indices))

autograd adaptive_max_pool3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: ty[].atenMethod("adaptive_max_pool3d_forward", self.tensor, output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool3d_backward(grad, self, fwd_result.indices))

autograd adaptive_max_pool3d:
  proc forward*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: atenFunction("at::adaptive_max_pool3d_forward", self.tensor, output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(adaptive_max_pool3d_backward(grad, self, fwd_result.indices))

autograd avg_pool2d:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("avg_pool2d_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool2d:
  proc forward*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: atenFunction("at::avg_pool2d_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd avg_pool2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: atenFunction("at::avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd avg_pool3d:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("avg_pool3d_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool3d:
  proc forward*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: atenFunction("at::avg_pool3d_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: firstOrSelf(avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad))

autograd avg_pool3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd avg_pool3d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
    check: atenFunction("at::avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: firstOrSelf(avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad))
  self: firstOrSelf(zeros_like(self))

autograd fractional_max_pool2d:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: ty[].atenMethod("fractional_max_pool2d_forward", self.tensor, kernel_size.toAIntList(), output_size.toAIntList(), random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices))

autograd fractional_max_pool2d:
  proc forward*(self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: atenFunction("at::fractional_max_pool2d_forward", self.tensor, kernel_size.toAIntList(), output_size.toAIntList(), random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices))

autograd max_pool2d_with_indices:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: ty[].atenMethod("max_pool2d_with_indices_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_pool2d_with_indices:
  proc forward*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: atenFunction("at::max_pool2d_with_indices_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_pool3d_with_indices:
  proc forward*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: ty[].atenMethod("max_pool3d_with_indices_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_pool3d_with_indices:
  proc forward*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
    check: atenFunction("at::max_pool3d_with_indices_forward", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices))

autograd max_unpool2d:
  proc forward*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("max_unpool2d_forward", self.tensor, indices.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool2d_backward(grad, self, indices, output_size))

autograd max_unpool2d:
  proc forward*(self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::max_unpool2d_forward", self.tensor, indices.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool2d_backward(grad, self, indices, output_size))

autograd max_unpool2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(max_unpool2d(grad, indices, output_size))
  self: firstOrSelf(zeros_like(self))

autograd max_unpool2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(max_unpool2d(grad, indices, output_size))
  self: firstOrSelf(zeros_like(self))

autograd max_unpool3d:
  proc forward*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("max_unpool3d_forward", self.tensor, indices.tensor, output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool3d_backward(grad, self, indices, output_size, stride, padding))

autograd max_unpool3d:
  proc forward*(self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::max_unpool3d_forward", self.tensor, indices.tensor, output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(max_unpool3d_backward(grad, self, indices, output_size, stride, padding))

autograd reflection_pad1d:
  proc forward*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("reflection_pad1d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad1d_backward(grad, self, padding))

autograd reflection_pad1d:
  proc forward*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::reflection_pad1d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad1d_backward(grad, self, padding))

autograd reflection_pad1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("reflection_pad1d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd reflection_pad1d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::reflection_pad1d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd reflection_pad2d:
  proc forward*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("reflection_pad2d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad2d_backward(grad, self, padding))

autograd reflection_pad2d:
  proc forward*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::reflection_pad2d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(reflection_pad2d_backward(grad, self, padding))

autograd reflection_pad2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("reflection_pad2d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd reflection_pad2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::reflection_pad2d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(reflection_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad1d:
  proc forward*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("replication_pad1d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad1d_backward(grad, self, padding))

autograd replication_pad1d:
  proc forward*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::replication_pad1d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad1d_backward(grad, self, padding))

autograd replication_pad1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("replication_pad1d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad1d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::replication_pad1d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad1d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad2d:
  proc forward*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("replication_pad2d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad2d_backward(grad, self, padding))

autograd replication_pad2d:
  proc forward*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::replication_pad2d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad2d_backward(grad, self, padding))

autograd replication_pad2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("replication_pad2d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad2d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::replication_pad2d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad2d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad3d:
  proc forward*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("replication_pad3d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad3d_backward(grad, self, padding))

autograd replication_pad3d:
  proc forward*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::replication_pad3d_forward", self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(replication_pad3d_backward(grad, self, padding))

autograd replication_pad3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("replication_pad3d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad3d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd replication_pad3d_backward:
  proc forward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::replication_pad3d_backward", grad_output.tensor, self.tensor, padding.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(replication_pad3d(grad, padding))
  self: firstOrSelf(zeros_like(self))

autograd upsample_linear1d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_linear1d_forward", self.tensor, output_size.toAIntList(), align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_linear1d:
  proc forward*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: atenFunction("at::upsample_linear1d_forward", self.tensor, output_size.toAIntList(), align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_linear1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_linear1d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_linear1d(grad, output_size, align_corners))

autograd upsample_linear1d_backward:
  proc forward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: atenFunction("at::upsample_linear1d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_linear1d(grad, output_size, align_corners))

autograd upsample_bilinear2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_bilinear2d_forward", self.tensor, output_size.toAIntList(), align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_bilinear2d:
  proc forward*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: atenFunction("at::upsample_bilinear2d_forward", self.tensor, output_size.toAIntList(), align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_bilinear2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_bilinear2d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_bilinear2d(grad, output_size, align_corners))

autograd upsample_bilinear2d_backward:
  proc forward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: atenFunction("at::upsample_bilinear2d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_bilinear2d(grad, output_size, align_corners))

autograd upsample_trilinear3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_trilinear3d_forward", self.tensor, output_size.toAIntList(), align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_trilinear3d:
  proc forward*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: atenFunction("at::upsample_trilinear3d_forward", self.tensor, output_size.toAIntList(), align_corners).to(ATensor).newTensor()
  self: firstOrSelf(upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners))

autograd upsample_trilinear3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_trilinear3d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_trilinear3d(grad, output_size, align_corners))

autograd upsample_trilinear3d_backward:
  proc forward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
    check: atenFunction("at::upsample_trilinear3d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_trilinear3d(grad, output_size, align_corners))

autograd upsample_nearest1d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_nearest1d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest1d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest1d:
  proc forward*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::upsample_nearest1d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest1d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest1d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_nearest1d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest1d(grad, output_size))

autograd upsample_nearest1d_backward:
  proc forward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::upsample_nearest1d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest1d(grad, output_size))

autograd upsample_nearest2d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_nearest2d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest2d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest2d:
  proc forward*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::upsample_nearest2d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest2d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest2d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_nearest2d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest2d(grad, output_size))

autograd upsample_nearest2d_backward:
  proc forward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::upsample_nearest2d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest2d(grad, output_size))

autograd upsample_nearest3d:
  proc forward*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_nearest3d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest3d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest3d:
  proc forward*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::upsample_nearest3d_forward", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(upsample_nearest3d_backward(grad, output_size, self.sizes()))

autograd upsample_nearest3d_backward:
  proc forward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("upsample_nearest3d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest3d(grad, output_size))

autograd upsample_nearest3d_backward:
  proc forward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::upsample_nearest3d_backward", grad_output.tensor, output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()
  grad_output: firstOrSelf(upsample_nearest3d(grad, output_size))

autograd sigmoid_backward_impl:
  proc forward*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(sigmoid_backward_impl(grad, fwd_result))
  output: firstOrSelf(grad * grad_output * (-2 * fwd_result + 1))

autograd sigmoid_backward_impl:
  proc forward*(grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(sigmoid_backward_impl(grad, fwd_result))
  output: firstOrSelf(grad * grad_output * (-2 * fwd_result + 1))

autograd tanh_backward_impl:
  proc forward*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(tanh_backward_impl(grad, fwd_result))
  output: firstOrSelf(-2 * fwd_result * grad * grad_output)

autograd tanh_backward_impl:
  proc forward*(grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: firstOrSelf(tanh_backward_impl(grad, fwd_result))
  output: firstOrSelf(-2 * fwd_result * grad * grad_output)

autograd thnn_batch_norm:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline.} = 
    check: ty[].atenMethod("thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_batch_norm:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline.} = 
    check: atenFunction("at::thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_conv_transpose2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
    check: ty[].atenMethod("thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
    check: atenFunction("at::thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose3d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
    check: ty[].atenMethod("thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_transpose3d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
    check: atenFunction("at::thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
    check: ty[].atenMethod("thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
    check: atenFunction("at::thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_depthwise2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: firstOrSelf(grad.contiguous().view([grad.size(0), grad.size(1), -1]).sum(0).sum(1))

autograd thnn_conv_depthwise2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: firstOrSelf(grad.contiguous().view([grad.size(0), grad.size(1), -1]).sum(0).sum(1))

autograd thnn_conv3d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
    check: ty[].atenMethod("thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv3d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
    check: atenFunction("at::thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_dilated2d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
    check: ty[].atenMethod("thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated2d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
    check: atenFunction("at::thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
    check: ty[].atenMethod("thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d:
  proc forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
    check: atenFunction("at::thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size.toAIntList(), bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd cudnn_ctc_loss_impl:
  proc forward*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: ty[].atenMethod("_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(fwd_result[1])

autograd cudnn_ctc_loss_impl:
  proc forward*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: atenFunction("at::_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(fwd_result[1])

autograd cudnn_rnn_impl:
  proc forward*(ty: TensorType; input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
    check: ty[].atenMethod("_cudnn_rnn", input.tensor, weight.toATensors(), weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  output_differentiability: [true, true, true, false, false]
  (input, hx, cx, weight):  fwd_result[3].clone() 

autograd cudnn_rnn_impl:
  proc forward*(input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
    check: atenFunction("at::_cudnn_rnn", input.tensor, weight.toATensors(), weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  output_differentiability: [true, true, true, false, false]
  (input, hx, cx, weight):  fwd_result[3].clone() 

autograd abs:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("abs", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sign())

autograd abs:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("abs").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sign())

autograd acos:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("acos", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * -((-self * self + 1).rsqrt()))

autograd acos:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("acos").to(ATensor).newTensor()
  self: firstOrSelf(grad * -((-self * self + 1).rsqrt()))

autograd add:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("add", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(maybe_multiply(grad, alpha))

autograd add:
  proc forward*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("add", other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(maybe_multiply(grad, alpha))

autograd add:
  proc forward*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("add", self.tensor, other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd add:
  proc forward*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("add", other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd asin:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("asin", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * (-self * self + 1).rsqrt())

autograd asin:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("asin").to(ATensor).newTensor()
  self: firstOrSelf(grad * (-self * self + 1).rsqrt())

autograd atan:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("atan", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * self + 1))

autograd atan:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("atan").to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * self + 1))

autograd baddbmm:
  proc forward*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("baddbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad) * alpha)

autograd baddbmm:
  proc forward*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("baddbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  batch1: firstOrSelf(grad.bmm(batch2.transpose(1, 2)) * alpha)
  batch2: firstOrSelf(batch1.transpose(1, 2).bmm(grad) * alpha)

autograd bernoulli:
  proc forward*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: ty[].atenMethod("bernoulli", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd bernoulli:
  proc forward*(self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: self.tensor.atenMethod("bernoulli", generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd bernoulli_inplace:
  proc forward*(ty: TensorType; self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("bernoulli_", self.tensor, p.tensor, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))
  p: firstOrSelf(zeros_like(p))

autograd bernoulli_inplace:
  proc forward*(self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("bernoulli_", p.tensor, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))
  p: firstOrSelf(zeros_like(p))

autograd bernoulli_inplace:
  proc forward*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("bernoulli_", self.tensor, p, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd bernoulli_inplace:
  proc forward*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("bernoulli_", p, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd bmm:
  proc forward*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("bmm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.bmm(mat2.transpose(1, 2)))
  mat2: firstOrSelf(self.transpose(1, 2).bmm(grad))

autograd bmm:
  proc forward*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("bmm", mat2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.bmm(mat2.transpose(1, 2)))
  mat2: firstOrSelf(self.transpose(1, 2).bmm(grad))

autograd cat:
  proc forward*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
    check: ty[].atenMethod("cat", tensors.toATensors(), dim).to(ATensor).newTensor()
  tensors: firstOrSelf(cat_tensors_backward(grad, to_args_sizes(tensors), dim))

autograd cat:
  proc forward*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
    check: atenFunction("at::cat", tensors.toATensors(), dim).to(ATensor).newTensor()
  tensors: firstOrSelf(cat_tensors_backward(grad, to_args_sizes(tensors), dim))

autograd ceil:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("ceil", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd ceil:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("ceil").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd clamp_max:
  proc forward*(ty: TensorType; self: Tensor; max: float): Tensor {.inline.} = 
    check: ty[].atenMethod("clamp_max", self.tensor, max).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self <= max).type_as(grad))

autograd clamp_max:
  proc forward*(self: Tensor; max: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("clamp_max", max).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self <= max).type_as(grad))

autograd clamp_min:
  proc forward*(ty: TensorType; self: Tensor; min: float): Tensor {.inline.} = 
    check: ty[].atenMethod("clamp_min", self.tensor, min).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self >= min).type_as(grad))

autograd clamp_min:
  proc forward*(self: Tensor; min: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("clamp_min", min).to(ATensor).newTensor()
  self: firstOrSelf(grad * (self >= min).type_as(grad))

autograd conv_tbc:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; pad: int = 0): Tensor {.inline.} = 
    check: ty[].atenMethod("conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd conv_tbc:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; pad: int = 0): Tensor {.inline.} = 
    check: atenFunction("at::conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd cos:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("cos", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * -self.sin())

autograd cos:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("cos").to(ATensor).newTensor()
  self: firstOrSelf(grad * -self.sin())

autograd cosh:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("cosh", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sinh())

autograd cosh:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("cosh").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.sinh())

autograd cudnn_affine_grid_generator:
  proc forward*(ty: TensorType; theta: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.} = 
    check: ty[].atenMethod("cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: firstOrSelf(cudnn_affine_grid_generator_backward(grad, N, C, H, W))

autograd cudnn_affine_grid_generator:
  proc forward*(theta: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.} = 
    check: atenFunction("at::cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: firstOrSelf(cudnn_affine_grid_generator_backward(grad, N, C, H, W))

autograd cudnn_batch_norm:
  proc forward*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
    check: ty[].atenMethod("cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) 

autograd cudnn_batch_norm:
  proc forward*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
    check: atenFunction("at::cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) 

autograd cudnn_convolution:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: atenFunction("at::cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution_transpose:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution_transpose:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: atenFunction("at::cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_grid_sampler:
  proc forward*(ty: TensorType; self: Tensor; grid: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd cudnn_grid_sampler:
  proc forward*(self: Tensor; grid: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd ctc_loss_impl:
  proc forward*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: ty[].atenMethod("_ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(ctc_loss_backward_impl(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank))

autograd ctc_loss_impl:
  proc forward*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: atenFunction("at::_ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: firstOrSelf(ctc_loss_backward_impl(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank))

autograd div_name:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("div", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)
  other: firstOrSelf(-grad * self / (other * other))

autograd div_name:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("div", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)
  other: firstOrSelf(-grad * self / (other * other))

autograd div_name:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
    check: ty[].atenMethod("div", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)

autograd div_name:
  proc forward*(self: Tensor; other: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("div", other).to(ATensor).newTensor()
  self: firstOrSelf(grad / other)

autograd dot:
  proc forward*(ty: TensorType; self: Tensor; tensor: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("dot", self.tensor, tensor.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * tensor)
  tensor: firstOrSelf(grad * self)

autograd dot:
  proc forward*(self: Tensor; tensor: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("dot", tensor.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * tensor)
  tensor: firstOrSelf(grad * self)

autograd embedding:
  proc forward*(ty: TensorType; weight: Tensor; indices: Tensor; padding_idx: int = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.} = 
    check: ty[].atenMethod("embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: firstOrSelf(embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse))

autograd embedding:
  proc forward*(weight: Tensor; indices: Tensor; padding_idx: int = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.} = 
    check: atenFunction("at::embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: firstOrSelf(embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse))

autograd embedding_bag_impl:
  proc forward*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
    check: ty[].atenMethod("_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: firstOrSelf(embedding_bag_backward_impl(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse))

autograd embedding_bag_impl:
  proc forward*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
    check: atenFunction("at::_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: firstOrSelf(embedding_bag_backward_impl(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse))

autograd erf:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("erf", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd erf:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("erf").to(ATensor).newTensor()
  self: firstOrSelf(2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd erfc:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("erfc", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd erfc:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("erfc").to(ATensor).newTensor()
  self: firstOrSelf(-2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad)

autograd exp:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("exp", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * fwd_result)

autograd exp:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("exp").to(ATensor).newTensor()
  self: firstOrSelf(grad * fwd_result)

autograd expm1:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("expm1", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * (fwd_result + 1))

autograd expm1:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("expm1").to(ATensor).newTensor()
  self: firstOrSelf(grad * (fwd_result + 1))

autograd expand:
  proc forward*(ty: TensorType; self: Tensor; size: openarray[int]; implicit: bool = false): Tensor {.inline.} = 
    check: ty[].atenMethod("expand", self.tensor, size.toAIntList(), implicit).to(ATensor).newTensor()
  self: firstOrSelf(sum_to(grad, self.sizes()))

autograd expand:
  proc forward*(self: Tensor; size: openarray[int]; implicit: bool = false): Tensor {.inline.} = 
    check: self.tensor.atenMethod("expand", size.toAIntList(), implicit).to(ATensor).newTensor()
  self: firstOrSelf(sum_to(grad, self.sizes()))

autograd fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("fill_", self.tensor, value).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd fill_inplace:
  proc forward*(self: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("fill_", value).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("fill_", self.tensor, value.tensor).to(void); self
  self: firstOrSelf(zeros_like(grad))
  value: firstOrSelf(grad.sum())

autograd fill_inplace:
  proc forward*(self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("fill_", value.tensor).to(void); self
  self: firstOrSelf(zeros_like(grad))
  value: firstOrSelf(grad.sum())

autograd floor:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("floor", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd floor:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("floor").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd grid_sampler_2d:
  proc forward*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
    check: ty[].atenMethod("grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_2d:
  proc forward*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
    check: atenFunction("at::grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d:
  proc forward*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
    check: ty[].atenMethod("grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d:
  proc forward*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
    check: atenFunction("at::grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd ger:
  proc forward*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("ger", self.tensor, vec2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.mv(vec2))
  vec2: firstOrSelf(grad.t().mv(self))

autograd ger:
  proc forward*(self: Tensor; vec2: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("ger", vec2.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.mv(vec2))
  vec2: firstOrSelf(grad.t().mv(self))

autograd index_copy_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("index_copy_", self.tensor, dim, index.tensor, source.tensor).to(void); self
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  source: firstOrSelf(grad.index_select(dim, index))

autograd index_copy_inplace:
  proc forward*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("index_copy_", dim, index.tensor, source.tensor).to(void); self
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  source: firstOrSelf(grad.index_select(dim, index))

autograd inverse:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("inverse", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-matmul(fwd_result.transpose(-2, -1), matmul(grad, fwd_result.transpose(-2, -1))))

autograd inverse:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("inverse").to(ATensor).newTensor()
  self: firstOrSelf(-matmul(fwd_result.transpose(-2, -1), matmul(grad, fwd_result.transpose(-2, -1))))

autograd log:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("log", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.div_name(self))

autograd log:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("log").to(ATensor).newTensor()
  self: firstOrSelf(grad.div_name(self))

autograd log10:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("log10", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 2.3025850929940456))

autograd log10:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("log10").to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 2.3025850929940456))

autograd log2:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("log2", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 0.6931471805599453))

autograd log2:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("log2").to(ATensor).newTensor()
  self: firstOrSelf(grad / (self * 0.6931471805599453))

autograd log_softmax_impl:
  proc forward*(ty: TensorType; self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("_log_softmax", self.tensor, dim, half_to_float).to(ATensor).newTensor()
  self: firstOrSelf(log_softmax_backward_data_impl(grad, fwd_result, dim, self))

autograd log_softmax_impl:
  proc forward*(self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.} = 
    check: atenFunction("at::_log_softmax", self.tensor, dim, half_to_float).to(ATensor).newTensor()
  self: firstOrSelf(log_softmax_backward_data_impl(grad, fwd_result, dim, self))

autograd mean:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("mean", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()) / self.numel())

autograd mean:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("mean").to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()) / self.numel())

autograd mean:
  proc forward*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
    check: ty[].atenMethod("mean", self.tensor, dim, keepdim).to(ATensor).newTensor()
  self: firstOrSelf(sum_backward(grad, self.sizes(), dim, keepdim) / safe_size_impl(self.sizes(), dim))

autograd mean:
  proc forward*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
    check: self.tensor.atenMethod("mean", dim, keepdim).to(ATensor).newTensor()
  self: firstOrSelf(sum_backward(grad, self.sizes(), dim, keepdim) / safe_size_impl(self.sizes(), dim))

autograd mkldnn_convolution:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int): Tensor {.inline.} = 
    check: ty[].atenMethod("mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd mkldnn_convolution:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int): Tensor {.inline.} = 
    check: atenFunction("at::mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd miopen_batch_norm:
  proc forward*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
    check: ty[].atenMethod("miopen_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  miopen_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) 

autograd miopen_batch_norm:
  proc forward*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
    check: atenFunction("at::miopen_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  miopen_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) 

autograd miopen_convolution:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("miopen_convolution", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): miopen_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd miopen_convolution:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: atenFunction("at::miopen_convolution", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): miopen_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd miopen_convolution_transpose:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("miopen_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): miopen_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd miopen_convolution_transpose:
  proc forward*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
    check: atenFunction("at::miopen_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): miopen_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd mul:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("mul", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)
  other: firstOrSelf(grad * self)

autograd mul:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("mul", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)
  other: firstOrSelf(grad * self)

autograd mul:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
    check: ty[].atenMethod("mul", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)

autograd mul:
  proc forward*(self: Tensor; other: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("mul", other).to(ATensor).newTensor()
  self: firstOrSelf(grad * other)

autograd mv:
  proc forward*(ty: TensorType; self: Tensor; vec: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("mv", self.tensor, vec.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.ger(vec))
  vec: firstOrSelf(self.t().mv(grad))

autograd mv:
  proc forward*(self: Tensor; vec: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("mv", vec.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.ger(vec))
  vec: firstOrSelf(self.t().mv(grad))

autograd pdist_forward_impl:
  proc forward*(ty: TensorType; self: Tensor; p: float64 = 2): Tensor {.inline.} = 
    check: ty[].atenMethod("_pdist_forward", self.tensor, p).to(ATensor).newTensor()
  self: firstOrSelf(pdist_backward_impl(grad, self, p, fwd_result))

autograd pdist_forward_impl:
  proc forward*(self: Tensor; p: float64 = 2): Tensor {.inline.} = 
    check: atenFunction("at::_pdist_forward", self.tensor, p).to(ATensor).newTensor()
  self: firstOrSelf(pdist_backward_impl(grad, self, p, fwd_result))

autograd RoiPooling2d_forward:
  proc forward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: ty[].atenMethod("RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: firstOrSelf(RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1]))

autograd RoiPooling2d_forward:
  proc forward*(input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: atenFunction("at::RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: firstOrSelf(RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1]))

autograd round:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("round", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd round:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("round").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd relu:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("relu", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, 0, 0))

autograd relu:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("relu").to(ATensor).newTensor()
  self: firstOrSelf(threshold_backward(grad, self, 0, 0))

autograd prelu:
  proc forward*(ty: TensorType; self: Tensor; weight: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("prelu", self.tensor, weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight)

autograd prelu:
  proc forward*(self: Tensor; weight: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("prelu", weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight)

autograd hardshrink:
  proc forward*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.} = 
    check: ty[].atenMethod("hardshrink", self.tensor, lambd).to(ATensor).newTensor()
  self: firstOrSelf(hardshrink_backward(grad, self, lambd))

autograd hardshrink:
  proc forward*(self: Tensor; lambd: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("hardshrink", lambd).to(ATensor).newTensor()
  self: firstOrSelf(hardshrink_backward(grad, self, lambd))

autograd hardshrink_backward:
  proc forward*(ty: TensorType; grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
    check: ty[].atenMethod("hardshrink_backward", grad_out.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_out: firstOrSelf(hardshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd hardshrink_backward:
  proc forward*(grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("hardshrink_backward", grad_out.tensor, lambd).to(ATensor).newTensor()
  grad_out: firstOrSelf(hardshrink_backward(grad, self, lambd))
  self: firstOrSelf(zeros_like(grad))

autograd rsqrt:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("rsqrt", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-0.5 * grad * fwd_result.pow(3))

autograd rsqrt:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("rsqrt").to(ATensor).newTensor()
  self: firstOrSelf(-0.5 * grad * fwd_result.pow(3))

autograd sigmoid:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("sigmoid", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(sigmoid_backward_impl(grad, fwd_result))

autograd sigmoid:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sigmoid").to(ATensor).newTensor()
  self: firstOrSelf(sigmoid_backward_impl(grad, fwd_result))

autograd sin:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("sin", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cos())

autograd sin:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sin").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cos())

autograd sinh:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("sinh", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cosh())

autograd sinh:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sinh").to(ATensor).newTensor()
  self: firstOrSelf(grad * self.cosh())

autograd slice:
  proc forward*(ty: TensorType; self: Tensor; dim: int = 0; start: int = 0; end_name: int = int.high; step: int = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("slice", self.tensor, dim, start, end_name, step).to(ATensor).newTensor()
  self: firstOrSelf(slice_backward(grad, self.sizes(), dim, start, end_name, step))

autograd slice:
  proc forward*(self: Tensor; dim: int = 0; start: int = 0; end_name: int = int.high; step: int = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("slice", dim, start, end_name, step).to(ATensor).newTensor()
  self: firstOrSelf(slice_backward(grad, self.sizes(), dim, start, end_name, step))

autograd softmax_impl:
  proc forward*(ty: TensorType; self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.} = 
    check: ty[].atenMethod("_softmax", self.tensor, dim, half_to_float).to(ATensor).newTensor()
  self: firstOrSelf(softmax_backward_data_impl(grad, fwd_result, dim, self))

autograd softmax_impl:
  proc forward*(self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.} = 
    check: atenFunction("at::_softmax", self.tensor, dim, half_to_float).to(ATensor).newTensor()
  self: firstOrSelf(softmax_backward_data_impl(grad, fwd_result, dim, self))

autograd split:
  proc forward*(ty: TensorType; self: Tensor; split_size: int; dim: int = 0): TensorList {.inline.} = 
    check: ty[].atenMethod("split", self.tensor, split_size, dim).to(ATensors).newTensors()
  self: firstOrSelf(split_backward(grads, split_size, dim, self.sizes(), self.getType()))

autograd split:
  proc forward*(self: Tensor; split_size: int; dim: int = 0): TensorList {.inline.} = 
    check: self.tensor.atenMethod("split", split_size, dim).to(ATensors).newTensors()
  self: firstOrSelf(split_backward(grads, split_size, dim, self.sizes(), self.getType()))

autograd split_with_sizes:
  proc forward*(ty: TensorType; self: Tensor; split_sizes: openarray[int]; dim: int = 0): TensorList {.inline.} = 
    check: ty[].atenMethod("split_with_sizes", self.tensor, split_sizes.toAIntList(), dim).to(ATensors).newTensors()
  self: firstOrSelf(split_with_sizes_backward(grads, split_sizes, dim, self.sizes(), self.getType()))

autograd split_with_sizes:
  proc forward*(self: Tensor; split_sizes: openarray[int]; dim: int = 0): TensorList {.inline.} = 
    check: self.tensor.atenMethod("split_with_sizes", split_sizes.toAIntList(), dim).to(ATensors).newTensors()
  self: firstOrSelf(split_with_sizes_backward(grads, split_sizes, dim, self.sizes(), self.getType()))

autograd squeeze:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("squeeze", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(unsqueeze_to(grad, self.sizes()))

autograd squeeze:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("squeeze").to(ATensor).newTensor()
  self: firstOrSelf(unsqueeze_to(grad, self.sizes()))

autograd squeeze:
  proc forward*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
    check: ty[].atenMethod("squeeze", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(unsqueeze_to(grad, dim, self.sizes()))

autograd squeeze:
  proc forward*(self: Tensor; dim: int): Tensor {.inline.} = 
    check: self.tensor.atenMethod("squeeze", dim).to(ATensor).newTensor()
  self: firstOrSelf(unsqueeze_to(grad, dim, self.sizes()))

autograd squeeze_inplace:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("squeeze_", self.tensor).to(void); self
  self: firstOrSelf(unsqueeze_to(grad, self.sizes()))

autograd squeeze_inplace:
  proc forward*(self: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("squeeze_").to(void); self
  self: firstOrSelf(unsqueeze_to(grad, self.sizes()))

autograd squeeze_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("squeeze_", self.tensor, dim).to(void); self
  self: firstOrSelf(unsqueeze_to(grad, dim, self.sizes()))

autograd squeeze_inplace:
  proc forward*(self: Tensor; dim: int): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("squeeze_", dim).to(void); self
  self: firstOrSelf(unsqueeze_to(grad, dim, self.sizes()))

autograd stack:
  proc forward*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
    check: ty[].atenMethod("stack", tensors.toATensors(), dim).to(ATensor).newTensor()
  tensors: firstOrSelf(unbind(grad, dim))

autograd stack:
  proc forward*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
    check: atenFunction("at::stack", tensors.toATensors(), dim).to(ATensor).newTensor()
  tensors: firstOrSelf(unbind(grad, dim))

autograd sum:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("sum", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()))

autograd sum:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sum").to(ATensor).newTensor()
  self: firstOrSelf(grad.expand(self.sizes()))

autograd sum:
  proc forward*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
    check: ty[].atenMethod("sum", self.tensor, dim.toAIntList(), keepdim).to(ATensor).newTensor()
  self: firstOrSelf(sum_backward(grad, self.sizes(), dim, keepdim))

autograd sum:
  proc forward*(self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sum", dim.toAIntList(), keepdim).to(ATensor).newTensor()
  self: firstOrSelf(sum_backward(grad, self.sizes(), dim, keepdim))

autograd sqrt:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("sqrt", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad / (2 * fwd_result))

autograd sqrt:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sqrt").to(ATensor).newTensor()
  self: firstOrSelf(grad / (2 * fwd_result))

autograd t:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("t", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.t())

autograd t:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("t").to(ATensor).newTensor()
  self: firstOrSelf(grad.t())

autograd tan:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("tan", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * (1 + fwd_result.pow(2)))

autograd tan:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("tan").to(ATensor).newTensor()
  self: firstOrSelf(grad * (1 + fwd_result.pow(2)))

autograd tanh:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("tanh", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(tanh_backward_impl(grad, fwd_result))

autograd tanh:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("tanh").to(ATensor).newTensor()
  self: firstOrSelf(tanh_backward_impl(grad, fwd_result))

autograd transpose:
  proc forward*(ty: TensorType; self: Tensor; dim0: int; dim1: int): Tensor {.inline.} = 
    check: ty[].atenMethod("transpose", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd transpose:
  proc forward*(self: Tensor; dim0: int; dim1: int): Tensor {.inline.} = 
    check: self.tensor.atenMethod("transpose", dim0, dim1).to(ATensor).newTensor()
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd transpose_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim0: int; dim1: int): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("transpose_", self.tensor, dim0, dim1).to(void); self
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd transpose_inplace:
  proc forward*(self: Tensor; dim0: int; dim1: int): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("transpose_", dim0, dim1).to(void); self
  self: firstOrSelf(grad.transpose(dim0, dim1))

autograd flip:
  proc forward*(ty: TensorType; self: Tensor; dims: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("flip", self.tensor, dims.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.flip(dims))

autograd flip:
  proc forward*(self: Tensor; dims: openarray[int]): Tensor {.inline.} = 
    check: self.tensor.atenMethod("flip", dims.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.flip(dims))

autograd rot90:
  proc forward*(ty: TensorType; self: Tensor; k: int = 1; dims: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("rot90", self.tensor, k, dims.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.rot90(-k, dims))

autograd rot90:
  proc forward*(self: Tensor; k: int = 1; dims: openarray[int]): Tensor {.inline.} = 
    check: self.tensor.atenMethod("rot90", k, dims.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.rot90(-k, dims))

autograd trunc:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("trunc", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd trunc:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("trunc").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd unsafe_view_impl:
  proc forward*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("_unsafe_view", self.tensor, size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd unsafe_view_impl:
  proc forward*(self: Tensor; size: openarray[int]): Tensor {.inline.} = 
    check: atenFunction("at::_unsafe_view", self.tensor, size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd unsqueeze:
  proc forward*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
    check: ty[].atenMethod("unsqueeze", self.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(grad.squeeze(dim))

autograd unsqueeze:
  proc forward*(self: Tensor; dim: int): Tensor {.inline.} = 
    check: self.tensor.atenMethod("unsqueeze", dim).to(ATensor).newTensor()
  self: firstOrSelf(grad.squeeze(dim))

autograd unsqueeze_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("unsqueeze_", self.tensor, dim).to(void); self
  self: firstOrSelf(grad.squeeze(dim))

autograd unsqueeze_inplace:
  proc forward*(self: Tensor; dim: int): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("unsqueeze_", dim).to(void); self
  self: firstOrSelf(grad.squeeze(dim))

autograd s_where_impl:
  proc forward*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(where(condition, grad, zeros_like(grad)))
  other: firstOrSelf(where(condition, zeros_like(grad), grad))

autograd s_where_impl:
  proc forward*(condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: atenFunction("at::_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(where(condition, grad, zeros_like(grad)))
  other: firstOrSelf(where(condition, zeros_like(grad), grad))

autograd standard_gamma_impl:
  proc forward*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: ty[].atenMethod("_standard_gamma", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(grad * standard_gamma_grad_impl(self, fwd_result))

autograd standard_gamma_impl:
  proc forward*(self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: atenFunction("at::_standard_gamma", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(grad * standard_gamma_grad_impl(self, fwd_result))

autograd poisson:
  proc forward*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: ty[].atenMethod("poisson", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd poisson:
  proc forward*(self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
    check: atenFunction("at::poisson", self.tensor, generator).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self))

autograd clone:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("clone", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd clone:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("clone").to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd pow:
  proc forward*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.} = 
    check: ty[].atenMethod("pow", self.tensor, exponent).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward(grad, self, exponent))

autograd pow:
  proc forward*(self: Tensor; exponent: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("pow", exponent).to(ATensor).newTensor()
  self: firstOrSelf(pow_backward(grad, self, exponent))

autograd zero_inplace:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("zero_", self.tensor).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd zero_inplace:
  proc forward*(self: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("zero_").to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd sub:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("sub", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(-grad * alpha)

autograd sub:
  proc forward*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sub", other.tensor, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  other: firstOrSelf(-grad * alpha)

autograd sub:
  proc forward*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("sub", self.tensor, other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd sub:
  proc forward*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sub", other, alpha).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd s_native_addmm:
  proc forward*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat1: firstOrSelf(mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha))
  mat2: firstOrSelf(mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha))

autograd s_native_addmm:
  proc forward*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
    check: atenFunction("at::s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()
  self: firstOrSelf(maybe_multiply(grad, beta))
  mat1: firstOrSelf(mm_mat1_backward(grad, mat2, mat1.sizes(), mat1.strides(), alpha))
  mat2: firstOrSelf(mm_mat2_backward(grad, mat1, mat2.sizes(), mat2.strides(), alpha))

autograd coalesce:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("coalesce", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd coalesce:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("coalesce").to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd indices_impl:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("_indices", self.tensor).to(ATensor).newTensor()
  output_differentiability: [false]

autograd indices_impl:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("_indices").to(ATensor).newTensor()
  output_differentiability: [false]

autograd values_impl:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("_values", self.tensor).to(ATensor).newTensor()
  output_differentiability: [false]

autograd values_impl:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("_values").to(ATensor).newTensor()
  output_differentiability: [false]

autograd indices:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("indices", self.tensor).to(ATensor).newTensor()
  output_differentiability: [false]

autograd indices:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("indices").to(ATensor).newTensor()
  output_differentiability: [false]

autograd values:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("values", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(sparse_coo_tensor_unsafe_impl(self.indices(), grad, self.sizes()).coalesced_impl_inplace(true))

autograd values:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("values").to(ATensor).newTensor()
  self: firstOrSelf(sparse_coo_tensor_unsafe_impl(self.indices(), grad, self.sizes()).coalesced_impl_inplace(true))

autograd thnn_fused_lstm_cell_impl:
  proc forward*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
    check: ty[].atenMethod("_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  output_differentiability: [true, true, false]
  (input_gates, hidden_gates, cx, input_bias, hidden_bias): thnn_fused_lstm_cell_backward_impl(grads[0], grads[1], cx, fwd_result[1], fwd_result[2], input_bias.is_defined())

autograd thnn_fused_lstm_cell_impl:
  proc forward*(input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
    check: atenFunction("at::_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  output_differentiability: [true, true, false]
  (input_gates, hidden_gates, cx, input_bias, hidden_bias): thnn_fused_lstm_cell_backward_impl(grads[0], grads[1], cx, fwd_result[1], fwd_result[2], input_bias.is_defined())

autograd thnn_fused_gru_cell_impl:
  proc forward*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: ty[].atenMethod("_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): thnn_fused_gru_cell_backward_impl(grad, fwd_result[1], input_bias.is_defined())

autograd thnn_fused_gru_cell_impl:
  proc forward*(input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: atenFunction("at::_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): thnn_fused_gru_cell_backward_impl(grad, fwd_result[1], input_bias.is_defined())

autograd pack_padded_sequence_impl:
  proc forward*(ty: TensorType; input: Tensor; lengths: Tensor; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: ty[].atenMethod("_pack_padded_sequence", input.tensor, lengths.tensor, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: firstOrSelf(pack_padded_sequence_backward_impl(grad, input.sizes(), fwd_result[1], batch_first))

autograd pack_padded_sequence_impl:
  proc forward*(input: Tensor; lengths: Tensor; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: atenFunction("at::_pack_padded_sequence", input.tensor, lengths.tensor, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: firstOrSelf(pack_padded_sequence_backward_impl(grad, input.sizes(), fwd_result[1], batch_first))

autograd masked_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("masked_fill_", self.tensor, mask.tensor, value).to(void); self
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))

autograd masked_fill_inplace:
  proc forward*(self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("masked_fill_", mask.tensor, value).to(void); self
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))

autograd masked_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("masked_fill_", self.tensor, mask.tensor, value.tensor).to(void); self
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))
  value: firstOrSelf(where(mask, grad, zeros_like(grad)).sum())

autograd masked_fill_inplace:
  proc forward*(self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("masked_fill_", mask.tensor, value.tensor).to(void); self
  self: firstOrSelf(grad.clone().masked_fill_inplace(mask, 0))
  value: firstOrSelf(where(mask, grad, zeros_like(grad)).sum())

autograd view:
  proc forward*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.} = 
    check: ty[].atenMethod("view", self.tensor, size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd view:
  proc forward*(self: Tensor; size: openarray[int]): Tensor {.inline.} = 
    check: self.tensor.atenMethod("view", size.toAIntList()).to(ATensor).newTensor()
  self: firstOrSelf(grad.reshape(self.sizes()))

autograd put_inplace:
  proc forward*(ty: TensorType; self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("put_", self.tensor, index.tensor, source.tensor, accumulate).to(void); self
  self: firstOrSelf(grad.clone().put_inplace(index, zeros_like(source), accumulate))
  source: firstOrSelf(grad.take(index))

autograd put_inplace:
  proc forward*(self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("put_", index.tensor, source.tensor, accumulate).to(void); self
  self: firstOrSelf(grad.clone().put_inplace(index, zeros_like(source), accumulate))
  source: firstOrSelf(grad.take(index))

autograd index_add_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("index_add_", self.tensor, dim, index.tensor, source.tensor).to(void); self
  self: firstOrSelf(grad)
  source: firstOrSelf(grad.index_select(dim, index))

autograd index_add_inplace:
  proc forward*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("index_add_", dim, index.tensor, source.tensor).to(void); self
  self: firstOrSelf(grad)
  source: firstOrSelf(grad.index_select(dim, index))

autograd index_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("index_fill_", self.tensor, dim, index.tensor, value).to(void); self
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))

autograd index_fill_inplace:
  proc forward*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("index_fill_", dim, index.tensor, value).to(void); self
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))

autograd index_fill_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("index_fill_", self.tensor, dim, index.tensor, value.tensor).to(void); self
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  value: firstOrSelf(grad.index_select(dim, index).sum())

autograd index_fill_inplace:
  proc forward*(self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("index_fill_", dim, index.tensor, value.tensor).to(void); self
  self: firstOrSelf(grad.clone().index_fill_inplace(dim, index, 0))
  value: firstOrSelf(grad.index_select(dim, index).sum())

autograd scatter_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("scatter_", self.tensor, dim, index.tensor, src.tensor).to(void); self
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))
  src: firstOrSelf(grad.gather(dim, index))

autograd scatter_inplace:
  proc forward*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("scatter_", dim, index.tensor, src.tensor).to(void); self
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))
  src: firstOrSelf(grad.gather(dim, index))

autograd scatter_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("scatter_", self.tensor, dim, index.tensor, value).to(void); self
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))

autograd scatter_inplace:
  proc forward*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("scatter_", dim, index.tensor, value).to(void); self
  self: firstOrSelf(grad.clone().scatter_inplace(dim, index, 0))

autograd scatter_add_inplace:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("scatter_add_", self.tensor, dim, index.tensor, src.tensor).to(void); self
  self: firstOrSelf(grad)
  src: firstOrSelf(grad.gather(dim, index))

autograd scatter_add_inplace:
  proc forward*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("scatter_add_", dim, index.tensor, src.tensor).to(void); self
  self: firstOrSelf(grad)
  src: firstOrSelf(grad.gather(dim, index))

autograd lt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("lt_", self.tensor, other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd lt_inplace:
  proc forward*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("lt_", other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd lt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("lt_", self.tensor, other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd lt_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("lt_", other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd gt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("gt_", self.tensor, other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd gt_inplace:
  proc forward*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("gt_", other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd gt_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("gt_", self.tensor, other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd gt_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("gt_", other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd le_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("le_", self.tensor, other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd le_inplace:
  proc forward*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("le_", other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd le_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("le_", self.tensor, other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd le_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("le_", other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ge_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("ge_", self.tensor, other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd ge_inplace:
  proc forward*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("ge_", other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd ge_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("ge_", self.tensor, other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ge_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("ge_", other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd eq_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("eq_", self.tensor, other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd eq_inplace:
  proc forward*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("eq_", other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd eq_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("eq_", self.tensor, other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd eq_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("eq_", other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ne_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("ne_", self.tensor, other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd ne_inplace:
  proc forward*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("ne_", other).to(void); self
  self: firstOrSelf(zeros_like(self))

autograd ne_inplace:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("ne_", self.tensor, other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd ne_inplace:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("ne_", other.tensor).to(void); self
  self: firstOrSelf(zeros_like(self))
  other: firstOrSelf(zeros_like(other))

autograd random_inplace:
  proc forward*(ty: TensorType; self: Tensor; from_name: int; to_name: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("random_", self.tensor, from_name, to_name, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(self: Tensor; from_name: int; to_name: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("random_", from_name, to_name, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(ty: TensorType; self: Tensor; to_name: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("random_", self.tensor, to_name, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(self: Tensor; to_name: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("random_", to_name, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("random_", self.tensor, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd random_inplace:
  proc forward*(self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("random_", generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd uniform_inplace:
  proc forward*(ty: TensorType; self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("uniform_", self.tensor, from_name, to_name, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd uniform_inplace:
  proc forward*(self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("uniform_", from_name, to_name, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd normal_inplace:
  proc forward*(ty: TensorType; self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("normal_", self.tensor, mean, std, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd normal_inplace:
  proc forward*(self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("normal_", mean, std, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd cauchy_inplace:
  proc forward*(ty: TensorType; self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("cauchy_", self.tensor, median, sigma, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd cauchy_inplace:
  proc forward*(self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("cauchy_", median, sigma, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd log_normal_inplace:
  proc forward*(ty: TensorType; self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("log_normal_", self.tensor, mean, std, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd log_normal_inplace:
  proc forward*(self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("log_normal_", mean, std, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd exponential_inplace:
  proc forward*(ty: TensorType; self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("exponential_", self.tensor, lambd, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd exponential_inplace:
  proc forward*(self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("exponential_", lambd, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd geometric_inplace:
  proc forward*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: ty[].atenMethod("geometric_", self.tensor, p, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd geometric_inplace:
  proc forward*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
    check: self.tensor.atenMethod("geometric_", p, generator).to(void); self
  self: firstOrSelf(zeros_like(grad))

autograd cross:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.} = 
    check: ty[].atenMethod("cross", self.tensor, other.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(other.cross(grad, dim))
  other: firstOrSelf(grad.cross(self, dim))

autograd cross:
  proc forward*(self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("cross", other.tensor, dim).to(ATensor).newTensor()
  self: firstOrSelf(other.cross(grad, dim))
  other: firstOrSelf(grad.cross(self, dim))

autograd triu:
  proc forward*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
    check: ty[].atenMethod("triu", self.tensor, diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.triu(diagonal))

autograd triu:
  proc forward*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
    check: self.tensor.atenMethod("triu", diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.triu(diagonal))

autograd tril:
  proc forward*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
    check: ty[].atenMethod("tril", self.tensor, diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.tril(diagonal))

autograd tril:
  proc forward*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
    check: self.tensor.atenMethod("tril", diagonal).to(ATensor).newTensor()
  self: firstOrSelf(grad.tril(diagonal))

autograd take:
  proc forward*(ty: TensorType; self: Tensor; index: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("take", self.tensor, index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self).put_inplace(index, grad, true))

autograd take:
  proc forward*(self: Tensor; index: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("take", index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self).put_inplace(index, grad, true))

autograd index_select:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("index_select", self.tensor, dim, index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros(self.sizes(), grad.options()).index_add_inplace(dim, index, grad))

autograd index_select:
  proc forward*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("index_select", dim, index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros(self.sizes(), grad.options()).index_add_inplace(dim, index, grad))

autograd masked_select:
  proc forward*(ty: TensorType; self: Tensor; mask: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("masked_select", self.tensor, mask.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self.expand(infer_size(self.sizes(), mask.sizes()))).masked_scatter_inplace(mask, grad))

autograd masked_select:
  proc forward*(self: Tensor; mask: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("masked_select", mask.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(self.expand(infer_size(self.sizes(), mask.sizes()))).masked_scatter_inplace(mask, grad))

autograd gather:
  proc forward*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("gather", self.tensor, dim, index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros(self.sizes(), grad.options()).scatter_add_inplace(dim, index, grad))

autograd gather:
  proc forward*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("gather", dim, index.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros(self.sizes(), grad.options()).scatter_add_inplace(dim, index, grad))

autograd addcmul:
  proc forward*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("addcmul", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * tensor2 * value)
  tensor2: firstOrSelf(grad * tensor1 * value)

autograd addcmul:
  proc forward*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("addcmul", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * tensor2 * value)
  tensor2: firstOrSelf(grad * tensor1 * value)

autograd addcdiv:
  proc forward*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
    check: ty[].atenMethod("addcdiv", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * value / tensor2)
  tensor2: firstOrSelf(-grad * value * tensor1 / (tensor2 * tensor2))

autograd addcdiv:
  proc forward*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
    check: self.tensor.atenMethod("addcdiv", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: firstOrSelf(grad)
  tensor1: firstOrSelf(grad * value / tensor2)
  tensor2: firstOrSelf(-grad * value * tensor1 / (tensor2 * tensor2))

autograd symeig:
  proc forward*(ty: TensorType; self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: ty[].atenMethod("symeig", self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(symeig_backward(grads, self, eigenvectors, upper, fwd_result[0], fwd_result[1]))

autograd symeig:
  proc forward*(self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
    check: self.tensor.atenMethod("symeig", eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: firstOrSelf(symeig_backward(grads, self, eigenvectors, upper, fwd_result[0], fwd_result[1]))

autograd lgamma:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("lgamma", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * digamma(self))

autograd lgamma:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("lgamma").to(ATensor).newTensor()
  self: firstOrSelf(grad * digamma(self))

autograd digamma:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("digamma", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * polygamma(1, self))

autograd digamma:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("digamma").to(ATensor).newTensor()
  self: firstOrSelf(grad * polygamma(1, self))

autograd polygamma:
  proc forward*(ty: TensorType; n: int; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("polygamma", n, self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad * polygamma(n + 1, self))

autograd erfinv:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("erfinv", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad)

autograd erfinv:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("erfinv").to(ATensor).newTensor()
  self: firstOrSelf(0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad)

autograd frac:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("frac", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd frac:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("frac").to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd reciprocal:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("reciprocal", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(-grad * fwd_result * fwd_result)

autograd reciprocal:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("reciprocal").to(ATensor).newTensor()
  self: firstOrSelf(-grad * fwd_result * fwd_result)

autograd neg:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("neg", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad.neg())

autograd neg:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("neg").to(ATensor).newTensor()
  self: firstOrSelf(grad.neg())

autograd atan2:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("atan2", self.tensor, other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd atan2:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("atan2", other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd sign:
  proc forward*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("sign", self.tensor).to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd sign:
  proc forward*(self: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("sign").to(ATensor).newTensor()
  self: firstOrSelf(zeros_like(grad))

autograd fmod:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
    check: ty[].atenMethod("fmod", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd fmod:
  proc forward*(self: Tensor; other: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("fmod", other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd fmod:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("fmod", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd fmod:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("fmod", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
    check: ty[].atenMethod("remainder", self.tensor, other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(self: Tensor; other: float): Tensor {.inline.} = 
    check: self.tensor.atenMethod("remainder", other).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: ty[].atenMethod("remainder", self.tensor, other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

autograd remainder:
  proc forward*(self: Tensor; other: Tensor): Tensor {.inline.} = 
    check: self.tensor.atenMethod("remainder", other.tensor).to(ATensor).newTensor()
  self: firstOrSelf(grad)

