import os, dynlib
import fragments/ffi/cpp as cpp
export cpp

defineCppType(ACUDAStream, "at::cuda::CUDAStream", "ATen/cuda/CUDAContext.h")

proc createCUDAStream(): ACUDAStream {.importcpp: "at::cuda::createCUDAStream()".}
proc getDefaultCUDAStream(): ACUDAStream {.importcpp: "at::cuda::getDefaultCUDAStream()".}
proc getCurrentCUDAStream(): ACUDAStream {.importcpp: "at::cuda::getCurrentCUDAStream()".}
proc setCurrentCUDAStream(stream: ACUDAStream) {.importcpp: "at::cuda::setCurrentCUDAStream(#)".}

# add some cudart utility

# profiling, you also need to instruct the profiling tool to disable profiling at the start of the application. 
# For nvprof you do this with the --profile-from-start off flag. 
# For the Visual Profiler you use the Start execution with profiling enabled checkbox in the Settings View
proc cudaProfilerStart*() {.importc, dynlib: "libcudart.so".}
proc cudaProfilerStop*() {.importc, dynlib: "libcudart.so".}

type cudaStream_t {.importc: "cudaStream_t".} = object
proc cudaDeviceSynchronize*() {.importc, dynlib: "libcudart.so".}
proc cudaStreamSynchronize*(stream: cudaStream_t) {.importc, dynlib: "libcudart.so".}

proc currentMemoryAllocated*(device: cint): uint64 {.importc: "THCCachingAllocator_currentMemoryAllocated", header: "THCCachingAllocator.h".}
proc maxMemoryAllocated*(device: cint): uint64 {.importc: "THCCachingAllocator_maxMemoryAllocated", header: "THCCachingAllocator.h".}
proc currentMemoryCached*(device: cint): uint64 {.importc: "THCCachingAllocator_currentMemoryCached", header: "THCCachingAllocator.h".}
proc maxMemoryCached*(device: cint): uint64 {.importc: "THCCachingAllocator_maxMemoryCached", header: "THCCachingAllocator.h".}

when defined(linux) or defined(osx):
  const nvccPath* = staticExec("which nvcc")
  when nvccPath[0..4] != "which": # which returns `which: ...` when cannot be found
    const cudaPath* = nvccPath[0..^9]
    const cudaIncludePath* = cudaPath & "include"
    const cudaLibPath* = cudaPath & "lib"
    static:
      putEnv("CUDA_INCLUDE", cudaIncludePath)
      putEnv("CUDA_LIB", cudaLibPath)

static:
  putEnv("CUDA_LIB64", getEnv("CUDA_LIB") & "64")

{.passC: "-I$CUDA_INCLUDE -I$ATEN/include/TH -I$ATEN/include/THC".}
{.passL: "-L$CUDA_LIB -L$CUDA_LIB64".}

static:
  doAssert(getenv("CUDA_INCLUDE") != "", "Please add $CUDA_INCLUDE variable specifying cuda include folder to the environment")
  doAssert(getenv("CUDA_LIB") != "", "Please add $CUDA_LIB variable specifying cuda lib folder to the environment")
