import fragments/ffi/cpp as cpp
export cpp
import os, jsmn

defineCppType(ATensor, "at::Tensor", "ATen/ATen.h")
defineCppType(AScalar, "at::Scalar", "ATen/ATen.h")
defineCppType(AScalarType, "at::ScalarType", "ATen/ATen.h")
defineCppType(IntList, "at::IntList", "ATen/ATen.h")
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

{.passC: "-I$ATEN/include".}

var declCache {.compileTime.}: string
var declCacheTokens {.compileTime.}: seq[JsmnToken]
static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")
  
  let declCacheFile = "Declarations-cache.json"
  if not fileExists(declCacheFile):
    # convert from yaml to json to load at compile time
    echo "Declarations cache is missing, building it now..."
    
    let
      declYaml = "../" & getenv("ATEN") & "/share/ATen/Declarations.yaml"
      cmd = "python3 -c 'import json, sys, yaml ; " & # needs python3
        "stream = open(\"" & declYaml & "\", \"r\") ; " & # replace open with file for python2.. maybe
        "y=yaml.safe_load(stream) ; " & 
        "print(json.dumps(y))'"
      declJson = staticExec(cmd)
    
    # Finally write in the command path the cache
    writeFile("Declarations-cache.json", declJson)
  else:
    # we generate procs on the flight from Declarations.yaml
    declCache = staticRead(declCacheFile)
    declCacheTokens = newSeq[JsmnToken](250000)
    echo parseJson(declCache, declCacheTokens)
    echo "Loaded Declarations-cache.json"

when defined wasm:
  {.passL: "-L$ATEN/lib -lATen_cpu".}
  
  type ilsize* = clonglong
  
elif defined cuda:
  {.passL: "-Wl,--no-as-needed -L$ATEN/lib -L$ATEN/lib64 -lATen_cpu -lATen_cuda -lsleef -lcpuinfo -lcuda -pthread -fopenmp -lrt".}

  type ilsize* = clong

else:
  {.passL: "-L$ATEN/lib -L$ATEN/lib64 -lATen_cpu -lsleef -lcpuinfo -pthread -fopenmp -lrt".}

  type ilsize* = clong