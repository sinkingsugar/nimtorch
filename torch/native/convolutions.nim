
import strformat, sequtils

type
  ConvParams = object
    stride: seq[int]
    padding: seq[int]
    dilation: seq[int]
    transposed: bool
    output_padding: seq[int]
    groups: int
    benchmark: bool
    deterministic: bool
    cudnn_enabled: bool

proc is_strided(self: ConvParams): bool =
  for x in self.stride: result = result or x != 1

proc is_dilated(self: ConvParams): bool =
  for x in self.dilation: result = result or x != 1

proc is_padded(self: ConvParams): bool =
  for x in self.padding: result = result or x != 0

proc is_output_padding_neg(self: ConvParams): bool =
  for x in self.padding: result = result or x < 0

proc is_output_padding_big(self: ConvParams): bool =
  for i in 0 ..< self.padding.len: result = result or (self.output_padding[i] >= self.stride[i] or self.output_padding[i] >= self.dilation[i])

proc is_padding_neg(self: ConvParams): bool =
  for x in self.padding: result = result or x < 0

proc view1d_as_2d(self: var ConvParams) =
  if self.stride.len == 1:
    self.stride.insert(self.stride, 1)
    self.padding.insert(self.padding, 0)
    self.dilation.insert(self.dilation, 1)
    self.output_padding.insert(self.output_padding, 0)

proc use_cudnn(self: ConvParams; input: Tensor): bool =
  false
# if (!detail::getCUDAHooks().compiledWithCuDNN()) {
#   return false;
# }
# if (!input.type().is_cuda() || !cudnn_enabled) {
#   return false;
# }

# if (deterministic && is_dilated()) {
#   // cudnn doesn't support deterministic dilated convolution fully yet
#   return false;
# }
# if (is_dilated()) {
#   return detail::getCUDAHooks().supportsDilatedConvolutionWithCuDNN() && !is_output_padding_big();
# }
# return !is_output_padding_big();
# }

proc use_miopen(self: ConvParams; input: Tensor): bool =
  return false
# auto ConvParams::use_miopen(const at::Tensor& input) const -> bool {
# if (!detail::getCUDAHooks().compiledWithMIOpen() || !input.type().is_cuda() || !cudnn_enabled)
#   return false;
# return true;
# }

proc use_mkldnn(self: ConvParams; input: Tensor): bool =
  return false
# auto ConvParams::use_mkldnn(const at::Tensor& input) const -> bool {
# #if AT_MKLDNN_ENABLED()
# return input.type().backend() == at::Backend::CPU &&
#         input.type().scalarType() == kFloat && // only on CPU Float Tensors
#         !is_dilated() && // doesn't support dilation
#         !transposed && // or transposed tensors
#         input.ndimension() == 4; // must be in NCHW format
# #endif
# return false;
# }

# We currently only have depthwise support for the case where groups ==
# nInputPlane and nInputPlane == nOutputPlane (the latter due to the lack of
# a depthwise multiplier)
proc is_depthwise(self: ConvParams; input, weight: Tensor): bool =
  return
    input.getType().is_cuda() and
    not self.transposed and
    input.ndimension() == 4 and
    input.size(1) == self.groups and
    self.groups > 1 and # no point if there is only a single group
    weight.size(0) mod input.size(1) == 0 # output channels must be a multiple of input channels

proc view4d(tensor: Tensor): Tensor =
  assert(tensor.ndimension() == 3, fmt"expected 3D tensor, got tensor with {tensor.ndimension()} dimensions instead");
  return tensor.unsqueeze(2)

proc view3d(tensor: Tensor): Tensor =
  assert(tensor.ndimension() == 4, fmt"expected 4D tensor, got tensor with {tensor.ndimension()} dimensions instead");
  return tensor.unsqueeze(2)

proc subtensor(tensor: Tensor; dim, groups, g: int): Tensor =
  if not tensor.is_defined:
    return newTensor()

  let n = tensor.sizes[dim] div groups;
  return tensor.narrow(dim, n * g, n).contiguous()

proc convolution*(input, weight, bias: Tensor; stride, padding, dilation: openarray[int], transposed: bool; output_padding: openarray[int]; groups: int): Tensor
proc convolution_internal*(input_r, weight_r, bias_r: Tensor; stride, padding, dilation: openarray[int], transposed: bool; output_padding: openarray[int]; groups: int;
    benchmark, deterministic, cudnn_enabled: bool): Tensor
