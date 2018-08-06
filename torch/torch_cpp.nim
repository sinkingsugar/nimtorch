import fragments/ffi/cpp as cpp
export cpp
import os

defineCppType(ATensor, "at::Tensor", "ATen/ATen.h")
defineCppType(AScalar, "at::Scalar", "ATen/ATen.h")
defineCppType(IntList, "at::IntList", "ATen/ATen.h")
defineCppType(AGenerator, "at::Generator", "ATen/ATen.h")
defineCppType(AContext, "at::Context", "ATen/ATen.h")
defineCppTYpe(ATensors, "std::vector<at::Tensor>", "vector")

when defined cuda:
  defineCppTYpe(ACUDAStream, "at::cuda::CUDAStream", "ATen/cuda/CUDAContext.h")

proc ACPU(): CppProxy {.importcpp: "at::CPU(at::kFloat)".}
proc ACUDA(): CppProxy {.importcpp: "at::CUDA(at::kFloat)".}
proc printTensor(t: ATensor) {.importcpp: "at::print(#)".}
proc globalContext(): AContext {.importcpp: "at::globalContext()".}
var BackendCPU* {.importcpp: "at::Backend::CPU", nodecl.}: cint
var BackendCUDA* {.importcpp: "at::Backend::CUDA", nodecl.}: cint

when defined cuda:
  proc createCUDAStream(): ACUDAStream {.importcpp: "at::cuda::createCUDAStream()".}
  proc getDefaultCUDAStream(): ACUDAStream {.importcpp: "at::cuda::getDefaultCUDAStream()".}
  proc getCurrentCUDAStream(): ACUDAStream {.importcpp: "at::cuda::getCurrentCUDAStream()".}
  proc setCurrentCUDAStream(stream: ACUDAStream) {.importcpp: "at::cuda::setCurrentCUDAStream()".}

{.passC: "-I$ATEN/include -std=c++11".}

var haslib64cpuinfo {.compileTime, nodecl.} = false

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")

when defined wasm:
  {.passL: "-L$ATEN/lib -lATen_cpu".}
  
  type ilsize* = clonglong
  
elif defined cuda:
  {.passL: "-Wl,--no-as-needed -L$ATEN/lib -L$ATEN/lib64 -lATen_cpu -lATen_cuda -lsleef -lcpuinfo -lcuda -pthread -fopenmp -lrt".}

  type ilsize* = clong

else:
  {.passL: "-L$ATEN/lib -L$ATEN/lib64 -lATen_cpu -lsleef -lcpuinfo -pthread -fopenmp -lrt".}

  type ilsize* = clong