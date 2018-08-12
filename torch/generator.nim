import os, jsmn, sam, strutils

# we abuse nim metaprogramming abilities to do everything at compiletime
# the reason is that we can just use macros and AST emitting facilities
# this file will basically write to the stdout the .nim contents with the generated deal

# number of json tokens needed to parse Declarations.yaml
const tokensNumber = 90000 # this needs to be a const.. for now 90000 seems ok but might need more

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")
  
  let declarationsFile = "src/declarations.nim"
  if not fileExists(declarationsFile):
    # convert from yaml to json to load at compile time
    echo "declarations.nim is missing, generating it now..."
    
    let
      declYaml = "../" & getenv("ATEN") & "/share/ATen/Declarations.yaml"
      # NimYAML is not active anymore and anyway we most likely have all those modules if we built ATen anyway!
      cmd = "python3 -c 'import json, sys, yaml ; " & # needs python3
        "stream = open(\"" & declYaml & "\", \"r\") ; " & # replace open with file for python2.. maybe
        "y=yaml.safe_load(stream) ; " & 
        "print(json.dumps(y))'"
      (declJson, exitCode) = gorgeEx(cmd)
    
    doAssert(exitCode == 0, "Failed to convert Declarations.yaml to JSON, failed with output: " & declJson)
    
    var declTokens = newSeq[JsmnToken](tokensNumber)
    doAssert(parseJson(declJson, declTokens) <= tokensNumber)
    var rootArray = parse(declJson, declTokens, tokensNumber)
    for node in rootArray:
      if not node.hasKey("arguments"):
        continue
      
      let
        name = node["name"].toStr
        deprecated = node{1}["deprecated"].toBool
        methodOf = node{1}["method_of"]
      
      # avoid old stuff ?
      if deprecated:
        echo "Warning: skipping deprecated declaration: " & name
        continue
      
      # gotta process array immediately cos internally node shifted forward
      type MethodOfKind = enum
        Type, Tensor, Namespace
      var methodKind: set[MethodOfKind]
      for typeNode in methodOf:
        let strValue = typeNode.toStr
        if strValue == "Tensor":
          methodKind = methodKind + {Tensor}
        elif strValue == "Type":
          methodKind = methodKind + {Type}
        elif strValue == "namespace":
          methodKind = methodKind + {Namespace}
          
      if methodKind.contains(Tensor):
        # generate tensor code, potentially
        var argsNode = node{1}["arguments"]
        
        # for now accept only 'self' as first argument
        let
          firstNode = argsNode[0]
          dynType = firstNode["dynamic_type"].toStr
          argName = firstNode{1}["name"].toStr
        
        if argName != "self" and dynType != "Tensor":
          echo "Warning: ignoring method not of Tensor and without self as first argument: " & name
          continue

        # restore stack at argsNode
        argsNode = argsNode{2}
        
        for i in 1..argsNode.len:
          let argNode = argsNode[i]
          echo argNode