proc convolution_nogroup_internal*(input, weight, bias: Tensor; stride, padding, dilation: openarray[int]; transposed: bool; output_padding: openarray[int]): Tensor

proc conv1d*(input, weight, bias: Tensor; stride, padding, dilation: openarray[int], groups: int): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, false, [0], groups)

proc conv2d*(input, weight, bias: Tensor; stride, padding, dilation: openarray[int], groups: int): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, false, [0, 0], groups)

proc conv3d*(input, weight, bias: Tensor; stride, padding, dilation: openarray[int], groups: int): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, false, [0, 0, 0], groups)

proc conv_transpose1d*(input, weight, bias: Tensor; stride, padding, output_padding: openarray[int], groups: int, dilation: openarray[int]): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, true, output_padding, groups)

proc conv_transpose2d*(input, weight, bias: Tensor; stride, padding, output_padding: openarray[int], groups: int, dilation: openarray[int]): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, true, output_padding, groups)

proc conv_transpose3d*(input, weight, bias: Tensor; stride, padding, output_padding: openarray[int], groups: int, dilation: openarray[int]): Tensor =
  convolution(input, weight, bias, stride, padding, dilation, true, output_padding, groups)

proc convolution*(input, weight, bias: Tensor; stride, padding, dilation: openarray[int], transposed: bool; output_padding: openarray[int]; groups: int): Tensor =
  #let ctx = globalContext
  convolution_internal(input, weight, bias, stride, padding, dilation, transposed, output_padding, groups, false, false, false)
    #ctx.benchmarkCuDNN(), ctx.deterministicCuDNN(), ctx.userEnabledCuDNN())

proc convolution_expand_param_if_needed(list_param: openarray[int]; param_name: static string; expected_dim: int): seq[int] =
  if list_param.len == 1:
    return newSeqWith(expected_dim, list_param[0])
  elif list_param.len != expected_dim:
    raiseAssert(fmt"""expected {param_name} to be a single integer value or a
      list of {expected_dim} values to match the convolution
      "dimensions, but got {param_name}={list_param}""")
  else:
    return @list_param

# slice(n, m) - Chop off the first N elements of the array, and keep M
# elements in the array.
proc slice[T](self: seq[T]; N, M: int): seq[T] =
  assert(N + M <= self.len, fmt"ArrayRef: invalid slice, N = {N}; M = {M}; size = {self.len}")
  result = newSeq[T](M)
  for i in 0 ..< M:
    result[i] = self[N + i]

# slice(n) - Chop off the first N elements of the array.
proc slice[T](self: seq[T]; N: int): seq[T] =
  self.slice(N, self.len - N)

