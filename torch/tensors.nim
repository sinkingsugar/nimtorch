import fragments/ffi/cpp
import torch_cpp
import macros, sequtils, math, sets, strformat, options, strutils

{.experimental: "implicitDeref".}

type
  Tensor* = ref object
    hasTensor: bool
    tensor*: ATensor

    when not defined inference:
      requires_grad*: bool
      grad*: Tensor
      grad_fn*: BackwardFunction
    
  BackwardFunction* = ref object
    inputs*: seq[Tensor]
    outputs*: seq[Tensor]
    apply*: BackwardFunctionCall

  Generator* = ptr AGenerator
  TensorType* = ptr AType
  TensorOptions* = ATensorOptions
  TensorList* = seq[Tensor]
  IntList* = seq[int]
  
  Device* {.pure.} = enum
    CPU, CUDA
  
  TensorKind* = enum
    FloatTensor, DoubleTensor, HalfTensor, ByteTensor,
    CharTensor, ShortTensor, IntTensor, LongTensor

  BackwardFunctionCall* = proc(grads: openarray[Tensor]): seq[Tensor]

var undefinedTensor*: ATensor

# TODO: Shallow copy without leaf checking?
proc data*(self: Tensor): Tensor {.inline.} = self

var isGradDisabled {.threadvar.}: bool

proc is_grad_enabled*(): bool = not isGradDisabled

proc set_grad_enabled*(mode: bool) =
  isGradDisabled = not mode

template set_grad_enabled*(mode: bool; body: untyped): untyped =
  let wasGradEnabled = is_grad_enabled()
  set_grad_enabled(mode)
  try:
    body
  finally:
    set_grad_enabled(wasGradEnabled)

template no_grad*(body: untyped): untyped = 
  set_grad_enabled(false): body

template enable_grad*(body: untyped): untyped = 
  set_grad_enabled(true): body

proc use_count*(x: Tensor): int = x.tensor.dynamicCppCall("get()->use_count").to(int)

const
  nimtorchGcUs {.strdefine.} = "1000"
  nimtorchGcUsInt = parseInt(nimtorchGcUs)

proc newTensor*(): Tensor {.inline, noinit.} =
  new(result, proc(self: Tensor) = cppdtor(addr(self.tensor)))
  cppctor(addr(result.tensor))
  result.hasTensor = false
  result.tensor = undefinedTensor
  when defined useRealtimeGC:
    GC_step(nimtorchGcUsInt)

proc newTensor*(a: ATensor): Tensor {.inline, noinit.} =
  new(result, proc(self: Tensor) = cppdtor(addr(self.tensor)))
  cppctor(addr(result.tensor))
  result.hasTensor = true
  result.tensor = a
  when defined useRealtimeGC:
    GC_step(nimtorchGcUsInt)

proc len*(v: ATensors): int {.inline.} = v.size().to(int)

proc high*(v: ATensors): int {.inline.} = v.len - 1

proc `[]`*(v: ATensors; index: int): ATensor {.inline, noinit.} = v.toCpp[index.csize].to(ATensor)

proc add*(v: ATensors; value: ATensor) {.inline.} = v.push_back(value).to(void)

iterator items*(tensors: ATensors): ATensor {.inline.} =
  for i in 0 ..< tensors.len:
    yield tensors[i]
    
proc toATensors*(tensors: openarray[Tensor]): ATensors =
  result.resize(tensors.len.csize).to(void)
  for i, tensor in tensors:
    result[i] = tensor.tensor

proc high*(v: AIntList): int {.inline.} = v.size().to(int) - 1

proc len*(v: AIntList): int {.inline.} = v.size().to(int)

iterator items*(ints: AIntList): AInt64 {.inline.} =
  for i in 0 .. ints.high:
    yield ints[i].to(AInt64)

proc toIntList(self: AIntList): IntList =
  result.setLen(self.len)
  when sizeof(int) == sizeof(int64):
    proc unsafeAddr(self: CppProxy): pointer {.importcpp: "(void*)&(#)".}
    if self.len > 0:
      copyMem(addr result[0], unsafeAddr(self[0]), result.len * sizeof(int64))
  else:
    for i in 0 ..< self.len:
      result[i] = cast[int64](self[i].to(AInt64)).int

proc toAIntList*(self: openarray[int]): AIntList =
  when sizeof(int) == sizeof(int64):
    let temp = cppinit(AIntList, cast[ptr AInt64](unsafeaddr(self[0])), self.len.csize)
    return temp
  else:
    var converted = newSeq[AInt64](self.len)
    for i, value in self:
      converted[i] = cast[AInt64](value.int64)
    let temp = cppinit(AIntList, cast[ptr AInt64](unsafeaddr(converted[0])), self.len.csize)
    return temp

