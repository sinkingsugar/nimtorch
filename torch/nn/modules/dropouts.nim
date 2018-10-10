import ../../../torch, ../modules, ../functional

type
  DropoutModule* = ref object of Module
    p: float
    training: bool

template newDropoutModule(op: untyped; p: float = 0.5): untyped =
  new result
  let m = result
  m.p = p

  m.forward = proc(inputs: openarray[Tensor]): Tensor =
    op(inputs[0], m.p, m.training)

proc Dropout*(p: float = 0.5): DropoutModule = newDropoutModule(dropout, p)

proc Dropout2d*(p: float = 0.5): DropoutModule = newDropoutModule(dropout2d, p)

proc Dropout3d*(p: float = 0.5): DropoutModule = newDropoutModule(dropout3d, p)

proc AlphaDropout*(p: float = 0.5): DropoutModule = newDropoutModule(alpha_dropout, p)

proc FeatureAlphaDropout*(p: float = 0.5): DropoutModule = newDropoutModule(feature_alpha_dropout, p)