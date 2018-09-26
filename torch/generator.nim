import os, strutils, macros, osproc, json, sequtils, streams, pegs, tables, strformat, re

# nim naming issues:
# if a name is a nim keyword, like "var", the name will be prefixed by "a", and so it will be "avar"
# underscores are replaced with "u_", "_" = "u_" or "_u"

static:
  doAssert(getenv("ATEN") != "", "Please add $ATEN variable installation path to the environment")

type
  ArgInfo = object
    originalName: string
    name: string
    nimType: string

  ProcInfo = ref object
    originalName: string
    originalAlternativeName: string
    name: string
    args: seq[ArgInfo]
    returns: seq[ArgInfo]
    argsStr: string
    nimReturnType: string
    kind: MethodOfKind
    expression: string
    bodyText: string
    needsForwardDeclaration: bool
    isInplace: bool

  MethodOfKind = enum
    Type, Tensor, Namespace

  InvalidReturnException = object of Exception

proc toNimType(typeName: string): string =
  case typeName
  of "Tensor", "BoolTensor", "IndexTensor", "IntegerTensor": return "Tensor"
  of "TensorOptions": return "TensorOptions"
  of "Storage": return "AStorage"
  of "TensorList": return "TensorList"
  of "int64_t": return "int64"
  of "bool": return "bool"
  of "real", "accreal": return "float"
  of "double": return "float64"
  of "Generator*", "Generator *", "Generator": return "Generator"
  of "IntList": return "IntList"
  of "void": return "void"
  of "void*": return "pointer"
  of "Scalar": return "float"
  of "std::array<bool,2>": return "StdArray[bool, 2]"
  of "std::array<bool,3>": return "StdArray[bool, 3]"
  of "std::array<bool,4>": return "StdArray[bool, 4]"
  of "ScalarType": return "AScalarType"
  of "std::string": return "StdString"
  of "Type": return "TensorType"
  of "SparseTensorRef": return "ASparseTensorRef"
  else: raise newException(InvalidReturnException, "Invalid return type '" & typeName & "'")

proc validate(name: string): string =
  case name:
    of "__add__": return "`+`"

    else:
      const invalidNames = ["div", "var", "end", "result", "to", "from"]
      result = name
      if invalidNames.contains(result):
        result = result & "_name"
      else:
        result = result.replacef(re"^_*(.*?)_*$", "$1")
        if name.match(re"^__(.*)__$"): result &= "_builtin"
        else:
          if name.match(re"^_(.*)$"): result &= "_internal"
          if name.match(re"^(.*)_$"): result &= "_inplace"
  
var generatedProcs = newSeq[ProcInfo]()

# Functions that are implemented manually to enable autograd
const customNames = [
  "matmul",
  "mm",
  "contiguous",
  "chunk",
  "convolution",
  "_convolution",
  "_convolution_nogroup",
  "conv1d",
  "conv2d",
  "conv3d",
  "conv_transpose1d",
  "conv_transpose2d",
  "conv_transpose3d",
]

# add some known procs we created in torch.nim, don't care about args
const knownNames = [
  "maybe_multiply",
  "mm_mat1_backward",
  "mm_mat2_backward",
  "pow_backward",
  "pow_backward_self",
  "pow_backward_exponent",
  "atan2_backward",
  "slice_backward",
  "split_backward",
  "split_with_sizes_backward",
  "sum_backward",
  "cat_tensors_backward",
  "unsqueeze_to",
  "sum_to",
  "to_args_sizes",
  "sizes",
  "strides",
  "type",
  "options"]

for knownName in knownNames:
  generatedProcs.add(ProcInfo(originalName: knownName, name: knownName, kind: Namespace))

