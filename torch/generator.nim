import os, jsmn, sam, strutils, macros

# we abuse nim metaprogramming abilities to do everything at compiletime
# the reason is that we can just use macros and AST emitting facilities
# this file will basically write to the stdout the .nim contents with the generated deal

# at compile time we run in the nim vm which is limited so we need to do some little hardcoding.
const
  maxTokensNumber = 90000 # number of json tokens needed to parse Declarations.yaml for now 90000 seems ok but might need more
  maxArgumentsNumber = 16 # change this if a call ever has more then 16 args
  
# dumpAstGen:
#   proc sigmoid*(a: Tensor): Tensor {.inline.} = a.dynamicCppCall(sigmoid).to(ATensor)
  
var generatedProcs {.compileTime.} = newSeq[NimNode]()

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")
  
  let declarationsFile = "src/declarations.nim"
  if not fileExists(declarationsFile):
    echo "declarations.nim is missing, generating it now..."
    
    # convert from yaml to json to load at compile time, using python3 for now
    let
      declYaml = "../" & getenv("ATEN") & "/share/ATen/Declarations.yaml"
      # NimYAML is not active anymore and anyway we most likely have all those modules if we built ATen anyway!
      cmd = "python3 -c 'import json, sys, yaml ; " & # needs python3
        "stream = open(\"" & declYaml & "\", \"r\") ; " & # replace open with file for python2.. maybe
        "y=yaml.safe_load(stream) ; " & 
        "print(json.dumps(y))'"
      (declJson, exitCode) = gorgeEx(cmd)
    
    doAssert(exitCode == 0, "Failed to convert Declarations.yaml to JSON, failed with output: " & declJson)
    
    # load json to tokens array
    var declTokens = newSeq[JsmnToken](maxTokensNumber)
    doAssert(parseJson(declJson, declTokens) <= maxTokensNumber)
    
    type
      Argument = object
        name: string
        dynamic_type: string
      Declaration = object
        name: string
        method_of: array[maxArgumentsNumber, string]
        deprecated: bool
        arguments: array[maxArgumentsNumber, Argument] # gotta use array, for some reason at compiletime anyway
        
    var declarations = newSeq[Declaration](maxTokensNumber) # this might be too much
    
    # parsing json
    var rootArray = parse(declJson, declTokens, maxTokensNumber)
    
    loads(declarations, rootArray)
    
    for declaration in declarations:
      if declaration.name == nil or declaration.name == "":
        break
      
      echo declaration.name, " ", declaration.method_of
      
#     for node in rootArray:
#       if not node.hasKey("arguments"):
#         continue
      
#       let
#         name = node["name"].toStr
#         deprecated = node{1}["deprecated"].toBool
#         methodOf = node{1}["method_of"]
      
#       # avoid old stuff ?
#       if deprecated:
#         echo "Warning: skipping deprecated declaration: " & name
#         continue
      
#       # gotta process array immediately cos internally node shifted forward
#       type MethodOfKind = enum
#         Type, Tensor, Namespace
#       var methodKind: set[MethodOfKind]
#       for typeNode in methodOf:
#         let strValue = typeNode.toStr
#         if strValue == "Tensor":
#           methodKind = methodKind + {Tensor}
#         elif strValue == "Type":
#           methodKind = methodKind + {Type}
#         elif strValue == "namespace":
#           methodKind = methodKind + {Namespace}
          
#       if methodKind.contains(Tensor):
#         # generate tensor code, potentially
#         var argsNode = node{1}["arguments"]
        
#         if argsNode.len > 0:
#           # for now accept only 'self' as first argument
#           let
#             firstNode = argsNode[0]
#             dynType = firstNode["dynamic_type"].toStr
#             argName = firstNode{1}["name"].toStr

#           if argName != "self" and dynType != "Tensor":
#             echo "Warning: ignoring method not of Tensor and without self as first argument: " & name
#             continue

#           # restore stack at argsNode
#           argsNode = argsNode{2}

#           var procNode = nnkStmtList.newTree(
#             nnkProcDef.newTree(
#               nnkPostfix.newTree(
#                 newIdentNode("*"),
#                 newIdentNode(name)
#               ),
#               newEmptyNode(),
#               newEmptyNode(),
#               nnkFormalParams.newTree(
#                 newIdentNode("Tensor"),
#                 nnkIdentDefs.newTree(
#                   newIdentNode("self"),
#                   newIdentNode("Tensor"),
#                   newEmptyNode()
#                 )
#               ),
#               nnkPragma.newTree(
#                 newIdentNode("inline")
#               ),
#               newEmptyNode(),
#               nnkStmtList.newTree(
#                 nnkCall.newTree(
#                   nnkDotExpr.newTree(
#                     nnkCall.newTree(
#                       nnkDotExpr.newTree(
#                         newIdentNode("self"),
#                         newIdentNode("dynamicCppCall")
#                       ),
#                       newIdentNode(name)
#                     ),
#                     newIdentNode("to")
#                   ),
#                   newIdentNode("ATensor")
#                 )
#               )
#             )
#           )

#           # using array [] is annoying
#           var first = true
#           for argNode in argsNode:
#             if first:
#               first = false
#               continue
# #             echo argNode
            
#           generatedProcs.add(procNode)
          
macro emitProcs(): untyped =
  result = newStmtList()
  for p in generatedProcs:
    result.add(p)

expandMacros:
  emitProcs()