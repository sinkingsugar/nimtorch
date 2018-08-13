import os, strutils, macros, osproc, json, sequtils, streams
  
const
  ofTensorToTensor = "proc $1*(self: Tensor): Tensor {.inline.} = self.dynamicCppCall(\"$2\"$3).to(ATensor)"
  ofTensorTo = "proc $1*(self: Tensor$4): $2 {.inline.} = self.dynamicCppCall(\"$3\"$5).to($2)"
  ofTensor = "proc $1*(self: Tensor$3) {.inline.} = self.dynamicCppCall(\"$2\"$4).to(void)"

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")
  
var output = newFileStream("torch/declarations.nim", fmWrite)

output.writeLine "# Automatically generated, to update run again the generator from the torch root path"
output.writeLine "# nim c -r torch/generator.nim"

# convert from yaml to json to load at compile time, using python3 for now
let
  declYaml = getenv("ATEN") & "/share/ATen/Declarations.yaml"
  # NimYAML is not active anymore and anyway we most likely have all those modules if we built ATen anyway!
  cmd = "python3 -c 'import json, sys, yaml ; " & # needs python3
    "stream = open(\"" & declYaml & "\", \"r\") ; " & # replace open with file for python2.. maybe
    "y=yaml.safe_load(stream) ; " & 
    "print(json.dumps(y))'"
  (declJson, exitCode) = execCmdEx(cmd)

doAssert(exitCode == 0, "Failed to convert Declarations.yaml to JSON, failed with output: " & declJson)

type
  MethodOfKind = enum
    Type, Tensor, Namespace
  Argument = object
    name: string
    dynamic_type: string
  Declaration = object
    name: string
    method_of: seq[string]
    deprecated: bool
    arguments: seq[Argument]
    returns: seq[Argument]

var rootNode = parseJson(declJson)
var declarations = rootNode.to(seq[Declaration])

proc toNimType(typeName: string): string =
  case typeName
  of "Tensor", "BoolTensor": return "Tensor"
  of "int64_t": return "int64"
  else: raiseAssert("Type not supported")

for declaration in declarations:
  if declaration.name == nil or declaration.name == "":
    break

  if declaration.deprecated:
    stderr.writeLine "Skipping deprecated declaration: " & declaration.name
    continue

  var methodKind: set[MethodOfKind]
  for strValue in declaration.method_of:
    if strValue == "Tensor":
      methodKind = methodKind + {Tensor}
    elif strValue == "Type":
      methodKind = methodKind + {Type}
    elif strValue == "namespace":
      methodKind = methodKind + {Namespace}

  if methodKind.contains(Tensor):
    let hasSelf = declaration.arguments.any do (x: Argument) -> bool:
      x.name == "self" and x.dynamic_type == "Tensor"
    if not hasSelf:
      stderr.writeLine "Skipping method of Tensor without self Tensor: " & declaration.name
      continue
    
    if declaration.arguments.len > 1:
      let hasValidArguments = declaration.arguments.all do (x: Argument) -> bool:
        x.dynamic_type == "Tensor"
      if not hasValidArguments:
        stderr.writeLine "Skipping method of Tensor with invalid argument/s: " & declaration.name
        continue
    
    let validResults = declaration.returns.len == 0 or 
      declaration.returns.len == 1 and
      declaration.returns[0].name == "result" and (
        declaration.returns[0].dynamic_type == "Tensor" or
        declaration.returns[0].dynamic_type == "BoolTensor" or
        declaration.returns[0].dynamic_type == "int64_t"
        )
    if not validResults:
      stderr.writeLine "Skipping method of Tensor with invalid results: " & declaration.name
      continue
    
    var validName = declaration.name
    const invalidNames = ["div"]
    if validName.endsWith("_"):
      validName &= "u"
    if validName.startsWith("_"):
      validName = "u" & validName
    if invalidNames.contains(validName):
      validName = "a" & validName  
    validName = validName.replace("__", "_u_")
    
    var argsStr1 = ""
    var argsStr2 = ""
    for i in 1..declaration.arguments.high:
      argsStr1 &= ", arg$1: $2" % [$i, toNimType(declaration.arguments[i].dynamic_type)]
      argsStr2 &= ", arg$1" % [$i]
    
    if declaration.returns.len == 0:
      output.writeLine ofTensor % [validName, declaration.name, argsStr1, argsStr2]
    else:
      case declaration.returns[0].dynamic_type
      of "Tensor", "BoolTensor":
        output.writeLine ofTensorTo % [validName, "Tensor", declaration.name, argsStr1, argsStr2]
      of "int64_t":
        output.writeLine ofTensorTo % [validName, "int64", declaration.name, argsStr1, argsStr2]
    
output.flush()
output.close()