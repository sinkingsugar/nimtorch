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

# hard coded tuples, find for now, if they increase need to do something
defineCppType(ATensorTuple2, "std::tuple<at::Tensor, at::Tensor>")
defineCppType(ATensorRTuple2, "std::tuple<at::Tensor&, at::Tensor&>")
defineCppType(ATensorTuple3, "std::tuple<at::Tensor, at::Tensor, at::Tensor>")
defineCppType(ATensorRTuple3, "std::tuple<at::Tensor&, at::Tensor&, at::Tensor&>")
defineCppType(ATensorTuple4, "std::tuple<at::Tensor, at::Tensor, at::Tensor, at::Tensor>")
defineCppType(ATensorRTuple4, "std::tuple<at::Tensor&, at::Tensor&, at::Tensor&, at::Tensor&>")
defineCppType(ATensorTuple5, "std::tuple<at::Tensor, at::Tensor, at::Tensor, at::Tensor, at::Tensor>")
defineCppType(ATensorRTuple5, "std::tuple<at::Tensor&, at::Tensor&, at::Tensor&, at::Tensor&, at::Tensor&>")
defineCppType(ATensorTuple3v1, "std::tuple<at::Tensor, at::Tensor, at::Tensor, std::vector<at::Tensor>>")

# cpp utils
defineCppType(StdString, "std::string", "string")
converter toStdString*(s: string): StdString {.inline, noinit.} = cppinit(StdString, s.cstring)

proc cppTupleGet[T](index: int; obj: CppProxy): T {.importcpp: "std::get<#>(#)".}

# some issues generating static[int] in cpp
type
  StdArray* {.importcpp: "std::array<'0, '1>", header: "array".} [T; S: static[int]] = object

proc `[]`*[T; S: static[int]](v: StdArray[T, S]; index: int): T {.inline.} = v.toCpp[index].to(T)
proc `[]=`*[T; S: static[int]](v: StdArray[T, S]; index: int; value: T) {.inline.} = v.toCpp[index] = value

template `@`*[SIZE](a: array[SIZE, bool]): StdArray = 
  var result: StdArray[bool, a.len]
  for i in 0..a.high: 
    result[i] = a[i]
  result

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

{.passC: "-I$ATEN/include".}

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