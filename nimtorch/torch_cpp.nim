import fragments/ffi/cpp as cpp
export cpp
import os

defineCppType(AType, "at::Type", "ATen/ATen.h")
defineCppType(ATensor, "at::Tensor", "ATen/ATen.h")
defineCppType(AStorage, "at::Storage", "ATen/ATen.h")
defineCppType(ASparseTensorRef, "at::SparseTensorRef", "ATen/ATen.h")
defineCppType(ATensorOptions, "at::TensorOptions", "ATen/ATen.h")
defineCppType(AScalar, "at::Scalar", "ATen/ATen.h")
defineCppType(AScalarType, "at::ScalarType", "ATen/ATen.h")
defineCppType(AIntList, "at::IntList", "ATen/ATen.h")
defineCppType(AGenerator, "at::Generator", "ATen/ATen.h")
defineCppType(AContext, "at::Context", "ATen/ATen.h")
defineCppType(ATensors, "std::vector<at::Tensor>", "vector")

var ATkByte {.importcpp: "at::kByte", nodecl.}: AScalarType
var ATkChar {.importcpp: "at::kChar", nodecl.}: AScalarType
var ATkShort {.importcpp: "at::kShort", nodecl.}: AScalarType
var ATkInt {.importcpp: "at::kInt", nodecl.}: AScalarType
var ATkLong {.importcpp: "at::kLong", nodecl.}: AScalarType
var ATkHalf {.importcpp: "at::kHalf", nodecl.}: AScalarType
var ATkFloat {.importcpp: "at::kFloat", nodecl.}: AScalarType
var ATkDouble {.importcpp: "at::kDouble", nodecl.}: AScalarType

proc toATenType(nimType: typedesc[byte]): AScalarType {.inline.} = ATkByte
proc toATenType(nimType: typedesc[char]): AScalarType {.inline.} = ATkChar
proc toATenType(nimType: typedesc[int16]): AScalarType {.inline.} = ATkShort
proc toATenType(nimType: typedesc[int32]): AScalarType {.inline.} = ATkInt
proc toATenType(nimType: typedesc[int64]): AScalarType {.inline.} = ATkLong
proc toATenType(nimType: typedesc[float32]): AScalarType {.inline.} = ATkFloat
proc toATenType(nimType: typedesc[float64]): AScalarType {.inline.} = ATkDouble

proc ACPU(): CppProxy {.importcpp: "at::CPU(at::kFloat)".}
proc ACUDA(): CppProxy {.importcpp: "at::CUDA(at::kFloat)".}
proc ACPU(dtype: AScalarType): CppProxy {.importcpp: "at::CPU(#)".}
proc ACUDA(dtype: AScalarType): CppProxy {.importcpp: "at::CUDA(#)".}
proc printTensor(t: ATensor) {.importcpp: "at::print(#)".}
proc globalContext(): AContext {.importcpp: "at::globalContext()".}
var BackendCPU* {.importcpp: "at::Backend::CPU", nodecl.}: cint
var BackendCUDA* {.importcpp: "at::Backend::CUDA", nodecl.}: cint
var DeviceTypeCPU* {.importcpp: "at::DeviceType::CPU", nodecl.}: cint
var DeviceTypeCUDA* {.importcpp: "at::DeviceType::CUDA", nodecl.}: cint

const atenPath = getEnv("ATEN")
when atenPath == "":
  {.error: "Please set $ATEN environment variable to point to the ATen installation path".}

cppincludes(atenPath & """/include""")
cpplibpaths(atenPath & """/lib""")
cpplibpaths(atenPath & """/lib64""")

when defined wasm:
  type ilsize* = int64

  {.passL: "-lATen_cpu".}

elif defined windows:
  type ilsize* = int64

  cpplibs(atenPath & "/lib/ATen_cpu.lib")
  cpplibs(atenPath & "/lib/cpuinfo.lib")

  when defined cuda:
    const cudaPath = getEnv("CUDA_PATH")
    cppincludes(cudaPath & """/include""")
  
    when sizeof(int) == 8:
      const cudaLibPath = cudaPath & "/lib/x64"
    else:
      const cudaLibPath = cudaPath & "/lib/Win32"

    cpplibs(cudaLibPath & "/cuda.lib")

else:
  type ilsize* = clong

  {.passL: "-lATen_cpu -lcpuinfo -lsleef -pthread -fopenmp -lrt".}
  when defined cuda:
    {.passL: "-lATen_cuda -Wl,--no-as-needed -lcuda".}