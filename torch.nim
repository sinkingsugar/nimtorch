include torch/torch_cpp
import macros, sequtils, math, sets, strformat, options

{.experimental: "implicitDeref".}

type
  Tensor* = ref object
    hasTensor: bool
    tensor: ATensor

    when not defined inference:
      requires_grad*: bool
      grad*: Tensor
      grad_fn: BackwardFunction
    
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

var undefinedTensor: ATensor

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

proc requires_grad(self: not Tensor): bool = false

template capture(name: untyped): untyped =
  when name is openarray | varargs:
    let name = @`name`

macro autograd(head, body: untyped): untyped =

  result = newStmtList()

  let
    name = head
    resultIdent = ident"result"
    forwardResultIdent = ident"fwd_result"
    gradsIdent = ident"grads"
    gradInputMaskIdent = ident"grad_input_mask"
    forwardBody = newStmtList()
    backwardBody = newStmtList()
    resultExpressions = nnkBracket.newTree()
    inputIdents = nnkBracket.newTree()

  # Make `grad` available in derivative expressions, as alias for `grads[0]`
  backwardBody.add quote do:
    template grad: Tensor = `gradsIdent`[0]
    
  var resultIndex = 0
  for x in body:
    x.expectKind({ nnkCall, nnkPar, nnkProcDef, nnkFuncDef })

    if x.kind in { nnkProcDef, nnkFuncDef }:
      if x.name.basename != ident"forward":
        error("Only a proc named 'forward' is allowed", x)

      # TODO: Handle non-expressions
      let forwardExpr = x.body
      x.name = nnkPostfix.newTree(ident"*", name)
      forwardBody.add quote do:
        `resultIdent` = `forwardExpr`
        let `forwardResultIdent` = `resultIdent`      

      # If parameters are non-concrete, captures them as concrete types (e.g. openarray -> seq)
      for i in 1 ..< x.params.len:
        let paramName = x.params[i][0].basename
        forwardBody.add quote do:
          capture(`paramName`)

      x.body = forwardBody

      result.add(x)

    else:
      x[0].expectKind({ nnkIdent, nnkPar })

      # Simply assign non-tuples
      var resultExpr: NimNode
      if x[0].kind == nnkIdent:
        resultExpr = quote do: `resultIdent`[`resultIndex`] 
        inputIdents.add(x[0])
        inc resultIndex

      # Deconstruct result tuple
      else:
        let tupleCount = x[0].len
        backwardBody.add quote do:
          var `gradInputMaskIdent`: StdArray[bool, `tupleCount`]

        resultExpr = newPar()
        for i, inputIdent in x[0]:
          inputIdent.expectKind(nnkIdent)
          resultExpr.add quote do: `resultIdent`[`resultIndex`]
          inputIdents.add(inputIdent)
          backwardBody.add quote do:
            `gradInputMaskIdent`[`i`] = `inputIdent`.requires_grad
          inc resultIndex

      let gradExpr = x[1]
      backwardBody.add quote do:
        when type(`gradExpr`) isnot TensorList:
          #if `varIdent`.requires_grad: `resultIdent`[`resultIndex`] = `gradExpr`
          `resultExpr` = `gradExpr`
        else:
          `resultIdent`.add(`gradExpr`)


  # Propagate whether gradient is needed or not
  var requiresGradExpr: NimNode
  for i, inputIdent in inputIdents:
    if i == 0:
      requiresGradExpr = quote do:
        `inputIdent`.requires_grad
    else:
      requiresGradExpr = quote do:
        `requiresGradExpr` or `inputIdent`.requires_grad

  forwardBody.add quote do:
    when not defined inference:
      if is_grad_enabled() and `requiresGradExpr`:

        let grad_fn = new BackwardFunction
        grad_fn.apply = proc(`gradsIdent`: openarray[Tensor]): seq[Tensor] =
          `resultIdent`.setLen(`resultIndex`)
          `backwardBody`

        when compiles(grad_fn.inputs.add(`inputIdents`)):
          grad_fn.inputs.add(`inputIdents`)

        when `resultIdent` is Tensor:
          grad_fn.outputs = @[`resultIdent`]
          `resultIdent`.requires_grad = true
          `resultIdent`.grad_fn = grad_fn

        else:
          when `resultIdent` is tuple:
            for k, f in `resultIdent`.fieldPairs:
              when f is Tensor:
                grad_fn.outputs.add(f)
                f.requires_grad = true
                f.grad_fn = grad_fn

          elif `resultIdent` is seq:
            grad_fn.outputs = `resultIdent`
            for i in 0 ..< `resultIdent`.len:
              let r = `resultIdent`[i]
              when r is Tensor:
                r.requires_grad = true
                r.grad_fn = grad_fn

