include torch/torch_cpp
import macros, sequtils, math, queues

type
  Tensor* = ref object
    hasTensor: bool
    tensor: ATensor

    requires_grad*: bool
    grad_fn: BackwardFunction
    grad: Tensor
    inputs: seq[Tensor]
    
  TensorType* = AType
  TensorOptions* = ATensorOptions
  TensorList* = ATensors
  IntList* = AIntList
  
  Device* {.pure.} = enum
    CPU, CUDA
  
  TensorKind* = enum
    FloatTensor, DoubleTensor, HalfTensor, ByteTensor,
    CharTensor, ShortTensor, IntTensor, LongTensor

  BackwardFunction* = proc(grads: openarray[Tensor]): seq[Tensor]

var undefinedTensor: ATensor

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

proc high*(v: TensorList): int {.inline.} = v.size().to(int) - 1

proc len*(v: TensorList): int {.inline.} = v.size().to(int)

proc get*(v: TensorList; index: int): Tensor {.inline, noinit.} =
  result = newTensor v.toCpp[index].to(ATensor)

proc `[]`*(v: TensorList; index: int): Tensor {.inline, noinit.} = v.get(index)

proc `[]=`*(v: TensorList; index: int; value: Tensor) {.inline.} = v.toCpp[index] = value.tensor

proc add*(v: TensorList; value: Tensor) {.inline.} = v.push_back(value.tensor).to(void)

iterator items*(tensors: TensorList): Tensor {.inline.} =
  var cppTensors = tensors
  for x in cppItems[TensorList, Tensor](cppTensors):
    yield x
    
proc `@`*[IDX](a: array[IDX, Tensor]): TensorList =
  for tensor in a:
    result.add(tensor)

converter toTensorList*(tensors: openarray[Tensor]): TensorList =
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
proc newTensors(nativeTensor: ATensor): Tensor {.inline.} = nativeTensor.newTensor()

proc newTensors(nativeTensors: TensorList): untyped = nativeTensors

macro newTensors(nativeTensors: tuple): untyped = 
  let T = nativeTensors.getType()
  T.expectKind(nnkBracketExpr)

  result = nnkTupleConstr.newTree()
  for i in 1 ..< T.len:
    let index = i - 1
    result.add quote do:
      newTensors(`nativeTensors`[`index`])

include torch/declarations

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

proc device*(deviceName: string): Device {.inline.} =
  case deviceName
  of "cpu", "CPU": return Device.CPU
  of "cuda", "CUDA": return Device.CUDA
  else: raiseAssert("Unknown device")

proc zeros*(intList: IntList): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  return torch.zeros(intList, opts)

proc zeros*(intList: IntList; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.zeros(intList, opts)

proc zeros*(intList: IntList; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return torch.zeros(intList, opts)

proc zeros*(intList: IntList; dtype: TensorKind; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.zeros(intList, opts)

proc ones*(intList: IntList): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  return torch.ones(intList, opts)

proc ones*(intList: IntList; device: Device): Tensor =
  var opts: TensorOptions
  opts.dtype(defaultType.toATenType()).to(void)
  case device
  of CUDA: opts.device(DeviceTypeCUDA.toCpp).to(void)
  of CPU: opts.device(DeviceTypeCPU.toCpp).to(void)
  return torch.ones(intList, opts)

proc ones*(intList: IntList; dtype: TensorKind): Tensor =
  var opts: TensorOptions
  opts.dtype(dtype.toATenType()).to(void)
  return torch.ones(intList, opts)

proc ones*(intList: IntList; dtype: TensorKind; device: Device): Tensor =
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

proc tensor*(data: openarray; dtype: TensorKind; device: Device = Device.CPU; dummy_bugfix: static[int] = 0;): Tensor {.inline, noinit.} =
  # as noticed in Arraymancer as well:
  ## Note: dummy_bugfix param is unused and is a workaround a Nim bug.
  # TODO: remove 'dummy_bugfix' - https://github.com/nim-lang/Nim/issues/6343

  # figure out size of array/seq
  var size = newSeq[ilsize]()
  for length in lenIter(data):
    size.add(length.ilsize)
  
  # make shape out of size
  let shape = cppinit(AIntList, cast[ptr ilsize](addr(size[0])), size.len.csize)
  
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

proc getType*(a: Tensor): TensorType {.inline.} =
  assert(a.hasTensor)
  return a.tensor.dynamicCppCall("type").to(TensorType)

converter toTensorOptions*(tensorType: TensorType): TensorOptions =
  result = cppinit(TensorOptions, tensorType.toCpp)

proc cpu*(a: Tensor): Tensor {.inline, noinit.} =
  newTensor a.tensor.dynamicCppCall(toBackend, BackendCPU).to(ATensor)

proc cuda*(a: Tensor): Tensor {.inline, noinit.} =
  newTensor a.tensor.dynamicCppCall(toBackend, BackendCUDA).to(ATensor)

proc copy*(a: Tensor; non_blocking: bool = false): Tensor {.inline, noinit.} =
  newTensor a.tensor.dynamicCppCall("type").dynamicCppCall("copy", a.tensor, non_blocking).to(ATensor)

proc is_defined*(a: Tensor): bool {.inline.} = a.tensor.dynamicCppCall("defined").to(bool)

proc sizes*(a: Tensor): IntList {.inline.} = a.tensor.dynamicCppCall("sizes").to(IntList)

proc strides*(a: Tensor): IntList = a.tensor.dynamicCppCall("strides").to(IntList)

proc `-`*(a: Tensor): Tensor {.inline, noinit.} =
  newTensor (-(a.toCpp)).to(ATensor)

proc `+`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp + b.tensor.toCpp).to(ATensor)

proc `<=`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp <= b.tensor.toCpp).to(ATensor)

proc `<`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp < b.tensor.toCpp).to(ATensor)

