include nimtorch/torch_cpp
import macros, sequtils, math

type
  Tensor* = ATensor
  TensorType* = AType
  TensorOptions* = ATensorOptions
  TensorList* = ATensors
  IntList* = AIntList
  torch* = distinct pointer
  
  Device* {.pure.} = enum
    CPU, CUDA
  
  TensorKind* = enum
    FloatTensor, DoubleTensor, HalfTensor, ByteTensor, 
    CharTensor, ShortTensor, IntTensor, LongTensor

proc high*(v: TensorList): int {.inline.} = v.size().to(int) - 1

proc len*(v: TensorList): int {.inline.} = v.size().to(int)

proc `[]`*(v: TensorList; index: int): Tensor {.inline.} = v.toCpp[index].to(Tensor)

proc `[]=`*(v: TensorList; index: int; value: Tensor) {.inline.} = v.toCpp[index] = value

proc add*(v: TensorList; value: Tensor) {.inline.} = v.push_back(value).to(void)

iterator items*(tensors: TensorList): Tensor {.inline.} =
  var cppTensors = tensors
  for x in cppItems[TensorList, Tensor](cppTensors):
    yield x
    
proc `@`*[IDX](a: array[IDX, Tensor]): TensorList =
  for tensor in a:
    result.add(tensor)
    
converter toTensorSeq*(tensors: TensorList): seq[Tensor] =
  sequtils.toSeq(tensors.items)
  
converter toTensorList*(tensors: seq[Tensor]): TensorList =
  for tensor in tensors:
    result.add(tensor)

proc high*(v: IntList): int {.inline.} = v.size().to(int) - 1

proc len*(v: IntList): int {.inline.} = v.size().to(int)

proc `[]`*(v: IntList; index: int): int64 {.inline.} = v.toCpp[index].to(int64)

proc `[]=`*(v: IntList; index: int; value: int64) {.inline.} = v.toCpp[index] = value

iterator items*(ints: IntList): int64 {.inline.} =
  for i in 0..ints.high:
    yield ints[i]

# ArrayRef (IntList) does not store data, so we need this magic trick
template `@`*[IDX](a: array[IDX, SomeInteger]): IntList =
  var res {.noinit.}: array[IDX, ilsize]
  for i in 0..a.high:
    res[i] = a[i].ilsize
  # cannot use cppinit for some reasons
  dynamicCCall("at::IntList", cast[ptr ilsize](addr(res)), res.len.csize)

# Auto generated #
# append all the auto generated procs
include nimtorch/declarations

proc toIntListType*(x: int): ilsize {.inline.} = x.ilsize

var defaultType = FloatTensor

proc set_default_dtype*(dtype: TensorKind) {.inline.} = defaultType = dtype
proc get_default_dtype*(): TensorKind {.inline.} = defaultType

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

proc device*(_: typedesc[torch]; deviceName: string): Device {.inline.} =
  case deviceName
  of "cpu", "CPU": return Device.CPU
  of "cuda", "CUDA": return Device.CUDA
  else: raiseAssert("Unknown device")

proc zeros*(_: typedesc[torch]; intList: IntList): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  return torch.zeros(intList, opts)

