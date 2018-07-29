import fragments/ffi/cpp as cpp
export cpp
import os

defineCppType(ATensor, "at::Tensor", "ATen/ATen.h")
defineCppType(AScalar, "at::Scalar", "ATen/ATen.h")
defineCppType(IntList, "at::IntList", "ATen/ATen.h")
defineCppType(AGenerator, "at::Generator", "ATen/ATen.h")
defineCppType(AContext, "at::Context", "ATen/ATen.h")
defineCppTYpe(ATensors, "std::vector<at::Tensor>", "vector")

proc ACPU(): CppProxy {.importcpp: "at::CPU(at::kFloat)".}
proc ACUDA(): CppProxy {.importcpp: "at::CUDA(at::kFloat)".}
proc printTensor(t: ATensor) {.importcpp: "at::print(#)".}
proc globalContext(): AContext {.importcpp: "at::globalContext()".}
var BackendCPU* {.importcpp: "at::Backend::CPU", nodecl.}: cint
var BackendCUDA* {.importcpp: "at::Backend::CUDA", nodecl.}: cint

{.passC: "-I$ATEN/include -std=c++11".}

var haslib64cpuinfo {.compileTime, nodecl.} = false

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")

when defined wasm:
  {.passL: "-L$ATEN/lib -lATen_cpu -lcpuinfo".}
  
  type ilsize = clonglong
  
elif defined cuda:
  # cuda needs dynamic libraries
  {.passL: "-Wl,--no-as-needed -L$ATEN/lib -L$ATEN/lib64 -lATen_cpu -lATen_cuda -lsleef -lcpuinfo -lcuda -pthread -fopenmp -lrt".}

  type ilsize = clong

  # add some cudart utility
  import dynlib

  # profiling, you also need to instruct the profiling tool to disable profiling at the start of the application. 
  # For nvprof you do this with the --profile-from-start off flag. 
  # For the Visual Profiler you use the Start execution with profiling enabled checkbox in the Settings View
  proc cudaProfilerStart*() {.importc, dynlib: "libcudart.so".}
  proc cudaProfilerStop*() {.importc, dynlib: "libcudart.so".}

else:
  {.passL: "-L$ATEN/lib -L$ATEN/lib64 -lATen_cpu -lsleef -lcpuinfo -pthread -fopenmp -lrt".}

  type ilsize = clong