block declarations:
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
  
  var rootNode = parseJson(declJson)
  
  for node in rootNode:
    if not node.hasKey("name"):
      continue
      
    let name = node["name"].getStr()

    # Skip deprecated procs
    var deprecated = false
    if node.hasKey("deprecated") and node["deprecated"].getBool():
      deprecated = true
      continue

    # Disable out-procs for now
    # TODO: Do we need these for some optimization?
    if name.contains("_out"):
      continue

    # # TODO: Skip inplace procs until we know how to handle their graph properly/know if we can optimize them otherwise
    # if node.hasKey("inplace") and node["inplace"].getBool():
    #   continue

    var
      originalAlternativeName: string
      validName = name

    # NN function with no _forward/_backward suffix don't have cimpls. They call the _forward function and discard any buffer returns
    # See https://github.com/pytorch/pytorch/blob/dccd0f2de69396de99f45cf6792c684b5a095c49/aten/src/ATen/function_wrapper.py#L822
    if node.hasKey("mode") and node["mode"].getStr() == "NN":
      if validName.contains("_forward"):
        originalAlternativeName = name.replace("_forward", "")
        validName = originalAlternativeName
      elif not validName.contains("_backward"):
        continue # Skip alternative desclaration

    validName = validName.validate()

    assert(node.hasKey("method_of"))
    var methodKind: set[MethodOfKind]
    for ofNode in node["method_of"]:
      case ofNode.getStr()
      of "Tensor": methodKind.incl Tensor
      of "Type": methodKind.incl Type
      of "namespace": methodKind.incl Namespace
      
    proc validateArguments(arguments: openarray[JsonNode]): bool =
      result = arguments.all do (x: JsonNode) -> bool:
        assert(x.hasKey("dynamic_type"))
        let dynType = x["dynamic_type"].getStr()
        return 
          dynType == "Tensor" or
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

      if not result:
        echo "Skipping method with invalid argument/s: ", name, " arguments: ", arguments
          
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

    proc generateProc(kind: MethodOfKind; arguments: seq[JsonNode]) =

      # Find the self-parameter
      var
        hasSelf = false
        selfPosition = 0
      
      for i, arg in arguments:
        assert(arg.hasKey("name") and arg.hasKey("dynamic_type"))
        if arg["name"].getStr() == "self" and arg["dynamic_type"].getStr() == "Tensor":
          hasSelf = true
          selfPosition = i
          break

      # Tensor procs need a self parameter
      if kind == Tensor and not hasSelf:
        echo "Skipping method of Tensor without self Tensor: ", name, " ", arguments
        return
      
      if not validateArguments(arguments):
        return

      var procInfo = ProcInfo(originalName: name, originalAlternativeName: originalAlternativeName, name: validName, args: @[], returns: @[], kind: kind)
      
      var argsStr1 = ""
      var argsStr2 = ""
      for i, arg in arguments:
        var
          nimType = toNimType(arguments[i]["dynamic_type"].getStr())
          argName = arguments[i]["name"].getStr()
          originalName = argName
          defaultStr = ""

        argName = argName.validate()
        
        fillArgumentDefaults()
        
        var nimInputType = nimType
        if nimInputType == "IntList":
          nimInputType = "openarray[SomeInteger]"
        elif nimInputType == "TensorList":
          nimInputType = "openarray[Tensor]"

        var prefix = if i == 0: "" else: "; "
        argsStr1 &= prefix & "$1: $2$3" % [argName, nimInputType, defaultStr]

        # For tensor procs we don't add `self` parameter to the native call
        if kind != Tensor or argName != "self":
          if nimType == "Tensor":
            argsStr2 &= ", $1.tensor" % [argName]
          elif nimType == "IntList":
            argsStr2 &= ", $1.toAIntList()" % [argName]
          elif nimType == "TensorList":
            argsStr2 &= ", $1.toATensors()" % [argName]
          else:
            argsStr2 &= ", $1" % [argName]

        var argInfo = ArgInfo(originalName: originalName, name: argName, nimType: nimType)
        if kind == Tensor and argName == "self":
          procInfo.args.insert(argInfo, 0)
        else:  
          procInfo.args.add(argInfo)

      var pragmasStr = ""
      if deprecated:
        pragmasStr = "{.deprecated, inline, noinit.} "
      else:
        pragmasStr = "{.inline, noinit.} "
      
      var convertStr, preCode: string

      try:
        if not node.hasKey("returns") or node["returns"].len == 0:
          raise newException(InvalidReturnException, "Method has no returns") # should not happen by design
        
        elif node["returns"].len == 1:
          procInfo.nimReturnType = toNimType(node["returns"][0]["dynamic_type"].getStr())
          convertStr = ".to(" & procInfo.nimReturnType & ")"

          if procInfo.nimReturnType == "Tensor":
            convertStr = ".to(ATensor).newTensor()"
          elif procInfo.nimReturnType == "TensorList":
            convertStr = ".to(ATensors).newTensors()"

          procInfo.returns.add(ArgInfo(originalName: "", name: "", nimType: procInfo.nimReturnType))
          
        elif node["returns"].len > 1: # tuple, a bit ugly tho
          var
            tupleStr1 = ""
            tupleStr2 = ""
            resultStr = ""
          
          let returnsHigh = node["returns"].len - 1
          for i in 0 .. returnsHigh:
            var
              res = node["returns"][i]["dynamic_type"].getStr()
              returnName = node["returns"][i]["name"].getStr()
            
            # Need to
            # turn any grad_input into self because of:
            # https://github.com/pytorch/pytorch/blob/e26d584445a80a548485097bfbef1f67bba5f771/aten/src/ATen/nn_parse.py#L356
            # addume grad_ is to be cut cos of
            # https://github.com/pytorch/pytorch/blob/e26d584445a80a548485097bfbef1f67bba5f771/aten/src/ATen/nn_parse.py#L356
            if returnName == "grad_input":
              returnName = "self"
            elif returnName.startsWith("grad_"):
              returnName = returnName["grad_".len..^1]
            
            var
              originalReturnName = returnName
              outputType = res.toNimType
              toType = outputType
              
            if outputType == "Tensor":
              toType = "ATensor"
            elif outputType == "TensorList":
              toType = "ATensors"

            returnName = returnName.validate()

            procInfo.returns.add(ArgInfo(originalName: originalReturnName, name: returnName, nimType: outputType))

            tupleStr1 &= returnName & ": " & outputType
            tupleStr2 &= toType

            if i != returnsHigh:
              tupleStr1 &= ", "
              tupleStr2 &= ", "

          convertStr = ".to(StdTuple" & $(returnsHigh + 1) & "[" & tupleStr2 & "]).toNimTuple().newTensors()"
          procInfo.nimReturnType = "tuple[" & tupleStr1 & "]"
         
        else:
          raise newException(InvalidReturnException, "Not implemented returns length")

        if node.hasKey("inplace") and node["inplace"].getBool():
          procInfo.isInplace = true
          convertStr = ".to(void); self"

        case kind:
          of Tensor:
            procInfo.argsStr = argsStr1
            procInfo.expression = fmt"self.tensor.atenMethod(""{procInfo.originalName}""{argsStr2}){convertStr}"
          of Type:
            procInfo.argsStr = "ty: TensorType; " & argsStr1
            procInfo.expression = fmt"ty.atenMethod(""{procInfo.originalName}""{argsStr2}){convertStr}"
          of Namespace:
            procInfo.argsStr = argsStr1
            procInfo.expression = fmt"atenFunction(""at::{procInfo.originalName}""{argsStr2}){convertStr}"

        #output.writeLine(procInfo.kind.procFormatString % [procInfo.name, procInfo.nimReturnType, procInfo.originalName, argsStr1, argsStr2, convertStr, pragmasStr, preCode])
        generatedProcs.add(procInfo)

      except InvalidReturnException:
        echo "Skipping method with invalid results: ", name, " type: ", node["returns"][0]["dynamic_type"].getStr()
        echo getCurrentExceptionMsg()
    
    assert(node.hasKey("arguments"))
    let arguments = toSeq(node["arguments"])

    # Always generate the type proc
    if methodKind.contains(Type):
      generateProc(Type, arguments)

    # Generate only the tensor or the namespace proc.
    # In nim the call syntax is unified
    if methodKind.contains(Tensor):
      generateProc(Tensor, arguments) 
    elif methodKind.contains(Namespace):
      generateProc(Namespace, arguments)