proc newTensors*(nativeTensor: ATensor): Tensor {.inline.} = nativeTensor.newTensor()

proc newTensors*(nativeTensors: ATensors): TensorList {.inline.} =
  result.setLen(nativeTensors.len)
  for i in 0 ..< result.len:
    result[i] = nativeTensors[i].newTensor()

macro newTensors*(nativeTensors: tuple): untyped = 
  let T = nativeTensors.getType()
  T.expectKind(nnkBracketExpr)

  let
    tempSym = genSym(nskLet)
    tupleExpr = nnkTupleConstr.newTree()

  for i in 1 ..< T.len:
    let index = i - 1
    tupleExpr.add quote do:
      newTensors(`tempSym`[`index`])

  result = quote do:
    # Store the argument, since it might be an expression
    let `tempSym` = `nativeTensors`
    `tupleExpr`

var defaultType = FloatTensor

proc set_default_dtype*(dtype: TensorKind) {.inline.} = defaultType = dtype
proc get_default_dtype*(): TensorKind {.inline.} = defaultType

proc is_cuda*(self: TensorType): bool =
  self[].is_cuda().to(bool)

proc is_cuda*(self: Tensor): bool =
  self.tensor.is_cuda().to(bool)

proc is_sparse*(self: Tensor): bool =
  self.tensor.is_sparse().to(bool)

proc toATenType*(kind: TensorKind): ScalarType {.inline.} =
  case kind
  of FloatTensor: return ScalarType.kFloat
  of DoubleTensor: return ScalarType.kDouble
  of HalfTensor: return ScalarType.kHalf
  of ByteTensor: return ScalarType.kByte
  of CharTensor: return ScalarType.kChar
  of ShortTensor: return ScalarType.kShort
  of IntTensor: return ScalarType.kInt
  of LongTensor: return ScalarType.kLong
  else: raiseAssert("Unknown type")

proc defaultOptions*(): TensorOptions =
  var opts: TensorOptions
  opts.dtype(get_default_dtype().toATenType()).to(void)
  return opts

proc device*(deviceName: string): Device {.inline.} =
  case deviceName
  of "cpu", "CPU": return Device.CPU
  of "cuda", "CUDA": return Device.CUDA
  else: raiseAssert("Unknown device")

iterator lenIter[T](s: openarray[T]): int {.inline.} =
  ## Inline iterator on any-depth seq or array
  ## Returns values in order
  yield s.len
  for item in s:
    when item is array|seq:
      for subitem in lenIter(item):
        yield subitem
      break

iterator flatIter[T](s: openarray[T]): auto {.inline.} =
  ## Inline iterator on any-depth seq or array
  ## Returns values in order
  for item in s:
    when item is array|seq:
      for subitem in flatIter(item):
        yield subitem
    else:
      yield item

