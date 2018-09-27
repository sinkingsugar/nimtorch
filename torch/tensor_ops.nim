import tensors, autograd_macro, torch_cpp
import macros

{.experimental: "implicitDeref".}

include torch/declarations

proc zeros*[T: SomeInteger](size: varargs[T]): Tensor =
  var opts: TensorOptions
  opts.dtype(get_default_dtype().toATenType()).to(void)
  return zeros(size, opts)

proc zeros*(size: openarray[SomeInteger]; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(get_default_dtype().toATenType()).to(void)
  case device
  of Device.CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of Device.CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return zeros(size, opts)

proc zeros*(size: openarray[SomeInteger]; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return zeros(size, opts)

proc zeros*(size: openarray[SomeInteger]; dtype: TensorKind; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  case device
  of Device.CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of Device.CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return zeros(size, opts)

proc ones*[T: SomeInteger](size: varargs[T]): Tensor =
  var opts: TensorOptions
  opts.dtype(get_default_dtype().toATenType()).to(void)
  return ones(size, opts)

proc ones*(size: openarray[SomeInteger]; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(get_default_dtype().toATenType()).to(void)
  case device
  of Device.CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of Device.CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return ones(size, opts)

proc ones*(size: openarray[SomeInteger]; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return ones(size, opts)

proc ones*(size: openarray[SomeInteger]; dtype: TensorKind; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  case device
  of Device.CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of Device.CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return ones(size, opts)

proc add*(self: Tensor; value: SomeNumber; other: Tensor): Tensor {.inline.} = add(self, other, value)

proc add_inplace*(self: Tensor; value: SomeNumber; other: Tensor): Tensor {.inline, discardable.} = add_inplace(self, other, value)

proc `-`*(a: Tensor): Tensor {.inline, noinit.} = neg(a)

proc `+`*(a, b: Tensor): Tensor {.inline, noinit.} = add(a, b)

proc `<=`*(a, b: Tensor): Tensor {.inline, noinit.} = le(a, b)

proc `<`*(a, b: Tensor): Tensor {.inline, noinit.} = lt(a, b)

proc `>`*(a, b: Tensor): Tensor {.inline, noinit.} = ge(a, b)

proc `>=`*(a, b: Tensor): Tensor {.inline, noinit.} = ge(a, b)

proc `<=`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} = le(a, b)

proc `>=`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} = ge(a, b)

proc `+`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} = add(a, b.float)

proc `+`*(a: SomeNumber; b: Tensor): Tensor {.inline, noinit.} = b + a

proc `*`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} = mul(a, b.float)

proc `*`*(a: SomeNumber; b: Tensor): Tensor {.inline, noinit.} = b * a

proc `/`*(a, b: Tensor): Tensor {.inline, noinit.} = div_name(a, b)

proc `/`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} = div_name(a, b.float)

proc `/`*(a: SomeNumber; b: Tensor): Tensor {.inline, noinit.} = div_name(a.float, b)

proc `*`*(a, b: Tensor): Tensor {.inline, noinit.} = mul(a, b)

proc `-`*(a, b: Tensor): Tensor {.inline, noinit.} = sub(a, b)

proc `-`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} = sub(a, b.float)

proc `==`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} = eq(a, b)

proc `==`*(a, b: Tensor): Tensor {.inline.} = eq(a, b)

# TODO: Use inplace ops instead?
proc `+=`*(a: var Tensor; b: Tensor) {.inline.} = a = a + b

proc `-=`*(a: var Tensor; b: Tensor) {.inline.} = a = a - b

include torch/autograd_helpers
include torch/native/convolutions
include torch/derivatives

proc detach*(self: Tensor): Tensor =
  result = self.clone()
  result.detach_inplace()

proc toSeq*[T](a: Tensor): seq[T] {.inline, noinit.} =
  let elements = a.numel()
  result = newSeq[T](elements)

  if a.is_cuda():
    var tmp = a.cpu()
    copyMem(addr(result[0]), tmp.data_ptr(), sizeof(T) * elements)
  else:
    copyMem(addr(result[0]), a.data_ptr(), sizeof(T) * elements)

template _*: int = -1

macro `[]`*(a: Tensor; args: varargs[int]): Tensor =
  result = newStmtList()
  
  var resSym = gensym(nskVar)
  result.add quote do:
    var `resSym` {.inject.} = `a`
  
  var dimSkip = 0
  for arg in args:
    if arg.kind == nnkIntLit and arg.intVal == -1:
      inc dimSkip
    else:
      result.add quote do:
        `resSym` = `resSym`.select(`dimSkip`, `arg`)

  result.add quote do:
    `resSym`

macro `[]=`*(a: Tensor; args: varargs[int]; value: Tensor | SomeNumber): untyped =
  result = newStmtList()
  
  var resSym = gensym(nskVar)
  result.add quote do:
    var `resSym` {.inject.} = `a`
  
  var dimSkip = 0
  for arg in args:
    if arg.kind == nnkIntLit and arg.intVal == -1:
      inc dimSkip
    else:
      result.add quote do:
        `resSym` = `resSym`.select(`dimSkip`, `arg`)

  result.add quote do:
    when type(`value`) is Tensor:
      let
        sizeOne = `resSym`.sizes()[0] - 1
        indexTensor = range(0.float, sizeOne.float, LongTensor)
      `resSym`.index_put_inplace([indexTensor], `value`)
    else:
      let
        sizeOne = `resSym`.sizes()[0] - 1
        indexTensor = range(0.float, sizeOne.float, LongTensor)
      `resSym`.index_put_inplace([indexTensor], full_like(`resSym`, `value`.float, `resSym`.options()))

macro chunk*(self: Tensor; chunks: static[int]; dim: int): untyped =
  var tensors = genSym()
  var tupleTree = nnkTupleConstr.newTree()

  for i in 0 ..< chunks:
    tupleTree.add quote do:
      `tensors`[`i`]
  
  result = quote do:
    let `tensors` = `self`.chunk(`chunks`, `dim`.int64)
    `tupleTree`