proc convolution_internal(input_r, weight_r, bias_r: Tensor; stride, padding, dilation: openarray[int], transposed: bool; output_padding: openarray[int]; groups: int;
    benchmark, deterministic, cudnn_enabled: bool): Tensor =

  var
    input = input_r.contiguous()
    weight = weight_r
    bias = bias_r
    k = weight.ndimension()
    dim = k - 2

  assert(dim > 0, "weight should at least have at least two dimensions")

  var params = ConvParams(
    stride: convolution_expand_param_if_needed(stride, "stride", dim),
    padding: convolution_expand_param_if_needed(padding, "padding", dim),
    dilation: convolution_expand_param_if_needed(dilation, "dilation", dim),
    transposed: transposed,
    output_padding: convolution_expand_param_if_needed(output_padding, "output_padding", dim),
    groups: groups,
    benchmark: benchmark,
    deterministic: deterministic,
    cudnn_enabled: cudnn_enabled)

  assert(not params.is_padding_neg(), "negative padding is not supported")
  assert(not params.is_output_padding_neg(), "negative output_padding is not supported")

  #check_input_shape_forward(input, weight, bias, params.groups, params.transposed)

  if k == 3:
    params.view1d_as_2d()
    input = view4d(input)
    weight = view4d(weight)

  #result = input.getType().tensor()

  if params.is_depthwise(input, weight):
      # output.resize_(output_size(input, weight))

      let
        kernel_size = weight.sizes().slice(2)
        stride = params.stride
        padding = params.padding
        dilation = params.dilation

      result = thnn_conv_depthwise2d(input, weight, kernel_size, bias, stride, padding, dilation)

  elif params.use_cudnn(input):
    assert(input.getType() == weight.getType(), fmt"Input type ({input.getType()}) and weight type ({weight.getType()}) should be the same")
    assert(not bias.is_defined() or (input.getType() == bias.getType()), fmt"Input type ({input.getType()}) and bias type ({bias.getType()}) should be the same")

    if params.transposed:
      result = cudnn_convolution_transpose(input, weight, bias, params.padding, params.output_padding, params.stride, params.dilation, params.groups, params.benchmark, params.deterministic)
    else:
      result = cudnn_convolution(input, weight, bias, params.padding, params.stride, params.dilation, params.groups, params.benchmark, params.deterministic)

  # elif (params.use_miopen(input)):
  #   assert(input.getType() == weight.getType(), fmt"Input type ({input.getType()}) and weight type ({weight.getType()}) should be the same")
  #   assert(not bias.is_defined() or (input.getType() == bias.getType()), fmt"Input type ({input.getType()}) and bias type ({bias.getType()}) should be the same")

  #   if params.transposed:
  #     result = miopen_convolution_transpose(input, weight, bias, params.padding, params.output_padding, params.stride, params.dilation, params.groups, params.benchmark, params.deterministic)
  #   else:
  #     result = miopen_convolution(input, weight, bias, params.padding, params.stride, params.dilation, params.groups, params.benchmark, params.deterministic)

  elif params.use_mkldnn(input):
    when defined AT_MKLDNN_ENABLED:
      assert(input.getType() == weight.getType(), fmt"Input type ({input.getType()}) and weight type ({weight.getType()}) should be the same")
      assert(not bias.is_defined() or (input.getType() == bias.getType()), fmt"Input type ({input.getType()}) and bias type ({bias.getType()}) should be the same")

      result = mkldnn_convolution(input, weight, bias, params.padding, params.stride, params.dilation, params.groups)

  else:
    if params.groups == 1:
      result = convolution_nogroup_internal(input, weight, bias, params.stride, params.padding, params.dilation, params.transposed, params.output_padding)
    else:
      var outputs = newSeq[Tensor](params.groups)
      for g in 0 ..< params.groups:
        let
          input_g = subtensor(input, 1, params.groups, g)
          weight_g = subtensor(weight, 0, params.groups, g)
          bias_g = subtensor(bias, 0, params.groups, g)
        
        outputs[g] = convolution_nogroup_internal(input_g, weight_g, bias_g, params.stride, params.padding, params.dilation, params.transposed, params.output_padding)

      result = cat(outputs, 1)

  if k == 3:
    result = view3d(result)

# A generic function for convolution implementations which don't
# natively implement groups (e.g., not CuDNN).
proc convolution_nogroup_internal*(input, weight, bias: Tensor; stride, padding, dilation: openarray[int]; transposed: bool; output_padding: openarray[int]): Tensor =

  let params = ConvParams(
    stride: @stride,
    padding: @padding,
    dilation: @dilation,
    transposed: transposed,
    output_padding: @output_padding,
    groups: 1,
    benchmark: false,
    deterministic: false,
    cudnn_enabled: false)

  let
    dim = input.ndimension()
    dilated = params.is_dilated()
    kernel_size = weight.sizes().slice(2)

  if params.transposed:
    if dim == 4:
      return thnn_conv_transpose2d(input, weight, kernel_size, bias, stride, padding, output_padding, dilation).output
    elif (dim == 5):
      return thnn_conv_transpose3d(input, weight, kernel_size, bias, stride, padding, output_padding, dilation).output
  else: # Not transposed
    if dim == 4:
      if dilated:
        return thnn_conv_dilated2d(input, weight, kernel_size, bias, stride, padding, dilation).output
      else: # dim == 4, non-dilated
        # CPU implementation has specialized MM kernels for non-dilated case here
        return thnn_conv2d(input, weight, kernel_size, bias, stride, padding)
    elif dim == 5 and (input.getType().is_cuda() or dilated):
      return thnn_conv_dilated3d(input, weight, kernel_size, bias, stride, padding, dilation).output
    elif dim == 5: # dim == 5, CPU, non-dilated
      # CPU implementation has specialized MM kernels for non-dilated case here
      return thnn_conv3d(input, weight, kernel_size, bias, stride, padding).output

  raiseAssert("unsupported ConvNd parameters")