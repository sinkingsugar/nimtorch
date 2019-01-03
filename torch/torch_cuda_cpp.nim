import os, dynlib
import fragments/ffi/cpp as cpp
export cpp

defineCppType(ACUDAStream, "at::cuda::CUDAStream", "ATen/cuda/CUDAContext.h")

proc createCUDAStream*(): ACUDAStream {.importcpp: "at::cuda::createCUDAStream()".}
proc getDefaultCUDAStream*(): ACUDAStream {.importcpp: "at::cuda::getDefaultCUDAStream()".}
proc getCurrentCUDAStream*(): ACUDAStream {.importcpp: "at::cuda::getCurrentCUDAStream()".}
proc setCurrentCUDAStream*(stream: ACUDAStream) {.importcpp: "at::cuda::setCurrentCUDAStream(#)".}

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

when defined staticlibs:
# we use static libraries so the following code is needed to initialize at runtime properly
  {.emit:"""
#include <c10/cuda/impl/CUDAGuardImpl.h>

namespace c10 {
namespace cuda {
namespace impl {

C10_REGISTER_GUARD_IMPL(CUDA, CUDAGuardImpl);

}}} // namespace c10::cuda::detail

#include <ATen/cuda/detail/CUDAHooks.h>
#include <ATen/RegisterCUDA.h>

namespace at {
namespace cuda {
namespace detail {

using at::CUDAHooksRegistry;
using at::RegistererCUDAHooksRegistry;

REGISTER_CUDA_HOOKS(CUDAHooks);

} // namespace detail
} // namespace cuda
} // namespace at
  """.}

when defined(linux) or defined(osx):
  const nvccPath* = staticExec("which nvcc")
  when nvccPath[0..4] != "which": # which returns `which: ...` when cannot be found
    const cudaPath* = nvccPath[0..^9]
    const cudaIncludePath* = cudaPath & "include"
    # Figure if cuda installation uses lib or lib64 path
    when staticExec("[ -f '" & cudaPath & "/lib64/libcudart.so' ] && echo 'true' || echo 'false'") == "true":
      const cudaLibPath* = cudaPath & "lib64"
    else:
      const cudaLibPath* = cudaPath & "lib"
    
    static:
      putEnv("CUDA_INCLUDE", cudaIncludePath)
      putEnv("CUDA_LIB", cudaLibPath)

{.passC: "-I$CUDA_INCLUDE -I$ATEN/include/TH -I$ATEN/include/THC".}
{.passL: "-L$CUDA_LIB".}

when not defined staticlibs:
  {.passL: "-lcuda".}

  when staticExec("""[ -f "$ATEN/lib/libmagma.so" ] && echo 'true' || echo 'false'""") == "true":
    {.passL: "-lcublas -lmagma".}

  {.passL: "-lc10_cuda -lcaffe2_gpu -Wl,--no-as-needed".}

else:
  # TODO/WIP
  
  {.passL: "$ATEN/lib/libcaffe2_gpu.a $ATEN/lib/libc10_cuda.a $ATEN/lib/libcaffe2.a $ATEN/lib/libc10.a".}
  
  when staticExec("""[ -f "$ATEN/lib/libmagma.a" ] && echo 'true' || echo 'false'""") == "true":
    {.passL: "$ATEN/lib/libmagma.a".}
  
  {.passL: "-Wl,--start-group $CUDA_LIB/liblapack_static.a $CUDA_LIB/libcusparse_static.a $CUDA_LIB/libculibos.a $CUDA_LIB/libcublas_static.a $CUDA_LIB/libcudart_static.a -Wl,--end-group".}

  {.passL: "/usr/lib/libcudnn_static_v7.a".}


static:
  doAssert(getenv("CUDA_INCLUDE") != "", "Please add $CUDA_INCLUDE variable specifying cuda include folder to the environment")
  doAssert(getenv("CUDA_LIB") != "", "Please add $CUDA_LIB variable specifying cuda lib folder to the environment")
