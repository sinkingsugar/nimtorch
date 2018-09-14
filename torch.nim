include torch/torch_cpp
import macros, sequtils, math, queues, sets, strformat, options

{.experimental: "implicitDeref".}

type
  Tensor* = ref object
    hasTensor: bool
    tensor: ATensor

    requires_grad*: bool
    grad_fn: BackwardFunction
    grad: Tensor
    inputs: seq[Tensor]
    
  TensorType* = ptr AType
  TensorOptions* = ATensorOptions
  TensorList* = seq[Tensor]
  IntList* = seq[int]
  
  Device* {.pure.} = enum
    CPU, CUDA
  
  TensorKind* = enum
    FloatTensor, DoubleTensor, HalfTensor, ByteTensor,
    CharTensor, ShortTensor, IntTensor, LongTensor

  BackwardFunction* = proc(grads: openarray[Tensor]): seq[Tensor]

var undefinedTensor: ATensor

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
        for r in x[0]:
          r.expectKind(nnkIdent)
          resultExpr.add quote do: `resultIdent`[`resultIndex`]
          inputIdents.add(r)
          inc resultIndex

      let gradExpr = x[1]
      backwardBody.add quote do:
        when type(`gradExpr`) isnot TensorList:
          #if `varIdent`.requires_grad: `resultIdent`[`resultIndex`] = `gradExpr`
          `resultExpr` = `gradExpr`

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
    let fn = proc(`gradsIdent`: openarray[Tensor]): seq[Tensor] =
      `resultIdent`.setLen(`resultIndex`)
      `backwardBody`

    when `resultIdent` is Tensor:
      `resultIdent`.requires_grad = `requiresGradExpr`
      `resultIdent`.grad_fn = fn
      `resultIdent`.inputs = @[]
      when compiles(`resultIdent`.inputs.add(`inputIdents`)):
        `resultIdent`.inputs.add(`inputIdents`)
    else:
      error("Tuple returns not implemented")

# proc test_fwd(self, other: Tensor): Tensor = discard
# proc test_bwd(self: Tensor): Tensor = discard

# expandMacros:
#   autograd test:
#     proc forward(self: Tensor, other: Tensor, a: openarray[int]; i: int = 1): Tensor =
#       test_fwd(self, other)
#     self: grad
#     other: test_bwd(grad)

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

# proc `[]`*(v: AIntList; index: int): int64 {.inline.} = v.toCpp[index].to(int64)

#proc `[]=`*(v: AIntList; index: int; value: int64) {.inline.} = v.toCpp[index] = value

iterator items*(ints: AIntList): ilsize {.inline.} =
  for i in 0 .. ints.high:
    yield ints[i]

proc toIntList(self: AIntList): IntList =
  result.setLen(self.len)
  # TODO: copymem
  for i in 0 ..< self.len:
    result[i] = self[i].ilsize

proc toAIntList[T: SomeInteger](self: openarray[T]): AIntList =
  when T is ilsize:
    let temp = cppinit(AIntList, cast[ptr ilsize](unsafeaddr(self[0])), self.len.csize)
    return temp
  else:
    var converted = newSeq[ilsize](self.len)
    for i, value in self:
      converted[i] = value.ilsize
    let temp = cppinit(AIntList, cast[ptr ilsize](unsafeaddr(converted[0])), converted.len.csize)
    return temp

# Auto generated #
# append all the auto generated procs

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

proc cpu*(a: Tensor): Tensor {.inline, noinit.} =
  newTensor a.tensor.dynamicCppCall(toBackend, BackendCPU).to(ATensor)

proc cuda*(a: Tensor): Tensor {.inline, noinit.} =
  newTensor a.tensor.dynamicCppCall(toBackend, BackendCUDA).to(ATensor)

proc copy*(typ: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline, noinit.} =
  typ[].dynamicCppCall("copy", self.tensor, non_blocking).to(ATensor).newTensor()

proc copy*(self: Tensor; non_blocking: bool = false): Tensor {.inline, noinit.} =
  self.getType().copy(self, non_blocking)
  
proc is_defined*(a: Tensor): bool {.inline.} =
  a.tensor.dynamicCppCall("defined").to(bool)

proc sizes*(a: Tensor): IntList {.inline.} =
  a.tensor.dynamicCppCall("sizes").to(AIntList).toIntList()

proc strides*(a: Tensor): IntList {.inline.} =
  a.tensor.dynamicCppCall("strides").to(AIntList).toIntList()

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

proc `$`*(a: Tensor): string {.inline, noinit.} = $a.tensor.dynamicCppCall(toString).to(cstring)

proc `[]`*(a: Tensor; index: int): Tensor {.inline, noinit.} =
  newTensor a.tensor.toCpp()[index].to(ATensor)

proc `[]=`*(a: Tensor; index: int; b: Tensor) {.inline.} =
  a.tensor.toCpp()[index] = b.tensor