proc use_count*(x: Tensor): int = x.tensor.dynamicCppCall("get()->use_count").to(int)

proc newTensor*(): Tensor {.inline, noinit.} =
  new(result, proc(self: Tensor) = cppdtor(addr(self.tensor)))
  cppctor(addr(result.tensor))
  result.hasTensor = false
  result.tensor = undefinedTensor

proc newTensor*(a: ATensor): Tensor {.inline, noinit.} =
  new(result, proc(self: Tensor) = cppdtor(addr(self.tensor)))
  cppctor(addr(result.tensor))
  result.hasTensor = true
  result.tensor = a

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

iterator items*(ints: AIntList): ilsize {.inline.} =
  for i in 0 .. ints.high:
    yield ints[i]

proc toIntList(self: AIntList): IntList =
  result.setLen(self.len)
  # TODO: copymem
  for i in 0 ..< self.len:
    result[i] = self[i].int

proc toAIntList[T: SomeInteger](self: openarray[T]): AIntList =
  when T is ilsize:
    let temp = cppinit(AIntList, cast[ptr ilsize](unsafeaddr(self[0])), self.len.csize)
    return temp
  else:
    var converted = newSeq[ilsize](self.len)
    for i, value in self:
      converted[i] = value.ilsize
    let temp = cppinit(AIntList, cast[ptr ilsize](unsafeaddr(converted[0])), self.len.csize)
    return temp

proc newTensors(nativeTensor: ATensor): Tensor {.inline.} = nativeTensor.newTensor()

proc newTensors(nativeTensors: ATensors): TensorList {.inline.} =
  result.setLen(nativeTensors.len)
  for i in 0 ..< result.len:
    result[i] = nativeTensors[i].newTensor()

macro newTensors(nativeTensors: tuple): untyped = 
  let T = nativeTensors.getType()
  T.expectKind(nnkBracketExpr)

  result = nnkTupleConstr.newTree()
  for i in 1 ..< T.len:
    let index = i - 1
    result.add quote do:
      newTensors(`nativeTensors`[`index`])

template firstOrSelf(self: tuple): untyped = self[0]
template firstOrSelf(self: not tuple): untyped = self

include torch/declarations

proc toIntListType*(x: int): ilsize {.inline.} = x.ilsize

var defaultType = FloatTensor

proc set_default_dtype*(dtype: TensorKind) {.inline.} = defaultType = dtype
proc get_default_dtype*(): TensorKind {.inline.} = defaultType

proc is_cuda*(self: TensorType): bool =
  when defined cuda:
    return self.dynamicCppCall("is_cuda").to(bool)
  else:
    return false

proc toATenType(kind: TensorKind): AScalarType {.inline.} =
  case kind
  of FloatTensor: return ATkFloat
  of DoubleTensor: return ATkDouble
  of HalfTensor: return ATkHalf
  of ByteTensor: return ATkByte
  of CharTensor: return ATkChar
  of ShortTensor: return ATkShort
  of IntTensor: return ATkInt
  of LongTensor: return ATkLong
  else: raiseAssert("Unknown type")

proc device*(deviceName: string): Device {.inline.} =
  case deviceName
  of "cpu", "CPU": return Device.CPU
  of "cuda", "CUDA": return Device.CUDA
  else: raiseAssert("Unknown device")

proc zeros*[T: SomeInteger](size: varargs[T]): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  return torch.zeros(size, opts)