proc `>`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp > b.tensor.toCpp).to(ATensor)

proc `>=`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp >= b.tensor.toCpp).to(ATensor)

proc `<=`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp <= b.float.toCpp).to(ATensor)

proc `>=`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp >= b.float.toCpp).to(ATensor)

proc `+`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp + b.float.toCpp).to(ATensor)

proc `+`*(a: SomeNumber; b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.float.toCpp + b.tensor.toCpp).to(ATensor)

proc `*`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp * b.float.toCpp).to(ATensor)

proc `*`*(a: SomeNumber; b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.float.toCpp * b.tensor.toCpp).to(ATensor)

proc `/`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp / b.tensor.toCpp).to(ATensor)

proc `/`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp / b.float.toCpp).to(ATensor)

proc `/`*(a: SomeNumber; b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.float.toCpp / b.tensor.toCpp).to(ATensor)

proc `*`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp * b.tensor.toCpp).to(ATensor)

proc `-`*(a, b: Tensor): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp - b.tensor.toCpp).to(ATensor)

proc `-`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp - b.float.toCpp).to(ATensor)

proc `==`*(a: Tensor; b: SomeNumber): Tensor {.inline, noinit.} =
  newTensor (a.tensor.toCpp == b.float.toCpp).to(ATensor)

proc `==`*(a, b: Tensor): bool {.inline.} =
  cast[pointer](a) == cast[pointer](b)

proc `+=`*(a, b: Tensor) {.inline.} =
  a.tensor.toCpp += b.tensor.toCpp

proc `-=`*(a, b: Tensor) {.inline.} =
  a.tensor.toCpp += b.tensor.toCpp

proc sqrt*(b: SomeFloat): SomeFloat {.inline, noinit.} = math.sqrt(b)

proc ndimension*(a: Tensor): int64 {.inline, noinit.} = a.tensor.dynamicCppCall(ndimension).to(int64)

proc dim*(a: Tensor): int64 {.inline, noinit.} = a.tensor.dynamicCppCall(dim).to(int64)

proc `$`*(a: Tensor): string {.inline, noinit.} = $a.tensor.dynamicCppCall(toString).to(cstring)

proc `[]`*(a: Tensor; index: int): Tensor {.inline, noinit.} =
  newTensor a.tensor.toCpp()[index].to(ATensor)

proc `[]=`*(a: Tensor; index: int; b: Tensor) {.inline.} =
  a.tensor.toCpp()[index] = b.tensor

macro chunk*(a: Tensor; chunks: static[int]; dim: int): untyped =
  # dumpAstGen:
  #   proc helper(a: Tensor): (Tensor, Tensor) {.gensym.} =
  #     let tensors = a.tensor.dynamicCppCall(chunk, chunks, dim).to(TensorList)
  #     return (tensors.get(0), tensors.get(1), tensors.get(3))
  #   helper(a)

  var tensors = genSym()
  var tupleTree = nnkTupleConstr.newTree()

  for i in 0..<chunks:
    tupleTree.add(
      nnkCall.newTree(
        nnkDotExpr.newTree(
          tensors,
          newIdentNode("get")
        ),
        newLit(i)
      )
    )
  
  result = quote do:
    let `tensors` = `a`.tensor.dynamicCppCall("chunk", `chunks`, `dim`).to(TensorList)
    assert(`tensors` is TensorList)
    `tupleTree`

proc print*(a: Tensor) =
  printTensor(a.tensor)
  echo ""

proc toSeq*[T](a: Tensor): seq[T] {.inline, noinit.} =
  let elements = a.numel()
  result = newSeq[T](elements)

  if a.is_cuda():
    var tmp = a.cpu()
    copyMem(addr(result[0]), tmp.data_ptr(), sizeof(T) * elements)
  else:
    copyMem(addr(result[0]), a.data_ptr(), sizeof(T) * elements)

