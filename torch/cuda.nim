include torch_cuda_cpp
import ../torch as torch
import macros

type
  CudaStream* = object
    cudaStream: ACUDAStream

proc `!=`*(a, b: CudaStream): bool = a.cudaStream == b.cudaStream

proc setStream*(stream: CudaStream) = setCurrentCUDAStream(stream.cudaStream)

proc defaultStream*(): CudaStream = result.cudaStream = getDefaultCUDAStream()

proc current_stream*(): CudaStream = result.cudaStream = getCurrentCUDAStream()

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
  assert(getCurrentCUDAStream() == stream.cudaStream)

  code
  assert(getCurrentCUDAStream() == stream.cudaStream)
  
  setCurrentCUDAStream(previousStream)
  assert(getCurrentCUDAStream() == previousStream)

template with*(pycode, code: untyped): untyped =
  let stream = pycode
  with stream:
    code

when isMainModule:
  var myStream = Stream()

  with myStream:
    assert(myStream == cuda.current_stream())
    discard
  
  assert(myStream != cuda.current_stream())

  with cuda.stream(myStream):
    assert(myStream == cuda.current_stream())
    discard

  assert(myStream != cuda.current_stream())
  
  myStream.synchronize()
  cuda.synchronize()
  cuda.empty_cache()