proc zeros*(size: openarray[SomeInteger]; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.zeros(size, opts)

proc zeros*(size: openarray[SomeInteger]; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return torch.zeros(size, opts)

proc zeros*(size: openarray[SomeInteger]; dtype: TensorKind; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.zeros(size, opts)

proc ones*[T: SomeInteger](size: varargs[T]): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  return torch.ones(size, opts)

proc ones*(size: openarray[SomeInteger]; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.ones(size, opts)

proc ones*(size: openarray[SomeInteger]; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return torch.ones(size, opts)

proc ones*(size: openarray[SomeInteger]; dtype: TensorKind; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.ones(size, opts)

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

  # figure out size of array/seq
  var size = newSeq[ilsize]()
  for length in lenIter(data):
    size.add(length.ilsize)
  
  # make shape out of size
  let shape = size.toAIntList()
  
  # TODO avoid some of those copies and iterations
  
  # flatten and eventually cast data
  var flatData = toSeq(flatIter(data))
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(type(flatData[0]).toATenType()).dynamicCppCall(tensorFromBlob, addr(flatData[0]), shape).to(ATensor)
  
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
  let temp = cppinit(TensorOptions, tensorType.toCpp)
  return temp

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

proc sqrt*(b: SomeFloat): SomeFloat {.inline, noinit.} = math.sqrt(b)

proc ndimension*(a: Tensor): int {.inline, noinit.} = a.tensor.dynamicCppCall(ndimension).to(int64).int

proc dim*(a: Tensor): int {.inline, noinit.} = a.tensor.dynamicCppCall(dim).to(int64).int

proc `[]`*(a: Tensor; index: int): Tensor {.inline, noinit.} =
  newTensor a.tensor.toCpp()[index].to(ATensor)

proc `[]=`*(a: Tensor; index: int; b: Tensor) {.inline.} =
  a.tensor.toCpp()[index] = b.tensor

proc `[]`*(a: Tensor; index: Tensor): Tensor {.inline, noinit.} =
  newTensor a.tensor.toCpp()[index.tensor].to(ATensor)

proc `[]=`*(a: Tensor; index: Tensor; b: Tensor) {.inline.} =
  a.tensor.toCpp()[index.tensor] = b.tensor

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
        indexTensor = torch.range(0.float, sizeOne.float, LongTensor)
      `resSym`.index_put_inplace([indexTensor], `value`)
    else:
      let
        sizeOne = `resSym`.sizes()[0] - 1
        indexTensor = torch.range(0.float, sizeOne.float, LongTensor)
      `resSym`.index_put_inplace([indexTensor], torch.full_like(`resSym`, `value`.float, `resSym`.options()))

include torch/autograd_helpers
include torch/native/convolutions
include torch/derivatives

macro chunk*(self: Tensor; chunks: static[int]; dim: int): untyped =
  var tensors = genSym()
  var tupleTree = nnkTupleConstr.newTree()

  for i in 0 ..< chunks:
    tupleTree.add quote do:
      `tensors`[`i`]
  
  result = quote do:
    let `tensors` = `self`.chunk(`chunks`, `dim`.int64)
    `tupleTree`

proc `$`*(a: Tensor): string {.inline, noinit.} =
  var sstream = cppinit(OStringStream)
  dynamicCCall("at::print", sstream, a.tensor, 80).to(void)
  let
    stdstr = sstream.str().to(StdString)
    res = stdstr.c_str().to(cstring)
  return $res

proc print*(a: Tensor) = echo a

proc toSeq*[T](a: Tensor): seq[T] {.inline, noinit.} =
  let elements = a.numel()
  result = newSeq[T](elements)

  if a.is_cuda():
    var tmp = a.cpu()
    copyMem(addr(result[0]), tmp.data_ptr(), sizeof(T) * elements)
  else:
    copyMem(addr(result[0]), a.data_ptr(), sizeof(T) * elements)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]; device: Device): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: result = newTensor ACUDA(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]; dtype: TensorType): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)

  result = newTensor ACPU(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]; dtype: TensorType; device: Device): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  case device:
    of Device.CUDA: result = newTensor ACUDA(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
    of Device.CPU: result = newTensor ACPU(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc toTensor*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]): Tensor {.inline.} = internalFromArray(s, size)
proc toTensor*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]; device: Device): Tensor {.inline.} = internalFromArray(s, size, device)
proc toTensor*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]; dtype: TensorKind): Tensor {.inline.} = internalFromArray(s, size, dtype)
proc toTensor*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]; dtype: TensorKind; device: Device): Tensor {.inline.} = internalFromArray(s, size, dtype, device)

converter toFloat32*(a: Tensor): float32 {.inline, noinit.} =
  doAssert(a.numel() == 1, "Trying to call converter toFloat32 on a multi element tensor")
  proc scalarToF32(s: AScalar): float32 {.importcpp: "#.to<float>()".}
  let scalar = cppinit(AScalar, a.tensor)
  return scalar.scalarToF32()

proc internalManualSeed(seed: int) =
  globalContext().defaultGenerator(DeviceTypeCPU).manualSeed(seed).to(void)
  if globalContext().hasCUDA().to(bool):
    globalContext().defaultGenerator(DeviceTypeCUDA).manualSeed(seed).to(void)

proc manual_seed*(seed: int) = internalManualSeed(seed)

