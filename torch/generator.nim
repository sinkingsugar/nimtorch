import os, strutils, macros, osproc, json, sequtils, streams

# nim naming issues:
# if a name is a nim keyword, like "var", the name will be prefixed by "a", and so it will be "avar"
# underscores are replaced with "u_", "_" = "u_" or "_u"

const
  ofTensorTo = "template $1*(self: Tensor$4): $2 $7= self.dynamicCppCall(\"$3\"$5).$6"
  ofNamespaceTo = "template $1*($4): $2 $7= dynamicCCall(\"at::$3\"$5).$6"

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
    
  InvalidReturnException = object of Exception

var rootNode = parseJson(declJson)

proc toNimType(typeName: string): string =
  case typeName
  of "Tensor", "BoolTensor", "IndexTensor", "IntegerTensor": return "Tensor"
  of "TensorOptions": return "ATensorOptions"
  of "Storage": return "AStorage"
  of "TensorList": return "TensorList"
  of "int64_t": return "int64"
  of "bool": return "bool"
  of "real", "accreal": return "float"
  of "double": return "float64"
  of "Generator*", "Generator *": return "pointer"
  of "IntList": return "IntList"
  of "void": return "void"
  of "void*": return "pointer"
  of "Scalar": return "float"
  of "std::array<bool,2>": return "BoolArray2"
  of "std::array<bool,3>": return "BoolArray3"
  of "std::array<bool,4>": return "BoolArray4"
  of "ScalarType": return "AScalarType"
  of "std::string": return "StdString"
  of "Type": return "AType"
  of "SparseTensorRef": return "SparseTensorRef"
  else: raise newException(InvalidReturnException, "Invalid return type")
  
proc validate(validName: var string) =
  const invalidNames = ["div", "var", "end", "result", "to", "from"]
  if validName.endsWith("_"):
    validName &= "u"
  if validName.startsWith("_"):
    validName = "u" & validName
  if invalidNames.contains(validName):
    validName = "a" & validName
  validName = validName.replace("__", "_u_u")