proc tensor*(data: openarray; dtype: TensorKind; device: Device = Device.CPU; dummy_bugfix: static[int] = 0;): Tensor {.inline, noinit.} =
  # as noticed in Arraymancer as well:
  ## Note: dummy_bugfix param is unused and is a workaround a Nim bug.
  # TODO: remove 'dummy_bugfix' - https://github.com/nim-lang/Nim/issues/6343

  # make shape out of nested array/seq size
  let shape = toSeq(lenIter(data)).toAIntList()
  
  # TODO avoid some of those copies and iterations
  
  # flatten and eventually cast data
  var flatData = toSeq(flatIter(data))
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(type(flatData[0]).toATenType()).dynamicCppCall("tensorFromBlob", addr(flatData[0]), shape).to(ATensor)
  
  # finally write into a tensor (notice: casting happens aten side!)
  case device:
  of Device.CUDA: result = newTensor ACUDA(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: result = newTensor ACPU(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc tensor*(data: openarray; device: Device = Device.CPU; dummy_bugfix: static[int] = 0;): Tensor {.inline, noinit.} =
  return tensor(data, defaultType, device)

proc getType*(a: Tensor): TensorType {.inline, noinit.} =
  proc helper(a: ATensor): TensorType {.importcpp: "&(#.type())".}
  return helper(a.tensor)

proc options*(a: Tensor): TensorOptions {.inline, noinit.} =
  a.tensor.dynamicCppCall("options").to(TensorOptions)

converter toTensorOptions*(tensorType: TensorType): TensorOptions =
  result = tensorType.options()

converter toTensorOptions*(tensorKind: TensorKind): TensorOptions =
  result.dtype(tensorKind.toATenType()).to(void)

proc cpu*(a: Tensor): Tensor {.inline, noinit.} =
  result = newTensor a.tensor.dynamicCppCall(toBackend, BackendCPU).to(ATensor)
  when not defined inference:
    result.requires_grad = a.requires_grad

proc cuda*(a: Tensor): Tensor {.inline, noinit.} =
  result = newTensor a.tensor.dynamicCppCall(toBackend, BackendCUDA).to(ATensor)
  when not defined inference:
    result.requires_grad = a.requires_grad

proc copy*(typ: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline, noinit.} =
  typ[].dynamicCppCall("copy", self.tensor, non_blocking).to(ATensor).newTensor()

proc copy*(self: Tensor; non_blocking: bool = false): Tensor {.inline, noinit.} =
  self.getType().copy(self, non_blocking)

proc copy_inplace*(self: Tensor; other: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} =
  self.tensor.dynamicCppCall("copy_", other.tensor, non_blocking).to(void)
  return self

proc is_defined*(a: Tensor): bool {.inline.} =
  not a.isNil and a.tensor.dynamicCppCall("defined").to(bool)

proc sizes*(a: Tensor): IntList {.inline.} =
  a.tensor.dynamicCppCall("sizes").to(AIntList).toIntList()

proc strides*(a: Tensor): IntList {.inline.} =
  a.tensor.dynamicCppCall("strides").to(AIntList).toIntList()

proc sqrt*(b: SomeFloat): SomeFloat {.inline, noinit.} = math.sqrt(b)

proc ndimension*(a: Tensor): int {.inline, noinit.} = a.tensor.dynamicCppCall(ndimension).to(int)

proc dim*(a: Tensor): int {.inline, noinit.} = a.tensor.dynamicCppCall(dim).to(int)

proc `[]`*(a: Tensor; index: int): Tensor {.inline, noinit.} =
  newTensor a.tensor.toCpp()[index].to(ATensor)

proc `[]=`*(a: Tensor; index: int; b: Tensor) {.inline.} =
  a.tensor.toCpp()[index] = b.tensor

proc `[]`*(a: Tensor; index: Tensor): Tensor {.inline, noinit.} =
  newTensor a.tensor.toCpp()[index.tensor].to(ATensor)

proc `[]=`*(a: Tensor; index: Tensor; b: Tensor) {.inline.} =
  a.tensor.toCpp()[index.tensor] = b.tensor

proc `$`*(a: Tensor): string {.inline, noinit.} =
  var sstream = cppinit(OStringStream)
  dynamicCCall("at::print", sstream, a.tensor, 80).to(void)
  let
    stdstr = sstream.str().to(StdString)
    res = stdstr.c_str().to(cstring)
  return $res

proc print*(a: Tensor) = echo a

proc toTensor*[T](s: openarray[T], size: varargs[int]): Tensor {.inline.} =
  let shape = size.toAIntList()
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, unsafeAddr(s[0]), shape).to(ATensor)
  
  result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc toTensor*[T](s: openarray[T], size: varargs[int]; device: Device): Tensor {.inline.} =
  let shape = size.toAIntList()
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, unsafeAddr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: result = newTensor ACUDA(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc toTensor*[T](s: openarray[T], size: varargs[int]; dtype: TensorKind): Tensor {.inline.} =
  let shape = size.toAIntList()
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, unsafeAddr(s[0]), shape).to(ATensor)

  result = newTensor ACPU(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc toTensor*[T](s: openarray[T], size: varargs[int]; dtype: TensorKind; device: Device): Tensor {.inline.} =
  let shape = size.toAIntList()
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, unsafeAddr(s[0]), shape).to(ATensor)
  
  case device:
    of Device.CUDA: result = newTensor ACUDA(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
    of Device.CPU: result = newTensor ACPU(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalManualSeed(seed: int) =
  globalContext().defaultGenerator(DeviceTypeCPU).manualSeed(seed).to(void)
  if globalContext().hasCUDA().to(bool):
    globalContext().defaultGenerator(DeviceTypeCUDA).manualSeed(seed).to(void)

proc manual_seed*(seed: int) = internalManualSeed(seed)

proc aten_set_num_threads(num: int) {.importcpp: "at::set_num_threads(#)", header: "ATen/ATen.h".}
proc th_set_num_threads(num: int) {.importcpp: "THSetNumThreads(#)", header: "TH/THGeneral.h".}

proc set_num_threads*(num: int) =
  aten_set_num_threads(num)
  th_set_num_threads(num)

proc get_num_threads*(): int {.importcpp: "at::get_num_threads()".}

proc detach_inplace*(self: Tensor): Tensor {.discardable.} =
  self.grad_fn = nil
  self.requires_grad = false
  return self