proc set_num_threads*(num: int) {.importcpp: "at::set_num_threads(#)", header: "ATen/ATen.h".}

proc get_num_threads*(): int {.importcpp: "at::get_num_threads()".}

proc detach_inplace*(self: Tensor): Tensor {.discardable.} =
  self.grad_fn = nil
  self.requires_grad = false
  return self

proc detach*(self: Tensor): Tensor =
  result = self.clone()
  result.detach_inplace()

iterator reverse*[T](a: openarray[T]): T =
  for i in countdown(a.high, 0):
    yield a[i]

proc backward*(tensors, grads: openarray[Tensor]) =

  when defined inference:
    raiseAssert("Backward pass is not supported in inference mode")
  
  else:
    var
      sortedNodes: seq[Tensor]
      gradFuncs: HashSet[pointer]

    gradFuncs.init()

    proc visit(node: Tensor) =
      # Gradient along this path is not needed
      if not node.requires_grad:
        return

      # If the gradient is needed, initialize it
      node.grad = torch.zeros_like(node)

      # Gradient is not defined, so don't evaluate inputs
      if node.grad_fn == nil:
        return

      # Already executed this backward function through this node,
      # or another output of this function
      if gradFuncs.containsOrIncl(cast[pointer](node.grad_fn)):
        return

      for input in node.grad_fn.inputs:
        visit(input)

      sortedNodes.add(node)

    # Topologically sort the graph
    for node in tensors:
      visit(node)

    # Set initial gradients
    for i, tensor in tensors:
      tensor.grad = grads[i]

    # Accumulate grads
    for node in sortedNodes.reverse:
      # TODO: handle multiple output gradients
      var grad_outputs: seq[Tensor]
      for output in node.grad_fn.outputs:
        grad_outputs.add(output.grad)

      let grad_inputs = node.grad_fn.apply(grad_outputs)
      for i, input in node.grad_fn.inputs:
        if input.requires_grad:
          input.grad += grad_inputs[i].sum_to(input.grad.sizes)
    
    # Issue #16, GC being lazy about cleaning up garbage
    GC_fullCollect()

proc backward*(tensor, grad: Tensor) =
  backward([tensor], [grad])

proc backward*(tensor: Tensor) =
  backward(tensor, ones_like(tensor))

