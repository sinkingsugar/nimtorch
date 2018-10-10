import ../../../torch, ../modules, ../functional
import math

type
  MaxPoolModule = ref object of LinearModuleBase
    kernel_size: seq[int]
    stride: seq[int]
    padding: seq[int]
    dilation: seq[int]
    ceil_mode: bool

proc MaxPool(op: untyped; kernel_size, stride, padding, dilation: openarray[int]; ceil_mode: bool): MaxPoolModule =
  new result
  let m = result

  m.kernel_size = @kernel_size
  m.stride = if stride.len == 0: m.kernel_size else: @stride
  m.padding = @padding
  m.dilation = @dilation
  m.ceil_mode = ceil_mode

  m.forward = proc(input: varargs[Tensor]): Tensor =
    op(input[0], m.kernel_size, m.stride, m.padding, m.dilation, m.ceil_mode)

proc MaxPool1d*(kernel_size: int; stride: int = 0; padding: int = 0; dilation: int = 1; ceil_mode: bool = false): MaxPoolModule =
  let stride = if stride > 0: stride else: kernel_size
  MaxPool(max_pool1d, [kernel_size], [stride], [padding], [dilation], ceil_mode)

proc MaxPool2d*(kernel_size: openarray[int]; stride: openarray[int] = []; padding: openarray[int] = [0, 0]; dilation: openarray[int] = [1, 1]; ceil_mode: bool = false): MaxPoolModule =
  MaxPool(max_pool2d, kernel_size, stride, padding, dilation, ceil_mode)

proc MaxPool3d*(kernel_size: openarray[int]; stride: openarray[int] = []; padding: openarray[int] = [0, 0, 0]; dilation: openarray[int] = [1, 1, 1]; ceil_mode: bool = false): MaxPoolModule =
  MaxPool(max_pool3d, kernel_size, stride, padding, dilation, ceil_mode)