for node in rootNode:
  if not node.hasKey("name"):
    break
    
  let name = node["name"].getStr()

  var deprecated = false
  if node.hasKey("deprecated") and node["deprecated"].getBool():
    deprecated = true

  assert(node.hasKey("method_of"))

  var methodKind: set[MethodOfKind]
  for ofNode in node["method_of"]:
    case ofNode.getStr()
    of "Tensor": methodKind = methodKind + {Tensor}
    of "Type": methodKind = methodKind + {Type}
    of "namespace": methodKind = methodKind + {Namespace}
    
  template validateArguments: untyped =
    let hasValidArguments = arguments.all do (x: JsonNode) -> bool:
        assert(x.hasKey("dynamic_type"))
        let dynType = x["dynamic_type"].getStr()
        return  dynType == "Tensor" or
                dynType == "BoolTensor" or
                dynType == "IndexTensor" or
                dynType == "IntegerTensor" or
                dynType == "TensorList" or
                dynType == "int64_t" or 
                dynType == "bool" or
                dynType == "real" or
                dynType == "double" or
                dynType == "Generator*" or dynType == "Generator *" or
                dynType == "IntList" or
                dynType == "accreal" or
                dynType == "Scalar" or
                dynType == "TensorOptions" or
                dynType == "Storage" or
                dynType == "ScalarType" or
                dynType == "std::string" or
                dynType == "std::array<bool,2>" or
                dynType == "std::array<bool,3>" or
                dynType == "std::array<bool,4>" or
                dynType == "Type" or
                dynType == "SparseTensorRef"

    if not hasValidArguments:
      echo "Skipping method with invalid argument/s: ", name, " arguments: ", arguments
      continue
        
  template fillArgumentDefaults: untyped =
    if arguments[i].hasKey("default"):
      let defaultNode = arguments[i]["default"]
      case defaultNode.kind
      of JInt, JBool:
        # easy case, no need to transform
        case nimType
        of "IntList": defaultStr = " = @[" & $arguments[i]["default"] & "]"
        else: defaultStr = " = " & $arguments[i]["default"]
      of JString:
        let stringValue = arguments[i]["default"].getStr()
        case stringValue
        of "nullptr": defaultStr = " = nil"
      else:
        # skipping defaults, might cause integration issues tho
        discard
        
  template generateProc(ofTemplateTo: untyped): untyped =
    var deprecatedStr = ""
    if deprecated:
      deprecatedStr = "{.deprecated.} "
    
    try:
      if not node.hasKey("returns") or node["returns"].len == 0:
        raise newException(InvalidReturnException, "Method has no returns") # should not happen by design
        
      elif node["returns"].len == 1:
        let outputType = toNimType(node["returns"][0]["dynamic_type"].getStr())
        
        output.writeLine ofTemplateTo % [validName, outputType, name, argsStr1, argsStr2, "to(" & outputType & ")", deprecatedStr]
        
      elif node["returns"].len > 1: # tuple, a bit ugly tho
        var
          tupleStr = "("
          convertStr = ""
          isRef = false
          hasVector = false
        
        let returnsHigh = node["returns"].len - 1
        for i in 0..returnsHigh:
          let
            res = node["returns"][i]["dynamic_type"].getStr()
            resType = node["returns"][i]["type"].getStr()
          
          # quite hard coded behavior for now...
          # reason is we hard coded tuples in torch_cpp
          # not a problem since it's very few and probably rare to increase/change
          # if maintenance cost/time is too high lets soft code it
          
          if resType == "Tensor &":
            isRef = true
          
          if res == "TensorList":
            hasVector = true
          
          tupleStr &= toNimType(res)
          
          if i != returnsHigh:
            tupleStr &= ", "
          else:
            tupleStr &= ")"
            
            case returnsHigh
            of 1:
              if isRef:
                convertStr = "to(ATensorRTuple2).toNimTensorTuple()"
              else:
                convertStr = "to(ATensorTuple2).toNimTensorTuple()"
            of 2:
              if isRef:
                convertStr = "to(ATensorRTuple3).toNimTensorTuple()"
              else:
                convertStr = "to(ATensorTuple3).toNimTensorTuple()"
            of 3:
              if hasVector:
                convertStr = "to(ATensorTuple3v1).toNimTensorTuple()"
              else:
                if isRef:
                  convertStr = "to(ATensorRTuple4).toNimTensorTuple()"
                else:
                  convertStr = "to(ATensorTuple4).toNimTensorTuple()"
            of 4:
              if isRef:
                convertStr = "to(ATensorRTuple5).toNimTensorTuple()"
              else:
                convertStr = "to(ATensorTuple5).toNimTensorTuple()"
            else:
              raise newException(InvalidReturnException, "Not implemented tuple size")
          
        output.writeLine ofTemplateTo % [validName, tupleStr, name, argsStr1, argsStr2, convertStr, deprecatedStr]
          
      else:
        raise newException(InvalidReturnException, "Not implemented returns length")
    
    except InvalidReturnException:
      echo "Skipping method with invalid results: ", name, " type: ", node["returns"][0]["dynamic_type"].getStr()
      echo getCurrentExceptionMsg()
  
  assert(node.hasKey("arguments"))
  let arguments = toSeq(node["arguments"])

  if methodKind.contains(Tensor):
    let hasSelf = arguments.any do (x: JsonNode) -> bool:
      assert(x.hasKey("name") and x.hasKey("dynamic_type"))
      return x["name"].getStr() == "self" and x["dynamic_type"].getStr() == "Tensor"
      
    if not hasSelf:
      echo "Skipping method of Tensor without self Tensor: ", name, " ", arguments
      continue
    
    if arguments.len > 1:
      validateArguments()
    
    var validName = name
    validName.validate()
    
    var argsStr1 = ""
    var argsStr2 = ""
    for i in 0..arguments.high:
      var
        nimType = toNimType(arguments[i]["dynamic_type"].getStr())
        argName = arguments[i]["name"].getStr()
        defaultStr = ""
      
      if argName == "self":
        continue
      
      argName.validate()
      
      fillArgumentDefaults()
      
      argsStr1 &= ", $1: $2$3" % [argName, nimType, defaultStr]
      argsStr2 &= ", $1" % [argName]
    
    generateProc(ofTensorTo)
      
  elif methodKind.contains(Namespace):
  
    if arguments.len > 0:
      validateArguments()
    
    var validName = name
    validName.validate()
    
    var argsStr1 = ""
    var argsStr2 = ""
    for i in 0..arguments.high:
      var
        nimType = toNimType(arguments[i]["dynamic_type"].getStr())
        argName = arguments[i]["name"].getStr()
        defaultStr = ""
        
      argName.validate()
      
      fillArgumentDefaults()
      
      var prefix = if i == 0: "" else: ", "
      argsStr1 &= prefix & "$1: $2$3" % [argName, nimType, defaultStr]
      argsStr2 &= ", $1" % [argName]
    
    generateProc(ofNamespaceTo)
    
output.flush()
output.close()