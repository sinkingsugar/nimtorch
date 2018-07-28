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

{.passC: "-I$ATEN/include".}

var haslib64cpuinfo {.compileTime, nodecl.} = false

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")

when defined wasm:
  {.passL: "-L$ATEN/lib -lATen_cpu -lcpuinfo".}
  
  type ilsize = clonglong
else:
  {.passL: "-L$ATEN/lib -L$ATEN/lib64 -lATen_cpu -lsleef -lcpuinfo -pthread -fopenmp".}

  type ilsize = clong