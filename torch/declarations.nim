# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim
import fragments/ffi/cpp
import torch_cpp
import tensors
import macros

template atenMethod*(obj: CppObject, field: untyped, args: varargs[CppProxy, CppFromAst]): CppProxy = obj.dynamicCppCall(field, args)
template atenFunction*(field: untyped, args: varargs[CppProxy, CppFromAst]): CppProxy = dynamicCCall(field, args)

template checkVoid(body: untyped): untyped =
  try: body
  except StdException as e: raiseAssert($e.what())

macro check(body: untyped): untyped =
  # We are generating the symbol here, so we can declare a var, and use it in a scope
  # where it is not declared. This way, we can avoid explicitly specifying it's type
  # with `type(body)`, significantly decreasing compilation time.
  let r = genSym(nskVar)
  return quote do:
    try:
      var `r` = `body`
    except StdException as e: raiseAssert($e.what())
    `r`

proc th_set_impl_inplace*(ty: TensorType; self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_set_", self.toATensor(), source).to(void); self

proc th_set_impl_inplace*(self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_set_", self.toATensor(), source).to(void); self

proc th_set_impl_inplace*(ty: TensorType; self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_set_", self.toATensor(), source, storage_offset, size.toAIntList(), stride.toAIntList()).to(void); self

proc th_set_impl_inplace*(self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_set_", self.toATensor(), source, storage_offset, size.toAIntList(), stride.toAIntList()).to(void); self

proc th_set_impl_inplace*(ty: TensorType; self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_set_", self.toATensor(), source.toATensor()).to(void); self

proc th_set_impl_inplace*(self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_set_", self.toATensor(), source.toATensor()).to(void); self

proc th_set_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_set_", self.toATensor()).to(void); self

proc th_set_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_set_", self.toATensor()).to(void); self

proc th_fill_impl_inplace*(ty: TensorType; self: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_fill_", self.toATensor(), value).to(void); self

proc th_fill_impl_inplace*(self: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_fill_", self.toATensor(), value).to(void); self

proc th_fill_impl_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_fill_", self.toATensor(), value.toATensor()).to(void); self

proc th_fill_impl_inplace*(self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_fill_", self.toATensor(), value.toATensor()).to(void); self

proc th_is_set_to_impl*(ty: TensorType; self: Tensor; tensor: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("_th_is_set_to", self.toATensor(), tensor.toATensor()).to(bool)

proc th_is_set_to_impl*(self: Tensor; tensor: Tensor): bool {.inline.} = 
  check: atenFunction("at::_th_is_set_to", self.toATensor(), tensor.toATensor()).to(bool)

proc th_masked_fill_impl_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_masked_fill_", self.toATensor(), mask.toATensor(), value).to(void); self

proc th_masked_fill_impl_inplace*(self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_masked_fill_", self.toATensor(), mask.toATensor(), value).to(void); self

proc th_masked_fill_impl_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_masked_fill_", self.toATensor(), mask.toATensor(), value.toATensor()).to(void); self

proc th_masked_fill_impl_inplace*(self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_masked_fill_", self.toATensor(), mask.toATensor(), value.toATensor()).to(void); self

proc th_masked_scatter_impl_inplace*(ty: TensorType; self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_masked_scatter_", self.toATensor(), mask.toATensor(), source.toATensor()).to(void); self

proc th_masked_scatter_impl_inplace*(self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_masked_scatter_", self.toATensor(), mask.toATensor(), source.toATensor()).to(void); self

proc th_masked_select_impl*(ty: TensorType; self: Tensor; mask: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_masked_select", self.toATensor(), mask.toATensor()).to(ATensor).newTensor()

proc th_masked_select_impl*(self: Tensor; mask: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_masked_select", self.toATensor(), mask.toATensor()).to(ATensor).newTensor()

proc th_nonzero_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_nonzero", self.toATensor()).to(ATensor).newTensor()

proc th_nonzero_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_nonzero", self.toATensor()).to(ATensor).newTensor()

proc th_clone_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_clone", self.toATensor()).to(ATensor).newTensor()

proc th_clone_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_clone", self.toATensor()).to(ATensor).newTensor()

proc th_view_impl*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_view", self.toATensor(), size.toAIntList()).to(ATensor).newTensor()

proc th_view_impl*(self: Tensor; size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_th_view", self.toATensor(), size.toAIntList()).to(ATensor).newTensor()

proc th_resize_as_impl_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_resize_as_", self.toATensor(), the_template.toATensor()).to(void); self

proc th_resize_as_impl_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_resize_as_", self.toATensor(), the_template.toATensor()).to(void); self

proc th_index_select_impl*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_index_select", self.toATensor(), dim, index.toATensor()).to(ATensor).newTensor()

proc th_index_select_impl*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_index_select", self.toATensor(), dim, index.toATensor()).to(ATensor).newTensor()

proc th_index_copy_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_index_copy_", self.toATensor(), dim, index.toATensor(), source.toATensor()).to(void); self

proc th_index_copy_impl_inplace*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_index_copy_", self.toATensor(), dim, index.toATensor(), source.toATensor()).to(void); self

proc th_take_impl*(ty: TensorType; self: Tensor; index: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_take", self.toATensor(), index.toATensor()).to(ATensor).newTensor()

proc th_take_impl*(self: Tensor; index: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_take", self.toATensor(), index.toATensor()).to(ATensor).newTensor()

proc th_put_impl_inplace*(ty: TensorType; self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_put_", self.toATensor(), index.toATensor(), source.toATensor(), accumulate).to(void); self

proc th_put_impl_inplace*(self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_put_", self.toATensor(), index.toATensor(), source.toATensor(), accumulate).to(void); self

proc th_index_add_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_index_add_", self.toATensor(), dim, index.toATensor(), source.toATensor()).to(void); self

proc th_index_add_impl_inplace*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_index_add_", self.toATensor(), dim, index.toATensor(), source.toATensor()).to(void); self

proc th_index_fill_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_index_fill_", self.toATensor(), dim, index.toATensor(), value).to(void); self

proc th_index_fill_impl_inplace*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_index_fill_", self.toATensor(), dim, index.toATensor(), value).to(void); self

proc th_index_fill_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_index_fill_", self.toATensor(), dim, index.toATensor(), value.toATensor()).to(void); self

proc th_index_fill_impl_inplace*(self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_index_fill_", self.toATensor(), dim, index.toATensor(), value.toATensor()).to(void); self

proc th_unfold_impl*(ty: TensorType; self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_unfold", self.toATensor(), dimension, size, step).to(ATensor).newTensor()

proc th_unfold_impl*(self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  check: atenFunction("at::_th_unfold", self.toATensor(), dimension, size, step).to(ATensor).newTensor()

proc th_range_impl*(ty: TensorType; start: float; end_special: float; step: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_range", start, end_special, step).to(ATensor).newTensor()

proc th_arange_impl*(ty: TensorType; start: float; end_special: float; step: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_arange", start, end_special, step).to(ATensor).newTensor()

proc th_arange_impl*(ty: TensorType; end_special: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_arange", end_special).to(ATensor).newTensor()

proc th_scatter_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_scatter_", self.toATensor(), dim, index.toATensor(), src.toATensor()).to(void); self

proc th_scatter_impl_inplace*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_scatter_", self.toATensor(), dim, index.toATensor(), src.toATensor()).to(void); self

proc th_scatter_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_scatter_", self.toATensor(), dim, index.toATensor(), value).to(void); self

proc th_scatter_impl_inplace*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_scatter_", self.toATensor(), dim, index.toATensor(), value).to(void); self

proc th_scatter_add_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_scatter_add_", self.toATensor(), dim, index.toATensor(), src.toATensor()).to(void); self

proc th_scatter_add_impl_inplace*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_scatter_add_", self.toATensor(), dim, index.toATensor(), src.toATensor()).to(void); self

proc th_gather_impl*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_gather", self.toATensor(), dim, index.toATensor()).to(ATensor).newTensor()

proc th_gather_impl*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_gather", self.toATensor(), dim, index.toATensor()).to(ATensor).newTensor()

proc th_equal_impl*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("_th_equal", self.toATensor(), other.toATensor()).to(bool)

proc th_equal_impl*(self: Tensor; other: Tensor): bool {.inline.} = 
  check: atenFunction("at::_th_equal", self.toATensor(), other.toATensor()).to(bool)

proc th_and_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_and", self.toATensor(), other).to(ATensor).newTensor()

proc th_and_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_and", self.toATensor(), other).to(ATensor).newTensor()

proc th_and_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_and", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_and_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_and", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_iand_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_iand_", self.toATensor(), other).to(void); self

proc th_iand_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_iand_", self.toATensor(), other).to(void); self

proc th_iand_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_iand_", self.toATensor(), other.toATensor()).to(void); self

proc th_iand_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_iand_", self.toATensor(), other.toATensor()).to(void); self

proc th_or_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_or", self.toATensor(), other).to(ATensor).newTensor()

proc th_or_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_or", self.toATensor(), other).to(ATensor).newTensor()

proc th_or_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_or", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_or_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_or", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_ior_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ior_", self.toATensor(), other).to(void); self

proc th_ior_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ior_", self.toATensor(), other).to(void); self

proc th_ior_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ior_", self.toATensor(), other.toATensor()).to(void); self

proc th_ior_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ior_", self.toATensor(), other.toATensor()).to(void); self

proc th_xor_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_xor", self.toATensor(), other).to(ATensor).newTensor()

proc th_xor_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_xor", self.toATensor(), other).to(ATensor).newTensor()

proc th_xor_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_xor", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_xor_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_xor", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_ixor_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ixor_", self.toATensor(), other).to(void); self

proc th_ixor_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ixor_", self.toATensor(), other).to(void); self

proc th_ixor_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ixor_", self.toATensor(), other.toATensor()).to(void); self

proc th_ixor_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ixor_", self.toATensor(), other.toATensor()).to(void); self

proc th_lshift_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_lshift", self.toATensor(), other).to(ATensor).newTensor()

proc th_lshift_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_lshift", self.toATensor(), other).to(ATensor).newTensor()

proc th_lshift_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_lshift", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_lshift_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_lshift", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_ilshift_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ilshift_", self.toATensor(), other).to(void); self

proc th_ilshift_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ilshift_", self.toATensor(), other).to(void); self

proc th_ilshift_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ilshift_", self.toATensor(), other.toATensor()).to(void); self

proc th_ilshift_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ilshift_", self.toATensor(), other.toATensor()).to(void); self

proc th_rshift_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_rshift", self.toATensor(), other).to(ATensor).newTensor()

proc th_rshift_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_rshift", self.toATensor(), other).to(ATensor).newTensor()

proc th_rshift_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_rshift", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_rshift_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_rshift", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_irshift_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_irshift_", self.toATensor(), other).to(void); self

proc th_irshift_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_irshift_", self.toATensor(), other).to(void); self

proc th_irshift_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_irshift_", self.toATensor(), other.toATensor()).to(void); self

proc th_irshift_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_irshift_", self.toATensor(), other.toATensor()).to(void); self

proc th_lt_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_lt", self.toATensor(), other).to(ATensor).newTensor()

proc th_lt_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_lt", self.toATensor(), other).to(ATensor).newTensor()

proc th_lt_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_lt", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_lt_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_lt", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_lt_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_lt_", self.toATensor(), other).to(void); self

proc th_lt_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_lt_", self.toATensor(), other).to(void); self

proc th_lt_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_lt_", self.toATensor(), other.toATensor()).to(void); self

proc th_lt_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_lt_", self.toATensor(), other.toATensor()).to(void); self

proc th_gt_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_gt", self.toATensor(), other).to(ATensor).newTensor()

proc th_gt_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_gt", self.toATensor(), other).to(ATensor).newTensor()

proc th_gt_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_gt", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_gt_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_gt", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_gt_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_gt_", self.toATensor(), other).to(void); self

proc th_gt_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_gt_", self.toATensor(), other).to(void); self

proc th_gt_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_gt_", self.toATensor(), other.toATensor()).to(void); self

proc th_gt_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_gt_", self.toATensor(), other.toATensor()).to(void); self

proc th_le_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_le", self.toATensor(), other).to(ATensor).newTensor()

proc th_le_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_le", self.toATensor(), other).to(ATensor).newTensor()

proc th_le_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_le", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_le_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_le", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_le_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_le_", self.toATensor(), other).to(void); self

proc th_le_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_le_", self.toATensor(), other).to(void); self

proc th_le_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_le_", self.toATensor(), other.toATensor()).to(void); self

proc th_le_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_le_", self.toATensor(), other.toATensor()).to(void); self

proc th_ge_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_ge", self.toATensor(), other).to(ATensor).newTensor()

proc th_ge_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_ge", self.toATensor(), other).to(ATensor).newTensor()

proc th_ge_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_ge", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_ge_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_ge", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_ge_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ge_", self.toATensor(), other).to(void); self

proc th_ge_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ge_", self.toATensor(), other).to(void); self

proc th_ge_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ge_", self.toATensor(), other.toATensor()).to(void); self

proc th_ge_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ge_", self.toATensor(), other.toATensor()).to(void); self

proc th_eq_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_eq", self.toATensor(), other).to(ATensor).newTensor()

proc th_eq_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_eq", self.toATensor(), other).to(ATensor).newTensor()

proc th_eq_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_eq", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_eq_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_eq", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_eq_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_eq_", self.toATensor(), other).to(void); self

proc th_eq_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_eq_", self.toATensor(), other).to(void); self

proc th_eq_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_eq_", self.toATensor(), other.toATensor()).to(void); self

proc th_eq_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_eq_", self.toATensor(), other.toATensor()).to(void); self

proc th_ne_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_ne", self.toATensor(), other).to(ATensor).newTensor()

proc th_ne_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_ne", self.toATensor(), other).to(ATensor).newTensor()

proc th_ne_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_ne", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_ne_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_ne", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_ne_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ne_", self.toATensor(), other).to(void); self

proc th_ne_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ne_", self.toATensor(), other).to(void); self

proc th_ne_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_ne_", self.toATensor(), other.toATensor()).to(void); self

proc th_ne_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_ne_", self.toATensor(), other.toATensor()).to(void); self

proc th_min_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_min", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_min_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_min", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_min_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_th_min", self.toATensor()).to(float)

proc th_min_impl*(self: Tensor): float {.inline.} = 
  check: atenFunction("at::_th_min", self.toATensor()).to(float)

proc th_min_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_min", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_min_impl*(self: Tensor; dim: int; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline.} = 
  check: atenFunction("at::_th_min", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_max_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_max", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_max_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_max", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_max_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_th_max", self.toATensor()).to(float)

proc th_max_impl*(self: Tensor): float {.inline.} = 
  check: atenFunction("at::_th_max", self.toATensor()).to(float)

proc th_max_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_max", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_max_impl*(self: Tensor; dim: int; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline.} = 
  check: atenFunction("at::_th_max", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_impl*(ty: TensorType; self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_kthvalue", self.toATensor(), k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_impl*(self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_th_kthvalue", self.toATensor(), k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_impl*(ty: TensorType; self: Tensor; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_mode", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_impl*(self: Tensor; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_th_mode", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_median_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_th_median", self.toATensor()).to(float)

proc th_median_impl*(self: Tensor): float {.inline.} = 
  check: atenFunction("at::_th_median", self.toATensor()).to(float)

proc th_median_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_median", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_median_impl*(self: Tensor; dim: int; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_th_median", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_sort_impl*(ty: TensorType; self: Tensor; dim: int = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_sort", self.toATensor(), dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_sort_impl*(self: Tensor; dim: int = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_th_sort", self.toATensor(), dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_topk_impl*(ty: TensorType; self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_topk", self.toATensor(), k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_topk_impl*(self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_th_topk", self.toATensor(), k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_all_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_th_all", self.toATensor()).to(float)

proc th_all_impl*(self: Tensor): float {.inline.} = 
  check: atenFunction("at::_th_all", self.toATensor()).to(float)

proc th_all_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_all", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc th_all_impl*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_th_all", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc th_any_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_th_any", self.toATensor()).to(float)

proc th_any_impl*(self: Tensor): float {.inline.} = 
  check: atenFunction("at::_th_any", self.toATensor()).to(float)

proc th_any_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_any", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc th_any_impl*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_th_any", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc th_abs_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_abs", self.toATensor()).to(ATensor).newTensor()

proc th_abs_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_abs", self.toATensor()).to(ATensor).newTensor()

proc th_sigmoid_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_sigmoid", self.toATensor()).to(ATensor).newTensor()

proc th_sigmoid_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_sigmoid", self.toATensor()).to(ATensor).newTensor()

proc th_log_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_log", self.toATensor()).to(ATensor).newTensor()

proc th_log_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_log", self.toATensor()).to(ATensor).newTensor()

proc th_log10_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_log10", self.toATensor()).to(ATensor).newTensor()

proc th_log10_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_log10", self.toATensor()).to(ATensor).newTensor()

proc th_log1p_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_log1p", self.toATensor()).to(ATensor).newTensor()

proc th_log1p_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_log1p", self.toATensor()).to(ATensor).newTensor()

proc th_log2_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_log2", self.toATensor()).to(ATensor).newTensor()

proc th_log2_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_log2", self.toATensor()).to(ATensor).newTensor()

proc th_lgamma_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_lgamma", self.toATensor()).to(ATensor).newTensor()

proc th_lgamma_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_lgamma", self.toATensor()).to(ATensor).newTensor()

proc th_lgamma_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_lgamma_", self.toATensor()).to(void); self

proc th_lgamma_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_lgamma_", self.toATensor()).to(void); self

proc th_digamma_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_digamma", self.toATensor()).to(ATensor).newTensor()

proc th_digamma_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_digamma", self.toATensor()).to(ATensor).newTensor()

proc th_digamma_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_digamma_", self.toATensor()).to(void); self

proc th_digamma_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_digamma_", self.toATensor()).to(void); self

proc th_polygamma_impl*(ty: TensorType; n: int; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_polygamma", n, self.toATensor()).to(ATensor).newTensor()

proc th_polygamma_impl*(n: int; self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_polygamma", n, self.toATensor()).to(ATensor).newTensor()

proc th_polygamma_impl_inplace*(ty: TensorType; self: Tensor; n: int): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_polygamma_", self.toATensor(), n).to(void); self

proc th_polygamma_impl_inplace*(self: Tensor; n: int): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_polygamma_", self.toATensor(), n).to(void); self

proc th_exp_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_exp", self.toATensor()).to(ATensor).newTensor()

proc th_exp_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_exp", self.toATensor()).to(ATensor).newTensor()

proc th_expm1_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_expm1", self.toATensor()).to(ATensor).newTensor()

proc th_expm1_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_expm1", self.toATensor()).to(ATensor).newTensor()

proc th_cos_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_cos", self.toATensor()).to(ATensor).newTensor()

proc th_cos_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_cos", self.toATensor()).to(ATensor).newTensor()

proc th_acos_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_acos", self.toATensor()).to(ATensor).newTensor()

proc th_acos_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_acos", self.toATensor()).to(ATensor).newTensor()

proc th_cosh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_cosh", self.toATensor()).to(ATensor).newTensor()

proc th_cosh_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_cosh", self.toATensor()).to(ATensor).newTensor()

proc th_sin_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_sin", self.toATensor()).to(ATensor).newTensor()

proc th_sin_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_sin", self.toATensor()).to(ATensor).newTensor()

proc th_asin_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_asin", self.toATensor()).to(ATensor).newTensor()

proc th_asin_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_asin", self.toATensor()).to(ATensor).newTensor()

proc th_sinh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_sinh", self.toATensor()).to(ATensor).newTensor()

proc th_sinh_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_sinh", self.toATensor()).to(ATensor).newTensor()

proc th_tan_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_tan", self.toATensor()).to(ATensor).newTensor()

proc th_tan_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_tan", self.toATensor()).to(ATensor).newTensor()

proc th_atan_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_atan", self.toATensor()).to(ATensor).newTensor()

proc th_atan_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_atan", self.toATensor()).to(ATensor).newTensor()

proc th_tanh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_tanh", self.toATensor()).to(ATensor).newTensor()

proc th_tanh_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_tanh", self.toATensor()).to(ATensor).newTensor()

proc th_erf_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_erf", self.toATensor()).to(ATensor).newTensor()

proc th_erf_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_erf", self.toATensor()).to(ATensor).newTensor()

proc th_erfc_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_erfc", self.toATensor()).to(ATensor).newTensor()

proc th_erfc_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_erfc", self.toATensor()).to(ATensor).newTensor()

proc th_erfinv_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_erfinv_", self.toATensor()).to(void); self

proc th_erfinv_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_erfinv_", self.toATensor()).to(void); self

proc th_erfinv_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_erfinv", self.toATensor()).to(ATensor).newTensor()

proc th_erfinv_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_erfinv", self.toATensor()).to(ATensor).newTensor()

proc th_sqrt_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_sqrt", self.toATensor()).to(ATensor).newTensor()

proc th_sqrt_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_sqrt", self.toATensor()).to(ATensor).newTensor()

proc th_rsqrt_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_rsqrt", self.toATensor()).to(ATensor).newTensor()

proc th_rsqrt_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_rsqrt", self.toATensor()).to(ATensor).newTensor()

proc th_ceil_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_ceil", self.toATensor()).to(ATensor).newTensor()

proc th_ceil_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_ceil", self.toATensor()).to(ATensor).newTensor()

proc th_floor_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_floor", self.toATensor()).to(ATensor).newTensor()

proc th_floor_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_floor", self.toATensor()).to(ATensor).newTensor()

proc th_round_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_round", self.toATensor()).to(ATensor).newTensor()

proc th_round_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_round", self.toATensor()).to(ATensor).newTensor()

proc th_trunc_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_trunc", self.toATensor()).to(ATensor).newTensor()

proc th_trunc_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_trunc", self.toATensor()).to(ATensor).newTensor()

proc th_frac_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_frac_", self.toATensor()).to(void); self

proc th_frac_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_frac_", self.toATensor()).to(void); self

proc th_frac_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_frac", self.toATensor()).to(ATensor).newTensor()

proc th_frac_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_frac", self.toATensor()).to(ATensor).newTensor()

proc th_var_impl*(ty: TensorType; self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_var", self.toATensor(), dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_impl*(self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_th_var", self.toATensor(), dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_impl*(ty: TensorType; self: Tensor; unbiased: bool = true): float {.inline.} = 
  check: ty[].atenMethod("_th_var", self.toATensor(), unbiased).to(float)

proc th_var_impl*(self: Tensor; unbiased: bool = true): float {.inline.} = 
  check: atenFunction("at::_th_var", self.toATensor(), unbiased).to(float)

proc th_std_impl*(ty: TensorType; self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_std", self.toATensor(), dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_impl*(self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_th_std", self.toATensor(), dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_impl*(ty: TensorType; self: Tensor; unbiased: bool = true): float {.inline.} = 
  check: ty[].atenMethod("_th_std", self.toATensor(), unbiased).to(float)

proc th_std_impl*(self: Tensor; unbiased: bool = true): float {.inline.} = 
  check: atenFunction("at::_th_std", self.toATensor(), unbiased).to(float)

proc th_norm_impl*(ty: TensorType; self: Tensor; p: float = 2): float {.inline.} = 
  check: ty[].atenMethod("_th_norm", self.toATensor(), p).to(float)

proc th_norm_impl*(self: Tensor; p: float = 2): float {.inline.} = 
  check: atenFunction("at::_th_norm", self.toATensor(), p).to(float)

proc th_norm_impl*(ty: TensorType; self: Tensor; p: float; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_norm", self.toATensor(), p, dim, keepdim).to(ATensor).newTensor()

proc th_norm_impl*(self: Tensor; p: float; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_th_norm", self.toATensor(), p, dim, keepdim).to(ATensor).newTensor()

proc th_renorm_impl*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_renorm", self.toATensor(), p, dim, maxnorm).to(ATensor).newTensor()

proc th_renorm_impl*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_renorm", self.toATensor(), p, dim, maxnorm).to(ATensor).newTensor()

proc th_renorm_impl_inplace*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_renorm_", self.toATensor(), p, dim, maxnorm).to(void); self

proc th_renorm_impl_inplace*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_renorm_", self.toATensor(), p, dim, maxnorm).to(void); self

proc th_dist_impl*(ty: TensorType; self: Tensor; other: Tensor; p: float = 2): float {.inline.} = 
  check: ty[].atenMethod("_th_dist", self.toATensor(), other.toATensor(), p).to(float)

proc th_dist_impl*(self: Tensor; other: Tensor; p: float = 2): float {.inline.} = 
  check: atenFunction("at::_th_dist", self.toATensor(), other.toATensor(), p).to(float)

proc th_reciprocal_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_reciprocal", self.toATensor()).to(ATensor).newTensor()

proc th_reciprocal_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_reciprocal", self.toATensor()).to(ATensor).newTensor()

proc th_reciprocal_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_reciprocal_", self.toATensor()).to(void); self

proc th_reciprocal_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_reciprocal_", self.toATensor()).to(void); self

proc th_neg_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_neg", self.toATensor()).to(ATensor).newTensor()

proc th_neg_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_neg", self.toATensor()).to(ATensor).newTensor()

proc th_neg_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_neg_", self.toATensor()).to(void); self

proc th_neg_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_neg_", self.toATensor()).to(void); self

proc th_atan2_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_atan2", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_atan2_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_atan2", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_atan2_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_atan2_", self.toATensor(), other.toATensor()).to(void); self

proc th_atan2_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_atan2_", self.toATensor(), other.toATensor()).to(void); self

proc th_pow_impl*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_pow", self.toATensor(), exponent).to(ATensor).newTensor()

proc th_pow_impl*(self: Tensor; exponent: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_pow", self.toATensor(), exponent).to(ATensor).newTensor()

proc th_pow_impl*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_pow", self.toATensor(), exponent.toATensor()).to(ATensor).newTensor()

proc th_pow_impl*(self: Tensor; exponent: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_pow", self.toATensor(), exponent.toATensor()).to(ATensor).newTensor()

proc th_pow_impl*(ty: TensorType; self: float; exponent: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_pow", self, exponent.toATensor()).to(ATensor).newTensor()

proc th_pow_impl*(self: float; exponent: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_pow", self, exponent.toATensor()).to(ATensor).newTensor()

proc th_pow_impl_inplace*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_pow_", self.toATensor(), exponent).to(void); self

proc th_pow_impl_inplace*(self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_pow_", self.toATensor(), exponent).to(void); self

proc th_pow_impl_inplace*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_pow_", self.toATensor(), exponent.toATensor()).to(void); self

proc th_pow_impl_inplace*(self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_pow_", self.toATensor(), exponent.toATensor()).to(void); self

proc th_lerp_impl*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_lerp", self.toATensor(), end_special.toATensor(), weight).to(ATensor).newTensor()

proc th_lerp_impl*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_lerp", self.toATensor(), end_special.toATensor(), weight).to(ATensor).newTensor()

proc th_lerp_impl_inplace*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_lerp_", self.toATensor(), end_special.toATensor(), weight).to(void); self

proc th_lerp_impl_inplace*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_lerp_", self.toATensor(), end_special.toATensor(), weight).to(void); self

proc th_linspace_impl*(ty: TensorType; start: float; end_special: float; steps: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_linspace", start, end_special, steps).to(ATensor).newTensor()

proc th_logspace_impl*(ty: TensorType; start: float; end_special: float; steps: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_logspace", start, end_special, steps).to(ATensor).newTensor()

proc th_histc_impl*(ty: TensorType; self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_histc", self.toATensor(), bins, min, max).to(ATensor).newTensor()

proc th_histc_impl*(self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  check: atenFunction("at::_th_histc", self.toATensor(), bins, min, max).to(ATensor).newTensor()

proc th_zero_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_zero_", self.toATensor()).to(void); self

proc th_zero_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_zero_", self.toATensor()).to(void); self

proc th_cumsum_impl*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_cumsum", self.toATensor(), dim).to(ATensor).newTensor()

proc th_cumsum_impl*(self: Tensor; dim: int): Tensor {.inline.} = 
  check: atenFunction("at::_th_cumsum", self.toATensor(), dim).to(ATensor).newTensor()

proc th_cumprod_impl*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_cumprod", self.toATensor(), dim).to(ATensor).newTensor()

proc th_cumprod_impl*(self: Tensor; dim: int): Tensor {.inline.} = 
  check: atenFunction("at::_th_cumprod", self.toATensor(), dim).to(ATensor).newTensor()

proc th_sign_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_sign", self.toATensor()).to(ATensor).newTensor()

proc th_sign_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_sign", self.toATensor()).to(ATensor).newTensor()

proc th_sign_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_sign_", self.toATensor()).to(void); self

proc th_sign_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_sign_", self.toATensor()).to(void); self

proc th_trace_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_th_trace", self.toATensor()).to(float)

proc th_trace_impl*(self: Tensor): float {.inline.} = 
  check: atenFunction("at::_th_trace", self.toATensor()).to(float)

proc th_fmod_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_fmod", self.toATensor(), other).to(ATensor).newTensor()

proc th_fmod_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_fmod", self.toATensor(), other).to(ATensor).newTensor()

proc th_fmod_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_fmod", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_fmod_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_fmod", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_fmod_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_fmod_", self.toATensor(), other).to(void); self

proc th_fmod_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_fmod_", self.toATensor(), other).to(void); self

proc th_fmod_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_fmod_", self.toATensor(), other.toATensor()).to(void); self

proc th_fmod_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_fmod_", self.toATensor(), other.toATensor()).to(void); self

proc th_remainder_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_remainder", self.toATensor(), other).to(ATensor).newTensor()

proc th_remainder_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_remainder", self.toATensor(), other).to(ATensor).newTensor()

proc th_remainder_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_remainder", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_remainder_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_remainder", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc th_remainder_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_remainder_", self.toATensor(), other).to(void); self

proc th_remainder_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_remainder_", self.toATensor(), other).to(void); self

proc th_remainder_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_remainder_", self.toATensor(), other.toATensor()).to(void); self

proc th_remainder_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_remainder_", self.toATensor(), other.toATensor()).to(void); self

proc th_clamp_impl*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_clamp", self.toATensor(), min, max).to(ATensor).newTensor()

proc th_clamp_impl*(self: Tensor; min: float; max: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_clamp", self.toATensor(), min, max).to(ATensor).newTensor()

proc th_clamp_min_impl*(ty: TensorType; self: Tensor; min: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_clamp_min", self.toATensor(), min).to(ATensor).newTensor()

proc th_clamp_min_impl*(self: Tensor; min: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_clamp_min", self.toATensor(), min).to(ATensor).newTensor()

proc th_clamp_max_impl*(ty: TensorType; self: Tensor; max: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_clamp_max", self.toATensor(), max).to(ATensor).newTensor()

proc th_clamp_max_impl*(self: Tensor; max: float): Tensor {.inline.} = 
  check: atenFunction("at::_th_clamp_max", self.toATensor(), max).to(ATensor).newTensor()

proc th_dot_impl*(ty: TensorType; self: Tensor; tensor: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_th_dot", self.toATensor(), tensor.toATensor()).to(float)

proc th_dot_impl*(self: Tensor; tensor: Tensor): float {.inline.} = 
  check: atenFunction("at::_th_dot", self.toATensor(), tensor.toATensor()).to(float)

proc th_tril_impl*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_tril", self.toATensor(), diagonal).to(ATensor).newTensor()

proc th_tril_impl*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: atenFunction("at::_th_tril", self.toATensor(), diagonal).to(ATensor).newTensor()

proc th_tril_impl_inplace*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_tril_", self.toATensor(), diagonal).to(void); self

proc th_tril_impl_inplace*(self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_tril_", self.toATensor(), diagonal).to(void); self

proc th_triu_impl*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_triu", self.toATensor(), diagonal).to(ATensor).newTensor()

proc th_triu_impl*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: atenFunction("at::_th_triu", self.toATensor(), diagonal).to(ATensor).newTensor()

proc th_triu_impl_inplace*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_triu_", self.toATensor(), diagonal).to(void); self

proc th_triu_impl_inplace*(self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_triu_", self.toATensor(), diagonal).to(void); self

proc th_cross_impl*(ty: TensorType; self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_cross", self.toATensor(), other.toATensor(), dim).to(ATensor).newTensor()

proc th_cross_impl*(self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.} = 
  check: atenFunction("at::_th_cross", self.toATensor(), other.toATensor(), dim).to(ATensor).newTensor()

proc th_diag_impl*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_diag", self.toATensor(), diagonal).to(ATensor).newTensor()

proc th_diag_impl*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: atenFunction("at::_th_diag", self.toATensor(), diagonal).to(ATensor).newTensor()

proc th_addmm_impl*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addmm_impl*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_th_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addmm_impl_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(void); self

proc th_addmm_impl_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(void); self

proc th_addmv_impl*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_addmv", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addmv_impl*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_th_addmv", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addmv_impl_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_addmv_", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha).to(void); self

proc th_addmv_impl_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_addmv_", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha).to(void); self

proc th_addr_impl*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_addr", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addr_impl*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_th_addr", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addr_impl_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_addr_", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha).to(void); self

proc th_addr_impl_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_addr_", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha).to(void); self

proc th_ger_impl*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_ger", self.toATensor(), vec2.toATensor()).to(ATensor).newTensor()

proc th_ger_impl*(self: Tensor; vec2: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_ger", self.toATensor(), vec2.toATensor()).to(ATensor).newTensor()

proc th_mv_impl*(ty: TensorType; self: Tensor; vec: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_mv", self.toATensor(), vec.toATensor()).to(ATensor).newTensor()

proc th_mv_impl*(self: Tensor; vec: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_mv", self.toATensor(), vec.toATensor()).to(ATensor).newTensor()

proc th_mm_impl*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_mm", self.toATensor(), mat2.toATensor()).to(ATensor).newTensor()

proc th_mm_impl*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_mm", self.toATensor(), mat2.toATensor()).to(ATensor).newTensor()

proc th_bmm_impl*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_bmm", self.toATensor(), mat2.toATensor()).to(ATensor).newTensor()

proc th_bmm_impl*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_bmm", self.toATensor(), mat2.toATensor()).to(ATensor).newTensor()

proc th_addbmm_impl*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_addbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addbmm_impl*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_th_addbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addbmm_impl_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_addbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc th_addbmm_impl_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_addbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc th_baddbmm_impl*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_baddbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_baddbmm_impl*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_th_baddbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc th_addcmul_impl*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_addcmul", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(ATensor).newTensor()

proc th_addcmul_impl*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_th_addcmul", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(ATensor).newTensor()

proc th_addcmul_impl_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_addcmul_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc th_addcmul_impl_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_addcmul_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc th_addcdiv_impl*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_addcdiv", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(ATensor).newTensor()

proc th_addcdiv_impl*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_th_addcdiv", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(ATensor).newTensor()

proc th_addcdiv_impl_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_addcdiv_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc th_addcdiv_impl_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_addcdiv_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc th_gesv_single_impl*(ty: TensorType; self: Tensor; A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_gesv_single", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_gesv_single_impl*(self: Tensor; A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline.} = 
  check: atenFunction("at::_th_gesv_single", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_gels_impl*(ty: TensorType; self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_gels", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_gels_impl*(self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: atenFunction("at::_th_gels", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_trtrs_impl*(ty: TensorType; self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_trtrs", self.toATensor(), A.toATensor(), upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_trtrs_impl*(self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: atenFunction("at::_th_trtrs", self.toATensor(), A.toATensor(), upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_symeig_impl*(ty: TensorType; self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_symeig", self.toATensor(), eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_symeig_impl*(self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: atenFunction("at::_th_symeig", self.toATensor(), eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_eig_impl*(ty: TensorType; self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_eig", self.toATensor(), eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_eig_impl*(self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: atenFunction("at::_th_eig", self.toATensor(), eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_svd_impl*(ty: TensorType; self: Tensor; some: bool = true; compute_uv: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_svd", self.toATensor(), some, compute_uv).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc th_svd_impl*(self: Tensor; some: bool = true; compute_uv: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline.} = 
  check: atenFunction("at::_th_svd", self.toATensor(), some, compute_uv).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc th_getri_single_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_getri_single", self.toATensor()).to(ATensor).newTensor()

proc th_getri_single_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_getri_single", self.toATensor()).to(ATensor).newTensor()

proc th_potrf_single_impl*(ty: TensorType; self: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_potrf_single", self.toATensor(), upper).to(ATensor).newTensor()

proc th_potrf_single_impl*(self: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: atenFunction("at::_th_potrf_single", self.toATensor(), upper).to(ATensor).newTensor()

proc th_potrs_single_impl*(ty: TensorType; self: Tensor; input2: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_potrs_single", self.toATensor(), input2.toATensor(), upper).to(ATensor).newTensor()

proc th_potrs_single_impl*(self: Tensor; input2: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: atenFunction("at::_th_potrs_single", self.toATensor(), input2.toATensor(), upper).to(ATensor).newTensor()

proc th_potri_impl*(ty: TensorType; self: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_potri", self.toATensor(), upper).to(ATensor).newTensor()

proc th_potri_impl*(self: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: atenFunction("at::_th_potri", self.toATensor(), upper).to(ATensor).newTensor()

proc th_pstrf_impl*(ty: TensorType; self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_pstrf", self.toATensor(), upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_pstrf_impl*(self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: atenFunction("at::_th_pstrf", self.toATensor(), upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_qr_impl*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_qr", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_qr_impl*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: atenFunction("at::_th_qr", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_geqrf_impl*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_geqrf", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_geqrf_impl*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  check: atenFunction("at::_th_geqrf", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_orgqr_impl*(ty: TensorType; self: Tensor; input2: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_orgqr", self.toATensor(), input2.toATensor()).to(ATensor).newTensor()

proc th_orgqr_impl*(self: Tensor; input2: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_orgqr", self.toATensor(), input2.toATensor()).to(ATensor).newTensor()

proc th_ormqr_impl*(ty: TensorType; self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_ormqr", self.toATensor(), input2.toATensor(), input3.toATensor(), left, transpose).to(ATensor).newTensor()

proc th_ormqr_impl*(self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_th_ormqr", self.toATensor(), input2.toATensor(), input3.toATensor(), left, transpose).to(ATensor).newTensor()

proc th_btrifact_impl*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_btrifact", self.toATensor(), pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_btrifact_impl*(self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor] {.inline.} = 
  check: atenFunction("at::_th_btrifact", self.toATensor(), pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_btrifact_with_info_impl*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor, info: Tensor] {.inline.} = 
  check: ty[].atenMethod("_th_btrifact_with_info", self.toATensor(), pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc th_btrifact_with_info_impl*(self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor, info: Tensor] {.inline.} = 
  check: atenFunction("at::_th_btrifact_with_info", self.toATensor(), pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc th_btrisolve_impl*(ty: TensorType; self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_btrisolve", self.toATensor(), LU_data.toATensor(), LU_pivots.toATensor()).to(ATensor).newTensor()

proc th_btrisolve_impl*(self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_btrisolve", self.toATensor(), LU_data.toATensor(), LU_pivots.toATensor()).to(ATensor).newTensor()

proc th_random_impl_inplace*(ty: TensorType; self: Tensor; from_special: int; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_random_", self.toATensor(), from_special, to_special, generator).to(void); self

proc th_random_impl_inplace*(self: Tensor; from_special: int; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_random_", self.toATensor(), from_special, to_special, generator).to(void); self

proc th_random_impl_inplace*(ty: TensorType; self: Tensor; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_random_", self.toATensor(), to_special, generator).to(void); self

proc th_random_impl_inplace*(self: Tensor; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_random_", self.toATensor(), to_special, generator).to(void); self

proc th_random_impl_inplace*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_random_", self.toATensor(), generator).to(void); self

proc th_random_impl_inplace*(self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_random_", self.toATensor(), generator).to(void); self

proc th_multinomial_impl*(ty: TensorType; self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_multinomial", self.toATensor(), num_samples, replacement, generator).to(ATensor).newTensor()

proc th_multinomial_impl*(self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  check: atenFunction("at::_th_multinomial", self.toATensor(), num_samples, replacement, generator).to(ATensor).newTensor()

proc th_uniform_impl_inplace*(ty: TensorType; self: Tensor; from_special: float64 = 0; to_special: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_uniform_", self.toATensor(), from_special, to_special, generator).to(void); self

proc th_uniform_impl_inplace*(self: Tensor; from_special: float64 = 0; to_special: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_uniform_", self.toATensor(), from_special, to_special, generator).to(void); self

proc th_normal_impl*(ty: TensorType; mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_normal", mean.toATensor(), std, generator).to(ATensor).newTensor()

proc th_normal_impl*(mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.} = 
  check: atenFunction("at::_th_normal", mean.toATensor(), std, generator).to(ATensor).newTensor()

proc th_normal_impl*(ty: TensorType; mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_normal", mean, std.toATensor(), generator).to(ATensor).newTensor()

proc th_normal_impl*(mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  check: atenFunction("at::_th_normal", mean, std.toATensor(), generator).to(ATensor).newTensor()

proc th_normal_impl*(ty: TensorType; mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_normal", mean.toATensor(), std.toATensor(), generator).to(ATensor).newTensor()

proc th_normal_impl*(mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  check: atenFunction("at::_th_normal", mean.toATensor(), std.toATensor(), generator).to(ATensor).newTensor()

proc th_normal_impl_inplace*(ty: TensorType; self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_normal_", self.toATensor(), mean, std, generator).to(void); self

proc th_normal_impl_inplace*(self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_normal_", self.toATensor(), mean, std, generator).to(void); self

proc th_cauchy_impl_inplace*(ty: TensorType; self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_cauchy_", self.toATensor(), median, sigma, generator).to(void); self

proc th_cauchy_impl_inplace*(self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_cauchy_", self.toATensor(), median, sigma, generator).to(void); self

proc th_log_normal_impl_inplace*(ty: TensorType; self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_log_normal_", self.toATensor(), mean, std, generator).to(void); self

proc th_log_normal_impl_inplace*(self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_log_normal_", self.toATensor(), mean, std, generator).to(void); self

proc th_exponential_impl_inplace*(ty: TensorType; self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_exponential_", self.toATensor(), lambd, generator).to(void); self

proc th_exponential_impl_inplace*(self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_exponential_", self.toATensor(), lambd, generator).to(void); self

proc th_geometric_impl_inplace*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_geometric_", self.toATensor(), p, generator).to(void); self

proc th_geometric_impl_inplace*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_geometric_", self.toATensor(), p, generator).to(void); self

proc th_dirichlet_grad_impl*(ty: TensorType; x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).to(ATensor).newTensor()

proc th_dirichlet_grad_impl*(x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).to(ATensor).newTensor()

proc th_tensor_impl*(ty: TensorType; storage: AStorage; storageOffset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_tensor", storage, storageOffset, size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc th_tensor_impl*(ty: TensorType; size: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_tensor", size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc th_alias_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_alias", self.toATensor()).to(ATensor).newTensor()

proc th_alias_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_th_alias", self.toATensor()).to(ATensor).newTensor()

proc th_copy_ignoring_overlaps_impl_inplace*(ty: TensorType; self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_th_copy_ignoring_overlaps_", self.toATensor(), src.toATensor()).to(void); self

proc th_copy_ignoring_overlaps_impl_inplace*(self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_th_copy_ignoring_overlaps_", self.toATensor(), src.toATensor()).to(void); self

proc th_cat_impl*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("_th_cat", tensors.toATensors(), dim).to(ATensor).newTensor()

proc th_cat_impl*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
  check: atenFunction("at::_th_cat", tensors.toATensors(), dim).to(ATensor).newTensor()

proc thnn_binary_cross_entropy_impl*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_binary_cross_entropy_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_binary_cross_entropy_impl*(self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_binary_cross_entropy_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_binary_cross_entropy_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_binary_cross_entropy_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_l1_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_l1_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_l1_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_l1_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_mse_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_mse_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_mse_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_mse_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_mse_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_mse_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_multi_margin_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_multi_margin_loss_forward", self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_multi_margin_loss_impl*(self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_multi_margin_loss_forward", self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_multi_margin_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_multi_margin_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_multilabel_margin_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_multilabel_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_multilabel_margin_loss_impl*(self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_multilabel_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_multilabel_margin_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).to(ATensor).newTensor()

proc thnn_multilabel_margin_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).to(ATensor).newTensor()

proc thnn_nll_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_nll_loss_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_nll_loss_impl*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_nll_loss_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_nll_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_nll_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).to(ATensor).newTensor()

proc thnn_nll_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_nll_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).to(ATensor).newTensor()

proc thnn_nll_loss2d_impl*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_nll_loss2d_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_nll_loss2d_impl*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_nll_loss2d_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_nll_loss2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_nll_loss2d_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).to(ATensor).newTensor()

proc thnn_nll_loss2d_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_nll_loss2d_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).to(ATensor).newTensor()

proc thnn_smooth_l1_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_smooth_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_smooth_l1_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_smooth_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_smooth_l1_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_smooth_l1_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_soft_margin_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_soft_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_soft_margin_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_soft_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_soft_margin_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_soft_margin_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc thnn_elu_impl*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_elu_forward", self.toATensor(), alpha, scale, input_scale).to(ATensor).newTensor()

proc thnn_elu_impl*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_elu_forward", self.toATensor(), alpha, scale, input_scale).to(ATensor).newTensor()

proc thnn_elu_backward_impl*(ty: TensorType; grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).to(ATensor).newTensor()

proc thnn_elu_backward_impl*(grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).to(ATensor).newTensor()

proc thnn_elu_impl_inplace*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_thnn_elu_forward_", self.toATensor(), alpha, scale, input_scale).to(void); self

proc thnn_elu_impl_inplace*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_thnn_elu_forward_", self.toATensor(), alpha, scale, input_scale).to(void); self

proc thnn_glu_impl*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_glu_forward", self.toATensor(), dim).to(ATensor).newTensor()

proc thnn_glu_impl*(self: Tensor; dim: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_glu_forward", self.toATensor(), dim).to(ATensor).newTensor()

proc thnn_glu_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_glu_backward", grad_output.toATensor(), self.toATensor(), dim).to(ATensor).newTensor()

proc thnn_glu_backward_impl*(grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_glu_backward", grad_output.toATensor(), self.toATensor(), dim).to(ATensor).newTensor()

proc thnn_hardtanh_impl*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_hardtanh_forward", self.toATensor(), min_val, max_val).to(ATensor).newTensor()

proc thnn_hardtanh_impl*(self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_hardtanh_forward", self.toATensor(), min_val, max_val).to(ATensor).newTensor()

proc thnn_hardtanh_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_hardtanh_backward", grad_output.toATensor(), self.toATensor(), min_val, max_val).to(ATensor).newTensor()

proc thnn_hardtanh_backward_impl*(grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_hardtanh_backward", grad_output.toATensor(), self.toATensor(), min_val, max_val).to(ATensor).newTensor()

proc thnn_hardtanh_impl_inplace*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_thnn_hardtanh_forward_", self.toATensor(), min_val, max_val).to(void); self

proc thnn_hardtanh_impl_inplace*(self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_thnn_hardtanh_forward_", self.toATensor(), min_val, max_val).to(void); self

proc thnn_leaky_relu_impl*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_leaky_relu_forward", self.toATensor(), negative_slope).to(ATensor).newTensor()

proc thnn_leaky_relu_impl*(self: Tensor; negative_slope: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_leaky_relu_forward", self.toATensor(), negative_slope).to(ATensor).newTensor()

proc thnn_leaky_relu_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_leaky_relu_backward", grad_output.toATensor(), self.toATensor(), negative_slope).to(ATensor).newTensor()

proc thnn_leaky_relu_backward_impl*(grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_leaky_relu_backward", grad_output.toATensor(), self.toATensor(), negative_slope).to(ATensor).newTensor()

proc thnn_leaky_relu_impl_inplace*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_thnn_leaky_relu_forward_", self.toATensor(), negative_slope).to(void); self

proc thnn_leaky_relu_impl_inplace*(self: Tensor; negative_slope: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_thnn_leaky_relu_forward_", self.toATensor(), negative_slope).to(void); self

proc thnn_log_sigmoid_impl*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_log_sigmoid_forward", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_log_sigmoid_impl*(self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_log_sigmoid_forward", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_log_sigmoid_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).to(ATensor).newTensor()

proc thnn_log_sigmoid_backward_impl*(grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).to(ATensor).newTensor()

proc thnn_rrelu_with_noise_impl*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_rrelu_with_noise_forward", self.toATensor(), noise.toATensor(), lower, upper, training, generator).to(ATensor).newTensor()

proc thnn_rrelu_with_noise_impl*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_rrelu_with_noise_forward", self.toATensor(), noise.toATensor(), lower, upper, training, generator).to(ATensor).newTensor()

proc thnn_rrelu_with_noise_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_rrelu_with_noise_backward", grad_output.toATensor(), self.toATensor(), noise.toATensor(), lower, upper, training).to(ATensor).newTensor()

proc thnn_rrelu_with_noise_backward_impl*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_rrelu_with_noise_backward", grad_output.toATensor(), self.toATensor(), noise.toATensor(), lower, upper, training).to(ATensor).newTensor()

proc thnn_rrelu_with_noise_impl_inplace*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_thnn_rrelu_with_noise_forward_", self.toATensor(), noise.toATensor(), lower, upper, training, generator).to(void); self

proc thnn_rrelu_with_noise_impl_inplace*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_thnn_rrelu_with_noise_forward_", self.toATensor(), noise.toATensor(), lower, upper, training, generator).to(void); self

proc thnn_softplus_impl*(ty: TensorType; self: Tensor; beta: float; threshold: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_softplus_forward", self.toATensor(), beta, threshold).to(ATensor).newTensor()

proc thnn_softplus_impl*(self: Tensor; beta: float; threshold: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_softplus_forward", self.toATensor(), beta, threshold).to(ATensor).newTensor()

proc thnn_softplus_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).to(ATensor).newTensor()

proc thnn_softplus_backward_impl*(grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).to(ATensor).newTensor()

proc thnn_softshrink_impl*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_softshrink_forward", self.toATensor(), lambd).to(ATensor).newTensor()

proc thnn_softshrink_impl*(self: Tensor; lambd: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_softshrink_forward", self.toATensor(), lambd).to(ATensor).newTensor()

proc thnn_softshrink_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_softshrink_backward", grad_output.toATensor(), self.toATensor(), lambd).to(ATensor).newTensor()

proc thnn_softshrink_backward_impl*(grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_softshrink_backward", grad_output.toATensor(), self.toATensor(), lambd).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_avg_pool2d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool2d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_avg_pool2d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_avg_pool2d_backward", grad_output.toATensor(), self.toATensor()).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool2d_backward_impl*(grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_avg_pool2d_backward", grad_output.toATensor(), self.toATensor()).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_avg_pool3d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool3d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_avg_pool3d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_avg_pool3d_backward", grad_output.toATensor(), self.toATensor()).to(ATensor).newTensor()

proc thnn_adaptive_avg_pool3d_backward_impl*(grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_avg_pool3d_backward", grad_output.toATensor(), self.toATensor()).to(ATensor).newTensor()

proc thnn_adaptive_max_pool2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_max_pool2d_forward", self.toATensor(), output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_adaptive_max_pool2d_impl*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_max_pool2d_forward", self.toATensor(), output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_adaptive_max_pool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc thnn_adaptive_max_pool2d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc thnn_adaptive_max_pool3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_max_pool3d_forward", self.toATensor(), output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_adaptive_max_pool3d_impl*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_max_pool3d_forward", self.toATensor(), output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_adaptive_max_pool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc thnn_adaptive_max_pool3d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc thnn_avg_pool2d_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_avg_pool2d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_avg_pool2d_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_avg_pool2d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_avg_pool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_avg_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_avg_pool2d_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_avg_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_avg_pool3d_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_avg_pool3d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_avg_pool3d_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_avg_pool3d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_avg_pool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_avg_pool3d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_avg_pool3d_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_avg_pool3d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc thnn_fractional_max_pool2d_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_fractional_max_pool2d_forward", self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), random_samples.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fractional_max_pool2d_impl*(self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_fractional_max_pool2d_forward", self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), random_samples.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fractional_max_pool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_fractional_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).to(ATensor).newTensor()

proc thnn_fractional_max_pool2d_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_fractional_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).to(ATensor).newTensor()

proc thnn_max_pool2d_with_indices_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_max_pool2d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_max_pool2d_with_indices_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_max_pool2d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_max_pool2d_with_indices_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc thnn_max_pool2d_with_indices_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc thnn_max_pool3d_with_indices_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_max_pool3d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_max_pool3d_with_indices_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_max_pool3d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_max_pool3d_with_indices_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc thnn_max_pool3d_with_indices_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc thnn_max_unpool2d_impl*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_max_unpool2d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_max_unpool2d_impl*(self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_max_unpool2d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_max_unpool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_max_unpool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_max_unpool2d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_max_unpool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_max_unpool3d_impl*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_max_unpool3d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_max_unpool3d_impl*(self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_max_unpool3d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_max_unpool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_max_unpool3d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad1d_impl*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_reflection_pad1d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad1d_impl*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_reflection_pad1d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad1d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_reflection_pad1d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad1d_backward_impl*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_reflection_pad1d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad2d_impl*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_reflection_pad2d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad2d_impl*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_reflection_pad2d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_reflection_pad2d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_reflection_pad2d_backward_impl*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_reflection_pad2d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad1d_impl*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_replication_pad1d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad1d_impl*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_replication_pad1d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad1d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_replication_pad1d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad1d_backward_impl*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_replication_pad1d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad2d_impl*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_replication_pad2d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad2d_impl*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_replication_pad2d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_replication_pad2d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad2d_backward_impl*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_replication_pad2d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad3d_impl*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_replication_pad3d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad3d_impl*(self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_replication_pad3d_forward", self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_replication_pad3d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_replication_pad3d_backward_impl*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_replication_pad3d_backward", grad_output.toATensor(), self.toATensor(), padding.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_linear1d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_linear1d_forward", self.toATensor(), output_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_linear1d_impl*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_linear1d_forward", self.toATensor(), output_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_linear1d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_linear1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_linear1d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_linear1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_bilinear2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_bilinear2d_forward", self.toATensor(), output_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_bilinear2d_impl*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_bilinear2d_forward", self.toATensor(), output_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_bilinear2d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_bilinear2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_bilinear2d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_bilinear2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_trilinear3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_trilinear3d_forward", self.toATensor(), output_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_trilinear3d_impl*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_trilinear3d_forward", self.toATensor(), output_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_trilinear3d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_trilinear3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_trilinear3d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_trilinear3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).to(ATensor).newTensor()

proc thnn_upsample_nearest1d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_nearest1d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest1d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_nearest1d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest1d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_nearest1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest1d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_nearest1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_nearest2d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest2d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_nearest2d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest2d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_nearest2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest2d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_nearest2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_nearest3d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest3d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_nearest3d_forward", self.toATensor(), output_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest3d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_upsample_nearest3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()

proc thnn_upsample_nearest3d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_upsample_nearest3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).to(ATensor).newTensor()

proc thnn_sigmoid_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_sigmoid_forward", self.toATensor()).to(ATensor).newTensor()

proc thnn_sigmoid_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_sigmoid_forward", self.toATensor()).to(ATensor).newTensor()

proc thnn_sigmoid_backward_impl*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_sigmoid_backward", grad_output.toATensor(), output.toATensor()).to(ATensor).newTensor()

proc thnn_sigmoid_backward_impl*(grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_sigmoid_backward", grad_output.toATensor(), output.toATensor()).to(ATensor).newTensor()

proc thnn_tanh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_tanh_forward", self.toATensor()).to(ATensor).newTensor()

proc thnn_tanh_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_tanh_forward", self.toATensor()).to(ATensor).newTensor()

proc thnn_tanh_backward_impl*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_tanh_backward", grad_output.toATensor(), output.toATensor()).to(ATensor).newTensor()

proc thnn_tanh_backward_impl*(grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_tanh_backward", grad_output.toATensor(), output.toATensor()).to(ATensor).newTensor()

proc thnn_conv_transpose2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_transpose2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_transpose2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_transpose3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_transpose3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_depthwise2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(ATensor).newTensor()

proc thnn_conv_depthwise2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_thnn_conv_depthwise2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(ATensor).newTensor()

proc thnn_conv_depthwise2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_dilated2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_dilated2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_dilated3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_dilated3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cast_Byte_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Byte", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Byte_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Byte", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Char_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Char", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Char_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Char", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Double_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Double", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Double_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Double", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Float_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Float", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Float_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Float", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Int_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Int", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Int_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Int", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Long_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Long", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Long_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Long", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Short_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Short", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Short_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Short", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Half_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_cast_Half", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cast_Half_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_cast_Half", self.toATensor(), non_blocking).to(ATensor).newTensor()

proc cudnn_ctc_loss_impl*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc cudnn_ctc_loss_impl*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc cudnn_rnn_flatten_weight_impl*(ty: TensorType; weight_arr: openarray[Tensor]; weight_stride0: int; input_size: int; mode: int; hidden_size: int; num_layers: int; batch_first: bool; bidirectional: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_cudnn_rnn_flatten_weight", weight_arr.toATensors(), weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_flatten_weight_impl*(weight_arr: openarray[Tensor]; weight_stride0: int; input_size: int; mode: int; hidden_size: int; num_layers: int; batch_first: bool; bidirectional: bool): Tensor {.inline.} = 
  check: atenFunction("at::_cudnn_rnn_flatten_weight", weight_arr.toATensors(), weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_impl*(ty: TensorType; input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.}

proc cudnn_rnn_impl*(input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.}

proc cudnn_rnn_backward_impl*(ty: TensorType; input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline.} = 
  check: ty[].atenMethod("_cudnn_rnn_backward", input.toATensor(), weight.toATensors(), weight_stride0, weight_buf.toATensor(), hx.toATensor(), cx.toATensor(), output.toATensor(), grad_output.toATensor(), grad_hy.toATensor(), grad_cy.toATensor(), mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.toATensor(), reserve.toATensor(), output_mask).to(StdTuple4[ATensor, ATensor, ATensor, ATensors]).toNimTuple().newTensors()

proc cudnn_rnn_backward_impl*(input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline.} = 
  check: atenFunction("at::_cudnn_rnn_backward", input.toATensor(), weight.toATensors(), weight_stride0, weight_buf.toATensor(), hx.toATensor(), cx.toATensor(), output.toATensor(), grad_output.toATensor(), grad_hy.toATensor(), grad_cy.toATensor(), mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.toATensor(), reserve.toATensor(), output_mask).to(StdTuple4[ATensor, ATensor, ATensor, ATensors]).toNimTuple().newTensors()

proc cudnn_init_dropout_state_impl*(ty: TensorType; dropout: float64; train: bool; dropout_seed: int; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("_cudnn_init_dropout_state", dropout, train, dropout_seed, options).to(ATensor).newTensor()

proc cudnn_init_dropout_state_impl*(dropout: float64; train: bool; dropout_seed: int; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::_cudnn_init_dropout_state", dropout, train, dropout_seed, options).to(ATensor).newTensor()

proc fused_dropout_impl*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_fused_dropout", self.toATensor(), p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc fused_dropout_impl*(self: Tensor; p: float64; generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_fused_dropout", self.toATensor(), p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc masked_scale_impl*(ty: TensorType; self: Tensor; mask: Tensor; scale: float64): Tensor {.inline.} = 
  check: ty[].atenMethod("_masked_scale", self.toATensor(), mask.toATensor(), scale).to(ATensor).newTensor()

proc masked_scale_impl*(self: Tensor; mask: Tensor; scale: float64): Tensor {.inline.} = 
  check: atenFunction("at::_masked_scale", self.toATensor(), mask.toATensor(), scale).to(ATensor).newTensor()

proc reshape_from_tensor_impl*(ty: TensorType; self: Tensor; shape: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_reshape_from_tensor", self.toATensor(), shape.toATensor()).to(ATensor).newTensor()

proc reshape_from_tensor_impl*(self: Tensor; shape: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_reshape_from_tensor", self.toATensor(), shape.toATensor()).to(ATensor).newTensor()

proc shape_as_tensor_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_shape_as_tensor", self.toATensor()).to(ATensor).newTensor()

proc shape_as_tensor_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_shape_as_tensor", self.toATensor()).to(ATensor).newTensor()

proc abs*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc abs*(self: Tensor): Tensor {.inline.}

proc abs_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("abs_", self.toATensor()).to(void); self

proc abs_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("abs_").to(void); self

proc acos*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc acos*(self: Tensor): Tensor {.inline.}

proc acos_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("acos_", self.toATensor()).to(void); self

proc acos_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("acos_").to(void); self

proc add*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc add*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc add_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("add_", self.toATensor(), other.toATensor(), alpha).to(void); self

proc add_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("add_", other.toATensor(), alpha).to(void); self

proc add*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc add*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc add_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("add_", self.toATensor(), other, alpha).to(void); self

proc add_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("add_", other, alpha).to(void); self

proc addmv*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmv*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmv_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("addmv_", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha).to(void); self

proc addmv_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("addmv_", mat.toATensor(), vec.toATensor(), beta, alpha).to(void); self

proc addr_special*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addr_special*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addr_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("addr_", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha).to(void); self

proc addr_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("addr_", vec1.toATensor(), vec2.toATensor(), beta, alpha).to(void); self

proc affine_grid_generator*(ty: TensorType; theta: Tensor; size: openarray[int]): Tensor {.inline.}

proc affine_grid_generator*(theta: Tensor; size: openarray[int]): Tensor {.inline.}

proc affine_grid_generator_backward*(ty: TensorType; grad: Tensor; size: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("affine_grid_generator_backward", grad.toATensor(), size.toAIntList()).to(ATensor).newTensor()

proc affine_grid_generator_backward*(grad: Tensor; size: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::affine_grid_generator_backward", grad.toATensor(), size.toAIntList()).to(ATensor).newTensor()

proc all*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("all", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc all*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("all", dim, keepdim).to(ATensor).newTensor()

proc allclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool {.inline.} = 
  check: ty[].atenMethod("allclose", self.toATensor(), other.toATensor(), rtol, atol, equal_nan).to(bool)

proc allclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool {.inline.} = 
  check: self.tensor.atenMethod("allclose", other.toATensor(), rtol, atol, equal_nan).to(bool)

proc any*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("any", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc any*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("any", dim, keepdim).to(ATensor).newTensor()

proc arange*(ty: TensorType; start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("arange", start, end_special, options).to(ATensor).newTensor()

proc arange*(start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::arange", start, end_special, options).to(ATensor).newTensor()

proc arange*(ty: TensorType; start: float; end_special: float; step: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("arange", start, end_special, step, options).to(ATensor).newTensor()

proc arange*(start: float; end_special: float; step: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::arange", start, end_special, step, options).to(ATensor).newTensor()

proc arange*(ty: TensorType; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("arange", end_special, options).to(ATensor).newTensor()

proc arange*(end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::arange", end_special, options).to(ATensor).newTensor()

proc dim_arange_impl*(ty: TensorType; like: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_dim_arange", like.toATensor(), dim).to(ATensor).newTensor()

proc dim_arange_impl*(like: Tensor; dim: int): Tensor {.inline.} = 
  check: atenFunction("at::_dim_arange", like.toATensor(), dim).to(ATensor).newTensor()

proc argmax*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("argmax", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc argmax*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("argmax", dim, keepdim).to(ATensor).newTensor()

proc argmax*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("argmax", self.toATensor()).to(ATensor).newTensor()

proc argmax*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("argmax").to(ATensor).newTensor()

proc argmax_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_argmax", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc argmax_impl*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_argmax", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc argmin*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("argmin", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc argmin*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("argmin", dim, keepdim).to(ATensor).newTensor()

proc argmin*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("argmin", self.toATensor()).to(ATensor).newTensor()

proc argmin*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("argmin").to(ATensor).newTensor()

proc argmin_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_argmin", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc argmin_impl*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_argmin", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc as_strided*(ty: TensorType; self: Tensor; size: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("as_strided", self.toATensor(), size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc as_strided*(self: Tensor; size: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  check: self.tensor.atenMethod("as_strided", size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc as_strided_inplace*(ty: TensorType; self: Tensor; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("as_strided_", self.toATensor(), size.toAIntList(), stride.toAIntList()).to(void); self

proc as_strided_inplace*(self: Tensor; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("as_strided_", size.toAIntList(), stride.toAIntList()).to(void); self

proc as_strided*(ty: TensorType; self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline.} = 
  check: ty[].atenMethod("as_strided", self.toATensor(), size.toAIntList(), stride.toAIntList(), storage_offset).to(ATensor).newTensor()

proc as_strided*(self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("as_strided", size.toAIntList(), stride.toAIntList(), storage_offset).to(ATensor).newTensor()

proc as_strided_inplace*(ty: TensorType; self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("as_strided_", self.toATensor(), size.toAIntList(), stride.toAIntList(), storage_offset).to(void); self

proc as_strided_inplace*(self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("as_strided_", size.toAIntList(), stride.toAIntList(), storage_offset).to(void); self

proc asin*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc asin*(self: Tensor): Tensor {.inline.}

proc asin_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("asin_", self.toATensor()).to(void); self

proc asin_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("asin_").to(void); self

proc atan*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc atan*(self: Tensor): Tensor {.inline.}

proc atan_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("atan_", self.toATensor()).to(void); self

proc atan_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("atan_").to(void); self

proc baddbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc baddbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc baddbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("baddbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc baddbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("baddbmm_", batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc baddbmm_mkl_impl_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_baddbmm_mkl_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc baddbmm_mkl_impl_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::_baddbmm_mkl_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc bartlett_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc bartlett_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("batch_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  check: atenFunction("at::batch_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc bernoulli*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc bernoulli*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli_inplace*(self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli_inplace*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline.} = 
  check: ty[].atenMethod("bernoulli", self.toATensor(), p, generator).to(ATensor).newTensor()

proc bernoulli*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline.} = 
  check: self.tensor.atenMethod("bernoulli", p, generator).to(ATensor).newTensor()

proc bilinear_internal*(ty: TensorType; input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("bilinear", input1.toATensor(), input2.toATensor(), weight.toATensor(), bias.toATensor()).to(ATensor).newTensor()

proc bilinear_internal*(input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::bilinear", input1.toATensor(), input2.toATensor(), weight.toATensor(), bias.toATensor()).to(ATensor).newTensor()

proc binary_cross_entropy_with_logits*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("binary_cross_entropy_with_logits", self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).to(ATensor).newTensor()

proc binary_cross_entropy_with_logits*(self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::binary_cross_entropy_with_logits", self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).to(ATensor).newTensor()

proc binary_cross_entropy_with_logits_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("binary_cross_entropy_with_logits_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).to(ATensor).newTensor()

proc binary_cross_entropy_with_logits_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::binary_cross_entropy_with_logits_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).to(ATensor).newTensor()

proc bincount*(ty: TensorType; self: Tensor; weights: Tensor; minlength: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("bincount", self.toATensor(), weights.toATensor(), minlength).to(ATensor).newTensor()

proc bincount*(self: Tensor; weights: Tensor; minlength: int = 0): Tensor {.inline.} = 
  check: self.tensor.atenMethod("bincount", weights.toATensor(), minlength).to(ATensor).newTensor()

proc blackman_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc blackman_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc bmm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.}

proc bmm*(self: Tensor; mat2: Tensor): Tensor {.inline.}

proc broadcast_tensors*(ty: TensorType; tensors: openarray[Tensor]): TensorList {.inline.} = 
  check: ty[].atenMethod("broadcast_tensors", tensors.toATensors()).to(ATensors).newTensors()

proc broadcast_tensors*(tensors: openarray[Tensor]): TensorList {.inline.} = 
  check: atenFunction("at::broadcast_tensors", tensors.toATensors()).to(ATensors).newTensors()

proc cat*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc cat*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc ceil*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc ceil*(self: Tensor): Tensor {.inline.}

proc ceil_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("ceil_", self.toATensor()).to(void); self

proc ceil_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("ceil_").to(void); self

proc chain_matmul*(ty: TensorType; matrices: openarray[Tensor]): Tensor {.inline.} = 
  check: ty[].atenMethod("chain_matmul", matrices.toATensors()).to(ATensor).newTensor()

proc chain_matmul*(matrices: openarray[Tensor]): Tensor {.inline.} = 
  check: atenFunction("at::chain_matmul", matrices.toATensors()).to(ATensor).newTensor()

proc clamp*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline.} = 
  check: ty[].atenMethod("clamp", self.toATensor(), min, max).to(ATensor).newTensor()

proc clamp*(self: Tensor; min: float; max: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("clamp", min, max).to(ATensor).newTensor()

proc clamp_inplace*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("clamp_", self.toATensor(), min, max).to(void); self

proc clamp_inplace*(self: Tensor; min: float; max: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("clamp_", min, max).to(void); self

proc clamp_max*(ty: TensorType; self: Tensor; max: float): Tensor {.inline.}

proc clamp_max*(self: Tensor; max: float): Tensor {.inline.}

proc clamp_max_inplace*(ty: TensorType; self: Tensor; max: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("clamp_max_", self.toATensor(), max).to(void); self

proc clamp_max_inplace*(self: Tensor; max: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("clamp_max_", max).to(void); self

proc clamp_min*(ty: TensorType; self: Tensor; min: float): Tensor {.inline.}

proc clamp_min*(self: Tensor; min: float): Tensor {.inline.}

proc clamp_min_inplace*(ty: TensorType; self: Tensor; min: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("clamp_min_", self.toATensor(), min).to(void); self

proc clamp_min_inplace*(self: Tensor; min: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("clamp_min_", min).to(void); self

proc cudnn_is_acceptable*(ty: TensorType; self: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("cudnn_is_acceptable", self.toATensor()).to(bool)

proc cudnn_is_acceptable*(self: Tensor): bool {.inline.} = 
  check: atenFunction("at::cudnn_is_acceptable", self.toATensor()).to(bool)

proc constant_pad_nd*(ty: TensorType; self: Tensor; pad: openarray[int]; value: float = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("constant_pad_nd", self.toATensor(), pad.toAIntList(), value).to(ATensor).newTensor()

proc constant_pad_nd*(self: Tensor; pad: openarray[int]; value: float = 0): Tensor {.inline.} = 
  check: atenFunction("at::constant_pad_nd", self.toATensor(), pad.toAIntList(), value).to(ATensor).newTensor()

proc convolution_double_backward_impl*(ty: TensorType; ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; transposed: bool; output_padding: openarray[int]; groups: int; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("_convolution_double_backward", ggI.toATensor(), ggW.toATensor(), ggb.toATensor(), gO.toATensor(), weight.toATensor(), self.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList(), groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc convolution_double_backward_impl*(ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; transposed: bool; output_padding: openarray[int]; groups: int; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::_convolution_double_backward", ggI.toATensor(), ggW.toATensor(), ggb.toATensor(), gO.toATensor(), weight.toATensor(), self.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList(), groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_tbc*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; pad: int = 0): Tensor {.inline.}

proc conv_tbc*(self: Tensor; weight: Tensor; bias: Tensor; pad: int = 0): Tensor {.inline.}

proc conv_tbc_backward*(ty: TensorType; self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("conv_tbc_backward", self.toATensor(), input.toATensor(), weight.toATensor(), bias.toATensor(), pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_tbc_backward*(self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::conv_tbc_backward", self.toATensor(), input.toATensor(), weight.toATensor(), bias.toATensor(), pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc s_copy_inplace*(ty: TensorType; self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("s_copy_", self.toATensor(), src.toATensor(), non_blocking).to(void); self

proc s_copy_inplace*(self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  check: atenFunction("at::s_copy_", self.toATensor(), src.toATensor(), non_blocking).to(void); self

proc s_copy_from_impl*(ty: TensorType; self: Tensor; dst: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("_s_copy_from", self.toATensor(), dst.toATensor(), non_blocking).to(ATensor).newTensor()

proc s_copy_from_impl*(self: Tensor; dst: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::_s_copy_from", self.toATensor(), dst.toATensor(), non_blocking).to(ATensor).newTensor()

proc copy_same_type_impl_inplace*(ty: TensorType; self: Tensor; src: Tensor): void {.inline, discardable.} = 
  checkVoid: ty[].atenMethod("_copy_same_type_", self.toATensor(), src.toATensor()).to(void)

proc copy_same_type_impl_inplace*(self: Tensor; src: Tensor): void {.inline, discardable.} = 
  checkVoid: atenFunction("at::_copy_same_type_", self.toATensor(), src.toATensor()).to(void)

proc cos*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc cos*(self: Tensor): Tensor {.inline.}

proc cos_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("cos_", self.toATensor()).to(void); self

proc cos_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("cos_").to(void); self

proc cosh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc cosh*(self: Tensor): Tensor {.inline.}

proc cosh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("cosh_", self.toATensor()).to(void); self

proc cosh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("cosh_").to(void); self

proc cosine_embedding_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("cosine_embedding_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).to(ATensor).newTensor()

proc cosine_embedding_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::cosine_embedding_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).to(ATensor).newTensor()

proc cudnn_affine_grid_generator*(ty: TensorType; theta: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.}

proc cudnn_affine_grid_generator*(theta: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.}

proc cudnn_affine_grid_generator_backward*(ty: TensorType; grad: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.} = 
  check: ty[].atenMethod("cudnn_affine_grid_generator_backward", grad.toATensor(), N, C, H, W).to(ATensor).newTensor()

proc cudnn_affine_grid_generator_backward*(grad: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.} = 
  check: atenFunction("at::cudnn_affine_grid_generator_backward", grad.toATensor(), N, C, H, W).to(ATensor).newTensor()

proc cudnn_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc cudnn_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc cudnn_batch_norm_backward*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("cudnn_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_batch_norm_backward*(input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::cudnn_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_backward_input*(ty: TensorType; self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_input*(self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::cudnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::cudnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_backward_bias", grad_output.toATensor()).to(ATensor).newTensor()

proc cudnn_convolution_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::cudnn_convolution_backward_bias", grad_output.toATensor()).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::cudnn_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_transpose*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_transpose_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::cudnn_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_transpose_backward_bias", grad_output.toATensor()).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::cudnn_convolution_transpose_backward_bias", grad_output.toATensor()).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input*(ty: TensorType; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input*(grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::cudnn_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("cudnn_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::cudnn_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_grid_sampler*(ty: TensorType; self: Tensor; grid: Tensor): Tensor {.inline.}

proc cudnn_grid_sampler*(self: Tensor; grid: Tensor): Tensor {.inline.}

proc cudnn_grid_sampler_backward*(ty: TensorType; self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline.} = 
  check: ty[].atenMethod("cudnn_grid_sampler_backward", self.toATensor(), grid.toATensor(), grad_output.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_grid_sampler_backward*(self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline.} = 
  check: atenFunction("at::cudnn_grid_sampler_backward", self.toATensor(), grid.toATensor(), grad_output.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cumsum*(ty: TensorType; self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("cumsum", self.toATensor(), dim, dtype).to(ATensor).newTensor()

proc cumsum*(self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("cumsum", dim, dtype).to(ATensor).newTensor()

proc cumsum*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("cumsum", self.toATensor(), dim).to(ATensor).newTensor()

proc cumsum*(self: Tensor; dim: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("cumsum", dim).to(ATensor).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("cumprod", self.toATensor(), dim, dtype).to(ATensor).newTensor()

proc cumprod*(self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("cumprod", dim, dtype).to(ATensor).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("cumprod", self.toATensor(), dim).to(ATensor).newTensor()

proc cumprod*(self: Tensor; dim: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("cumprod", dim).to(ATensor).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int = 0; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toATensor(), target_lengths.toATensor(), blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int = 0; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toATensor(), target_lengths.toATensor(), blank, reduction).to(ATensor).newTensor()

proc ctc_loss_impl*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc ctc_loss_impl*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc ctc_loss_backward_impl*(ty: TensorType; grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_ctc_loss_backward", grad.toATensor(), log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), neg_log_likelihood.toATensor(), log_alpha.toATensor(), blank).to(ATensor).newTensor()

proc ctc_loss_backward_impl*(grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int): Tensor {.inline.} = 
  check: atenFunction("at::_ctc_loss_backward", grad.toATensor(), log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), neg_log_likelihood.toATensor(), log_alpha.toATensor(), blank).to(ATensor).newTensor()

proc det*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("det", self.toATensor()).to(ATensor).newTensor()

proc det*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("det").to(ATensor).newTensor()

proc diag_embed*(ty: TensorType; self: Tensor; offset: int = 0; dim1: int = -2; dim2: int = -1): Tensor {.inline.} = 
  check: ty[].atenMethod("diag_embed", self.toATensor(), offset, dim1, dim2).to(ATensor).newTensor()

proc diag_embed*(self: Tensor; offset: int = 0; dim1: int = -2; dim2: int = -1): Tensor {.inline.} = 
  check: self.tensor.atenMethod("diag_embed", offset, dim1, dim2).to(ATensor).newTensor()

proc diagflat*(ty: TensorType; self: Tensor; offset: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("diagflat", self.toATensor(), offset).to(ATensor).newTensor()

proc diagflat*(self: Tensor; offset: int = 0): Tensor {.inline.} = 
  check: self.tensor.atenMethod("diagflat", offset).to(ATensor).newTensor()

proc diagonal*(ty: TensorType; self: Tensor; offset: int = 0; dim1: int = 0; dim2: int = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("diagonal", self.toATensor(), offset, dim1, dim2).to(ATensor).newTensor()

proc diagonal*(self: Tensor; offset: int = 0; dim1: int = 0; dim2: int = 1): Tensor {.inline.} = 
  check: self.tensor.atenMethod("diagonal", offset, dim1, dim2).to(ATensor).newTensor()

proc div_special*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc div_special*(self: Tensor; other: Tensor): Tensor {.inline.}

proc div_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("div_", self.toATensor(), other.toATensor()).to(void); self

proc div_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("div_", other.toATensor()).to(void); self

proc div_special*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc div_special*(self: Tensor; other: float): Tensor {.inline.}

proc div_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("div_", self.toATensor(), other).to(void); self

proc div_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("div_", other).to(void); self

proc dot*(ty: TensorType; self: Tensor; tensor: Tensor): Tensor {.inline.}

proc dot*(self: Tensor; tensor: Tensor): Tensor {.inline.}

proc einsum*(ty: TensorType; equation: StdString; tensors: openarray[Tensor]): Tensor {.inline.} = 
  check: ty[].atenMethod("einsum", equation, tensors.toATensors()).to(ATensor).newTensor()

proc einsum*(equation: StdString; tensors: openarray[Tensor]): Tensor {.inline.} = 
  check: atenFunction("at::einsum", equation, tensors.toATensors()).to(ATensor).newTensor()

proc embedding*(ty: TensorType; weight: Tensor; indices: Tensor; padding_idx: int = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.}

proc embedding*(weight: Tensor; indices: Tensor; padding_idx: int = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.}

proc embedding_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool; sparse: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("embedding_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_backward*(grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool; sparse: bool): Tensor {.inline.} = 
  check: atenFunction("at::embedding_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_dense_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("embedding_dense_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_dense_backward*(grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  check: atenFunction("at::embedding_dense_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_renorm_inplace*(ty: TensorType; self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("embedding_renorm_", self.toATensor(), indices.toATensor(), max_norm, norm_type).to(void); self

proc embedding_renorm_inplace*(self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor {.inline, discardable.} = 
  check: atenFunction("at::embedding_renorm_", self.toATensor(), indices.toATensor(), max_norm, norm_type).to(void); self

proc embedding_sparse_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("embedding_sparse_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_sparse_backward*(grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  check: atenFunction("at::embedding_sparse_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_bag*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
  check: ty[].atenMethod("embedding_bag", weight.toATensor(), indices.toATensor(), offsets.toATensor(), scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
  check: atenFunction("at::embedding_bag", weight.toATensor(), indices.toATensor(), offsets.toATensor(), scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag_impl*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.}

proc embedding_bag_impl*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.}

proc embedding_bag_backward_impl*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int; sparse: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_embedding_bag_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_backward_impl*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int; sparse: bool): Tensor {.inline.} = 
  check: atenFunction("at::_embedding_bag_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_impl*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_embedding_bag_sparse_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_impl*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  check: atenFunction("at::_embedding_bag_sparse_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_impl*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  check: ty[].atenMethod("_embedding_bag_dense_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_impl*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  check: atenFunction("at::_embedding_bag_dense_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc empty*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("empty", size.toAIntList(), options).to(ATensor).newTensor()

proc empty*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::empty", size.toAIntList(), options).to(ATensor).newTensor()

proc resize_inplace*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("resize_", self.toATensor(), size.toAIntList()).to(void); self

proc resize_inplace*(self: Tensor; size: openarray[int]): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("resize_", size.toAIntList()).to(void); self

proc empty_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("empty_like", self.toATensor()).to(ATensor).newTensor()

proc empty_like*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::empty_like", self.toATensor()).to(ATensor).newTensor()

proc empty_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("empty_like", self.toATensor(), options).to(ATensor).newTensor()

proc empty_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::empty_like", self.toATensor(), options).to(ATensor).newTensor()

proc empty_strided*(ty: TensorType; size: openarray[int]; stride: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("empty_strided", size.toAIntList(), stride.toAIntList(), options).to(ATensor).newTensor()

proc empty_strided*(size: openarray[int]; stride: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::empty_strided", size.toAIntList(), stride.toAIntList(), options).to(ATensor).newTensor()

proc erf*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erf*(self: Tensor): Tensor {.inline.}

proc erf_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("erf_", self.toATensor()).to(void); self

proc erf_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("erf_").to(void); self

proc erfc*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erfc*(self: Tensor): Tensor {.inline.}

proc erfc_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("erfc_", self.toATensor()).to(void); self

proc erfc_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("erfc_").to(void); self

proc exp*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc exp*(self: Tensor): Tensor {.inline.}

proc exp_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("exp_", self.toATensor()).to(void); self

proc exp_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("exp_").to(void); self

proc expm1*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc expm1*(self: Tensor): Tensor {.inline.}

proc expm1_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("expm1_", self.toATensor()).to(void); self

proc expm1_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("expm1_").to(void); self

proc expand*(ty: TensorType; self: Tensor; size: openarray[int]; implicit: bool = false): Tensor {.inline.}

proc expand*(self: Tensor; size: openarray[int]; implicit: bool = false): Tensor {.inline.}

proc eye*(ty: TensorType; n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("eye", n, options).to(ATensor).newTensor()

proc eye*(n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::eye", n, options).to(ATensor).newTensor()

proc eye*(ty: TensorType; n: int; m: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("eye", n, m, options).to(ATensor).newTensor()

proc eye*(n: int; m: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::eye", n, m, options).to(ATensor).newTensor()

proc flatten*(ty: TensorType; self: Tensor; start_dim: int = 0; end_dim: int = -1): Tensor {.inline.} = 
  check: ty[].atenMethod("flatten", self.toATensor(), start_dim, end_dim).to(ATensor).newTensor()

proc flatten*(self: Tensor; start_dim: int = 0; end_dim: int = -1): Tensor {.inline.} = 
  check: self.tensor.atenMethod("flatten", start_dim, end_dim).to(ATensor).newTensor()

proc fill_inplace*(ty: TensorType; self: Tensor; value: float): Tensor {.inline, discardable.}

proc fill_inplace*(self: Tensor; value: float): Tensor {.inline, discardable.}

proc fill_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc fill_inplace*(self: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc floor*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc floor*(self: Tensor): Tensor {.inline.}

proc floor_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("floor_", self.toATensor()).to(void); self

proc floor_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("floor_").to(void); self

proc full*(ty: TensorType; size: openarray[int]; fill_value: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("full", size.toAIntList(), fill_value, options).to(ATensor).newTensor()

proc full*(size: openarray[int]; fill_value: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::full", size.toAIntList(), fill_value, options).to(ATensor).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float): Tensor {.inline.} = 
  check: ty[].atenMethod("full_like", self.toATensor(), fill_value).to(ATensor).newTensor()

proc full_like*(self: Tensor; fill_value: float): Tensor {.inline.} = 
  check: atenFunction("at::full_like", self.toATensor(), fill_value).to(ATensor).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("full_like", self.toATensor(), fill_value, options).to(ATensor).newTensor()

proc full_like*(self: Tensor; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::full_like", self.toATensor(), fill_value, options).to(ATensor).newTensor()

proc grid_sampler*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
  check: ty[].atenMethod("grid_sampler", input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
  check: atenFunction("at::grid_sampler", input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler_2d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_2d*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_2d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("grid_sampler_2d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_2d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::grid_sampler_2d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_3d*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_3d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("grid_sampler_3d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::grid_sampler_3d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc hann_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hann_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; periodic: bool; alpha: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int; periodic: bool; alpha: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; periodic: bool; alpha: float64; beta: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int; periodic: bool; alpha: float64; beta: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hinge_embedding_loss*(ty: TensorType; self: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("hinge_embedding_loss", self.toATensor(), target.toATensor(), margin, reduction).to(ATensor).newTensor()

proc hinge_embedding_loss*(self: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::hinge_embedding_loss", self.toATensor(), target.toATensor(), margin, reduction).to(ATensor).newTensor()

proc ger*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor {.inline.}

proc ger*(self: Tensor; vec2: Tensor): Tensor {.inline.}

proc gesv*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("gesv", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("gesv", A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_impl*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_gesv_helper", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_impl*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_gesv_helper", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc group_norm*(ty: TensorType; input: Tensor; num_groups: int; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("group_norm", input.toATensor(), num_groups, weight.toATensor(), bias.toATensor(), eps, cudnn_enabled).to(ATensor).newTensor()

proc group_norm*(input: Tensor; num_groups: int; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor {.inline.} = 
  check: atenFunction("at::group_norm", input.toATensor(), num_groups, weight.toATensor(), bias.toATensor(), eps, cudnn_enabled).to(ATensor).newTensor()

proc fft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("fft", self.toATensor(), signal_ndim, normalized).to(ATensor).newTensor()

proc fft*(self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("fft", signal_ndim, normalized).to(ATensor).newTensor()

proc ifft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("ifft", self.toATensor(), signal_ndim, normalized).to(ATensor).newTensor()

proc ifft*(self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("ifft", signal_ndim, normalized).to(ATensor).newTensor()

proc rfft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("rfft", self.toATensor(), signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc rfft*(self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  check: self.tensor.atenMethod("rfft", signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc irfft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("irfft", self.toATensor(), signal_ndim, normalized, onesided, signal_sizes.toAIntList()).to(ATensor).newTensor()

proc irfft*(self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[int]): Tensor {.inline.} = 
  check: self.tensor.atenMethod("irfft", signal_ndim, normalized, onesided, signal_sizes.toAIntList()).to(ATensor).newTensor()

proc fft_with_size_impl*(ty: TensorType; self: Tensor; signal_ndim: int; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[int]; normalized: bool; onesided: bool; output_sizes: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_fft_with_size", self.toATensor(), signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList(), normalized, onesided, output_sizes.toAIntList()).to(ATensor).newTensor()

proc fft_with_size_impl*(self: Tensor; signal_ndim: int; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[int]; normalized: bool; onesided: bool; output_sizes: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_fft_with_size", self.toATensor(), signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList(), normalized, onesided, output_sizes.toAIntList()).to(ATensor).newTensor()

proc cufft_get_plan_cache_size_impl*(ty: TensorType; ): int {.inline.} = 
  check: ty[].atenMethod("_cufft_get_plan_cache_size").to(int)

proc cufft_get_plan_cache_size_impl*(): int {.inline.} = 
  check: atenFunction("at::_cufft_get_plan_cache_size").to(int)

proc cufft_get_plan_cache_max_size_impl*(ty: TensorType; ): int {.inline.} = 
  check: ty[].atenMethod("_cufft_get_plan_cache_max_size").to(int)

proc cufft_get_plan_cache_max_size_impl*(): int {.inline.} = 
  check: atenFunction("at::_cufft_get_plan_cache_max_size").to(int)

proc cufft_set_plan_cache_max_size_impl*(ty: TensorType; max_size: int): void {.inline.} = 
  checkVoid: ty[].atenMethod("_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_set_plan_cache_max_size_impl*(max_size: int): void {.inline.} = 
  checkVoid: atenFunction("at::_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_clear_plan_cache_impl*(ty: TensorType; ): void {.inline.} = 
  checkVoid: ty[].atenMethod("_cufft_clear_plan_cache").to(void)

proc cufft_clear_plan_cache_impl*(): void {.inline.} = 
  checkVoid: atenFunction("at::_cufft_clear_plan_cache").to(void)

proc index*(ty: TensorType; self: Tensor; indices: openarray[Tensor]): Tensor {.inline.} = 
  check: ty[].atenMethod("index", self.toATensor(), indices.toATensors()).to(ATensor).newTensor()

proc index*(self: Tensor; indices: openarray[Tensor]): Tensor {.inline.} = 
  check: self.tensor.atenMethod("index", indices.toATensors()).to(ATensor).newTensor()

proc index_copy_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_copy_inplace*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_put*(ty: TensorType; self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("index_put", self.toATensor(), indices.toATensors(), values.toATensor(), accumulate).to(ATensor).newTensor()

proc index_put*(self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("index_put", indices.toATensors(), values.toATensor(), accumulate).to(ATensor).newTensor()

proc index_put_inplace*(ty: TensorType; self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc index_put_inplace*(self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc instance_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; use_input_stats: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("instance_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), use_input_stats, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc instance_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; use_input_stats: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  check: atenFunction("at::instance_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), use_input_stats, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc inverse*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc inverse*(self: Tensor): Tensor {.inline.}

proc inverse_helper_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_inverse_helper", self.toATensor()).to(ATensor).newTensor()

proc inverse_helper_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_inverse_helper", self.toATensor()).to(ATensor).newTensor()

proc isclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("isclose", self.toATensor(), other.toATensor(), rtol, atol, equal_nan).to(ATensor).newTensor()

proc isclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("isclose", other.toATensor(), rtol, atol, equal_nan).to(ATensor).newTensor()

proc is_distributed*(ty: TensorType; self: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_distributed", self.toATensor()).to(bool)

proc is_distributed*(self: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_distributed").to(bool)

proc is_floating_point*(ty: TensorType; self: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_floating_point", self.toATensor()).to(bool)

proc is_floating_point*(self: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_floating_point").to(bool)

proc is_complex*(ty: TensorType; self: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_complex", self.toATensor()).to(bool)

proc is_complex*(self: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_complex").to(bool)

proc is_nonzero*(ty: TensorType; self: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_nonzero", self.toATensor()).to(bool)

proc is_nonzero*(self: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_nonzero").to(bool)

proc is_same_size*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_same_size", self.toATensor(), other.toATensor()).to(bool)

proc is_same_size*(self: Tensor; other: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_same_size", other.toATensor()).to(bool)

proc is_signed*(ty: TensorType; self: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_signed", self.toATensor()).to(bool)

proc is_signed*(self: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_signed").to(bool)

proc kl_div*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("kl_div", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc kl_div*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::kl_div", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc kl_div_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("kl_div_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc kl_div_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::kl_div_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc kthvalue*(ty: TensorType; self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("kthvalue", self.toATensor(), k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc kthvalue*(self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc layer_norm*(ty: TensorType; input: Tensor; normalized_shape: openarray[int]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("layer_norm", input.toATensor(), normalized_shape.toAIntList(), weight.toATensor(), bias.toATensor(), eps, cudnn_enable).to(ATensor).newTensor()

proc layer_norm*(input: Tensor; normalized_shape: openarray[int]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor {.inline.} = 
  check: atenFunction("at::layer_norm", input.toATensor(), normalized_shape.toAIntList(), weight.toATensor(), bias.toATensor(), eps, cudnn_enable).to(ATensor).newTensor()

proc linear_internal*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("linear", input.toATensor(), weight.toATensor(), bias.toATensor()).to(ATensor).newTensor()

proc linear_internal*(input: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::linear", input.toATensor(), weight.toATensor(), bias.toATensor()).to(ATensor).newTensor()

proc linspace*(ty: TensorType; start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("linspace", start, end_special, options).to(ATensor).newTensor()

proc linspace*(start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::linspace", start, end_special, options).to(ATensor).newTensor()

proc linspace*(ty: TensorType; start: float; end_special: float; steps: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("linspace", start, end_special, steps, options).to(ATensor).newTensor()

proc linspace*(start: float; end_special: float; steps: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::linspace", start, end_special, steps, options).to(ATensor).newTensor()

proc log*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log*(self: Tensor): Tensor {.inline.}

proc log_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("log_", self.toATensor()).to(void); self

proc log_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("log_").to(void); self

proc log10*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log10*(self: Tensor): Tensor {.inline.}

proc log10_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("log10_", self.toATensor()).to(void); self

proc log10_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("log10_").to(void); self

proc log1p*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("log1p", self.toATensor()).to(ATensor).newTensor()

proc log1p*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("log1p").to(ATensor).newTensor()

proc log1p_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("log1p_", self.toATensor()).to(void); self

proc log1p_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("log1p_").to(void); self

proc log2*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log2*(self: Tensor): Tensor {.inline.}

proc log2_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("log2_", self.toATensor()).to(void); self

proc log2_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("log2_").to(void); self

proc logdet*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("logdet", self.toATensor()).to(ATensor).newTensor()

proc logdet*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("logdet").to(ATensor).newTensor()

proc logspace*(ty: TensorType; start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("logspace", start, end_special, options).to(ATensor).newTensor()

proc logspace*(start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::logspace", start, end_special, options).to(ATensor).newTensor()

proc logspace*(ty: TensorType; start: float; end_special: float; steps: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("logspace", start, end_special, steps, options).to(ATensor).newTensor()

proc logspace*(start: float; end_special: float; steps: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::logspace", start, end_special, steps, options).to(ATensor).newTensor()

proc log_softmax_impl*(ty: TensorType; self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc log_softmax_impl*(self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc log_softmax_backward_data_impl*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_log_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).to(ATensor).newTensor()

proc log_softmax_backward_data_impl*(grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_log_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).to(ATensor).newTensor()

proc logsumexp*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("logsumexp", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc logsumexp*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("logsumexp", dim, keepdim).to(ATensor).newTensor()

proc margin_ranking_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("margin_ranking_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).to(ATensor).newTensor()

proc margin_ranking_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::margin_ranking_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).to(ATensor).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; tol: float64; symmetric: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("matrix_rank", self.toATensor(), tol, symmetric).to(ATensor).newTensor()

proc matrix_rank*(self: Tensor; tol: float64; symmetric: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::matrix_rank", self.toATensor(), tol, symmetric).to(ATensor).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; symmetric: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("matrix_rank", self.toATensor(), symmetric).to(ATensor).newTensor()

proc matrix_rank*(self: Tensor; symmetric: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::matrix_rank", self.toATensor(), symmetric).to(ATensor).newTensor()

proc matrix_power*(ty: TensorType; self: Tensor; n: int): Tensor {.inline.} = 
  check: ty[].atenMethod("matrix_power", self.toATensor(), n).to(ATensor).newTensor()

proc matrix_power*(self: Tensor; n: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("matrix_power", n).to(ATensor).newTensor()

proc max*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("max", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max*(self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_values*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("max_values", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc max_values*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("max_values", dim, keepdim).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("mean", self.toATensor(), dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("mean", dtype).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc mean*(self: Tensor): Tensor {.inline.}

proc mean*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("mean", self.toATensor(), dim.toAIntList(), keepdim, dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("mean", dim.toAIntList(), keepdim, dtype).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc mean*(self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc mean*(ty: TensorType; self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("mean", self.toATensor(), dim.toAIntList(), dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("mean", dim.toAIntList(), dtype).to(ATensor).newTensor()

proc median*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("median", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc median*(self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("min", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min*(self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min_values*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("min_values", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc min_values*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("min_values", dim, keepdim).to(ATensor).newTensor()

proc mkldnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int): Tensor {.inline.}

proc mkldnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int): Tensor {.inline.}

proc mkldnn_convolution_backward_input*(ty: TensorType; self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("mkldnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_input*(self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): Tensor {.inline.} = 
  check: atenFunction("at::mkldnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_weights*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("mkldnn_convolution_backward_weights", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward_weights*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::mkldnn_convolution_backward_weights", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("mkldnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::mkldnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc miopen_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc miopen_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc miopen_batch_norm_backward*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("miopen_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc miopen_batch_norm_backward*(input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::miopen_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc miopen_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution_backward_input*(ty: TensorType; self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("miopen_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc miopen_convolution_backward_input*(self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::miopen_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc miopen_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("miopen_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc miopen_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::miopen_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc miopen_convolution_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("miopen_convolution_backward_bias", grad_output.toATensor()).to(ATensor).newTensor()

proc miopen_convolution_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::miopen_convolution_backward_bias", grad_output.toATensor()).to(ATensor).newTensor()

proc miopen_convolution_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("miopen_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc miopen_convolution_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::miopen_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc miopen_convolution_transpose*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution_transpose*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution_transpose_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("miopen_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc miopen_convolution_transpose_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::miopen_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc miopen_convolution_transpose_backward_input*(ty: TensorType; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("miopen_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc miopen_convolution_transpose_backward_input*(grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::miopen_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc miopen_convolution_transpose_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("miopen_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc miopen_convolution_transpose_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  check: atenFunction("at::miopen_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc mm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.}

proc mm*(self: Tensor; mat2: Tensor): Tensor {.inline.}

proc sparse_mm_impl*(ty: TensorType; sparse: Tensor; dense: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_mm", sparse.toATensor(), dense.toATensor()).to(ATensor).newTensor()

proc sparse_mm_impl*(sparse: Tensor; dense: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_mm", sparse.toATensor(), dense.toATensor()).to(ATensor).newTensor()

proc mode*(ty: TensorType; self: Tensor; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("mode", self.toATensor(), dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mode*(self: Tensor; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mul*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc mul*(self: Tensor; other: Tensor): Tensor {.inline.}

proc mul_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("mul_", self.toATensor(), other.toATensor()).to(void); self

proc mul_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("mul_", other.toATensor()).to(void); self

proc mul*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc mul*(self: Tensor; other: float): Tensor {.inline.}

proc mul_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("mul_", self.toATensor(), other).to(void); self

proc mul_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("mul_", other).to(void); self

proc mv*(ty: TensorType; self: Tensor; vec: Tensor): Tensor {.inline.}

proc mv*(self: Tensor; vec: Tensor): Tensor {.inline.}

proc mvlgamma*(ty: TensorType; self: Tensor; p: int): Tensor {.inline.} = 
  check: ty[].atenMethod("mvlgamma", self.toATensor(), p).to(ATensor).newTensor()

proc mvlgamma*(self: Tensor; p: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("mvlgamma", p).to(ATensor).newTensor()

proc mvlgamma_inplace*(ty: TensorType; self: Tensor; p: int): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("mvlgamma_", self.toATensor(), p).to(void); self

proc mvlgamma_inplace*(self: Tensor; p: int): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("mvlgamma_", p).to(void); self

proc narrow_copy*(ty: TensorType; self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  check: ty[].atenMethod("narrow_copy", self.toATensor(), dim, start, length).to(ATensor).newTensor()

proc narrow_copy*(self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("narrow_copy", dim, start, length).to(ATensor).newTensor()

proc narrow*(ty: TensorType; self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  check: ty[].atenMethod("narrow", self.toATensor(), dim, start, length).to(ATensor).newTensor()

proc narrow*(self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("narrow", dim, start, length).to(ATensor).newTensor()

proc native_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc native_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc native_batch_norm_backward*(ty: TensorType; grad_out: Tensor; input: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_invstd: Tensor; train: bool; eps: float64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("native_batch_norm_backward", grad_out.toATensor(), input.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_invstd.toATensor(), train, eps, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc native_batch_norm_backward*(grad_out: Tensor; input: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_invstd: Tensor; train: bool; eps: float64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::native_batch_norm_backward", grad_out.toATensor(), input.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_invstd.toATensor(), train, eps, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc ones*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("ones", size.toAIntList(), options).to(ATensor).newTensor()

proc ones*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::ones", size.toAIntList(), options).to(ATensor).newTensor()

proc ones_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("ones_like", self.toATensor()).to(ATensor).newTensor()

proc ones_like*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::ones_like", self.toATensor()).to(ATensor).newTensor()

proc ones_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("ones_like", self.toATensor(), options).to(ATensor).newTensor()

proc ones_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::ones_like", self.toATensor(), options).to(ATensor).newTensor()

proc pairwise_distance*(ty: TensorType; x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("pairwise_distance", x1.toATensor(), x2.toATensor(), p, eps, keepdim).to(ATensor).newTensor()

proc pairwise_distance*(x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::pairwise_distance", x1.toATensor(), x2.toATensor(), p, eps, keepdim).to(ATensor).newTensor()

proc pdist*(ty: TensorType; self: Tensor; p: float64 = 2): Tensor {.inline.} = 
  check: ty[].atenMethod("pdist", self.toATensor(), p).to(ATensor).newTensor()

proc pdist*(self: Tensor; p: float64 = 2): Tensor {.inline.} = 
  check: atenFunction("at::pdist", self.toATensor(), p).to(ATensor).newTensor()

proc pdist_forward_impl*(ty: TensorType; self: Tensor; p: float64 = 2): Tensor {.inline.}

proc pdist_forward_impl*(self: Tensor; p: float64 = 2): Tensor {.inline.}

proc pdist_backward_impl*(ty: TensorType; grad: Tensor; self: Tensor; p: float64; pdist: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_pdist_backward", grad.toATensor(), self.toATensor(), p, pdist.toATensor()).to(ATensor).newTensor()

proc pdist_backward_impl*(grad: Tensor; self: Tensor; p: float64; pdist: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_pdist_backward", grad.toATensor(), self.toATensor(), p, pdist.toATensor()).to(ATensor).newTensor()

proc cosine_similarity*(ty: TensorType; x1: Tensor; x2: Tensor; dim: int = 1; eps: float64): Tensor {.inline.} = 
  check: ty[].atenMethod("cosine_similarity", x1.toATensor(), x2.toATensor(), dim, eps).to(ATensor).newTensor()

proc cosine_similarity*(x1: Tensor; x2: Tensor; dim: int = 1; eps: float64): Tensor {.inline.} = 
  check: atenFunction("at::cosine_similarity", x1.toATensor(), x2.toATensor(), dim, eps).to(ATensor).newTensor()

proc permute*(ty: TensorType; self: Tensor; dims: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("permute", self.toATensor(), dims.toAIntList()).to(ATensor).newTensor()

proc permute*(self: Tensor; dims: openarray[int]): Tensor {.inline.} = 
  check: self.tensor.atenMethod("permute", dims.toAIntList()).to(ATensor).newTensor()

proc pixel_shuffle*(ty: TensorType; self: Tensor; upscale_factor: int): Tensor {.inline.} = 
  check: ty[].atenMethod("pixel_shuffle", self.toATensor(), upscale_factor).to(ATensor).newTensor()

proc pixel_shuffle*(self: Tensor; upscale_factor: int): Tensor {.inline.} = 
  check: atenFunction("at::pixel_shuffle", self.toATensor(), upscale_factor).to(ATensor).newTensor()

proc pin_memory*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("pin_memory", self.toATensor()).to(ATensor).newTensor()

proc pin_memory*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("pin_memory").to(ATensor).newTensor()

proc pinverse*(ty: TensorType; self: Tensor; rcond: float64): Tensor {.inline.} = 
  check: ty[].atenMethod("pinverse", self.toATensor(), rcond).to(ATensor).newTensor()

proc pinverse*(self: Tensor; rcond: float64): Tensor {.inline.} = 
  check: self.tensor.atenMethod("pinverse", rcond).to(ATensor).newTensor()

proc rand*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("rand", size.toAIntList(), options).to(ATensor).newTensor()

proc rand*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::rand", size.toAIntList(), options).to(ATensor).newTensor()

proc rand*(ty: TensorType; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("rand", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc rand*(size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::rand", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc rand_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("rand_like", self.toATensor()).to(ATensor).newTensor()

proc rand_like*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::rand_like", self.toATensor()).to(ATensor).newTensor()

proc rand_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("rand_like", self.toATensor(), options).to(ATensor).newTensor()

proc rand_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::rand_like", self.toATensor(), options).to(ATensor).newTensor()

proc randint*(ty: TensorType; high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randint", high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randint", high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(ty: TensorType; high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randint", high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint*(high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randint", high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint*(ty: TensorType; low: int; high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randint", low, high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(low: int; high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randint", low, high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(ty: TensorType; low: int; high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randint", low, high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint*(low: int; high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randint", low, high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int): Tensor {.inline.} = 
  check: ty[].atenMethod("randint_like", self.toATensor(), high).to(ATensor).newTensor()

proc randint_like*(self: Tensor; high: int): Tensor {.inline.} = 
  check: atenFunction("at::randint_like", self.toATensor(), high).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int; high: int): Tensor {.inline.} = 
  check: ty[].atenMethod("randint_like", self.toATensor(), low, high).to(ATensor).newTensor()

proc randint_like*(self: Tensor; low: int; high: int): Tensor {.inline.} = 
  check: atenFunction("at::randint_like", self.toATensor(), low, high).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("randint_like", self.toATensor(), high, options).to(ATensor).newTensor()

proc randint_like*(self: Tensor; high: int; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::randint_like", self.toATensor(), high, options).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int; high: int; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("randint_like", self.toATensor(), low, high, options).to(ATensor).newTensor()

proc randint_like*(self: Tensor; low: int; high: int; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::randint_like", self.toATensor(), low, high, options).to(ATensor).newTensor()

proc randn*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randn", size.toAIntList(), options).to(ATensor).newTensor()

proc randn*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randn", size.toAIntList(), options).to(ATensor).newTensor()

proc randn*(ty: TensorType; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randn", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randn*(size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randn", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randn_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("randn_like", self.toATensor()).to(ATensor).newTensor()

proc randn_like*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::randn_like", self.toATensor()).to(ATensor).newTensor()

proc randn_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("randn_like", self.toATensor(), options).to(ATensor).newTensor()

proc randn_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::randn_like", self.toATensor(), options).to(ATensor).newTensor()

proc randperm*(ty: TensorType; n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randperm", n, options).to(ATensor).newTensor()

proc randperm*(n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randperm", n, options).to(ATensor).newTensor()

proc randperm*(ty: TensorType; n: int; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("randperm", n, generator, options).to(ATensor).newTensor()

proc randperm*(n: int; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::randperm", n, generator, options).to(ATensor).newTensor()

proc range*(ty: TensorType; start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("range", start, end_special, options).to(ATensor).newTensor()

proc range*(start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::range", start, end_special, options).to(ATensor).newTensor()

proc range*(ty: TensorType; start: float; end_special: float; step: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("range", start, end_special, step, options).to(ATensor).newTensor()

proc range*(start: float; end_special: float; step: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::range", start, end_special, step, options).to(ATensor).newTensor()

proc repeat*(ty: TensorType; self: Tensor; repeats: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("repeat", self.toATensor(), repeats.toAIntList()).to(ATensor).newTensor()

proc repeat*(self: Tensor; repeats: openarray[int]): Tensor {.inline.} = 
  check: self.tensor.atenMethod("repeat", repeats.toAIntList()).to(ATensor).newTensor()

proc reshape*(ty: TensorType; self: Tensor; shape: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("reshape", self.toATensor(), shape.toAIntList()).to(ATensor).newTensor()

proc reshape*(self: Tensor; shape: openarray[int]): Tensor {.inline.} = 
  check: self.tensor.atenMethod("reshape", shape.toAIntList()).to(ATensor).newTensor()

proc reshape_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("reshape_as", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc reshape_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("reshape_as", other.toATensor()).to(ATensor).newTensor()

proc RoiPooling2d_forward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc RoiPooling2d_forward*(input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc RoiPooling2d_backward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("RoiPooling2d_backward", input.toATensor(), rois.toATensor(), pooledHeight, pooledWidth, spatialScale, gradOutput.toATensor(), argmaxes.toATensor()).to(ATensor).newTensor()

proc RoiPooling2d_backward*(input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::RoiPooling2d_backward", input.toATensor(), rois.toATensor(), pooledHeight, pooledWidth, spatialScale, gradOutput.toATensor(), argmaxes.toATensor()).to(ATensor).newTensor()

proc round*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc round*(self: Tensor): Tensor {.inline.}

proc round_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("round_", self.toATensor()).to(void); self

proc round_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("round_").to(void); self

proc rrelu*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  check: ty[].atenMethod("rrelu", self.toATensor(), lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu*(self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  check: atenFunction("at::rrelu", self.toATensor(), lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu_inplace*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("rrelu_", self.toATensor(), lower, upper, training, generator).to(void); self

proc rrelu_inplace*(self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.} = 
  check: atenFunction("at::rrelu_", self.toATensor(), lower, upper, training, generator).to(void); self

proc relu*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc relu*(self: Tensor): Tensor {.inline.}

proc relu_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.}

proc relu_inplace*(self: Tensor): Tensor {.inline, discardable.}

proc prelu*(ty: TensorType; self: Tensor; weight: Tensor): Tensor {.inline.}

proc prelu*(self: Tensor; weight: Tensor): Tensor {.inline.}

proc prelu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("prelu_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc prelu_backward*(grad_output: Tensor; self: Tensor; weight: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("prelu_backward", grad_output.toATensor(), weight.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc hardshrink*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink*(self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink_backward*(ty: TensorType; grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink_backward*(grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc rsqrt*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc rsqrt*(self: Tensor): Tensor {.inline.}

proc rsqrt_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("rsqrt_", self.toATensor()).to(void); self

proc rsqrt_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("rsqrt_").to(void); self

proc select*(ty: TensorType; self: Tensor; dim: int; index: int): Tensor {.inline.} = 
  check: ty[].atenMethod("select", self.toATensor(), dim, index).to(ATensor).newTensor()

proc select*(self: Tensor; dim: int; index: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("select", dim, index).to(ATensor).newTensor()

proc selu*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("selu", self.toATensor()).to(ATensor).newTensor()

proc selu*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::selu", self.toATensor()).to(ATensor).newTensor()

proc selu_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("selu_", self.toATensor()).to(void); self

proc selu_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::selu_", self.toATensor()).to(void); self

proc celu*(ty: TensorType; self: Tensor; alpha: float): Tensor {.inline.} = 
  check: ty[].atenMethod("celu", self.toATensor(), alpha).to(ATensor).newTensor()

proc celu*(self: Tensor; alpha: float): Tensor {.inline.} = 
  check: atenFunction("at::celu", self.toATensor(), alpha).to(ATensor).newTensor()

proc celu_inplace*(ty: TensorType; self: Tensor; alpha: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("celu_", self.toATensor(), alpha).to(void); self

proc celu_inplace*(self: Tensor; alpha: float): Tensor {.inline, discardable.} = 
  check: atenFunction("at::celu_", self.toATensor(), alpha).to(void); self

proc sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sigmoid*(self: Tensor): Tensor {.inline.}

proc sigmoid_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sigmoid_", self.toATensor()).to(void); self

proc sigmoid_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sigmoid_").to(void); self

proc sin*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sin*(self: Tensor): Tensor {.inline.}

proc sin_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sin_", self.toATensor()).to(void); self

proc sin_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sin_").to(void); self

proc sinh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sinh*(self: Tensor): Tensor {.inline.}

proc sinh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sinh_", self.toATensor()).to(void); self

proc sinh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sinh_").to(void); self

proc size*(ty: TensorType; self: Tensor; dim: int): int {.inline.} = 
  check: ty[].atenMethod("size", self.toATensor(), dim).to(int)

proc size*(self: Tensor; dim: int): int {.inline.} = 
  check: self.tensor.atenMethod("size", dim).to(int)

proc slice*(ty: TensorType; self: Tensor; dim: int = 0; start: int = 0; end_special: int = int.high; step: int = 1): Tensor {.inline.}

proc slice*(self: Tensor; dim: int = 0; start: int = 0; end_special: int = int.high; step: int = 1): Tensor {.inline.}

proc slogdet*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("slogdet", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc slogdet*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("slogdet").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc smm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("smm", self.toATensor(), mat2.toATensor()).to(ATensor).newTensor()

proc smm*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("smm", mat2.toATensor()).to(ATensor).newTensor()

proc softmax_impl*(ty: TensorType; self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc softmax_impl*(self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc softmax_backward_data_impl*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).to(ATensor).newTensor()

proc softmax_backward_data_impl*(grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).to(ATensor).newTensor()

proc split*(ty: TensorType; self: Tensor; split_size: int; dim: int = 0): TensorList {.inline.}

proc split*(self: Tensor; split_size: int; dim: int = 0): TensorList {.inline.}

proc split_with_sizes*(ty: TensorType; self: Tensor; split_sizes: openarray[int]; dim: int = 0): TensorList {.inline.}

proc split_with_sizes*(self: Tensor; split_sizes: openarray[int]; dim: int = 0): TensorList {.inline.}

proc squeeze*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc squeeze*(self: Tensor): Tensor {.inline.}

proc squeeze*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.}

proc squeeze*(self: Tensor; dim: int): Tensor {.inline.}

proc squeeze_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.}

proc squeeze_inplace*(self: Tensor): Tensor {.inline, discardable.}

proc squeeze_inplace*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline, discardable.}

proc squeeze_inplace*(self: Tensor; dim: int): Tensor {.inline, discardable.}

proc sspaddmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("sspaddmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc sspaddmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: self.tensor.atenMethod("sspaddmm", mat1.toATensor(), mat2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc stack*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc stack*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc stft*(ty: TensorType; self: Tensor; n_fft: int; hop_length: int; win_length: int; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("stft", self.toATensor(), n_fft, hop_length, win_length, window.toATensor(), normalized, onesided).to(ATensor).newTensor()

proc stft*(self: Tensor; n_fft: int; hop_length: int; win_length: int; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  check: self.tensor.atenMethod("stft", n_fft, hop_length, win_length, window.toATensor(), normalized, onesided).to(ATensor).newTensor()

proc stride*(ty: TensorType; self: Tensor; dim: int): int {.inline.} = 
  check: ty[].atenMethod("stride", self.toATensor(), dim).to(int)

proc stride*(self: Tensor; dim: int): int {.inline.} = 
  check: self.tensor.atenMethod("stride", dim).to(int)

proc sum*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("sum", self.toATensor(), dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("sum", dtype).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sum*(self: Tensor): Tensor {.inline.}

proc sum*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("sum", self.toATensor(), dim.toAIntList(), keepdim, dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("sum", dim.toAIntList(), keepdim, dtype).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc sum*(self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc sum*(ty: TensorType; self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("sum", self.toATensor(), dim.toAIntList(), dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("sum", dim.toAIntList(), dtype).to(ATensor).newTensor()

proc sqrt*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sqrt*(self: Tensor): Tensor {.inline.}

proc sqrt_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sqrt_", self.toATensor()).to(void); self

proc sqrt_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sqrt_").to(void); self

proc std*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("std", self.toATensor(), unbiased).to(ATensor).newTensor()

proc std*(self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  check: self.tensor.atenMethod("std", unbiased).to(ATensor).newTensor()

proc std*(ty: TensorType; self: Tensor; dim: openarray[int]; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("std", self.toATensor(), dim.toAIntList(), unbiased, keepdim).to(ATensor).newTensor()

proc std*(self: Tensor; dim: openarray[int]; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("std", dim.toAIntList(), unbiased, keepdim).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("prod", self.toATensor(), dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("prod", dtype).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("prod", self.toATensor()).to(ATensor).newTensor()

proc prod*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("prod").to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("prod", self.toATensor(), dim, keepdim, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("prod", dim, keepdim, dtype).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("prod", self.toATensor(), dim, keepdim).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("prod", dim, keepdim).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("prod", self.toATensor(), dim, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  check: self.tensor.atenMethod("prod", dim, dtype).to(ATensor).newTensor()

proc t*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc t*(self: Tensor): Tensor {.inline.}

proc t_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("t_", self.toATensor()).to(void); self

proc t_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("t_").to(void); self

proc tan*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc tan*(self: Tensor): Tensor {.inline.}

proc tan_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("tan_", self.toATensor()).to(void); self

proc tan_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("tan_").to(void); self

proc tanh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc tanh*(self: Tensor): Tensor {.inline.}

proc tanh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("tanh_", self.toATensor()).to(void); self

proc tanh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("tanh_").to(void); self

proc tensordot*(ty: TensorType; self: Tensor; other: Tensor; dims_self: openarray[int]; dims_other: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("tensordot", self.toATensor(), other.toATensor(), dims_self.toAIntList(), dims_other.toAIntList()).to(ATensor).newTensor()

proc tensordot*(self: Tensor; other: Tensor; dims_self: openarray[int]; dims_other: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::tensordot", self.toATensor(), other.toATensor(), dims_self.toAIntList(), dims_other.toAIntList()).to(ATensor).newTensor()

proc threshold*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor {.inline.}

proc threshold*(self: Tensor; threshold: float; value: float): Tensor {.inline.}

proc threshold_inplace*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor {.inline, discardable.}

proc threshold_inplace*(self: Tensor; threshold: float; value: float): Tensor {.inline, discardable.}

proc threshold_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; threshold: float): Tensor {.inline.}

proc threshold_backward*(grad_output: Tensor; self: Tensor; threshold: float): Tensor {.inline.}

proc transpose*(ty: TensorType; self: Tensor; dim0: int; dim1: int): Tensor {.inline.}

proc transpose*(self: Tensor; dim0: int; dim1: int): Tensor {.inline.}

proc transpose_inplace*(ty: TensorType; self: Tensor; dim0: int; dim1: int): Tensor {.inline, discardable.}

proc transpose_inplace*(self: Tensor; dim0: int; dim1: int): Tensor {.inline, discardable.}

proc flip*(ty: TensorType; self: Tensor; dims: openarray[int]): Tensor {.inline.}

proc flip*(self: Tensor; dims: openarray[int]): Tensor {.inline.}

proc roll*(ty: TensorType; self: Tensor; shifts: openarray[int]; dims: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("roll", self.toATensor(), shifts.toAIntList(), dims.toAIntList()).to(ATensor).newTensor()

proc roll*(self: Tensor; shifts: openarray[int]; dims: openarray[int]): Tensor {.inline.} = 
  check: self.tensor.atenMethod("roll", shifts.toAIntList(), dims.toAIntList()).to(ATensor).newTensor()

proc rot90*(ty: TensorType; self: Tensor; k: int = 1; dims: openarray[int]): Tensor {.inline.}

proc rot90*(self: Tensor; k: int = 1; dims: openarray[int]): Tensor {.inline.}

proc trilinear_impl*(ty: TensorType; i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[int]; expand2: openarray[int]; expand3: openarray[int]; sumdim: openarray[int]; unroll_dim: int = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_trilinear", i1.toATensor(), i2.toATensor(), i3.toATensor(), expand1.toAIntList(), expand2.toAIntList(), expand3.toAIntList(), sumdim.toAIntList(), unroll_dim).to(ATensor).newTensor()

proc trilinear_impl*(i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[int]; expand2: openarray[int]; expand3: openarray[int]; sumdim: openarray[int]; unroll_dim: int = 1): Tensor {.inline.} = 
  check: atenFunction("at::_trilinear", i1.toATensor(), i2.toATensor(), i3.toATensor(), expand1.toAIntList(), expand2.toAIntList(), expand3.toAIntList(), sumdim.toAIntList(), unroll_dim).to(ATensor).newTensor()

proc triplet_margin_loss*(ty: TensorType; anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("triplet_margin_loss", anchor.toATensor(), positive.toATensor(), negative.toATensor(), margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc triplet_margin_loss*(anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::triplet_margin_loss", anchor.toATensor(), positive.toATensor(), negative.toATensor(), margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc trunc*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc trunc*(self: Tensor): Tensor {.inline.}

proc trunc_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("trunc_", self.toATensor()).to(void); self

proc trunc_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("trunc_").to(void); self

proc type_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("type_as", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc type_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("type_as", other.toATensor()).to(ATensor).newTensor()

proc unique_impl*(ty: TensorType; self: Tensor; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_unique", self.toATensor(), sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unique_impl*(self: Tensor; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_unique", self.toATensor(), sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unique_dim_impl*(ty: TensorType; self: Tensor; dim: int; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_unique_dim", self.toATensor(), dim, sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unique_dim_impl*(self: Tensor; dim: int; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_unique_dim", self.toATensor(), dim, sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unsafe_view_impl*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.}

proc unsafe_view_impl*(self: Tensor; size: openarray[int]): Tensor {.inline.}

proc unsqueeze*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.}

proc unsqueeze*(self: Tensor; dim: int): Tensor {.inline.}

proc unsqueeze_inplace*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline, discardable.}

proc unsqueeze_inplace*(self: Tensor; dim: int): Tensor {.inline, discardable.}

proc var_special*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("var", self.toATensor(), unbiased).to(ATensor).newTensor()

proc var_special*(self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  check: self.tensor.atenMethod("var", unbiased).to(ATensor).newTensor()

proc var_special*(ty: TensorType; self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("var", self.toATensor(), dim, unbiased, keepdim).to(ATensor).newTensor()

proc var_special*(self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("var", dim, unbiased, keepdim).to(ATensor).newTensor()

proc view_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("view_as", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc view_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("view_as", other.toATensor()).to(ATensor).newTensor()

proc where*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("where", condition.toATensor(), self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc where*(condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("where", condition.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc s_where_impl*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.}

proc s_where_impl*(condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.}

proc norm_except_dim*(ty: TensorType; v: Tensor; pow: int = 2; dim: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("norm_except_dim", v.toATensor(), pow, dim).to(ATensor).newTensor()

proc norm_except_dim*(v: Tensor; pow: int = 2; dim: int = 0): Tensor {.inline.} = 
  check: atenFunction("at::norm_except_dim", v.toATensor(), pow, dim).to(ATensor).newTensor()

proc weight_norm_impl*(ty: TensorType; v: Tensor; g: Tensor; dim: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("_weight_norm", v.toATensor(), g.toATensor(), dim).to(ATensor).newTensor()

proc weight_norm_impl*(v: Tensor; g: Tensor; dim: int = 0): Tensor {.inline.} = 
  check: atenFunction("at::_weight_norm", v.toATensor(), g.toATensor(), dim).to(ATensor).newTensor()

proc weight_norm_cuda_interface_impl*(ty: TensorType; v: Tensor; g: Tensor; dim: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_weight_norm_cuda_interface", v.toATensor(), g.toATensor(), dim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc weight_norm_cuda_interface_impl*(v: Tensor; g: Tensor; dim: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_weight_norm_cuda_interface", v.toATensor(), g.toATensor(), dim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc weight_norm_cuda_interface_backward_impl*(ty: TensorType; grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_weight_norm_cuda_interface_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc weight_norm_cuda_interface_backward_impl*(grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_weight_norm_cuda_interface_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc weight_norm_differentiable_backward_impl*(ty: TensorType; grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_weight_norm_differentiable_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc weight_norm_differentiable_backward_impl*(grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_weight_norm_differentiable_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc zeros*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("zeros", size.toAIntList(), options).to(ATensor).newTensor()

proc zeros*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::zeros", size.toAIntList(), options).to(ATensor).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("zeros_like", self.toATensor()).to(ATensor).newTensor()

proc zeros_like*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::zeros_like", self.toATensor()).to(ATensor).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("zeros_like", self.toATensor(), options).to(ATensor).newTensor()

proc zeros_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::zeros_like", self.toATensor(), options).to(ATensor).newTensor()

proc standard_gamma_grad_impl*(ty: TensorType; self: Tensor; output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_standard_gamma_grad", self.toATensor(), output.toATensor()).to(ATensor).newTensor()

proc standard_gamma_grad_impl*(self: Tensor; output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_standard_gamma_grad", self.toATensor(), output.toATensor()).to(ATensor).newTensor()

proc standard_gamma_impl*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc standard_gamma_impl*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc poisson*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc poisson*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc native_norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor {.inline.} = 
  check: ty[].atenMethod("native_norm", self.toATensor(), p).to(ATensor).newTensor()

proc native_norm*(self: Tensor; p: float = 2): Tensor {.inline.} = 
  check: atenFunction("at::native_norm", self.toATensor(), p).to(ATensor).newTensor()

proc sparse_sum_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_sum", self.toATensor()).to(ATensor).newTensor()

proc sparse_sum_impl*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_sum", self.toATensor()).to(ATensor).newTensor()

proc sparse_sum_impl*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_sum", self.toATensor(), dtype).to(ATensor).newTensor()

proc sparse_sum_impl*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_sum", self.toATensor(), dtype).to(ATensor).newTensor()

proc sparse_sum_impl*(ty: TensorType; self: Tensor; dim: openarray[int]): Tensor {.inline.}

proc sparse_sum_impl*(self: Tensor; dim: openarray[int]): Tensor {.inline.}

proc sparse_sum_impl*(ty: TensorType; self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_sum", self.toATensor(), dim.toAIntList(), dtype).to(ATensor).newTensor()

proc sparse_sum_impl*(self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_sum", self.toATensor(), dim.toAIntList(), dtype).to(ATensor).newTensor()

proc sparse_sum_backward_impl*(ty: TensorType; grad: Tensor; self: Tensor; dim: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_sum_backward", grad.toATensor(), self.toATensor(), dim.toAIntList()).to(ATensor).newTensor()

proc sparse_sum_backward_impl*(grad: Tensor; self: Tensor; dim: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_sum_backward", grad.toATensor(), self.toATensor(), dim.toAIntList()).to(ATensor).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor {.inline.} = 
  check: ty[].atenMethod("norm", self.toATensor(), p).to(ATensor).newTensor()

proc norm*(self: Tensor; p: float = 2): Tensor {.inline.} = 
  check: self.tensor.atenMethod("norm", p).to(ATensor).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("norm", self.toATensor(), p, dim, keepdim).to(ATensor).newTensor()

proc norm*(self: Tensor; p: float; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("norm", p, dim, keepdim).to(ATensor).newTensor()

proc frobenius_norm*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("frobenius_norm", self.toATensor()).to(ATensor).newTensor()

proc frobenius_norm*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::frobenius_norm", self.toATensor()).to(ATensor).newTensor()

proc frobenius_norm*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("frobenius_norm", self.toATensor(), dim.toAIntList(), keepdim).to(ATensor).newTensor()

proc frobenius_norm*(self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::frobenius_norm", self.toATensor(), dim.toAIntList(), keepdim).to(ATensor).newTensor()

proc nuclear_norm*(ty: TensorType; self: Tensor; keepdim: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("nuclear_norm", self.toATensor(), keepdim).to(ATensor).newTensor()

proc nuclear_norm*(self: Tensor; keepdim: bool = false): Tensor {.inline.} = 
  check: atenFunction("at::nuclear_norm", self.toATensor(), keepdim).to(ATensor).newTensor()

proc native_clone*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("native_clone", self.toATensor()).to(ATensor).newTensor()

proc native_clone*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::native_clone", self.toATensor()).to(ATensor).newTensor()

proc clone*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc clone*(self: Tensor): Tensor {.inline.}

proc native_resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("native_resize_as_", self.toATensor(), the_template.toATensor()).to(void); self

proc native_resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::native_resize_as_", self.toATensor(), the_template.toATensor()).to(void); self

proc resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("resize_as_", self.toATensor(), the_template.toATensor()).to(void); self

proc resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("resize_as_", the_template.toATensor()).to(void); self

proc native_pow*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.} = 
  check: ty[].atenMethod("native_pow", self.toATensor(), exponent).to(ATensor).newTensor()

proc native_pow*(self: Tensor; exponent: float): Tensor {.inline.} = 
  check: atenFunction("at::native_pow", self.toATensor(), exponent).to(ATensor).newTensor()

proc pow*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.}

proc pow*(self: Tensor; exponent: float): Tensor {.inline.}

proc native_zero_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("native_zero_", self.toATensor()).to(void); self

proc native_zero_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: atenFunction("at::native_zero_", self.toATensor()).to(void); self

proc zero_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.}

proc zero_inplace*(self: Tensor): Tensor {.inline, discardable.}

proc sub*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc sub*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc sub_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sub_", self.toATensor(), other.toATensor(), alpha).to(void); self

proc sub_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sub_", other.toATensor(), alpha).to(void); self

proc sub*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc sub*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc sub_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sub_", self.toATensor(), other, alpha).to(void); self

proc sub_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sub_", other, alpha).to(void); self

proc rsub*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc rsub*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc rsub*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc rsub*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc s_native_addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("s_native_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc s_native_addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::s_native_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(ATensor).newTensor()

proc s_native_addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("s_native_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(void); self

proc s_native_addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::s_native_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(void); self

proc sparse_addmm_impl*(ty: TensorType; self: Tensor; sparse: Tensor; dense: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_addmm", self.toATensor(), sparse.toATensor(), dense.toATensor(), beta, alpha).to(ATensor).newTensor()

proc sparse_addmm_impl*(self: Tensor; sparse: Tensor; dense: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_addmm", self.toATensor(), sparse.toATensor(), dense.toATensor(), beta, alpha).to(ATensor).newTensor()

proc addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).to(void); self

proc addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("addmm_", mat1.toATensor(), mat2.toATensor(), beta, alpha).to(void); self

proc sparse_coo_tensor*(ty: TensorType; size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("sparse_coo_tensor", size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor*(size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::sparse_coo_tensor", size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("sparse_coo_tensor", indices.toATensor(), values.toATensor(), options).to(ATensor).newTensor()

proc sparse_coo_tensor*(indices: Tensor; values: Tensor; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::sparse_coo_tensor", indices.toATensor(), values.toATensor(), options).to(ATensor).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("sparse_coo_tensor", indices.toATensor(), values.toATensor(), size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor*(indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::sparse_coo_tensor", indices.toATensor(), values.toATensor(), size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_impl*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_coo_tensor_unsafe", indices.toATensor(), values.toATensor(), size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_impl*(indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_coo_tensor_unsafe", indices.toATensor(), values.toATensor(), size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor_with_dims_impl*(ty: TensorType; sparse_dim: int; dense_dim: int; size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_coo_tensor_with_dims", sparse_dim, dense_dim, size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor_with_dims_impl*(sparse_dim: int; dense_dim: int; size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_coo_tensor_with_dims", sparse_dim, dense_dim, size.toAIntList(), options).to(ATensor).newTensor()

proc sparse_coo_tensor_with_dims_and_tensors_impl*(ty: TensorType; sparse_dim: int; dense_dim: int; size: openarray[int]; indices: Tensor; values: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: ty[].atenMethod("_sparse_coo_tensor_with_dims_and_tensors", sparse_dim, dense_dim, size.toAIntList(), indices.toATensor(), values.toATensor(), options).to(ATensor).newTensor()

proc sparse_coo_tensor_with_dims_and_tensors_impl*(sparse_dim: int; dense_dim: int; size: openarray[int]; indices: Tensor; values: Tensor; options: TensorOptions): Tensor {.inline.} = 
  check: atenFunction("at::_sparse_coo_tensor_with_dims_and_tensors", sparse_dim, dense_dim, size.toAIntList(), indices.toATensor(), values.toATensor(), options).to(ATensor).newTensor()

proc sparse_resize_inplace*(ty: TensorType; self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sparse_resize_", self.toATensor(), size.toAIntList(), sparse_dim, dense_dim).to(void); self

proc sparse_resize_inplace*(self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sparse_resize_", size.toAIntList(), sparse_dim, dense_dim).to(void); self

proc sparse_resize_and_clear_inplace*(ty: TensorType; self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sparse_resize_and_clear_", self.toATensor(), size.toAIntList(), sparse_dim, dense_dim).to(void); self

proc sparse_resize_and_clear_inplace*(self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sparse_resize_and_clear_", size.toAIntList(), sparse_dim, dense_dim).to(void); self

proc sparse_mask*(ty: TensorType; self: Tensor; mask: ASparseTensorRef): Tensor {.inline.} = 
  check: ty[].atenMethod("sparse_mask", self.toATensor(), mask).to(ATensor).newTensor()

proc sparse_mask*(self: Tensor; mask: ASparseTensorRef): Tensor {.inline.} = 
  check: self.tensor.atenMethod("sparse_mask", mask).to(ATensor).newTensor()

proc to_dense*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("to_dense", self.toATensor()).to(ATensor).newTensor()

proc to_dense*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("to_dense").to(ATensor).newTensor()

proc sparse_dim*(ty: TensorType; self: Tensor): int {.inline.} = 
  check: ty[].atenMethod("sparse_dim", self.toATensor()).to(int)

proc sparse_dim*(self: Tensor): int {.inline.} = 
  check: self.tensor.atenMethod("sparse_dim").to(int)

proc dimI_impl*(ty: TensorType; self: Tensor): int {.inline.} = 
  check: ty[].atenMethod("_dimI", self.toATensor()).to(int)

proc dimI_impl*(self: Tensor): int {.inline.} = 
  check: self.tensor.atenMethod("_dimI").to(int)

proc dense_dim*(ty: TensorType; self: Tensor): int {.inline.} = 
  check: ty[].atenMethod("dense_dim", self.toATensor()).to(int)

proc dense_dim*(self: Tensor): int {.inline.} = 
  check: self.tensor.atenMethod("dense_dim").to(int)

proc dimV_impl*(ty: TensorType; self: Tensor): int {.inline.} = 
  check: ty[].atenMethod("_dimV", self.toATensor()).to(int)

proc dimV_impl*(self: Tensor): int {.inline.} = 
  check: self.tensor.atenMethod("_dimV").to(int)

proc nnz_impl*(ty: TensorType; self: Tensor): int {.inline.} = 
  check: ty[].atenMethod("_nnz", self.toATensor()).to(int)

proc nnz_impl*(self: Tensor): int {.inline.} = 
  check: self.tensor.atenMethod("_nnz").to(int)

proc coalesce*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc coalesce*(self: Tensor): Tensor {.inline.}

proc is_coalesced*(ty: TensorType; self: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_coalesced", self.toATensor()).to(bool)

proc is_coalesced*(self: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_coalesced").to(bool)

proc indices_impl*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc indices_impl*(self: Tensor): Tensor {.inline.}

proc values_impl*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc values_impl*(self: Tensor): Tensor {.inline.}

proc coalesced_impl_inplace*(ty: TensorType; self: Tensor; coalesced: bool): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("_coalesced_", self.toATensor(), coalesced).to(void); self

proc coalesced_impl_inplace*(self: Tensor; coalesced: bool): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("_coalesced_", coalesced).to(void); self

proc indices*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc indices*(self: Tensor): Tensor {.inline.}

proc values*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc values*(self: Tensor): Tensor {.inline.}

proc hspmm*(ty: TensorType; mat1: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("hspmm", mat1.toATensor(), mat2.toATensor()).to(ATensor).newTensor()

proc hspmm*(mat1: Tensor; mat2: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::hspmm", mat1.toATensor(), mat2.toATensor()).to(ATensor).newTensor()

proc copy_sparse_to_sparse_inplace*(ty: TensorType; self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("copy_sparse_to_sparse_", self.toATensor(), src.toATensor(), non_blocking).to(void); self

proc copy_sparse_to_sparse_inplace*(self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  check: atenFunction("at::copy_sparse_to_sparse_", self.toATensor(), src.toATensor(), non_blocking).to(void); self

proc numel*(ty: TensorType; self: Tensor): int {.inline.} = 
  check: ty[].atenMethod("numel", self.toATensor()).to(int)

proc numel*(self: Tensor): int {.inline.} = 
  check: self.tensor.atenMethod("numel").to(int)

proc unbind*(ty: TensorType; self: Tensor; dim: int = 0): TensorList {.inline.} = 
  check: ty[].atenMethod("unbind", self.toATensor(), dim).to(ATensors).newTensors()

proc unbind*(self: Tensor; dim: int = 0): TensorList {.inline.} = 
  check: self.tensor.atenMethod("unbind", dim).to(ATensors).newTensors()

proc to_sparse*(ty: TensorType; self: Tensor; sparse_dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("to_sparse", self.toATensor(), sparse_dim).to(ATensor).newTensor()

proc to_sparse*(self: Tensor; sparse_dim: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("to_sparse", sparse_dim).to(ATensor).newTensor()

proc to_sparse*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("to_sparse", self.toATensor()).to(ATensor).newTensor()

proc to_sparse*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("to_sparse").to(ATensor).newTensor()

proc to_special*(ty: TensorType; self: Tensor; options: TensorOptions; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("to", self.toATensor(), options, non_blocking, copy).to(ATensor).newTensor()

proc to_special*(self: Tensor; options: TensorOptions; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("to", options, non_blocking, copy).to(ATensor).newTensor()

proc to_special*(ty: TensorType; self: Tensor; dtype: ScalarType; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("to", self.toATensor(), dtype, non_blocking, copy).to(ATensor).newTensor()

proc to_special*(self: Tensor; dtype: ScalarType; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("to", dtype, non_blocking, copy).to(ATensor).newTensor()

proc to_special*(ty: TensorType; self: Tensor; other: Tensor; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("to", self.toATensor(), other.toATensor(), non_blocking, copy).to(ATensor).newTensor()

proc to_special*(self: Tensor; other: Tensor; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("to", other.toATensor(), non_blocking, copy).to(ATensor).newTensor()

proc meshgrid*(ty: TensorType; tensors: openarray[Tensor]): TensorList {.inline.} = 
  check: ty[].atenMethod("meshgrid", tensors.toATensors()).to(ATensors).newTensors()

proc meshgrid*(tensors: openarray[Tensor]): TensorList {.inline.} = 
  check: atenFunction("at::meshgrid", tensors.toATensors()).to(ATensors).newTensors()

proc item*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("item", self.toATensor()).to(float)

proc item*(self: Tensor): float {.inline.} = 
  check: self.tensor.atenMethod("item").to(float)

proc local_scalar_dense_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  check: ty[].atenMethod("_local_scalar_dense", self.toATensor()).to(float)

proc local_scalar_dense_impl*(self: Tensor): float {.inline.} = 
  check: atenFunction("at::_local_scalar_dense", self.toATensor()).to(float)

proc thnn_fused_lstm_cell_impl*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc thnn_fused_lstm_cell_impl*(input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc thnn_fused_lstm_cell_backward_impl*(ty: TensorType; grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_fused_lstm_cell_backward", grad_hy.toATensor(), grad_cy.toATensor(), cx.toATensor(), cy.toATensor(), workspace.toATensor(), has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_backward_impl*(grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_fused_lstm_cell_backward", grad_hy.toATensor(), grad_cy.toATensor(), cx.toATensor(), cy.toATensor(), workspace.toATensor(), has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_impl*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc thnn_fused_gru_cell_impl*(input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc thnn_fused_gru_cell_backward_impl*(ty: TensorType; grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  check: ty[].atenMethod("_thnn_fused_gru_cell_backward", grad_hy.toATensor(), workspace.toATensor(), has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_backward_impl*(grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  check: atenFunction("at::_thnn_fused_gru_cell_backward", grad_hy.toATensor(), workspace.toATensor(), has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("lstm", input.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::lstm", input.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("lstm", data.toATensor(), batch_sizes.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(data: Tensor; batch_sizes: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: atenFunction("at::lstm", data.toATensor(), batch_sizes.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("gru", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::gru", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("gru", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::gru", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("rnn_tanh", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::rnn_tanh", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("rnn_tanh", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::rnn_tanh", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("rnn_relu", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::rnn_relu", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("rnn_relu", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::rnn_relu", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("lstm_cell", input.toATensor(), hx.toATensors(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell*(input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::lstm_cell", input.toATensor(), hx.toATensors(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("rnn_tanh_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).to(ATensor).newTensor()

proc rnn_tanh_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::rnn_tanh_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).to(ATensor).newTensor()

proc rnn_relu_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("rnn_relu_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).to(ATensor).newTensor()

proc rnn_relu_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::rnn_relu_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).to(ATensor).newTensor()

proc pack_padded_sequence_impl*(ty: TensorType; input: Tensor; lengths: Tensor; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc pack_padded_sequence_impl*(input: Tensor; lengths: Tensor; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc pack_padded_sequence_backward_impl*(ty: TensorType; grad: Tensor; input_size: openarray[int]; batch_sizes: Tensor; batch_first: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_pack_padded_sequence_backward", grad.toATensor(), input_size.toAIntList(), batch_sizes.toATensor(), batch_first).to(ATensor).newTensor()

proc pack_padded_sequence_backward_impl*(grad: Tensor; input_size: openarray[int]; batch_sizes: Tensor; batch_first: bool): Tensor {.inline.} = 
  check: atenFunction("at::_pack_padded_sequence_backward", grad.toATensor(), input_size.toAIntList(), batch_sizes.toATensor(), batch_first).to(ATensor).newTensor()

proc pad_packed_sequence_impl*(ty: TensorType; data: Tensor; batch_sizes: Tensor; batch_first: bool; padding_value: float; total_length: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("_pad_packed_sequence", data.toATensor(), batch_sizes.toATensor(), batch_first, padding_value, total_length).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc pad_packed_sequence_impl*(data: Tensor; batch_sizes: Tensor; batch_first: bool; padding_value: float; total_length: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: atenFunction("at::_pad_packed_sequence", data.toATensor(), batch_sizes.toATensor(), batch_first, padding_value, total_length).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc data_ptr*(ty: TensorType; self: Tensor): pointer {.inline.} = 
  check: ty[].atenMethod("data_ptr", self.toATensor()).to(pointer)

proc data_ptr*(self: Tensor): pointer {.inline.} = 
  check: self.tensor.atenMethod("data_ptr").to(pointer)

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("set_", self.toATensor(), source).to(void); self

proc set_inplace*(self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("set_", source).to(void); self

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("set_", self.toATensor(), source, storage_offset, size.toAIntList(), stride.toAIntList()).to(void); self

proc set_inplace*(self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("set_", source, storage_offset, size.toAIntList(), stride.toAIntList()).to(void); self

proc set_inplace*(ty: TensorType; self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("set_", self.toATensor(), source.toATensor()).to(void); self

proc set_inplace*(self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("set_", source.toATensor()).to(void); self

proc set_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("set_", self.toATensor()).to(void); self

proc set_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("set_").to(void); self

proc is_set_to*(ty: TensorType; self: Tensor; tensor: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("is_set_to", self.toATensor(), tensor.toATensor()).to(bool)

proc is_set_to*(self: Tensor; tensor: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("is_set_to", tensor.toATensor()).to(bool)

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.}

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.}

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc masked_scatter_inplace*(ty: TensorType; self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("masked_scatter_", self.toATensor(), mask.toATensor(), source.toATensor()).to(void); self

proc masked_scatter_inplace*(self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("masked_scatter_", mask.toATensor(), source.toATensor()).to(void); self

proc view*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.}

proc view*(self: Tensor; size: openarray[int]): Tensor {.inline.}

proc put_inplace*(ty: TensorType; self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc put_inplace*(self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc index_add_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_add_inplace*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_fill_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.}

proc index_fill_inplace*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.}

proc index_fill_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc index_fill_inplace*(self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc scatter_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc scatter_inplace*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc scatter_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.}

proc scatter_inplace*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.}

proc scatter_add_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc scatter_add_inplace*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc lt_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc lt_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc lt_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc lt_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc gt_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc gt_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc gt_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc gt_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc le_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc le_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc le_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc le_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ge_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc ge_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc ge_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ge_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc eq_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc eq_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc eq_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc eq_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ne_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc ne_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc ne_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ne_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc and_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("__and__", self.toATensor(), other).to(ATensor).newTensor()

proc and_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__and__", other).to(ATensor).newTensor()

proc and_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("__and__", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc and_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__and__", other.toATensor()).to(ATensor).newTensor()

proc iand_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__iand__", self.toATensor(), other).to(void); self

proc iand_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__iand__", other).to(void); self

proc iand_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__iand__", self.toATensor(), other.toATensor()).to(void); self

proc iand_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__iand__", other.toATensor()).to(void); self

proc or_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("__or__", self.toATensor(), other).to(ATensor).newTensor()

proc or_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__or__", other).to(ATensor).newTensor()

proc or_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("__or__", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc or_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__or__", other.toATensor()).to(ATensor).newTensor()

proc ior_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__ior__", self.toATensor(), other).to(void); self

proc ior_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__ior__", other).to(void); self

proc ior_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__ior__", self.toATensor(), other.toATensor()).to(void); self

proc ior_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__ior__", other.toATensor()).to(void); self

proc xor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("__xor__", self.toATensor(), other).to(ATensor).newTensor()

proc xor_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__xor__", other).to(ATensor).newTensor()

proc xor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("__xor__", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc xor_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__xor__", other.toATensor()).to(ATensor).newTensor()

proc ixor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__ixor__", self.toATensor(), other).to(void); self

proc ixor_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__ixor__", other).to(void); self

proc ixor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__ixor__", self.toATensor(), other.toATensor()).to(void); self

proc ixor_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__ixor__", other.toATensor()).to(void); self

proc lshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("__lshift__", self.toATensor(), other).to(ATensor).newTensor()

proc lshift_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__lshift__", other).to(ATensor).newTensor()

proc lshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("__lshift__", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc lshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__lshift__", other.toATensor()).to(ATensor).newTensor()

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__ilshift__", self.toATensor(), other).to(void); self

proc ilshift_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__ilshift__", other).to(void); self

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__ilshift__", self.toATensor(), other.toATensor()).to(void); self

proc ilshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__ilshift__", other.toATensor()).to(void); self

proc rshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("__rshift__", self.toATensor(), other).to(ATensor).newTensor()

proc rshift_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__rshift__", other).to(ATensor).newTensor()

proc rshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("__rshift__", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc rshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("__rshift__", other.toATensor()).to(ATensor).newTensor()

proc irshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__irshift__", self.toATensor(), other).to(void); self

proc irshift_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__irshift__", other).to(void); self

proc irshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("__irshift__", self.toATensor(), other.toATensor()).to(void); self

proc irshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("__irshift__", other.toATensor()).to(void); self

proc lgamma_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("lgamma_", self.toATensor()).to(void); self

proc lgamma_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("lgamma_").to(void); self

proc atan2_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("atan2_", self.toATensor(), other.toATensor()).to(void); self

proc atan2_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("atan2_", other.toATensor()).to(void); self

proc tril_inplace*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("tril_", self.toATensor(), diagonal).to(void); self

proc tril_inplace*(self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("tril_", diagonal).to(void); self

proc triu_inplace*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("triu_", self.toATensor(), diagonal).to(void); self

proc triu_inplace*(self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("triu_", diagonal).to(void); self

proc digamma_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("digamma_", self.toATensor()).to(void); self

proc digamma_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("digamma_").to(void); self

proc polygamma_inplace*(ty: TensorType; self: Tensor; n: int): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("polygamma_", self.toATensor(), n).to(void); self

proc polygamma_inplace*(self: Tensor; n: int): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("polygamma_", n).to(void); self

proc erfinv_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("erfinv_", self.toATensor()).to(void); self

proc erfinv_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("erfinv_").to(void); self

proc frac_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("frac_", self.toATensor()).to(void); self

proc frac_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("frac_").to(void); self

proc renorm_inplace*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("renorm_", self.toATensor(), p, dim, maxnorm).to(void); self

proc renorm_inplace*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("renorm_", p, dim, maxnorm).to(void); self

proc reciprocal_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("reciprocal_", self.toATensor()).to(void); self

proc reciprocal_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("reciprocal_").to(void); self

proc neg_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("neg_", self.toATensor()).to(void); self

proc neg_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("neg_").to(void); self

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("pow_", self.toATensor(), exponent).to(void); self

proc pow_inplace*(self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("pow_", exponent).to(void); self

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("pow_", self.toATensor(), exponent.toATensor()).to(void); self

proc pow_inplace*(self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("pow_", exponent.toATensor()).to(void); self

proc lerp_inplace*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("lerp_", self.toATensor(), end_special.toATensor(), weight).to(void); self

proc lerp_inplace*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("lerp_", end_special.toATensor(), weight).to(void); self

proc sign_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("sign_", self.toATensor()).to(void); self

proc sign_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("sign_").to(void); self

proc fmod_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("fmod_", self.toATensor(), other).to(void); self

proc fmod_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("fmod_", other).to(void); self

proc fmod_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("fmod_", self.toATensor(), other.toATensor()).to(void); self

proc fmod_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("fmod_", other.toATensor()).to(void); self

proc remainder_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("remainder_", self.toATensor(), other).to(void); self

proc remainder_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("remainder_", other).to(void); self

proc remainder_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("remainder_", self.toATensor(), other.toATensor()).to(void); self

proc remainder_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("remainder_", other.toATensor()).to(void); self

proc addbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("addbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc addbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("addbmm_", batch1.toATensor(), batch2.toATensor(), beta, alpha).to(void); self

proc addbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addcmul_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("addcmul_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc addcmul_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("addcmul_", tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc addcdiv_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("addcdiv_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc addcdiv_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  check: self.tensor.atenMethod("addcdiv_", tensor1.toATensor(), tensor2.toATensor(), value).to(void); self

proc random_inplace*(ty: TensorType; self: Tensor; from_special: int; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(self: Tensor; from_special: int; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(ty: TensorType; self: Tensor; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(self: Tensor; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc uniform_inplace*(ty: TensorType; self: Tensor; from_special: float64 = 0; to_special: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc uniform_inplace*(self: Tensor; from_special: float64 = 0; to_special: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc normal_inplace*(ty: TensorType; self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc normal_inplace*(self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc cauchy_inplace*(ty: TensorType; self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc cauchy_inplace*(self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc log_normal_inplace*(ty: TensorType; self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.}

proc log_normal_inplace*(self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.}

proc exponential_inplace*(ty: TensorType; self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc exponential_inplace*(self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc geometric_inplace*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.}

proc geometric_inplace*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.}

proc diag*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("diag", self.toATensor(), diagonal).to(ATensor).newTensor()

proc diag*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  check: self.tensor.atenMethod("diag", diagonal).to(ATensor).newTensor()

proc cross*(ty: TensorType; self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.}

proc cross*(self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.}

proc triu*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc triu*(self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc tril*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc tril*(self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc trace*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("trace", self.toATensor()).to(ATensor).newTensor()

proc trace*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("trace").to(ATensor).newTensor()

proc ne*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("ne", self.toATensor(), other).to(ATensor).newTensor()

proc ne*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("ne", other).to(ATensor).newTensor()

proc ne*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("ne", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc ne*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("ne", other.toATensor()).to(ATensor).newTensor()

proc eq*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("eq", self.toATensor(), other).to(ATensor).newTensor()

proc eq*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("eq", other).to(ATensor).newTensor()

proc eq*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("eq", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc eq*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("eq", other.toATensor()).to(ATensor).newTensor()

proc ge*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("ge", self.toATensor(), other).to(ATensor).newTensor()

proc ge*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("ge", other).to(ATensor).newTensor()

proc ge*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("ge", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc ge*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("ge", other.toATensor()).to(ATensor).newTensor()

proc le*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("le", self.toATensor(), other).to(ATensor).newTensor()

proc le*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("le", other).to(ATensor).newTensor()

proc le*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("le", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc le*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("le", other.toATensor()).to(ATensor).newTensor()

proc gt*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("gt", self.toATensor(), other).to(ATensor).newTensor()

proc gt*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("gt", other).to(ATensor).newTensor()

proc gt*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("gt", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc gt*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("gt", other.toATensor()).to(ATensor).newTensor()

proc lt*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  check: ty[].atenMethod("lt", self.toATensor(), other).to(ATensor).newTensor()

proc lt*(self: Tensor; other: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("lt", other).to(ATensor).newTensor()

proc lt*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("lt", self.toATensor(), other.toATensor()).to(ATensor).newTensor()

proc lt*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("lt", other.toATensor()).to(ATensor).newTensor()

proc take*(ty: TensorType; self: Tensor; index: Tensor): Tensor {.inline.}

proc take*(self: Tensor; index: Tensor): Tensor {.inline.}

proc index_select*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc index_select*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc masked_select*(ty: TensorType; self: Tensor; mask: Tensor): Tensor {.inline.}

proc masked_select*(self: Tensor; mask: Tensor): Tensor {.inline.}

proc nonzero*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("nonzero", self.toATensor()).to(ATensor).newTensor()

proc nonzero*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("nonzero").to(ATensor).newTensor()

proc gather*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc gather*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc addcmul*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcmul*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcdiv*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcdiv*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc gels*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("gels", self.toATensor(), A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gels*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("gels", A.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs*(ty: TensorType; self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("trtrs", self.toATensor(), A.toATensor(), upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs*(self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("trtrs", A.toATensor(), upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc symeig*(ty: TensorType; self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc symeig*(self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc eig*(ty: TensorType; self: Tensor; eigenvectors: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("eig", self.toATensor(), eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc eig*(self: Tensor; eigenvectors: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("eig", eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc svd*(ty: TensorType; self: Tensor; some: bool = true; compute_uv: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("svd", self.toATensor(), some, compute_uv).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc svd*(self: Tensor; some: bool = true; compute_uv: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("svd", some, compute_uv).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cholesky*(ty: TensorType; self: Tensor; upper: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("cholesky", self.toATensor(), upper).to(ATensor).newTensor()

proc cholesky*(self: Tensor; upper: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("cholesky", upper).to(ATensor).newTensor()

proc cholesky_helper_impl*(ty: TensorType; self: Tensor; upper: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_cholesky_helper", self.toATensor(), upper).to(ATensor).newTensor()

proc cholesky_helper_impl*(self: Tensor; upper: bool): Tensor {.inline.} = 
  check: atenFunction("at::_cholesky_helper", self.toATensor(), upper).to(ATensor).newTensor()

proc potrs*(ty: TensorType; self: Tensor; input2: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("potrs", self.toATensor(), input2.toATensor(), upper).to(ATensor).newTensor()

proc potrs*(self: Tensor; input2: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: self.tensor.atenMethod("potrs", input2.toATensor(), upper).to(ATensor).newTensor()

proc potrs_helper_impl*(ty: TensorType; self: Tensor; A: Tensor; upper: bool): Tensor {.inline.} = 
  check: ty[].atenMethod("_potrs_helper", self.toATensor(), A.toATensor(), upper).to(ATensor).newTensor()

proc potrs_helper_impl*(self: Tensor; A: Tensor; upper: bool): Tensor {.inline.} = 
  check: atenFunction("at::_potrs_helper", self.toATensor(), A.toATensor(), upper).to(ATensor).newTensor()

proc potri*(ty: TensorType; self: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: ty[].atenMethod("potri", self.toATensor(), upper).to(ATensor).newTensor()

proc potri*(self: Tensor; upper: bool = true): Tensor {.inline.} = 
  check: self.tensor.atenMethod("potri", upper).to(ATensor).newTensor()

proc pstrf*(ty: TensorType; self: Tensor; upper: bool = true; tol: float = -1): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("pstrf", self.toATensor(), upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc pstrf*(self: Tensor; upper: bool = true; tol: float = -1): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("pstrf", upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("qr", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("qr").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("geqrf", self.toATensor()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("geqrf").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc orgqr*(ty: TensorType; self: Tensor; input2: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("orgqr", self.toATensor(), input2.toATensor()).to(ATensor).newTensor()

proc orgqr*(self: Tensor; input2: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("orgqr", input2.toATensor()).to(ATensor).newTensor()

proc ormqr*(ty: TensorType; self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  check: ty[].atenMethod("ormqr", self.toATensor(), input2.toATensor(), input3.toATensor(), left, transpose).to(ATensor).newTensor()

proc ormqr*(self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  check: self.tensor.atenMethod("ormqr", input2.toATensor(), input3.toATensor(), left, transpose).to(ATensor).newTensor()

proc btrifact*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("btrifact", self.toATensor(), pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact*(self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("btrifact", pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: ty[].atenMethod("btrifact_with_info", self.toATensor(), pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info*(self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("btrifact_with_info", pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrisolve*(ty: TensorType; self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("btrisolve", self.toATensor(), LU_data.toATensor(), LU_pivots.toATensor()).to(ATensor).newTensor()

proc btrisolve*(self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("btrisolve", LU_data.toATensor(), LU_pivots.toATensor()).to(ATensor).newTensor()

proc multinomial*(ty: TensorType; self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  check: ty[].atenMethod("multinomial", self.toATensor(), num_samples, replacement, generator).to(ATensor).newTensor()

proc multinomial*(self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  check: self.tensor.atenMethod("multinomial", num_samples, replacement, generator).to(ATensor).newTensor()

proc lgamma*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc lgamma*(self: Tensor): Tensor {.inline.}

proc digamma*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc digamma*(self: Tensor): Tensor {.inline.}

proc polygamma*(ty: TensorType; n: int; self: Tensor): Tensor {.inline.}

proc polygamma*(n: int; self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("polygamma", n).to(ATensor).newTensor()

proc erfinv*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erfinv*(self: Tensor): Tensor {.inline.}

proc frac*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc frac*(self: Tensor): Tensor {.inline.}

proc dist*(ty: TensorType; self: Tensor; other: Tensor; p: float = 2): Tensor {.inline.} = 
  check: ty[].atenMethod("dist", self.toATensor(), other.toATensor(), p).to(ATensor).newTensor()

proc dist*(self: Tensor; other: Tensor; p: float = 2): Tensor {.inline.} = 
  check: self.tensor.atenMethod("dist", other.toATensor(), p).to(ATensor).newTensor()

proc reciprocal*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc reciprocal*(self: Tensor): Tensor {.inline.}

proc neg*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc neg*(self: Tensor): Tensor {.inline.}

proc atan2*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc atan2*(self: Tensor; other: Tensor): Tensor {.inline.}

proc lerp*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  check: ty[].atenMethod("lerp", self.toATensor(), end_special.toATensor(), weight).to(ATensor).newTensor()

proc lerp*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("lerp", end_special.toATensor(), weight).to(ATensor).newTensor()

proc histc*(ty: TensorType; self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  check: ty[].atenMethod("histc", self.toATensor(), bins, min, max).to(ATensor).newTensor()

proc histc*(self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  check: self.tensor.atenMethod("histc", bins, min, max).to(ATensor).newTensor()

proc sign*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sign*(self: Tensor): Tensor {.inline.}

proc fmod*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc fmod*(self: Tensor; other: float): Tensor {.inline.}

proc fmod*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc fmod*(self: Tensor; other: Tensor): Tensor {.inline.}

proc remainder*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc remainder*(self: Tensor; other: float): Tensor {.inline.}

proc remainder*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc remainder*(self: Tensor; other: Tensor): Tensor {.inline.}

proc min*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc min*(self: Tensor; other: Tensor): Tensor {.inline.}

proc min*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("min", self.toATensor()).to(ATensor).newTensor()

proc min*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("min").to(ATensor).newTensor()

proc max*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc max*(self: Tensor; other: Tensor): Tensor {.inline.}

proc max*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("max", self.toATensor()).to(ATensor).newTensor()

proc max*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("max").to(ATensor).newTensor()

proc median*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("median", self.toATensor()).to(ATensor).newTensor()

proc median*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("median").to(ATensor).newTensor()

proc sort*(ty: TensorType; self: Tensor; dim: int = -1; descending: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("sort", self.toATensor(), dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc sort*(self: Tensor; dim: int = -1; descending: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("sort", dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk*(ty: TensorType; self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: ty[].atenMethod("topk", self.toATensor(), k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk*(self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  check: self.tensor.atenMethod("topk", k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc all*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("all", self.toATensor()).to(ATensor).newTensor()

proc all*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("all").to(ATensor).newTensor()

proc any*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("any", self.toATensor()).to(ATensor).newTensor()

proc any*(self: Tensor): Tensor {.inline.} = 
  check: self.tensor.atenMethod("any").to(ATensor).newTensor()

proc renorm*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  check: ty[].atenMethod("renorm", self.toATensor(), p, dim, maxnorm).to(ATensor).newTensor()

proc renorm*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  check: self.tensor.atenMethod("renorm", p, dim, maxnorm).to(ATensor).newTensor()

proc unfold*(ty: TensorType; self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  check: ty[].atenMethod("unfold", self.toATensor(), dimension, size, step).to(ATensor).newTensor()

proc unfold*(self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  check: self.tensor.atenMethod("unfold", dimension, size, step).to(ATensor).newTensor()

proc equal*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  check: ty[].atenMethod("equal", self.toATensor(), other.toATensor()).to(bool)

proc equal*(self: Tensor; other: Tensor): bool {.inline.} = 
  check: self.tensor.atenMethod("equal", other.toATensor()).to(bool)

proc pow*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline.}

proc pow*(self: Tensor; exponent: Tensor): Tensor {.inline.}

proc pow*(ty: TensorType; self: float; exponent: Tensor): Tensor {.inline.}

proc pow*(self: float; exponent: Tensor): Tensor {.inline.}

proc normal*(ty: TensorType; mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.}

proc normal*(mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.}

proc normal*(ty: TensorType; mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.}

proc normal*(mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.}

proc normal*(ty: TensorType; mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.}

proc normal*(mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.}

proc alias*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc alias*(self: Tensor): Tensor {.inline.}

proc dirichlet_grad_impl*(ty: TensorType; x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).to(ATensor).newTensor()

proc dirichlet_grad_impl*(x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).to(ATensor).newTensor()

proc binary_cross_entropy*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.}

proc binary_cross_entropy*(self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.}

proc binary_cross_entropy_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).to(ATensor).newTensor()

proc binary_cross_entropy_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).to(ATensor).newTensor()

proc mse_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc mse_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc mse_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc mse_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc l1_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc multi_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; p: float = 1; margin: float = 1; weight: Tensor; reduction: int): Tensor {.inline.}

proc multi_margin_loss*(self: Tensor; target: Tensor; p: float = 1; margin: float = 1; weight: Tensor; reduction: int): Tensor {.inline.}

proc multi_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).to(ATensor).newTensor()

proc multi_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).to(ATensor).newTensor()

proc multilabel_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("multilabel_margin_loss", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc multilabel_margin_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::multilabel_margin_loss", self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc multilabel_margin_loss_forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.}

proc multilabel_margin_loss_forward*(self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.}

proc multilabel_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).to(ATensor).newTensor()

proc multilabel_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).to(ATensor).newTensor()

proc nll_loss*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  check: ty[].atenMethod("nll_loss", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(ATensor).newTensor()

proc nll_loss*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  check: atenFunction("at::nll_loss", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(ATensor).newTensor()

proc nll_loss_forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss_forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc nll_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc nll_loss2d*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  check: ty[].atenMethod("nll_loss2d", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(ATensor).newTensor()

proc nll_loss2d*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  check: atenFunction("at::nll_loss2d", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).to(ATensor).newTensor()

proc nll_loss2d_forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss2d_forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc nll_loss2d_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc smooth_l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc smooth_l1_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc smooth_l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc smooth_l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc soft_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc soft_margin_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc soft_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: ty[].atenMethod("soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc soft_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  check: atenFunction("at::soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).to(ATensor).newTensor()

proc elu*(ty: TensorType; self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline.}

proc elu*(self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline.}

proc elu_backward*(ty: TensorType; grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).to(ATensor).newTensor()

proc elu_backward*(grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).to(ATensor).newTensor()

proc elu_inplace*(ty: TensorType; self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline, discardable.} = 
  check: ty[].atenMethod("elu_", self.toATensor(), alpha, scale, input_scale).to(void); self

proc elu_inplace*(self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline, discardable.} = 
  check: atenFunction("at::elu_", self.toATensor(), alpha, scale, input_scale).to(void); self

proc glu*(ty: TensorType; self: Tensor; dim: int = -1): Tensor {.inline.}

proc glu*(self: Tensor; dim: int = -1): Tensor {.inline.}

proc glu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  check: ty[].atenMethod("glu_backward", grad_output.toATensor(), self.toATensor(), dim).to(ATensor).newTensor()

proc glu_backward*(grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  check: atenFunction("at::glu_backward", grad_output.toATensor(), self.toATensor(), dim).to(ATensor).newTensor()

proc hardtanh*(ty: TensorType; self: Tensor; min_val: float = -1; max_val: float = 1): Tensor {.inline.}

proc hardtanh*(self: Tensor; min_val: float = -1; max_val: float = 1): Tensor {.inline.}

proc hardtanh_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.}

proc hardtanh_backward*(grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.}

proc hardtanh_inplace*(ty: TensorType; self: Tensor; min_val: float = -1; max_val: float = 1): Tensor {.inline, discardable.}

proc hardtanh_inplace*(self: Tensor; min_val: float = -1; max_val: float = 1): Tensor {.inline, discardable.}

proc leaky_relu*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu*(self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu_backward*(grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu_inplace*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline, discardable.}

proc leaky_relu_inplace*(self: Tensor; negative_slope: float): Tensor {.inline, discardable.}

proc log_sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("log_sigmoid", self.toATensor()).to(ATensor).newTensor()

proc log_sigmoid*(self: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::log_sigmoid", self.toATensor()).to(ATensor).newTensor()

proc log_sigmoid_forward*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.}

proc log_sigmoid_forward*(self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.}

proc log_sigmoid_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).to(ATensor).newTensor()

proc log_sigmoid_backward*(grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).to(ATensor).newTensor()

proc rrelu_with_noise*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.}

proc rrelu_with_noise*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.}

proc rrelu_with_noise_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.}

proc rrelu_with_noise_backward*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.}

proc rrelu_with_noise_inplace*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.}

proc rrelu_with_noise_inplace*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.}

proc softplus*(ty: TensorType; self: Tensor; beta: float = 1; threshold: float = 20): Tensor {.inline.}

proc softplus*(self: Tensor; beta: float = 1; threshold: float = 20): Tensor {.inline.}

proc softplus_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).to(ATensor).newTensor()

proc softplus_backward*(grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).to(ATensor).newTensor()

proc softshrink*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.}

proc softshrink*(self: Tensor; lambd: float): Tensor {.inline.}

proc softshrink_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc softshrink_backward*(grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc adaptive_avg_pool2d*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc adaptive_avg_pool2d*(self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc adaptive_avg_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_avg_pool2d_backward*(grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_avg_pool3d*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc adaptive_avg_pool3d*(self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc adaptive_avg_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_avg_pool3d_backward*(grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_max_pool2d*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool2d*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc adaptive_max_pool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc adaptive_max_pool3d*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool3d*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc adaptive_max_pool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).to(ATensor).newTensor()

proc avg_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor {.inline.}

proc avg_pool2d*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor {.inline.}

proc avg_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool2d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool3d*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor {.inline.}

proc avg_pool3d*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor {.inline.}

proc avg_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool3d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc fractional_max_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.}

proc fractional_max_pool2d*(self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.}

proc fractional_max_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("fractional_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).to(ATensor).newTensor()

proc fractional_max_pool2d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::fractional_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).to(ATensor).newTensor()

proc max_pool2d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool2d_with_indices*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool2d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc max_pool2d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc max_pool3d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool3d_with_indices*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool3d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: ty[].atenMethod("max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc max_pool3d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  check: atenFunction("at::max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).to(ATensor).newTensor()

proc max_unpool2d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool2d*(self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool3d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.}

proc max_unpool3d*(self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.}

proc max_unpool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  check: ty[].atenMethod("max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc max_unpool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  check: atenFunction("at::max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc reflection_pad1d*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc reflection_pad1d*(self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc reflection_pad1d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc reflection_pad1d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc reflection_pad2d*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc reflection_pad2d*(self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc reflection_pad2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc reflection_pad2d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad1d*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad1d*(self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad1d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad1d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad2d*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad2d*(self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad2d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad3d*(ty: TensorType; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad3d*(self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc replication_pad3d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[int]): Tensor {.inline.}

proc upsample_linear1d*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_linear1d*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_linear1d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_linear1d_backward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d_backward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d_backward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_nearest1d*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest1d*(self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest1d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest1d_backward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest2d*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest2d*(self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest2d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest2d_backward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest3d*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest3d*(self: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest3d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.}

proc upsample_nearest3d_backward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.}

proc sigmoid_backward*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc sigmoid_backward*(grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc tanh_backward*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc tanh_backward*(grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc thnn_conv_transpose2d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_transpose2d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_transpose2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv_transpose3d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv_transpose3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv2d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.}

proc thnn_conv_depthwise2d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.}

proc thnn_conv_depthwise2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  check: ty[].atenMethod("thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  check: atenFunction("at::thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv3d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated2d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated3d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: ty[].atenMethod("thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  check: atenFunction("at::thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

