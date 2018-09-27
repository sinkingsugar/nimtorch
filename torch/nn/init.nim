import ../../torch
import ../python_helpers
import math, strutils

proc calculate_gain*(nonlinearity: string; param: SomeNumber = 0.01): float =
  const linear_fns = [
    "linear", 
    "conv1d", 
    "conv2d", 
    "conv3d", 
    "conv_transpose1d", 
    "conv_transpose2d", "conv_transpose3d"
    ]
  
  if nonlinearity in linear_fns or nonlinearity == "sigmoid":
    return 1
  elif nonlinearity == "tanh":
    return 5.0 / 3
  elif nonlinearity == "relu":
    return math.sqrt(2.0)
  elif nonlinearity == "leaky_relu":
    return math.sqrt(2.0 / (1.0 + param.float ** 2))
  else:
    raiseAssert("Unsupported nonlinearity")

proc calculate_fan_in_and_fan_out*(tensor: Tensor): (int64, int64) =
  let dimensions = tensor.ndimension()
  if dimensions < 2:
      raiseAssert("Fan in and fan out can not be computed for tensor with less than 2 dimensions")

  var
    fan_in, fan_out: int64

  if dimensions == 2:  # Linear
      fan_in = tensor.size(1)
      fan_out = tensor.size(0)
  else:
      let
        num_input_fmaps = tensor.size(1)
        num_output_fmaps = tensor.size(0)
      var
        receptive_field_size: int64 = 1
      if tensor.dim() > 2:
          receptive_field_size = tensor[0][0].numel()
      fan_in = num_input_fmaps * receptive_field_size
      fan_out = num_output_fmaps * receptive_field_size

  return (fan_in, fan_out)

proc calculate_correct_fan*(tensor: Tensor; mode: string): int64 =
    let modeLower = mode.toLowerAscii()
    const valid_modes = ["fan_in", "fan_out"]
    if valid_modes.contains(modeLower):
      let (fan_in, fan_out) = calculate_fan_in_and_fan_out(tensor)
      case modeLower
      of "fan_in":
        return fan_in
      of "fan_out":
        return fan_out
    else:
      raiseAssert("Mode not supported, please use one of " & $valid_modes)

proc xavier_normal*(tensor: Tensor; gain: float = 1.0): Tensor =
  let
    (fan_in, fan_out) = calculate_fan_in_and_fan_out(tensor)
    std = gain * sqrt(2.0 / (fan_in.float + fan_out.float))
    a = math.sqrt(3.0) * std  # Calculate uniform bounds from standard deviation
  # with torch.no_grad():
  return tensor.uniform_inplace(-a, a)

proc kaiming_uniform*(tensor: Tensor; a = 0.0; mode = "fan_in"; nonlinearity="leaky_relu"): Tensor =
  let
    fan = calculate_correct_fan(tensor, mode)
    gain = calculate_gain(nonlinearity, a)
    std = gain / math.sqrt(fan.float)
    bound = math.sqrt(3.0) * std  # Calculate uniform bounds from standard deviation
  # with torch.no_grad():
  return tensor.uniform_inplace(-bound, bound)

proc uniform*(tensor: Tensor; a=0.0; b=1.0): Tensor =
  # with torch.no_grad():
  return tensor.uniform_inplace(a, b)

when isMainModule:
  let
    z = zeros(@[2, 1, 4])
    xav = z.xavier_normal()
  
  xav.print()

  var
    v = zeros(@[2, 1, 4])
  v = v.xavier_normal()
  v.print()