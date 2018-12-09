import fragments/ffi/cpp as cpp
export cpp
import os

const version* = "2018.12.08.1793"

cppdefines("ATEN_VERSION=" & version)

defineCppType(AType, "at::Type", "ATen/ATen.h")
defineCppType(ATensor, "at::Tensor", "ATen/ATen.h")
defineCppType(AStorage, "at::Storage", "ATen/ATen.h")
defineCppType(ASparseTensorRef, "at::SparseTensorRef", "ATen/ATen.h")
defineCppType(ATensorOptions, "at::TensorOptions", "ATen/ATen.h")
defineCppType(AScalar, "at::Scalar", "ATen/ATen.h")
defineCppType(AIntList, "at::IntList", "ATen/ATen.h")
defineCppType(AGenerator, "at::Generator", "ATen/ATen.h")
defineCppType(AContext, "at::Context", "ATen/ATen.h")
defineCppType(ATensors, "std::vector<at::Tensor>", "vector")
defineCppType(OStringStream, "std::ostringstream", "sstream")

type
  ScalarType* {.pure, importcpp: "at::ScalarType", header: "ATen/ATen.h".} = enum
    kByte
    kChar
    kShort
    kInt
    kLong
    kHalf
    kFloat
    kDouble

proc toATenType*(nimType: typedesc[byte]): ScalarType {.inline.} = ScalarType.kByte
proc toATenType*(nimType: typedesc[char]): ScalarType {.inline.} = ScalarType.kChar
proc toATenType*(nimType: typedesc[int16]): ScalarType {.inline.} = ScalarType.kShort
proc toATenType*(nimType: typedesc[int32]): ScalarType {.inline.} = ScalarType.kInt
proc toATenType*(nimType: typedesc[int64]): ScalarType {.inline.} = ScalarType.kLong
proc toATenType*(nimType: typedesc[float32]): ScalarType {.inline.} = ScalarType.kFloat
proc toATenType*(nimType: typedesc[float64]): ScalarType {.inline.} = ScalarType.kDouble

proc ACPU*(): CppProxy {.importcpp: "at::CPU(at::kFloat)".}
proc ACUDA*(): CppProxy {.importcpp: "at::CUDA(at::kFloat)".}
proc ACPU*(dtype: ScalarType): CppProxy {.importcpp: "at::CPU(#)".}
proc ACUDA*(dtype: ScalarType): CppProxy {.importcpp: "at::CUDA(#)".}
proc printTensor*(t: ATensor) {.importcpp: "at::print(#)".}
proc globalContext*(): AContext {.importcpp: "at::globalContext()".}
var BackendCPU* {.importcpp: "at::Backend::CPU", nodecl.}: cint
var BackendCUDA* {.importcpp: "at::Backend::CUDA", nodecl.}: cint
var DeviceTypeCPU* {.importcpp: "at::DeviceType::CPU", nodecl.}: cint
var DeviceTypeCUDA* {.importcpp: "at::DeviceType::CUDA", nodecl.}: cint

when getEnv("ATEN") == "" and defined(ANACONDA):
  const atenPath = currentSourcePath()[0..^14] & "../../../../"
else:
  const atenPath = getEnv("ATEN")
  when atenPath == "":
    {.error: "Please set $ATEN environment variable to point to the ATen installation path".}

cppincludes(atenPath & """/include""")
cpplibpaths(atenPath & """/lib""")
cpplibpaths(atenPath & """/lib64""")

type AInt64* {.importcpp: "int64_t", header: "<stdint.h>".} = object

when defined wasm:
  {.passC: "-std=c++11".}
  {.passL: "-lc10 -lcaffe2".}

elif defined windows:
  cpplibs(
    atenPath & "/lib/cpuinfo.lib",
    atenPath & "/lib/c10.lib",
    atenPath & "/lib/caffe2.lib"
  )

  cppdefines("NOMINMAX")

  when defined cuda:
    const cudaPath = getEnv("CUDA_PATH")
    cppincludes(cudaPath & """/include""")
  
    when sizeof(int) == 8:
      const cudaLibPath = cudaPath & "/lib/x64"
    else:
      const cudaLibPath = cudaPath & "/lib/Win32"

    cpplibs(cudaLibPath & "/cuda.lib")

elif defined osx:
  {.passC: "-std=c++11".}

  when not defined ios:
    {.passL: "-lcpuinfo -lsleef -pthread -lc10 -lcaffe2".}
  else:
    import fragments/ffi/ios
    {.passL: "-lcpuinfo -pthread -lc10 -lcaffe2 ".}
  
  # Make sure we allow users to use rpath and be able find ATEN easier
  const atenEnvRpath = """-Wl,-rpath,'""" & atenPath & """/lib'"""
  {.passL: atenEnvRpath.}
  {.passL: """-Wl,-rpath,'$ORIGIN'""".}

  when defined gperftools:
    {.passC: "-DWITHGPERFTOOLS -g".}
    {.passL: "-lprofiler -g".}
    proc ProfilerStart*(fname: cstring): int {.importc.}
    proc ProfilerStop*() {.importc.}

else:
  {.passC: "-std=c++11".}

  const hasMkldnn = staticExec("[ -f '" & atenPath & "/lib/libmkldnn.so" & "' ] && echo 'true' || echo 'false'")
  when hasMkldnn == "true":
    {.passL: "-lcpuinfo -lsleef -pthread -lrt -lmkldnn -lc10 -lcaffe2".}
  else:
    {.passL: "-lcpuinfo -lsleef -pthread -lrt -lc10 -lcaffe2".}
  
  when defined cuda:
    const hasMagma = staticExec("[ -f '" & atenPath & "/lib/libmagma.so" & "' ] && echo 'true' || echo 'false'")
    when hasMagma == "true":
      {.passL: "-lcaffe2_gpu -Wl,--no-as-needed -lcuda -lmagma -lcublas".}
    else:
      {.passL: "-lcaffe2_gpu -Wl,--no-as-needed -lcuda".}
  
  # Make sure we allow users to use rpath and be able find ATEN easier
  const atenEnvRpath = """-Wl,-rpath,'""" & atenPath & """/lib'"""
  {.passL: atenEnvRpath.}
  {.passL: """-Wl,-rpath,'$ORIGIN'""".}

  when defined gperftools:
    {.passC: "-DWITHGPERFTOOLS -g".}
    {.passL: "-lprofiler -g".}
    proc ProfilerStart*(fname: cstring): int {.importc.}
    proc ProfilerStop*() {.importc.}
