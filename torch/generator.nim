import os, strutils, macros, osproc, json, sequtils, streams

# nim naming issues:
# if a name is a nim keyword, like "var", the name will be prefixed by "a", and so it will be "avar"
# underscores are replaced with "u_", "_" = "u_"

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

var rootNode = parseJson(declJson)

proc toNimType(typeName: string): string =
  case typeName
  of "Tensor", "BoolTensor": return "Tensor"
  of "int64_t": return "int64"
  of "bool": return "bool"
  else: raiseAssert("Type not supported")

for node in rootNode:
  if not node.hasKey("name"):
    break
    
  let name = node["name"].getStr()

  if node.hasKey("deprecated") and node["deprecated"].getBool():
    stderr.writeLine "Skipping deprecated declaration: " & name
    continue

  assert(node.hasKey("method_of"))

  var methodKind: set[MethodOfKind]
  for ofNode in node["method_of"]:
    case ofNode.getStr()
    of "Tensor": methodKind = methodKind + {Tensor}
    of "Type": methodKind = methodKind + {Type}
    of "namespace": methodKind = methodKind + {Namespace}

  if methodKind.contains(Tensor):
    echo "Processing Tensor method: ", name
    
    assert(node.hasKey("arguments"))
    
    let arguments = toSeq(node["arguments"])
    let hasSelf = arguments.any do (x: JsonNode) -> bool:
      assert(x.hasKey("name") and x.hasKey("dynamic_type"))
      return x["name"].getStr() == "self" and x["dynamic_type"].getStr() == "Tensor"
      
    if not hasSelf:
      echo arguments
      stderr.writeLine "Skipping method of Tensor without self Tensor: " & name
      continue
    
    if arguments.len > 1:
      let hasValidArguments = arguments.all do (x: JsonNode) -> bool:
        assert(x.hasKey("dynamic_type"))
        let dynType = x["dynamic_type"].getStr()
        return  dynType == "Tensor" or
                dynType == "BoolTensor" or
                dynType == "int64_t" or 
                dynType == "bool"
        
      if not hasValidArguments:
        stderr.writeLine "Skipping method of Tensor with invalid argument/s: " & name
        continue
    
    let validResults = not node.hasKey("returns") or 
        node["returns"].len == 1 and
        node["returns"][0]["name"].getStr() == "result" and (
        node["returns"][0]["dynamic_type"].getStr() == "Tensor" or
        node["returns"][0]["dynamic_type"].getStr() == "BoolTensor" or
        node["returns"][0]["dynamic_type"].getStr() == "int64_t" or 
        node["returns"][0]["dynamic_type"].getStr() == "bool"
        )
    if not validResults:
      stderr.writeLine "Skipping method of Tensor with invalid results: " & name
      continue
    
    var validName = name
    const invalidNames = ["div", "var"]
    if validName.endsWith("_"):
      validName &= "u"
    if validName.startsWith("_"):
      validName = "u" & validName
    if invalidNames.contains(validName):
      validName = "a" & validName  
    validName = validName.replace("__", "_u_")
    
    var argsStr1 = ""
    var argsStr2 = ""
    for i in 1..arguments.high:
      var nimType = toNimType(arguments[i]["dynamic_type"].getStr())
      var defaultStr = ""
      if arguments[i].hasKey("default") and nimType != "Tensor":
        defaultStr = " = " & $arguments[i]["default"]
      argsStr1 &= ", arg$1: $2$3" % [$i, nimType, defaultStr]
      argsStr2 &= ", arg$1" % [$i]
    
    if not node.hasKey("returns") or node["returns"].len == 0:
      output.writeLine ofTensor % [validName, name, argsStr1, argsStr2]
    else:
      output.writeLine ofTensorTo % [validName, toNimType(node["returns"][0]["dynamic_type"].getStr()), name, argsStr1, argsStr2]
    
output.flush()
output.close()