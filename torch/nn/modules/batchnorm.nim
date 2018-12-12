import ../../../torch, ../modules, ../functional

type
  BatchNormModule* = ref object of LinearModuleBase
    num_features: int
    eps: float
    momentum: float
    affine: bool
    track_running_stats: bool

    running_mean: Tensor
    running_var: Tensor
    num_batches_tracked: int

    training: bool

proc BatchNorm*(num_features: int; eps: float = 1e-5; momentum: float = 0.1; affine: bool = true; track_running_stats: bool = true): BatchNormModule =
  new(result)
  let m = result

  m.num_features = num_features
  m.eps = eps
  m.momentum = momentum
  m.affine = affine
  m.track_running_stats = track_running_stats

  if m.affine:
    m.weight = zeros(num_features)
    m.bias = zeros(num_features)

  if m.track_running_stats:
    m.running_mean = zeros(num_features)
    m.running_var = ones(num_features)

  m.forward = proc(input: varargs[Tensor]): Tensor =
    var exponential_average_factor = 0.0
    if m.training and m.track_running_stats:
      inc m.num_batches_tracked
      if m.momentum == 0.0: # use cumulative moving average
        exponential_average_factor = 1.0 / m.num_batches_tracked.float
      else: # use exponential moving average
        exponential_average_factor = m.momentum

    let training = m.training or not m.track_running_stats
    return batch_norm(input[0], m.running_mean, m.running_var, m.weight, m.bias, training, exponential_average_factor, m.eps)

  m.reset_parameters()

method parameters*(m: BatchNormModule): seq[Tensor] =
  if m.affine:
    result.add([m.bias, m.weight]) # [beta, gamma]
  if m.track_running_stats:
    result.add([m.running_mean, m.running_var])

proc reset_running_state*(m: BatchNormModule) =
  if m.track_running_stats:
    m.running_mean.zero_inplace()
    m.running_var.fill_inplace(1.0)
    m.num_batches_tracked = 0

method reset_parameters*(m: BatchNormModule) =
  m.reset_running_state()
  if m.affine:
    m.weight.uniform_inplace()
    m.bias.zero_inplace()
    m.weight.requires_grad = true
    m.bias.requires_grad = true

proc BatchNorm1d*(num_features: int; eps: float = 1e-5; momentum: float = 0.1; affine: bool = true; track_running_stats: bool = true): BatchNormModule =
  BatchNorm(num_features, eps, momentum, affine, track_running_stats)

proc BatchNorm2d*(num_features: int; eps: float = 1e-5; momentum: float = 0.1; affine: bool = true; track_running_stats: bool = true): BatchNormModule =
  BatchNorm(num_features, eps, momentum, affine, track_running_stats)

proc BatchNorm3d*(num_features: int; eps: float = 1e-5; momentum: float = 0.1; affine: bool = true; track_running_stats: bool = true): BatchNormModule =
  BatchNorm(num_features, eps, momentum, affine, track_running_stats)