proc zeros*(_: typedesc[torch]; intList: IntList; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.zeros(intList, opts)

proc zeros*(_: typedesc[torch]; intList: IntList; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return torch.zeros(intList, opts)

proc zeros*(_: typedesc[torch]; intList: IntList; dtype: TensorKind; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.zeros(intList, opts)

proc ones*(_: typedesc[torch]; intList: IntList): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  return torch.ones(intList, opts)

proc ones*(_: typedesc[torch]; intList: IntList; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.ones(intList, opts)

proc ones*(_: typedesc[torch]; intList: IntList; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return torch.ones(intList, opts)

proc ones*(_: typedesc[torch]; intList: IntList; dtype: TensorKind; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.ones(intList, opts)

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

proc tensor*(_: typedesc[torch]; data: openarray; dtype: TensorKind; device: Device = Device.CPU; dummy_bugfix: static[int] = 0;): Tensor {.inline.} =
  # as noticed in Arraymancer as well:
  ## Note: dummy_bugfix param is unused and is a workaround a Nim bug.
  # TODO: remove 'dummy_bugfix' - https://github.com/nim-lang/Nim/issues/6343

  # figure out size of array/seq
  var size = newSeq[ilsize]()
  for length in lenIter(data):
    size.add(length)
  
  # make shape out of size
  let shape = cppinit(AIntList, cast[ptr ilsize](addr(size[0])), size.len.csize)
  
  # TODO avoid some of those copies and iterations
  
  # flatten and eventually cast data
  var flatData = toSeq(flatIter(data))
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(type(flatData[0]).toATenType()).dynamicCppCall(tensorFromBlob, addr(flatData[0]), shape).to(ATensor)
  
  # finally write into a tensor (notice: casting happens aten side!)
  case device:
  of Device.CUDA: return ACUDA(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: return ACPU(dtype.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc tensor*(_: typedesc[torch]; data: openarray; device: Device = Device.CPU; dummy_bugfix: static[int] = 0;): Tensor {.inline.} =
  return tensor(torch, data, defaultType, device)

template getType*(tensor: Tensor): TensorType = tensor.dynamicCppCall("type").to(TensorType)

converter toTensorOptions*(tensorType: TensorType): TensorOptions =
  result = cppinit(TensorOptions, tensorType.toCpp)

template cpu*(tensor: Tensor): Tensor = tensor.dynamicCppCall(toBackend, BackendCPU).to(ATensor)

template cuda*(tensor: Tensor): Tensor = tensor.dynamicCppCall(toBackend, BackendCUDA).to(ATensor)

template copy*(tensor: Tensor; non_blocking: bool = false): Tensor = tensor.dynamicCppCall("type").dynamicCppCall("copy", tensor, non_blocking).to(ATensor)

template is_defined*(tensor: Tensor): bool = tensor.dynamicCppCall("defined").to(bool)

template sizes*(tensor: Tensor): IntList = tensor.dynamicCppCall("sizes").to(IntList)

template strides*(tensor: Tensor): IntList = tensor.dynamicCppCall("strides").to(IntList)

template `-`*(a): Tensor = (-(a.toCpp)).to(ATensor)

template `+`*(a, b: Tensor): Tensor = (a.toCpp + b.toCpp).to(ATensor)

template `<=`*(a, b: Tensor): Tensor = (a.toCpp <= b.toCpp).to(ATensor)

template `>=`*(a, b: Tensor): Tensor = (a.toCpp >= b.toCpp).to(ATensor)

template `<=`*(a: Tensor; b: SomeNumber): Tensor = (a.toCpp <= b.float.toCpp).to(ATensor)

template `>=`*(a: Tensor; b: SomeNumber): Tensor = (a.toCpp >= b.float.toCpp).to(ATensor)

template `+`*(a: Tensor; b: SomeNumber): Tensor = (a.toCpp + b.float.toCpp).to(ATensor)

template `*`*(a: Tensor; b: SomeNumber): Tensor = (a.toCpp * b.float.toCpp).to(ATensor)

template `*`*(a: SomeNumber; b: Tensor): Tensor = (a.float.toCpp * b.toCpp).to(ATensor)

template `/`*(a: Tensor; b: SomeNumber): Tensor = (a.toCpp / b.float.toCpp).to(ATensor)

template sqrt*(_: typedesc[torch]; b: SomeFloat): SomeFloat = math.sqrt(b)

proc maybe_multiply*(_: typedesc[torch]; a: Tensor; b: SomeNumber): Tensor {.inline.} =
  if b.float == 1.0:
    return a
  else:
    return a * b

proc mm_mat1_backward*(_: typedesc[torch]; grad, mat2: Tensor; sizes, strides: IntList; alpha: float): Tensor =
  if strides[0] == 1 and strides[1] == sizes[0]:
    return torch.maybe_multiply(mat2.mm(grad.t()).t(), alpha)
  else:
    return torch.maybe_multiply(grad.mm(mat2.t()), alpha)

proc mm_mat2_backward*(_: typedesc[torch]; grad, mat1: Tensor; sizes, strides: IntList; alpha: float): Tensor =
  if strides[0] == 1 and strides[1] == sizes[0]:
    return torch.maybe_multiply(grad.t().mm(mat1).t(), alpha)
  else:
    return torch.maybe_multiply(mat1.t().mm(grad), alpha)

template `==`*(a, b: Tensor): bool =  a.dynamicCppCall(equal, b).to(bool)

macro chunk*(a: Tensor; chunks, dim: int): untyped =
  # dumpAstGen:
  #   proc helper(a: Tensor): (Tensor, Tensor) {.gensym.} =
  #     let
  #       tensors = a.dynamicCppCall(chunk, chunks, dim).to(ATensors)
  #     return (tensors[0].to(ATensor), tensors[1].to(ATensor))
  #   helper(a)

  var tensors = genSym()
  var tupleTree = nnkTupleConstr.newTree()

  for i in 0..<chunks.intVal:
    tupleTree.add(nnkCall.newTree(
      nnkDotExpr.newTree(
        nnkBracketExpr.newTree(
          tensors,
          newLit(i)
        ),
        newIdentNode("to")
      ),
      newIdentNode("ATensor")
    ))

  result = quote do:
    let `tensors` = `a`.dynamicCppCall(chunk, `chunks`, `dim`).to(ATensors)
    `tupleTree`

template `*`*(a, b: Tensor): Tensor = (a.toCpp * b.toCpp).to(ATensor)

template `-`*(a, b: Tensor): Tensor = (a.toCpp - b.toCpp).to(ATensor)

template ndimension*(a: Tensor): int64 = a.dynamicCppCall(ndimension).to(int64)

template dim*(a: Tensor): int64 = a.dynamicCppCall(dim).to(int64)

template `$`*(a: Tensor): string = $a.dynamicCppCall(toString).to(cstring)

proc print*(a: Tensor) =
  printTensor(a)
  echo ""

proc toSeq*[T](a: Tensor): seq[T] {.inline.} =
  let elements = a.numel()
  result = newSeq[T](elements)

  if a.is_cuda():
    var tmp = a.cpu()
    copyMem(addr(result[0]), tmp.data_ptr(), sizeof(T) * elements)
  else:
    copyMem(addr(result[0]), a.data_ptr(), sizeof(T) * elements)

proc internalFromSeq*[T](s: var seq[T], size: openarray[ilsize]): Tensor {.inline.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  return ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromSeq*[T](s: var seq[T], size: openarray[ilsize]; device: Device): Tensor {.inline.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: return ACUDA(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: return ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]): Tensor {.inline.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  return ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]; device: Device): Tensor {.inline.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: return ACUDA(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: return ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc fromSeq*[T; I: SomeInteger](s: var seq[T], size: varargs[I, toIntListType]): Tensor {.inline.} = internalFromSeq(s, size)
proc fromSeq*[T; I: SomeInteger](s: var seq[T], size: varargs[I, toIntListType]; device: Device): Tensor {.inline.} = internalFromSeq(s, size, device)
proc fromArray*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]): Tensor {.inline.} = internalFromArray(s, size)
proc fromArray*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]; device: Device): Tensor {.inline.} = internalFromArray(s, size, device)

proc `[]`*(a: Tensor; index: int): Tensor {.inline.} = a.toCpp()[index].to(ATensor)

converter toFloat32*(a: Tensor): float32 {.inline.} =
  proc scalarToF32(s: AScalar): float32 {.importcpp: "#.to<float>()".}
  let scalar = cppinit(AScalar, a)
  return scalar.scalarToF32()

proc internalManualSeed(seed: int) =
  globalContext().defaultGenerator(DeviceTypeCPU).manualSeed(seed).to(void)
  if globalContext().hasCUDA().to(bool):
    globalContext().defaultGenerator(DeviceTypeCUDA).manualSeed(seed).to(void)

proc manual_seed*(_: typedesc[torch]; seed: int) = internalManualSeed(seed)

proc set_num_threads(num: int) {.importcpp: "at::set_num_threads(#)".}

proc set_num_threads*(_: typedesc[torch]; num: int) = set_num_threads(num)

proc get_num_threads*(_: typedesc[torch];): int {.importcpp: "at::get_num_threads()".}

when isMainModule:
  # LD_LIBRARY_PATH=../docker-cuda9.2-ubuntu18.04/output/lib nim cpp --nimcache=nimcache-native -d:cuda -o:nimcache-native/test -r torch.nim
  # nim cpp -d:wasm --nimcache=nimcache-wasm -o:nimcache-wasm/test.js torch.nim && node nimcache-wasm/test.js

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

  # grucell
  var
    gi = x.matmul(w_input.transpose(1, 2)) + b_input
    gh = hidden.matmul(w_recur.transpose(1, 2)) + b_recur
    (i_r, i_i, i_nn) = gi.chunk(3, 2)
    (h_r, h_i, h_n) = gh.chunk(3, 2)
    resetgate = (i_r + h_r).sigmoid_u()
    presigmoid = i_i + h_i
    inputgate = torch.sigmoid_u(presigmoid)
    newgate = (i_nn + resetgate * h_n).tanh_u()
    hy = newgate + inputgate * (hidden - newgate)
  
  hy.print()

  var longt = torch.zeros(@[1, 1, 1], dtype = LongTensor)
  longt.print()

  var ht = torch.zeros(@[1, 1, 1], dtype = ByteTensor)
  ht.print()

  when not defined wasm:
    var tensorList: TensorList
    var tensorSeq = newSeq[Tensor]()
    tensorSeq.add(z)
    tensorSeq.add(x)
    tensorList = tensorSeq
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
    froms = tos.fromSeq(2, 3, 2)
    
  var (ra, rb) = torch.prelu_backward(gi, gh, hy, @[true, true])
  

  echo tos
  froms.print()
  
  when defined cuda:
    if globalContext().hasCUDA().to(bool):
      echo "Cuda available"
      echo "Cuda device ", globalContext().current_device().to(int)
      var cudaTensor = torch.zeros(@[7, 7, 7], device = torch.device("cuda"), dtype = DoubleTensor)
      cudaTensor.printTensor()

      froms = froms.cuda()
      froms.printTensor()

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

      hy.printTensor()
  
  torch.manual_seed(1)

  # tensor([[-0.5317, -0.4753],
  #         [-0.3930, -0.3210],
  #         [-0.7325, -0.6430]])