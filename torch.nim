include torch/torch_cpp
import macros, sequtils

type
  Tensor* = ATensor
  Device* {.pure.} = enum
    CPU, CUDA

template inPlace* {.pragma.} ## Note: equivalent of torch _ suffix

proc toIntListType*(x: int): ilsize {.inline.} = x.ilsize

proc device*(deviceName: string): Device =
  case deviceName
  of "cpu", "CPU": return Device.CPU
  of "cuda", "CUDA": return Device.CUDA
  else: raiseAssert("Unknown device")

proc internalZeros(size: openarray[ilsize]): Tensor {.inline.} =
  let shape = cppinit(IntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  return ACPU().dynamicCppCall(zeros, shape)

proc internalZeros(size: openarray[ilsize]; device: Device): Tensor {.inline.} =
  let shape = cppinit(IntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  case device:
  of Device.CUDA: return ACUDA().dynamicCppCall(zeros, shape)
  of Device.CPU: return ACPU().dynamicCppCall(zeros, shape)

proc zeros*[T: SomeInteger](size: varargs[T, toIntListType]): Tensor {.inline.} = internalZeros(size)
proc zeros*[T: SomeInteger](size: varargs[T, toIntListType]; device: Device): Tensor {.inline.} = internalZeros(size, device)

iterator lenIter[T](s: openarray[T]): int {.inline.} =
  ## Inline iterator on any-depth seq or array
  ## Returns values in order
  yield s.len
  for item in s:
    when item is array|seq:
      for subitem in lenIter(item):
        yield subitem
      break

iterator flatIter[T](s: openarray[T]): float32 {.inline.} =
  ## Inline iterator on any-depth seq or array
  ## Returns values in order
  for item in s:
    when item is array|seq:
      for subitem in flatIter(item):
        yield subitem.float32
    else:
      yield item.float32

proc tensor*(data: openarray; device: Device = Device.CPU; dummy_bugfix: static[int] = 0;): Tensor {.inline.} =
  # as noticed in Arraymancer as well:
  ## Note: dummy_bugfix param is unused and is a workaround a Nim bug.
  # TODO: remove 'dummy_bugfix' - https://github.com/nim-lang/Nim/issues/6343

  # figure out size of array/seq
  var size = newSeq[ilsize]()
  for length in lenIter(data):
    size.add(length)
  
  # make shape out of size
  let shape = cppinit(IntList, cast[ptr ilsize](addr(size[0])), size.len.csize) 
  
  # TODO avoid some of those copies and iterations
  
  # flatten and eventually cast data
  var flatData = toSeq(flatIter(data))

  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU().dynamicCppCall(tensorFromBlob, addr(flatData[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: return ACUDA().dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: return ACPU().dynamicCppCall(copy, tmp).to(ATensor)

proc cpu*(tensor: Tensor): Tensor {.inline.} = ACPU().dynamicCppCall(copy, tensor).to(ATensor)

proc cuda*(tensor: Tensor): Tensor {.inline.} = ACUDA().dynamicCppCall(copy, tensor).to(ATensor)

proc is_cuda*(tensor: Tensor): bool {.inline.} = tensor.dynamicCppCall(is_cuda).to(bool)

proc is_defined*(tensor: Tensor): bool {.inline.} = tensor.dynamicCppCall("defined").to(bool)

proc matmul*(a, b: Tensor): Tensor {.inline.} = a.dynamicCppCall(matmul, b).to(ATensor)

proc `+`*(a, b: Tensor): Tensor {.inline.} = (a.toCpp + b.toCpp).to(ATensor)

proc transpose*(a: Tensor; dim0, dim1: int): Tensor {.inline.} = a.dynamicCppCall(transpose, dim0, dim1).to(ATensor)

proc take*(a, indices: Tensor): Tensor {.inline.} = a.dynamicCppCall(take, indices).to(ATensor)

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

proc sigmoid*(a: Tensor): Tensor {.inline.} = a.dynamicCppCall(sigmoid).to(ATensor)

proc `*`*(a, b: Tensor): Tensor {.inline.} = (a.toCpp * b.toCpp).to(ATensor)

proc tanh*(a: Tensor): Tensor {.inline.} = a.dynamicCppCall(tanh).to(ATensor)

proc `-`*(a, b: Tensor): Tensor {.inline.} = (a.toCpp - b.toCpp).to(ATensor)

proc t*(a: Tensor): Tensor {.inline.} = a.dynamicCppCall(t).to(ATensor)

proc ndimension*(a: Tensor): int {.inline.} = a.dynamicCppCall(ndimension).to(int)

proc dim*(a: Tensor): int {.inline.} = a.dynamicCppCall(dim).to(int)

proc size*(a: Tensor; dim: int): int {.inline.} = a.dynamicCppCall(size, dim).to(int)

proc numel*(a: Tensor): int {.inline.} = a.dynamicCppCall(numel).to(int)

proc uniform*(a: Tensor; fromValue, toValue: float): Tensor {.inline, inPlace.} = a.dynamicCppCall("uniform_", fromValue, toValue).to(ATensor)

proc `$`*(a: Tensor): string {.inline.} = $a.dynamicCppCall(toString).to(cstring)

proc contiguous*(a: Tensor): Tensor {.inline.} = a.dynamicCppCall(contiguous).to(ATensor)

proc data_ptr*(a: Tensor): pointer {.inline.} = a.dynamicCppCall(data_ptr).to(pointer)

proc print*(a: Tensor) = printTensor(a)

proc toSeq*[T](a: Tensor): seq[T] {.inline.} =
  let elements = a.numel()
  result = newSeq[T](elements)

  if a.is_cuda():
    var tmp = a.cpu()
    copyMem(addr(result[0]), tmp.data_ptr(), sizeof(T) * elements)
  else:
    copyMem(addr(result[0]), a.data_ptr(), sizeof(T) * elements)

proc internalFromSeq*[T](s: var seq[T], size: openarray[ilsize]): Tensor {.inline.} =
  let shape = cppinit(IntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU().dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  return ACPU().dynamicCppCall(copy, tmp).to(ATensor)

proc internalFromSeq*[T](s: var seq[T], size: openarray[ilsize]; device: Device): Tensor {.inline.} =
  let shape = cppinit(IntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  
  # create a temporary CPU tensor with our GCed data
  var tmp = ACPU().dynamicCppCall(tensorFromBlob, addr(s[0]), shape).to(ATensor)
  
  # finally write into a tensor
  case device:
  of Device.CUDA: return ACUDA().dynamicCppCall(copy, tmp).to(ATensor)
  of Device.CPU: return ACPU().dynamicCppCall(copy, tmp).to(ATensor)

proc fromSeq*[T; I: SomeInteger](s: var seq[T], size: varargs[I, toIntListType]): Tensor {.inline.} = internalFromSeq(s, size)
proc fromSeq*[T; I: SomeInteger](s: var seq[T], size: varargs[I, toIntListType]; device: Device): Tensor {.inline.} = internalFromSeq(s, size, device)

proc `[]`*(a: Tensor; index: int): Tensor {.inline.} = a.toCpp()[index].to(ATensor)

converter toFloat32*(a: Tensor): float32 {.inline.} =
  proc scalarToF32(s: AScalar): float32 {.importcpp: "#.to<float>()".}
  let scalar = cppinit(AScalar, a)
  return scalar.scalarToF32()

proc manual_seed*(seed: int) =
  globalContext().defaultGenerator(BackendCPU).manualSeed(seed).to(void)
  if globalContext().hasCUDA().to(bool):
    globalContext().defaultGenerator(BackendCUDA).manualSeed(seed).to(void)

proc set_num_threads*(num: int) {.importcpp: "at::set_num_threads(#)".}

proc get_num_threads*(): int {.importcpp: "at::get_num_threads(#)".}

when isMainModule:
  # LD_LIBRARY_PATH=../docker-cuda9.2-ubuntu18.04/output/lib nim cpp --nimcache=nimcache-native -d:cuda -o:nimcache-native/test -r torch.nim
  # nim cpp -d:wasm --nimcache=nimcache-wasm -o:nimcache-wasm/test.js torch.nim && node nimcache-wasm/test.js

  var
    z = torch.zeros(2, 1, 4)

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

  # grucell
  var
    gi = x.matmul(w_input.transpose(1, 2)) + b_input
    gh = hidden.matmul(w_recur.transpose(1, 2)) + b_recur
    (i_r, i_i, i_nn) = gi.chunk(3, 2)
    (h_r, h_i, h_n) = gh.chunk(3, 2)
    resetgate = (i_r + h_r).sigmoid()
    inputgate = torch.sigmoid(i_i + h_i)
    newgate = (i_nn + resetgate * h_n).tanh()
    hy = newgate + inputgate * (hidden - newgate)

  hy.print()

  var
    tos = toSeq[float32](hy)
    froms = torch.fromSeq(tos, 2, 3, 2)

  echo tos
  froms.print()
  
  when not defined(wasm) and defined(cuda):
    if globalContext().hasCUDA().to(bool):
      echo "Cuda available"
      echo "Cuda device ", globalContext().current_device().to(int)
      var cudaTensor = torch.zeros(7, 7, 7, device = torch.device("cuda"))
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
      inputgate = torch.sigmoid(i_i + h_i)
      newgate = (i_nn + resetgate * h_n).tanh()
      hy = newgate + inputgate * (hidden - newgate)

      hy.printTensor()


  # tensor([[-0.5317, -0.4753],
  #         [-0.3930, -0.3210],
  #         [-0.7325, -0.6430]])