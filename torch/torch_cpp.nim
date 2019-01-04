import fragments/ffi/cpp as cpp
export cpp
import os

const version* = "2018.12.30.1989"

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

static:
  # in any case, lets put aten in the path 
  putEnv("ATEN", atenPath)

cppincludes(atenPath & """/include""")
cpplibpaths(atenPath & """/lib""")
cpplibpaths(atenPath & """/lib64""")

type AInt64* {.importcpp: "int64_t", header: "<stdint.h>".} = object

when defined staticlibs:
  # we use static libraries so the following code is needed to initialize at runtime properly
  {.emit:"""
#include <ATen/detail/CPUGuardImpl.h>
namespace at {
namespace detail {

C10_REGISTER_GUARD_IMPL(CPU, CPUGuardImpl);

}} // namespace at::detail
  """.}

when defined wasm:
  {.passC: "-std=c++11".}
  {.passL: "-lc10 -lcaffe2".}

elif defined windows:
  when not defined staticlibs:
    cpplibs(
      atenPath & "/lib/cpuinfo.lib",
      atenPath & "/lib/c10.lib",
      atenPath & "/lib/caffe2.lib"
    )
  else:
    cpplibs(
      atenPath & "/lib/cpuinfo.lib",
      atenPath & "/lib/clog.lib",
      atenPath & "/lib/c10.lib",
      atenPath & "/lib/caffe2.lib",
      atenPath & "/lib/mkl_core.lib",
      atenPath & "/lib/mkl_intel_thread.lib",
      atenPath & "/lib/mkl_intel_lp64.lib",
      atenPath & "/lib/libiomp5md.lib",
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

  when defined staticlibs:
    {.passL: "-framework Accelerate".}

  when not defined ios:
    {.passL: "-lcpuinfo -lsleef -lclog -pthread -lc10 -lcaffe2".}
  else:
    import fragments/ffi/ios
    {.passL: "-lcpuinfo -lclog -pthread -lc10 -lcaffe2 ".}
  
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

  # If we built ATEN with GCC version < 5.0 we might need this
  # We detect this if we have linking issues with std::string types
  when defined noCxx11Abi:
    {.passC: "-D_GLIBCXX_USE_CXX11_ABI=0".}

  when not defined staticlibs: # building using dynamic libraries
    # MKLDNN is optional, let's check if it's available
    when staticExec("[ -f '$ATEN/lib/libmkldnn.so' ] && echo 'true' || echo 'false'") == "true":
      {.passL: "-lmkldnn".}
    
    # REQUIRED LIBS
    {.passL: "-lcpuinfo -lsleef -pthread -lrt -lc10 -lcaffe2".}

    # Make sure we allow users to use rpath and be able find ATEN easier
    const atenEnvRpath = """-Wl,-rpath,'""" & atenPath & """/lib'"""
    {.passL: atenEnvRpath.}
    {.passL: """-Wl,-rpath,'$ORIGIN'""".}
  
  else: # building big static binary
    # REQUIRED LIBS
    {.passL: "-Wl,--start-group $ATEN/lib/libcaffe2.a $ATEN/lib/libc10.a $ATEN/lib/libcpuinfo.a $ATEN/lib/libsleef.a $ATEN/lib/libclog.a -Wl,--end-group".}
    
    # MKLDNN is optional, let's check if it's available
    when staticExec("""[ -f "$ATEN/lib/libmkldnn.a" ] && echo 'true' || echo 'false'""") == "true":
      static:
        echo "Using MKL-DNN"
      {.passL: "$ATEN/lib/libmkldnn.a".}
    
    # MKL is very needed (no good performance without it) but optional, let's check if it's available
    when staticExec("""[ -f "$ATEN/lib/libmkl_core.a" ] && echo 'true' || echo 'false'""") == "true":
      static:
        echo "Using Intel MKL"
      {.passL: "-Wl,--start-group $ATEN/lib/libmkl_intel_lp64.a $ATEN/lib/libmkl_gnu_thread.a $ATEN/lib/libmkl_core.a -Wl,--end-group".}
    
    # REQUIRED FLAGS
    {.passL: "-pthread -lrt -fopenmp".}

  when defined gperftools:
    {.passC: "-DWITHGPERFTOOLS -g".}
    {.passL: "-lprofiler -g".}
    proc ProfilerStart*(fname: cstring): int {.importc.}
    proc ProfilerStop*() {.importc.}