# proc infer_size*(shape: IntList; numel: int): IntList =
#   result = shape
#   var
#     newsize = 1
#     infer_dim = -1
  
#   for dim in 0 ..< shape.len:
#     if shape[dim] == -1:
#       if infer_dim >= 0:
#         raise newException(ValueError, "only one dimension can be inferred")
#       infer_dim = dim;
#     elif shape[dim] >= 0:
#       newsize *= shape[dim]
#     else:
#       raise newException(ValueError, "invalid shape dimension " & $shape[dim])

#   if numel == newsize or (infer_dim >= 0 and newsize > 0 and (numel mod newsize == 0)):
#     if infer_dim >= 0:
#       # we have a degree of freedom here to select the dimension size; follow NumPy semantics
#       # and just bail.
#       assert(newsize != 0, "cannot reshape tensor of 0 elements into shape " & $shape)
#       result[infer_dim] = numel div newsize
    
#   else:
#     raise newException(ValueError, fmt"shape '{shape}' is invalid for input of size {numel}")

proc chunk(self: Tensor; chunks, dim: int64): seq[Tensor] =
  assert(self.dim() > 0, "chunk expects at least a 1-dimensional tensor");
  assert(chunks > 0, "chunk expects `chunks` to be greater than 0, got: " & $chunks)
  
  let split_size = (self.size(dim) + chunks - 1) div chunks

  # We need to call split_with_sizes in the case where split_size and dimension size are 0, because
  # a call to split would discard the number of chunks (because we can have an arbitrary number of
  # 0-sized chunks adding up to 0).  So, call split_with_sizes with the correct number of chunks,
  # eventually we will do this for all cases.
  if split_size == 0 and self.size(dim) == 0:
    var split_sizes = newSeqWith(chunks.int, split_size)
    split_sizes[chunks.int - 1] = split_size - (split_size * chunks - self.size(dim))
    return self.split_with_sizes(split_sizes, dim)
  else:
    return self.split(split_size, dim)

proc contiguous*(self: Tensor): Tensor =
  #unpack(self, "self", 0)
  if self.is_contiguous():
    return self
  return self.clone()

proc infer_size(a, b: IntList): IntList =
  let
    dimsA = a.len
    dimsB = b.len
    ndim = max(dimsA, dimsB)

  result.setLen(ndim)

  for i in countdown(ndim - 1, 0):
    let
      offset = ndim - 1 - i
      dimA = dimsA - 1 - offset
      dimB = dimsB - 1 - offset
      sizeA = if dimA >= 0: a[dimA] else: 1
      sizeB = if dimB >= 0: b[dimB] else: 1

    assert(sizeA == sizeB or sizeA == 1 or sizeB == 1,
      fmt"The size of tensor a ({sizeA}) must match the size of tensor b ({sizeB}) at non-singleton dimension {i}")

    # 1s map to the other size (even 0).
    result[i] = if sizeA == 1: sizeB else: sizeA

proc toType(self: Tensor; t: TensorType; non_blocking: bool = false): Tensor =
  if self.getType() == t:
    return self
  return t.copy(self, non_blocking)

proc toType(self: Tensor; t: AScalarType; non_blocking: bool = false): Tensor =
  self.toType(self.getType().toScalarType(t).to(TensorType))

proc integer_upcast(self: Tensor; dtype: Option[AScalarType] = AScalarType.none): Tensor =
  let 
    scalarType = self.getType().scalarType().to(AScalarType)
    upcast_scalarType = if dtype.isSome: dtype.get else: (if scalarType.toCpp().isIntegralType().to(bool): ATkLong else: scalarType)
  return self.toType(upcast_scalarType)

proc sum(self: Tensor; dim: IntList; keepdim: bool; dtype: Option[AScalarType] = AScalarType.none): Tensor =
  sum_internal(integer_upcast(self, dtype), dim, keepdim)

# Sums `tensor` repeatedly to produce a tensor of shape `shape`.
# Precondition: is_expandable_to(shape, tensor.sizes()) must be true
proc sum_to(tensor: Tensor; shape: IntList): Tensor =
  if shape.len == 0:
    return tensor.sum()

  result = tensor
  while result.dim() > shape.len:
    result = result.sum([0], false)

  for i in 0 ..< result.dim():
    if shape[i] == 1 and result.sizes[i] > 1:
      result = result.sum([i], true)

proc mm*(self, mat2: Tensor): Tensor =
  if self.is_sparse:
    return mat2.getType().addmm(zeros[int]([], mat2.getType()), self, mat2, 0, 1)
  return mm_internal(self, mat2);

