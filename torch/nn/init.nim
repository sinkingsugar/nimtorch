import ../../nimtorch
import math

proc calculate_fan_in_and_fan_out(tensor: Tensor): (int64, int64) =
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

proc xavier_normal*(tensor: Tensor; gain: float = 1.0): Tensor =
  let
    (fan_in, fan_out) = calculate_fan_in_and_fan_out(tensor)
    std = gain * sqrt(2.0 / (fan_in.float + fan_out.float))
    a = math.sqrt(3.0) * std  # Calculate uniform bounds from standard deviation
  return tensor.uniform_u(-a, a)

when isMainModule:
  let
    z = torch.zeros(2, 1, 4)
    xav = z.xavier_normal()
  
  xav.print()