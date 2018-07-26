import fragments/ffi/cpp as cpp
export cpp

# when defined(linux) and not defined(nimsuggest):
#   static:
#     echo "Checking if aten folder is in artifacts and populated"
#     var check = gorgeEx("ls ../artifacts/aten/lib")
#     if check.exitCode != 0:
#       check = gorgeEx("""mkdir -p ../artifacts/aten && \
# cd ../artifacts/aten && \
# emconfigure cmake -DAT_LINK_STYLE=STATIC -DCAFFE2_CMAKE_BUILDING_WITH_MAIN_REPO=OFF -DCMAKE_C_FLAGS="-Wno-implicit-function-declaration \
# -DEMSCRIPTEN -s DISABLE_EXCEPTION_CATCHING=0" -DCMAKE_CXX_FLAGS="-Wno-implicit-function-declaration -DEMSCRIPTEN -s DISABLE_EXCEPTION_CATCHING=0" \
# -DCMAKE_INSTALL_PREFIX=/home/sugar/aten-wasm ../../deps/pytorch/aten""")
#       doAssert(check.exitCode == 0, check.output)

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

{.passC: "-I../aten/include".}

when defined wasm:
  type ilsize = clonglong
  {.passL: "../pytorch/aten/built/src/ATen/libATen_cpu.a ../pytorch/aten/built/confu-deps/cpuinfo/libcpuinfo.a".}
else:
  {.passL: "-L../aten/lib -lATen_cpu".}
  type ilsize = clong