proc matmul*(tensor1, tensor2: Tensor): Tensor =
  let
    dim_tensor1 = tensor1.dim()
    dim_tensor2 = tensor2.dim()

  if dim_tensor1 == 1 and dim_tensor2 == 1:
    return tensor1.dot(tensor2)
  elif dim_tensor1 == 2 and dim_tensor2 == 1:
    return tensor1.mv(tensor2)
  elif dim_tensor1 == 1 and dim_tensor2 == 2:
    return tensor1.unsqueeze(0).mm(tensor2).squeeze_inplace(0)
  elif dim_tensor1 == 2 and dim_tensor2 == 2:
    return tensor1.mm(tensor2)
  elif dim_tensor1 >= 3 and (dim_tensor2 == 1 or dim_tensor2 == 2):
    # optimization: use mm instead of bmm by folding tensor1's batch into
    # its leading matrix dimension.
    let
      t2 = if dim_tensor2 == 1: tensor2.unsqueeze(-1) else: tensor2
      size1 = tensor1.sizes()
      size2 = t2.sizes()
    var output_size = size1
    if dim_tensor2 > 1:
      output_size.add(size2[dim_tensor2 - 1])

    # fold the batch into the first dimension
    let t1 = tensor1.contiguous().view([-1, size1[size1.len - 1]])
    return unsafe_view_internal(t1.mm(t2), output_size)

  elif (dim_tensor1 >= 1 and dim_tensor2 >= 1) and (dim_tensor1 >= 3 or dim_tensor2 >= 3):
    # We are multiplying b1 x n x m1 by x2 x m2 x p (where b1 can be a list);
    # we track m1 vs m2 separately even though they must match for nicer error messages
    let
      n = if dim_tensor1 > 1: tensor1.size(-2) else: 1
      m1 = tensor1.size(-1)
      batch_tensor1 = tensor1.sizes[0 ..< max(dim_tensor1 - 2, 0)]
      m2 = if dim_tensor2 > 1: tensor2.size(-2) else: 1
      p = tensor2.size(-1)
      batch_tensor2 = tensor2.sizes[0 ..< max(dim_tensor2 - 2, 0)]

    # expand the batch portion (i.e. cut off matrix dimensions and expand rest)
    let
      expand_batch_portion = infer_size(batch_tensor1, batch_tensor2)
      tensor1_expand_size = expand_batch_portion & n.int & m1.int
      tensor2_expand_size = expand_batch_portion & m2.int & p.int

      expand_batch_product = expand_batch_portion.foldl(a * b)
      tensor1_bmm_view = @[expand_batch_product, n.int, m1.int]
      tensor2_bmm_view = @[expand_batch_product, m2.int, p.int]

    # flatten expanded batches
    let
      tensor1_expanded = tensor1.expand(tensor1_expand_size).contiguous().view(tensor1_bmm_view)
      tensor2_expanded = tensor2.expand(tensor2_expand_size).contiguous().view(tensor2_bmm_view)

    # reshape batches back into result
    var output_shape = expand_batch_portion;
    if dim_tensor1 > 1: output_shape.add(n.int)
    if dim_tensor2 > 1: output_shape.add(p.int)

    return unsafe_view_internal(tensor1_expanded.bmm(tensor2_expanded), output_shape)

  raise newException(ValueError, fmt"both arguments to matmul need to be at least 1D, but they are {dim_tensor1}D and {dim_tensor2}D")

include torch/autograd_helpers
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
    gradFuncs: HashSet[BackwardFunction]

  gradFuncs.init()

  for tensor in tensors:
    remainingNodes.enqueue(tensor)

  # Topologically sort the graph
  while remainingNodes.len > 0:
    let node = remainingNodes.dequeue()

    # Gradient along this path is not needed
    if not node.requires_grad:
      continue

    # If the gradient is needed, initialize it
    node.grad = torch.zeros_like(node)

    # Gradient is not defined, so don't evaluate inputs
    if node.grad_fn == nil:
      continue

    # Already executed this backward function through this node,
    # or another output of this function
    if gradFuncs.containsOrIncl(node.grad_fn):
      continue

    sortedNodes.add(node)

    for input in node.inputs:
      remainingNodes.enqueue(input)

  # Set initial gradients
  for i, tensor in tensors:
    tensor.grad = grads[i]

  # Accumulate grads
  for node in sortedNodes:
    # TODO: handle multiple output gradients
    let grads = node.grad_fn([node.grad])
    for i, input in node.inputs:
      if input.requires_grad:
        input.grad += grads[i]

proc backward*(tensor: Tensor) =
  backward([tensor], [torch.ones_like(tensor)])

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

  x.requires_grad = true

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
  
    echo "--------------------------"

    var a = tensor([
      [1, 2],
      [3, 4]
    ])

    var b = tensor([
      [5, 6],
      [8, 7]
    ])

    var
      n: IntList = @[2, 2]
      o = ones(n)
      g = (a + b).grad_fn([o])
    
    a.requires_grad = true
    let a1 = sin(a)
    echo a1.requires_grad
    a1.backward()
    print a.grad
   
  # tensor([[-0.5317, -0.4753],
  #         [-0.3930, -0.3210],
  #         [-0.7325, -0.6430]])
