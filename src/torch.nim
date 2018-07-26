include torch_cpp
import macros, sequtils

type
  torch* = pointer
  Tensor* = ATensor

proc toIntListType(x: int): ilsize {.inline.} = x.ilsize

proc zeros*(_: typedesc[torch], size: varargs[int, toIntListType]): Tensor {.inline.} =
  let shape = cppinit(IntList, cast[ptr ilsize](unsafeAddr(size)), size.len.csize)
  when defined cuda:
    result = ACUDA().dynamicCppCall(zeros, shape)
  else:
    result = ACPU().dynamicCppCall(zeros, shape)

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

proc tensor*(_: typedesc[torch], data: openarray): Tensor {.inline.} =
  # figure out size of array/seq
  var size = newSeq[ilsize]()
  for length in lenIter(data):
    size.add(length)
  
  # make shape out of size
  let shape = cppinit(IntList, cast[ptr ilsize](addr(size[0])), size.len.csize) 
  
  # flatten and eventually cast data
  var flatData = toSeq(flatIter(data))
  
  # finally write into a tensor
  when defined cuda:
    result = ACUDA().dynamicCppCall(tensorFromBlob, addr(flatData[0]), shape).to(ATensor)
  else:
    result = ACPU().dynamicCppCall(tensorFromBlob, addr(flatData[0]), shape).to(ATensor)
  
  result = result.clone() # avoid GC issues since seq memory is GC memory
  
when isMainModule:
  var
    z = torch.zeros(2, 1, 4)
    data = [
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
    ]
    x = torch.tensor(data)
  
  z.printTensor()
  echo ""
  x.printTensor()