when isMainModule:
  var
    z = torch.zeros(@[2, 1, 4])

    x = torch.tensor([
        [
          [ 0.1,  0.2,  0.3,  0.4],
          [-0.1, -0.2, -0.3, -0.4],
          [ 0.5,  0.6,  0.7,  0.8]
        ],
        [
          [ 0.1,  0.2,  0.3,  0.4],
          [-0.1, -0.2, -0.3, -0.4],
          [ 0.5,  0.6,  0.7,  0.8]
        ]
      ])

    hidden = torch.tensor([
        [
          [ -1.0, -1.0],
          [ -1.0, -1.0],
          [ -1.0, -1.0]
        ],
        [
          [ -1.0, -1.0],
          [ -1.0, -1.0],
          [ -1.0, -1.0]
        ]
      ])

    w_input = torch.tensor([
        [
          [0.9, 0.8, 0.7, 0.6],
          [0.8, 0.7, 0.6, 0.5],
          [0.7, 0.6, 0.5, 0.4],
          [0.6, 0.5, 0.4, 0.3],
          [0.5, 0.4, 0.3, 0.2],
          [0.4, 0.3, 0.2, 0.1]
        ],
        [
          [0.9, 0.8, 0.7, 0.6],
          [0.8, 0.7, 0.6, 0.5],
          [0.7, 0.6, 0.5, 0.4],
          [0.6, 0.5, 0.4, 0.3],
          [0.5, 0.4, 0.3, 0.2],
          [0.4, 0.3, 0.2, 0.1]
        ]
      ])

    w_recur = torch.tensor([
        [
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
        ],
        [
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
        ]
      ])

    b_input = torch.tensor([
        [
          [0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
        ],
        [
          [0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
        ]
      ])

    b_recur = torch.tensor([
        [
          [-0.1, -0.2, -0.3, -0.4, -0.5, -0.6],
        ],
        [
          [-0.1, -0.2, -0.3, -0.4, -0.5, -0.6],
        ]
      ])

  z.print()
  x.print()
  echo z.size(0)

  var emptyTensor: Tensor

  let zmul = z * 3

  # grucell
  var
    gi = x.matmul(w_input.transpose(1, 2)) + b_input
    gh = hidden.matmul(w_recur.transpose(1, 2)) + b_recur
    (i_r, i_i, i_nn) = gi.chunk(3, 2)
    (h_r, h_i, h_n) = gh.chunk(3, 2)
    resetgate = (i_r + h_r).sigmoid()
    presigmoid = i_i + h_i
    inputgate = presigmoid.sigmoid()
    newgate = (i_nn + resetgate * h_n).tanh()
    hy = newgate + inputgate * (hidden - newgate)
  
  hy.print()

  var hycopy = hy.copy()

  var longt = torch.zeros(@[1, 1, 1], dtype = LongTensor)
  longt.print()

  var ht = torch.zeros(@[1, 1, 1], dtype = ByteTensor)
  ht.print()

  var tensorList: TensorList
  tensorList = @[z, x]
  for i in 0..tensorList.high:
    tensorList[i].print()
  
  var
    c0 = torch.tensor([1.0, 0.0])
    c1 = torch.tensor([0.2, 1.1])
    c2 = torch.cat(@[c0, c1])
  
  echo "cat test:"
  c2.print()
  
  # var tupleTest = torch.multilabel_margin_loss_forward(c0, c1, 0)
  
  var intList: IntList = @[10, 20, 30]
  for i in 0..intList.high:
    echo "IntList[", i, "] = ", intList[i]
  
  for item in intList:
    echo item

  var
    tos = toSeq[float32](hy)
    froms = tos.toTensor(2, 3, 2)
    
  # var (ra, rb) = torch.prelu_backward(gi, gh, hy, @[true, true])
  
  echo tos
  froms.print()

  var accessorsTest = torch.zeros(@[5, 2, 3])
  # echo accessorsTest.sizes()[0]
  # var act1s = accessorsTest.select(1, 0)
  # var act2s = accessorsTest.select(1, 1)
  var act1 = accessorsTest[_, 0]
  var act2 = accessorsTest[_, 1]
  # var indexTensor = torch.range(0.float, 4.float, LongTensor)
  # act1.index_put_inplace([indexTensor], torch.full_like(act1, 10.float))
  # act2.index_put_inplace([indexTensor], torch.full_like(act1, 100.float))
  accessorsTest[_, 0] = 10
  accessorsTest[_, 1] = 100
  accessorsTest[_, _, 2] = 1020
  echo accessorsTest
  
  when defined cuda:
    if globalContext().hasCUDA().to(bool):
      echo "Cuda available"
      echo "Cuda device ", globalContext().current_device().to(int)
      var cudaTensor = torch.zeros(@[7, 7, 7], device = torch.device("cuda"), dtype = DoubleTensor)
      cudaTensor.print()

      froms = froms.cuda()
      froms.print()

      x = x.cuda()
      hidden = hidden.cuda()
      b_input = b_input.cuda()
      b_recur = b_recur.cuda()
      w_input = w_input.cuda()
      w_recur = w_recur.cuda()
      gi = x.matmul(w_input.transpose(1, 2)) + b_input
      gh = hidden.matmul(w_recur.transpose(1, 2)) + b_recur
      (i_r, i_i, i_nn) = gi.chunk(3, 2)
      (h_r, h_i, h_n) = gh.chunk(3, 2)
      resetgate = (i_r + h_r).sigmoid()
      presigmoid = i_i + h_i
      inputgate = torch.sigmoid(presigmoid)
      newgate = (i_nn + resetgate * h_n).tanh()
      hy = newgate + inputgate * (hidden - newgate)

      hy.print()
  
  # tensor([[-0.5317, -0.4753],
  #         [-0.3930, -0.3210],
  #         [-0.7325, -0.6430]])

  when not defined inference:
    var a = tensor([
      [1, 2],
      [3, 4]
    ])

    var b = tensor([
      [5, 6],
      [8, 7]
    ])
  
    a.requires_grad = true
    let a1 = sin(a)
    echo a1.requires_grad
    a1.backward()
    print a.grad

  block:
    var opts: TensorOptions
    opts.dtype(defaultType.toATenType()).to(void)
  
    let
      in_channels = 1
      out_channels = 1
      input = randn([1, in_channels, 100, 100], opts)
      weight = randn([out_channels, in_channels, 10, 10], opts)
      bias = randn([out_channels], opts)

    weight.requires_grad = true
    bias.requires_grad = true

    let
      x = conv2d(input, weight, bias, [1, 1], [0, 0], [1, 1], 1)
      
    x.backward()
    echo weight.grad.sizes()