proc internalFromSeq*[T](s: var seq[T], size: openarray[ilsize]): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromSeq*[T](s: var seq[T], size: openarray[ilsize]; device: Device): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: result = newTensor ACUDA(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromArray*[T](s: var openarray[T], size: openarray[ilsize]; device: Device): Tensor {.inline, noinit.} =
  let shape = cppinit(AIntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU(T.toATenType()).dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: result = newTensor ACUDA(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: result = newTensor ACPU(T.toATenType()).dynamicCppCall(copy, tmp).to(ATensor)

proc fromSeq*[T; I: SomeInteger](s: var seq[T], size: varargs[I, toIntListType]): Tensor {.inline.} = internalFromSeq(s, size)
proc fromSeq*[T; I: SomeInteger](s: var seq[T], size: varargs[I, toIntListType]; device: Device): Tensor {.inline.} = internalFromSeq(s, size, device)
proc fromArray*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]): Tensor {.inline.} = internalFromArray(s, size)
proc fromArray*[T; I: SomeInteger](s: var openarray[T], size: varargs[I, toIntListType]; device: Device): Tensor {.inline.} = internalFromArray(s, size, device)

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

proc backward*(tensors, grads: openarray[Tensor]) =

  var
    remainingNodes = initQueue[Tensor]()
    sortedNodes: seq[Tensor]

  for i in 0 ..< tensors.len:
    remainingNodes.enqueue(tensors[i])
    tensors[i].grad = grads[i]

  # Topologically sort the graph
  while remainingNodes.len > 0:
    let node = remainingNodes.dequeue()

    # Already visited
    # TODO: Use hashset
    if sortedNodes.contains(node):
      continue

    # Gradient along this path is not defined or needed
    if not node.requires_grad or node.grad_fn == nil:
      continue

    sortedNodes.add(node)
    node.grad = torch.zeros_like(node)

    for input in node.inputs:
      remainingNodes.enqueue(input)

  # Accumulate grads
  for node in sortedNodes:
    # TODO: Input mask
    let grads = node.grad_fn([node.grad])
    for i, input in node.inputs:
      if input.requires_grad:
        input.grad += grads[i]

proc backward*(tensor: Tensor) =
  backward([tensor], [torch.ones_like(tensor)])

macro function(head, body: untyped): untyped =
  for child in body:
    child.expectKind(nnkCommand)

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

  var emptyTensor: Tensor

  let zmul = z * 3

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
    froms = tos.fromSeq(2, 3, 2)
    
  # var (ra, rb) = torch.prelu_backward(gi, gh, hy, @[true, true])
  
  echo tos
  froms.print()
  
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
  
  torch.manual_seed(1)

  # tensor([[-0.5317, -0.4753],
  #         [-0.3930, -0.3210],
  #         [-0.7325, -0.6430]])

macro autograd(head, body: untyped): untyped =

  result = newStmtList()

  head.expectKind(nnkInfix)
  assert head[0] == ident"->"

  head[1].expectKind(nnkObjConstr)
  let name = nnkPostfix.newTree(ident"*", head[1][0])

  var params: seq[NimNode]
  params.add head[2]
  
  for i in 1 ..< head[1].len:
    let arg = head[1][i]
    arg.expectKind(nnkExprColonExpr)
    params.add newIdentDefs(arg[0], arg[1], newEmptyNode())
  
  let
    resultIdent = ident"result"
    gradsIdent = ident"grads"
    forwardBody = newStmtList()
    backwardBody = newStmtList()

  # Make `grad` available in derivative expressions, as alias for `grads[0]`
  backwardBody.add quote do:
    template grad: Tensor = `gradsIdent`[0]

  var resultIndex = 0
  for x in body:
    x.expectKind({ nnkCall, nnkPar })
    let varIdent = x[0]

    case x.kind:
      of nnkCall: discard
      of nnkPar: discard
      else: echo x.kind

    if varIdent == ident"result":
      let forwardExpr = newStmtList(x[1])
      forwardBody.add quote do:
        `resultIdent` = `forwardExpr`
      let forwardProc = newProc(name, params, forwardBody)
      result.add(forwardProc)

    else:
      x[0].expectKind({ nnkIdent, nnkPar })

      # Simply assign non-tuples
      var resultExpr: NimNode
      if x[0].kind == nnkIdent:
        resultExpr = quote do: `resultIdent`[`resultIndex`] 
        inc resultIndex

      # Deconstruct result tuple
      else:
        resultExpr = newPar()
        for r in x[0]:
          resultExpr.add quote do: `resultIdent`[`resultIndex`] 
          inc resultIndex

      let gradExpr = x[1]
      backwardBody.add quote do:
        #if `varIdent`.requires_grad: `resultIdent`[`resultIndex`] = `gradExpr`
        `resultExpr` = `gradExpr`

  forwardBody.add quote do:
    let fn = proc(`gradsIdent`: openarray[Tensor]): seq[Tensor] = `backwardBody`
    when `resultIdent` is Tensor:
      `resultIdent`.grad_fn = fn
    else: {.error.}

proc test_fwd(self, other: Tensor): Tensor = discard
proc test_bwd(self: Tensor): Tensor = discard

expandMacros:
  autograd test(self: Tensor, other: Tensor, i: int) -> Tensor:
    result: test_fwd(self, other)
    self: grad
    (other, lol): test_bwd(grad)