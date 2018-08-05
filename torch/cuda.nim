include torch_cuda_cpp
import ../torch as torch
import macros

type
  CudaStream* = object
    cudaStream: ACUDAStream

proc Stream*(): CudaStream =
  result.cudaStream = createCUDAStream()

proc stream*(stream: CudaStream): CudaStream {.inline.} = stream

proc synchronize*() {.inline.} = cudaDeviceSynchronize()

proc synchronize*(stream: CudaStream) {.inline.} = cudaStreamSynchronize(stream.cudaStream.toCpp.to(cudaStream_t))

proc empty_cache*() {.inline.} =
  proc themptycache() {.importc: "THCCachingAllocator_emptyCache", header: "THC/THCCachingAllocator.h".}
  themptycache()

template with*(stream: CudaStream; code: untyped): untyped =
  let previousStream = getCurrentCUDAStream()
  setCurrentCUDAStream(stream.cudaStream)
  code
  setCurrentCUDAStream(previousStream)

template with*(pycode, code: untyped): untyped =
  let stream = pycode
  with stream:
    code

when isMainModule:
  var myStream = Stream()

  with myStream:
    discard

  with cuda.stream(myStream):
    discard
  
  myStream.synchronize()
  cuda.synchronize()
  cuda.empty_cache()