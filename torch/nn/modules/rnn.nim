import ../../../torch, ../modules, ../functional
import math, strformat

type
  RNNCellBaseModule* = ref object of Module
    input_size: int
    hidden_size: int
    bias: bool
    weight_ih: Tensor
    weight_hh: Tensor
    bias_ih: Tensor
    bias_hh: Tensor

  GRUCellModule* = ref object of RNNCellBaseModule

proc init*(self: RNNCellBaseModule; input_size, hidden_size: int; bias: bool; num_chunks: int) =

  self.input_size = input_size
  self.hidden_size = hidden_size
  self.bias = bias
  self.weight_ih = zeros([num_chunks * hidden_size, input_size])
  self.weight_hh = zeros([num_chunks * hidden_size, hidden_size])
  self.weight_ih.requires_grad = true
  self.weight_hh.requires_grad = true

  if bias:
    self.bias_ih = zeros([num_chunks * hidden_size])
    self.bias_hh = zeros([num_chunks * hidden_size])
    self.bias_ih.requires_grad = true
    self.bias_hh.requires_grad = true

  self.reset_parameters()

method parameters*(self: RNNCellBaseModule): seq[Tensor] =
  @[self.weight_ih, self.weight_hh, self.bias_ih, self.bias_hh]

proc check_forward_input*(self: RNNCellBaseModule; input: Tensor) {.inline.} =
  assert(input.size(1) == self.input_size, fmt"input has inconsistent input_size: got {input.size(1)}, expected {self.input_size}")

proc check_forward_hidden*(self: RNNCellBaseModule; input, hx: Tensor; hidden_label: static string = "") {.inline.} =
  assert(input.size(0) == hx.size(0), fmt"Input batch size {input.size(0)} doesn't match hidden{hidden_label} batch size {hx.size(0)}")
  assert(hx.size(1) == self.hidden_size, fmt"hidden{hidden_label} has inconsistent hidden_size: got {hx.size(1)}, expected {self.hidden_size}")

method reset_parameters*(self: RNNCellBaseModule) =
  let stdv = 1.0 / math.sqrt(self.hidden_size.float)
  for weight in self.parameters:
    weight.uniform_inplace(-stdv, stdv)

proc GRUCell*(input_size, hidden_size: int; bias: bool = true): GRUCellModule =
  new result
  result.init(input_size, hidden_size, bias, 3)

  let m = result
  m.forward = proc(input: varargs[Tensor]): Tensor =

    var hx: Tensor
    if input.len > 1:
      hx = input[1]

    if hx.isNil:
      hx = zeros([input[0].size(0), m.hidden_size], input[0].options) # TODO: new_zeros

    m.check_forward_hidden(input[0], hx)
    gru_cell(input[0], hx, m.weight_ih, m.weight_hh, m.bias_ih, m.bias_hh)
