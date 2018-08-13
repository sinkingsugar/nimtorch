import os, strutils, macros, osproc, json, sequtils, streams
  
const
  ofTensorToTensor = "proc $1*(self: Tensor): Tensor {.inline.} = self.dynamicCppCall(\"$2\"$3).to(ATensor)"

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
    let hasSelfTensor = declaration.arguments.any do (x: Argument) -> bool:
      x.name == "self" and x.dynamic_type == "Tensor"
    if not hasSelfTensor:
      # should actually never happen
      stderr.writeLine "Skipping method of Tensor without self Tensor: " & declaration.name
      continue

    let hasTensorReturn = declaration.returns.any do (x: Argument) -> bool:
      x.name == "result" and x.dynamic_type == "Tensor"
    if hasTensorReturn:
      if declaration.arguments.len == 1: # self only
        var validName = declaration.name
        if validName.endsWith("_"):
          validName &= "u"
        if validName.startsWith("_"):
          validName = "u" & validName
        output.writeLine ofTensorToTensor % [validName, declaration.name, ""]

output.flush()
output.close()