block derivatives: # we still need to implement some of the procs in pytorch's 'tools/autograd/templates/Functions.cpp'

  # convert from yaml to json to load at compile time, using python3 for now
  let
    derYaml = getenv("ATEN") & "/share/derivatives.yaml"
    # NimYAML is not active anymore and anyway we most likely have all those modules if we built ATen anyway!
    cmd = "python3 -c 'import json, sys, yaml ; " & # needs python3
      "stream = open(\"" & derYaml & "\", \"r\") ; " & # replace open with file for python2.. maybe
      "y=yaml.safe_load(stream) ; " & 
      "print(json.dumps(y))'"
    (derJson, exitCode) = execCmdEx(cmd)
    
  let namePeg = peg"""
    full <- dot? {Name} func
    Name <- (validChars)+
    validChars <- \ident
    dot <- '.'
    func <- '(' @ ')'
    """
  let nameArgsPeg = peg"""
    full <- {Name} func
    Name <- (validChars)*
    validChars <- \ident
    func <- '(' {@} ')'
    """

  let argsPegs = peg"""
    full <- argFull+ argDelim argFull+ / argFull+
    separator <- ','
    ws <- \s
    argDelim <- ws? '*' ws? separator?
    argFull <- ws? arg ws? separator?
    arg <- {validChars} ws+ {validChars}
    validChars <- \ident
    """

  # generate replacements for calls from ATen/pytorch to nim 
  var replacements = newSeq[tuple[pattern: Peg, repl: string]]()
  for p in generatedProcs:
    case p.kind
    of Tensor: replacements.add((peg("'.' '" & p.originalName & "' '('"), "." & p.name & "("))
    of Namespace: replacements.add((peg("!'.' '" & p.originalName & "' '('"), p.name & "("))
    else: discard
  
  let callPeg = peg"','? \s? \ident+"

  doAssert(exitCode == 0, "Failed to convert derivatives.yaml to JSON, failed with output: " & derJson)

  var rootNode = parseJson(derJson)

  for node in rootNode:
    if not node.hasKey("name"):
      continue
    
    var
      name = ""
      info: ProcInfo
    
    let nameFull = node["name"].getStr()
    if nameFull =~ namePeg:
      name = matches[0]

    assert(name != "", nameFull)

    var nameMatches: array[0..10, string]
    if not nameFull.match(nameArgsPeg, nameMatches):
      echo "Invalid signature: " & nameFull
      continue

    var args = nameMatches[1].split(peg"',' \s?")

    # remove *, its the delimiter for optional args...
    let wildcardIndex = args.find("*")
    if wildcardIndex != -1:
      args.del(wildcardIndex)

    var candidates = generatedProcs.filter do (x: ProcInfo) -> bool:
      if x.originalName != name:
        return false

      if x.args.len != args.len:
        return false

      for i, arg in x.args:
        let
          argB = args[i].split(peg"\s+")[0].toNimType
          argA = x.args[i].nimType
        
        if argA != argB:
          return false

      return true

    for info in candidates:

      # at this point we know of which Declarations.yaml proc we are talking about

      # build backward proc itself
      var
        resTuple = "tuple["
        body = "\n"
        argsStr = ""
        hasError = false

        head: string
        bodyText: string

      block generateProc:
        var nodeIndex = 0
        for k, v in node:
          let vStr = v.getStr()
            .replace("at::", "") # also remove any at::prefix
            .replace(";", "") # remove semicolons from the end of some expressions

          if k == "name" or vStr.startsWith("not_implemented"):
            continue

          # k can be multi like: "self, weight, bias", this is likely a tuple
          let names = k.split(peg"',' \s?")

          # must keep track of final calls, to recycle them (specially if final result was a tuple)
          var
            calls = initTable[string, string]()
            addedInputMask = false
            generatedTrainingAssert = false
          
          bodyText &= "  "
          if names.len > 1:
            bodyText &= fmt"({k}): "
          else:
            bodyText &= fmt"{k}: "

          for name in names:
            var
              argName = info.args.filter do (x: ArgInfo) -> bool: x.originalName == name
              prefix = if nodeIndex == 0: "" else: ", "
            
            if argName.len == 0:
              echo "A needed arg was not found: ", name
              hasError = true
              break generateProc

          var nimLikeStr = vStr
              
          # make sure we got all procs we need nim side
          var neededProcs = nimLikeStr.findAll(namePeg)
          for neededProc in neededProcs:
            if neededProc =~ namePeg: # go thru again to filter out not matched stuff

              var hasProc = false
              for knownProc in generatedProcs:
                # we assume Type ONLY procs are not used/needed in derivatives.. this might be wrong
                if knownProc.kind notin { Tensor, Namespace }:
                  continue

                # The name must match the original name, or the name of it's forward-version, for NN procs
                if knownProc.originalName != matches[0] and knownProc.originalAlternativeName != matches[0]:
                  continue

                # TODO: Check arguments?
                hasProc = true
                knownProc.needsForwardDeclaration = true
              
              if not hasProc:
                echo "A needed proc was not found: ", neededProc
                hasError = true
                break generateProc
            
          # fix all pytorch to nim namings
          nimLikeStr = nimLikeStr.parallelReplace(replacements)

          # fix fwd_result namings
          nimLikeStr = nimLikeStr.replacef(peg"{[^_]} 'result' {\d}", "$1fwd_result[$2]")
          nimLikeStr = nimLikeStr.replacef(peg"^'result' {\d}", "fwd_result[$1]")
          nimLikeStr = nimLikeStr.replacef(peg"{[^_]} 'result' {!\ident}", "$1fwd_result$2")
          nimLikeStr = nimLikeStr.replacef(peg"^'result' {!\ident}", "fwd_result$1")

          nimLikeStr = nimLikeStr.replacef(peg"{[^_]} 'output' {!\ident}", "$1fwd_result$2")
          nimLikeStr = nimLikeStr.replacef(peg"^'output' {!\ident}", "fwd_result$1")

          # TODO: Handle invalide names
          nimLikeStr = nimLikeStr.replacef(peg"'end'", "end_name")

          nimLikeStr = nimLikeStr.replace(".type()", ".getType()")

          # replace any fwd result tuple names with proper prefix if necessary
          if info.returns.len > 1:
            for retArg in info.returns:
              nimLikeStr = nimLikeStr.replacef(peg("{[^_]} '" & retArg.originalName & "' {!\\ident}"), "$1fwd_result." & retArg.name & "$2")

          # replace int lists {} to our @[]
          nimLikeStr = nimLikeStr.replacef(peg"'{' {@} '}'", "@[$1]")

          # TODO: Properly handle "training ? A : B"
          nimLikeStr = nimLikeStr.replacef(re"^(.*)\?(.*):(.*)$", "$2")

          if names.len == 1:
            bodyText &= fmt"firstOrSelf({nimLikeStr})" & "\n"
          else:
            bodyText &= fmt"{nimLikeStr}" & "\n"

      if hasError:
        echo "Ignoring derivative (not implemented or error): ", name
        continue

      info.bodyText = bodyText

  # Generate forward declarations
  var output = newFileStream("torch/declarations.nim", fmWrite)
  output.writeLine "# Automatically generated, to update run again the generator from the torch root path"
  output.writeLine "# nim c -r torch/generator.nim\n"
  output.writeLine "template atenMethod*(obj: CppObject, field: untyped, args: varargs[CppProxy, CppFromAst]): CppProxy = obj.dynamicCppCall(field, args)"
  output.writeLine "template atenFunction*(field: untyped, args: varargs[CppProxy, CppFromAst]): CppProxy = dynamicCCall(field, args)\n"

  for info in generatedProcs:

    # Check if this proc was actually generated or if it's defined manually
    if info.expression == "":
      continue

    # Skip manually implemented procs
    if info.originalName in customNames:
      continue

    # If there was no autograd version generated, output a normal forward proc
    let pragma = if info.isInplace: ", discardable" else: ""
    if info.bodyText == "":
      output.writeLine(
        fmt"proc {info.name}*({info.argsStr}): {info.nimReturnType} {{.inline{pragma}.}} = " & "\n" &
        fmt"  {info.expression}" & "\n")

    # Otherwise output a forward declaration, if necessary
    else:
      output.writeLine(fmt"proc {info.name}*({info.argsStr}): {info.nimReturnType} {{.inline{pragma}.}}" & "\n")

  output.flush()
  output.close()

  # Generate autograd definitions
  output = newFileStream("torch/derivatives.nim", fmWrite)

  output.writeLine "# Automatically generated, to update run again the generator from the torch root path"
  output.writeLine "# nim c -r torch/generator.nim\n"
  output.writeLine "import math"
  output.writeLine "const M_PI = math.PI\n"
  
  for info in generatedProcs:
    let pragma = if info.isInplace: ", discardable" else: ""
    if info.bodyText != "":
      output.writeLine(
        fmt"autograd {info.name}:" & "\n" &
        fmt"  proc forward*({info.argsStr}): {info.nimReturnType} {{.inline{pragma}.}} = " & "\n" &
        fmt"    {info.expression}" & "\n" &
        info.bodyText)

  output.flush()
  output.close()