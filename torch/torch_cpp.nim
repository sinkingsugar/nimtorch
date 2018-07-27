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

var haslib64cpuinfo {.compileTime.} = false

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")
  
  if gorge("ls " & getenv("ATEN") & "/lib64") == "libcpuinfo.a":
    haslib64cpuinfo = true

when defined wasm:
  {.passL: "$ATEN/lib/libATen_cpu.a $ATEN/lib/libcpuinfo.a".}
  
  type ilsize = clonglong
else:
  when haslib64cpuinfo:
    {.passL: "$ATEN/lib/libATen_cpu.a $ATEN/lib/libsleef.a $ATEN/lib64/libcpuinfo.a -pthread -fopenmp".}
  else:
    {.passL: "$ATEN/lib/libATen_cpu.a $ATEN/lib/libsleef.a $ATEN/lib/libcpuinfo.a -pthread -fopenmp".}

  type ilsize = clong