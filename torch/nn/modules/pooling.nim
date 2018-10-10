import ../../../torch, ../modules, ../functional
import math

type
  MaxPoolModule* = ref object of LinearModuleBase
    kernel_size: seq[int]
    stride: seq[int]
    padding: seq[int]
    dilation: seq[int]
    ceil_mode: bool

proc newMaxPoolModule(kernel_size, stride, padding, dilation: openarray[int]; ceil_mode: bool): MaxPoolModule =
  new result
  result.kernel_size = @kernel_size
  result.stride = if stride.len == 0: result.kernel_size else: @stride
  result.padding = @padding
  result.dilation = @dilation
  result.ceil_mode = ceil_mode

proc MaxPool1d*(kernel_size: int; stride: int = 0; padding: int = 0; dilation: int = 1; ceil_mode: bool = false): MaxPoolModule =
  let stride = if stride > 0: stride else: kernel_size
  result = newMaxPoolModule([kernel_size], [stride], [padding], [dilation], ceil_mode)

  let m = result
  m.forward = proc(input: varargs[Tensor]): Tensor = 
    max_pool1d(input[0], m.kernel_size[0], m.stride[0], m.padding[0], m.dilation[0], m.ceil_mode)

proc MaxPool2d*(kernel_size: openarray[int]; stride: openarray[int] = []; padding: openarray[int] = [0, 0]; dilation: openarray[int] = [1, 1]; ceil_mode: bool = false): MaxPoolModule =
  result = newMaxPoolModule(kernel_size, stride, padding, dilation, ceil_mode)

  let m = result
  m.forward = proc(input: varargs[Tensor]): Tensor =
    max_pool2d(input[0], m.kernel_size, m.stride, m.padding, m.dilation, m.ceil_mode)

proc MaxPool3d*(kernel_size: openarray[int]; stride: openarray[int] = []; padding: openarray[int] = [0, 0, 0]; dilation: openarray[int] = [1, 1, 1]; ceil_mode: bool = false): MaxPoolModule =
  result = newMaxPoolModule(kernel_size, stride, padding, dilation, ceil_mode)

  let m = result
  m.forward = proc(input: varargs[Tensor]): Tensor =
    max_pool3d(input[0], m.kernel_size, m.stride, m.padding, m.dilation, m.ceil_mode)
