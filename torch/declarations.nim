# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim
import fragments/ffi/cpp
import torch_cpp
import tensors
import macros

template atenMethod*(obj: CppObject; returnType: type[void]; field: untyped, args: varargs[CppProxy, CppFromAst]): untyped =
  try: obj.dynamicCppCall(field, args).to(void)
  except StdException as e: raiseAssert($e.what())

template atenMethod*(obj: CppObject; returnType: type; field: untyped, args: varargs[CppProxy, CppFromAst]): untyped =
  var r: returnType
  try: r = obj.dynamicCppCall(field, args).to(returnType)
  except StdException as e: raiseAssert($e.what())
  r

template atenFunction*(returnType: type[void]; field: untyped, args: varargs[CppProxy, CppFromAst]): untyped =
  try: dynamicCCall(field, args).to(void)
  except StdException as e: raiseAssert($e.what())

template atenFunction*(returnType: type; field: untyped, args: varargs[CppProxy, CppFromAst]): untyped =
  var r: returnType
  try: r = dynamicCCall(field, args).to(returnType)
  except StdException as e: raiseAssert($e.what())
  r

proc th_set_impl_inplace*(ty: TensorType; self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_set_", self.toATensor(), source); self

proc th_set_impl_inplace*(self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_set_", self.toATensor(), source); self

proc th_set_impl_inplace*(ty: TensorType; self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_set_", self.toATensor(), source, storage_offset, size.toAIntList(), stride.toAIntList()); self

proc th_set_impl_inplace*(self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_set_", self.toATensor(), source, storage_offset, size.toAIntList(), stride.toAIntList()); self

proc th_set_impl_inplace*(ty: TensorType; self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_set_", self.toATensor(), source.toATensor()); self

proc th_set_impl_inplace*(self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_set_", self.toATensor(), source.toATensor()); self

proc th_set_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_set_", self.toATensor()); self

proc th_set_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_set_", self.toATensor()); self

proc th_fill_impl_inplace*(ty: TensorType; self: Tensor; value: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_fill_", self.toATensor(), value); self

proc th_fill_impl_inplace*(self: Tensor; value: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_fill_", self.toATensor(), value); self

proc th_fill_impl_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_fill_", self.toATensor(), value.toATensor()); self

proc th_fill_impl_inplace*(self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_fill_", self.toATensor(), value.toATensor()); self

proc th_is_set_to_impl*(ty: TensorType; self: Tensor; tensor: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "_th_is_set_to", self.toATensor(), tensor.toATensor())

proc th_is_set_to_impl*(self: Tensor; tensor: Tensor): bool {.inline.} = 
  atenFunction(bool, "at::_th_is_set_to", self.toATensor(), tensor.toATensor())

proc th_masked_fill_impl_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_masked_fill_", self.toATensor(), mask.toATensor(), value); self

proc th_masked_fill_impl_inplace*(self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_masked_fill_", self.toATensor(), mask.toATensor(), value); self

proc th_masked_fill_impl_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_masked_fill_", self.toATensor(), mask.toATensor(), value.toATensor()); self

proc th_masked_fill_impl_inplace*(self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_masked_fill_", self.toATensor(), mask.toATensor(), value.toATensor()); self

proc th_masked_scatter_impl_inplace*(ty: TensorType; self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_masked_scatter_", self.toATensor(), mask.toATensor(), source.toATensor()); self

proc th_masked_scatter_impl_inplace*(self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_masked_scatter_", self.toATensor(), mask.toATensor(), source.toATensor()); self

proc th_masked_select_impl*(ty: TensorType; self: Tensor; mask: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_masked_select", self.toATensor(), mask.toATensor()).newTensor()

proc th_masked_select_impl*(self: Tensor; mask: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_masked_select", self.toATensor(), mask.toATensor()).newTensor()

proc th_nonzero_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_nonzero", self.toATensor()).newTensor()

proc th_nonzero_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_nonzero", self.toATensor()).newTensor()

proc th_clone_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_clone", self.toATensor()).newTensor()

proc th_clone_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_clone", self.toATensor()).newTensor()

proc th_view_impl*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_view", self.toATensor(), size.toAIntList()).newTensor()

proc th_view_impl*(self: Tensor; size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_view", self.toATensor(), size.toAIntList()).newTensor()

proc th_resize_as_impl_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_resize_as_", self.toATensor(), the_template.toATensor()); self

proc th_resize_as_impl_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_resize_as_", self.toATensor(), the_template.toATensor()); self

proc th_index_select_impl*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_index_select", self.toATensor(), dim, index.toATensor()).newTensor()

proc th_index_select_impl*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_index_select", self.toATensor(), dim, index.toATensor()).newTensor()

proc th_index_copy_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_index_copy_", self.toATensor(), dim, index.toATensor(), source.toATensor()); self

proc th_index_copy_impl_inplace*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_index_copy_", self.toATensor(), dim, index.toATensor(), source.toATensor()); self

proc th_take_impl*(ty: TensorType; self: Tensor; index: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_take", self.toATensor(), index.toATensor()).newTensor()

proc th_take_impl*(self: Tensor; index: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_take", self.toATensor(), index.toATensor()).newTensor()

proc th_put_impl_inplace*(ty: TensorType; self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_put_", self.toATensor(), index.toATensor(), source.toATensor(), accumulate); self

proc th_put_impl_inplace*(self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_put_", self.toATensor(), index.toATensor(), source.toATensor(), accumulate); self

proc th_index_add_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_index_add_", self.toATensor(), dim, index.toATensor(), source.toATensor()); self

proc th_index_add_impl_inplace*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_index_add_", self.toATensor(), dim, index.toATensor(), source.toATensor()); self

proc th_index_fill_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_index_fill_", self.toATensor(), dim, index.toATensor(), value); self

proc th_index_fill_impl_inplace*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_index_fill_", self.toATensor(), dim, index.toATensor(), value); self

proc th_index_fill_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_index_fill_", self.toATensor(), dim, index.toATensor(), value.toATensor()); self

proc th_index_fill_impl_inplace*(self: Tensor; dim: int; index: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_index_fill_", self.toATensor(), dim, index.toATensor(), value.toATensor()); self

proc th_unfold_impl*(ty: TensorType; self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_unfold", self.toATensor(), dimension, size, step).newTensor()

proc th_unfold_impl*(self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_unfold", self.toATensor(), dimension, size, step).newTensor()

proc th_scatter_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_scatter_", self.toATensor(), dim, index.toATensor(), src.toATensor()); self

proc th_scatter_impl_inplace*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_scatter_", self.toATensor(), dim, index.toATensor(), src.toATensor()); self

proc th_scatter_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_scatter_", self.toATensor(), dim, index.toATensor(), value); self

proc th_scatter_impl_inplace*(self: Tensor; dim: int; index: Tensor; value: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_scatter_", self.toATensor(), dim, index.toATensor(), value); self

proc th_scatter_add_impl_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_scatter_add_", self.toATensor(), dim, index.toATensor(), src.toATensor()); self

proc th_scatter_add_impl_inplace*(self: Tensor; dim: int; index: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_scatter_add_", self.toATensor(), dim, index.toATensor(), src.toATensor()); self

proc th_gather_impl*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_gather", self.toATensor(), dim, index.toATensor()).newTensor()

proc th_gather_impl*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_gather", self.toATensor(), dim, index.toATensor()).newTensor()

proc th_equal_impl*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "_th_equal", self.toATensor(), other.toATensor())

proc th_equal_impl*(self: Tensor; other: Tensor): bool {.inline.} = 
  atenFunction(bool, "at::_th_equal", self.toATensor(), other.toATensor())

proc th_and_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_and", self.toATensor(), other).newTensor()

proc th_and_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_and", self.toATensor(), other).newTensor()

proc th_and_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_and", self.toATensor(), other.toATensor()).newTensor()

proc th_and_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_and", self.toATensor(), other.toATensor()).newTensor()

proc th_iand_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_iand_", self.toATensor(), other); self

proc th_iand_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_iand_", self.toATensor(), other); self

proc th_iand_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_iand_", self.toATensor(), other.toATensor()); self

proc th_iand_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_iand_", self.toATensor(), other.toATensor()); self

proc th_or_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_or", self.toATensor(), other).newTensor()

proc th_or_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_or", self.toATensor(), other).newTensor()

proc th_or_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_or", self.toATensor(), other.toATensor()).newTensor()

proc th_or_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_or", self.toATensor(), other.toATensor()).newTensor()

proc th_ior_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ior_", self.toATensor(), other); self

proc th_ior_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ior_", self.toATensor(), other); self

proc th_ior_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ior_", self.toATensor(), other.toATensor()); self

proc th_ior_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ior_", self.toATensor(), other.toATensor()); self

proc th_xor_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_xor", self.toATensor(), other).newTensor()

proc th_xor_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_xor", self.toATensor(), other).newTensor()

proc th_xor_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_xor", self.toATensor(), other.toATensor()).newTensor()

proc th_xor_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_xor", self.toATensor(), other.toATensor()).newTensor()

proc th_ixor_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ixor_", self.toATensor(), other); self

proc th_ixor_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ixor_", self.toATensor(), other); self

proc th_ixor_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ixor_", self.toATensor(), other.toATensor()); self

proc th_ixor_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ixor_", self.toATensor(), other.toATensor()); self

proc th_lshift_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_lshift", self.toATensor(), other).newTensor()

proc th_lshift_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_lshift", self.toATensor(), other).newTensor()

proc th_lshift_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_lshift", self.toATensor(), other.toATensor()).newTensor()

proc th_lshift_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_lshift", self.toATensor(), other.toATensor()).newTensor()

proc th_ilshift_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ilshift_", self.toATensor(), other); self

proc th_ilshift_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ilshift_", self.toATensor(), other); self

proc th_ilshift_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ilshift_", self.toATensor(), other.toATensor()); self

proc th_ilshift_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ilshift_", self.toATensor(), other.toATensor()); self

proc th_rshift_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_rshift", self.toATensor(), other).newTensor()

proc th_rshift_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_rshift", self.toATensor(), other).newTensor()

proc th_rshift_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_rshift", self.toATensor(), other.toATensor()).newTensor()

proc th_rshift_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_rshift", self.toATensor(), other.toATensor()).newTensor()

proc th_irshift_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_irshift_", self.toATensor(), other); self

proc th_irshift_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_irshift_", self.toATensor(), other); self

proc th_irshift_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_irshift_", self.toATensor(), other.toATensor()); self

proc th_irshift_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_irshift_", self.toATensor(), other.toATensor()); self

proc th_lt_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_lt", self.toATensor(), other).newTensor()

proc th_lt_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_lt", self.toATensor(), other).newTensor()

proc th_lt_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_lt", self.toATensor(), other.toATensor()).newTensor()

proc th_lt_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_lt", self.toATensor(), other.toATensor()).newTensor()

proc th_lt_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_lt_", self.toATensor(), other); self

proc th_lt_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_lt_", self.toATensor(), other); self

proc th_lt_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_lt_", self.toATensor(), other.toATensor()); self

proc th_lt_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_lt_", self.toATensor(), other.toATensor()); self

proc th_gt_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_gt", self.toATensor(), other).newTensor()

proc th_gt_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_gt", self.toATensor(), other).newTensor()

proc th_gt_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_gt", self.toATensor(), other.toATensor()).newTensor()

proc th_gt_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_gt", self.toATensor(), other.toATensor()).newTensor()

proc th_gt_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_gt_", self.toATensor(), other); self

proc th_gt_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_gt_", self.toATensor(), other); self

proc th_gt_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_gt_", self.toATensor(), other.toATensor()); self

proc th_gt_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_gt_", self.toATensor(), other.toATensor()); self

proc th_le_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_le", self.toATensor(), other).newTensor()

proc th_le_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_le", self.toATensor(), other).newTensor()

proc th_le_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_le", self.toATensor(), other.toATensor()).newTensor()

proc th_le_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_le", self.toATensor(), other.toATensor()).newTensor()

proc th_le_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_le_", self.toATensor(), other); self

proc th_le_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_le_", self.toATensor(), other); self

proc th_le_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_le_", self.toATensor(), other.toATensor()); self

proc th_le_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_le_", self.toATensor(), other.toATensor()); self

proc th_ge_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_ge", self.toATensor(), other).newTensor()

proc th_ge_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_ge", self.toATensor(), other).newTensor()

proc th_ge_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_ge", self.toATensor(), other.toATensor()).newTensor()

proc th_ge_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_ge", self.toATensor(), other.toATensor()).newTensor()

proc th_ge_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ge_", self.toATensor(), other); self

proc th_ge_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ge_", self.toATensor(), other); self

proc th_ge_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ge_", self.toATensor(), other.toATensor()); self

proc th_ge_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ge_", self.toATensor(), other.toATensor()); self

proc th_eq_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_eq", self.toATensor(), other).newTensor()

proc th_eq_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_eq", self.toATensor(), other).newTensor()

proc th_eq_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_eq", self.toATensor(), other.toATensor()).newTensor()

proc th_eq_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_eq", self.toATensor(), other.toATensor()).newTensor()

proc th_eq_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_eq_", self.toATensor(), other); self

proc th_eq_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_eq_", self.toATensor(), other); self

proc th_eq_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_eq_", self.toATensor(), other.toATensor()); self

proc th_eq_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_eq_", self.toATensor(), other.toATensor()); self

proc th_ne_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_ne", self.toATensor(), other).newTensor()

proc th_ne_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_ne", self.toATensor(), other).newTensor()

proc th_ne_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_ne", self.toATensor(), other.toATensor()).newTensor()

proc th_ne_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_ne", self.toATensor(), other.toATensor()).newTensor()

proc th_ne_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ne_", self.toATensor(), other); self

proc th_ne_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ne_", self.toATensor(), other); self

proc th_ne_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_ne_", self.toATensor(), other.toATensor()); self

proc th_ne_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_ne_", self.toATensor(), other.toATensor()); self

proc th_min_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_min", self.toATensor(), other.toATensor()).newTensor()

proc th_min_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_min", self.toATensor(), other.toATensor()).newTensor()

proc th_min_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty[].atenMethod(float, "_th_min", self.toATensor())

proc th_min_impl*(self: Tensor): float {.inline.} = 
  atenFunction(float, "at::_th_min", self.toATensor())

proc th_min_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_min", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_min_impl*(self: Tensor; dim: int; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_min", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_max_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_max", self.toATensor(), other.toATensor()).newTensor()

proc th_max_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_max", self.toATensor(), other.toATensor()).newTensor()

proc th_max_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty[].atenMethod(float, "_th_max", self.toATensor())

proc th_max_impl*(self: Tensor): float {.inline.} = 
  atenFunction(float, "at::_th_max", self.toATensor())

proc th_max_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_max", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_max_impl*(self: Tensor; dim: int; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_max", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_kthvalue_impl*(ty: TensorType; self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_kthvalue", self.toATensor(), k, dim, keepdim).toNimTuple().newTensors()

proc th_kthvalue_impl*(self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_kthvalue", self.toATensor(), k, dim, keepdim).toNimTuple().newTensors()

proc th_mode_impl*(ty: TensorType; self: Tensor; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_mode", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_mode_impl*(self: Tensor; dim: int = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_mode", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_median_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty[].atenMethod(float, "_th_median", self.toATensor())

proc th_median_impl*(self: Tensor): float {.inline.} = 
  atenFunction(float, "at::_th_median", self.toATensor())

proc th_median_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_median", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_median_impl*(self: Tensor; dim: int; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_median", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc th_sort_impl*(ty: TensorType; self: Tensor; dim: int = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_sort", self.toATensor(), dim, descending).toNimTuple().newTensors()

proc th_sort_impl*(self: Tensor; dim: int = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_sort", self.toATensor(), dim, descending).toNimTuple().newTensors()

proc th_topk_impl*(ty: TensorType; self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_topk", self.toATensor(), k, dim, largest, sorted).toNimTuple().newTensors()

proc th_topk_impl*(self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_topk", self.toATensor(), k, dim, largest, sorted).toNimTuple().newTensors()

proc th_abs_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_abs", self.toATensor()).newTensor()

proc th_abs_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_abs", self.toATensor()).newTensor()

proc th_sigmoid_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_sigmoid", self.toATensor()).newTensor()

proc th_sigmoid_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_sigmoid", self.toATensor()).newTensor()

proc th_log_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_log", self.toATensor()).newTensor()

proc th_log_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_log", self.toATensor()).newTensor()

proc th_log10_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_log10", self.toATensor()).newTensor()

proc th_log10_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_log10", self.toATensor()).newTensor()

proc th_log1p_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_log1p", self.toATensor()).newTensor()

proc th_log1p_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_log1p", self.toATensor()).newTensor()

proc th_log2_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_log2", self.toATensor()).newTensor()

proc th_log2_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_log2", self.toATensor()).newTensor()

proc th_lgamma_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_lgamma", self.toATensor()).newTensor()

proc th_lgamma_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_lgamma", self.toATensor()).newTensor()

proc th_lgamma_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_lgamma_", self.toATensor()); self

proc th_lgamma_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_lgamma_", self.toATensor()); self

proc th_digamma_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_digamma", self.toATensor()).newTensor()

proc th_digamma_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_digamma", self.toATensor()).newTensor()

proc th_digamma_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_digamma_", self.toATensor()); self

proc th_digamma_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_digamma_", self.toATensor()); self

proc th_polygamma_impl*(ty: TensorType; n: int; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_polygamma", n, self.toATensor()).newTensor()

proc th_polygamma_impl*(n: int; self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_polygamma", n, self.toATensor()).newTensor()

proc th_polygamma_impl_inplace*(ty: TensorType; self: Tensor; n: int): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_polygamma_", self.toATensor(), n); self

proc th_polygamma_impl_inplace*(self: Tensor; n: int): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_polygamma_", self.toATensor(), n); self

proc th_exp_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_exp", self.toATensor()).newTensor()

proc th_exp_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_exp", self.toATensor()).newTensor()

proc th_expm1_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_expm1", self.toATensor()).newTensor()

proc th_expm1_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_expm1", self.toATensor()).newTensor()

proc th_cos_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_cos", self.toATensor()).newTensor()

proc th_cos_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_cos", self.toATensor()).newTensor()

proc th_acos_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_acos", self.toATensor()).newTensor()

proc th_acos_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_acos", self.toATensor()).newTensor()

proc th_cosh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_cosh", self.toATensor()).newTensor()

proc th_cosh_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_cosh", self.toATensor()).newTensor()

proc th_sin_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_sin", self.toATensor()).newTensor()

proc th_sin_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_sin", self.toATensor()).newTensor()

proc th_asin_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_asin", self.toATensor()).newTensor()

proc th_asin_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_asin", self.toATensor()).newTensor()

proc th_sinh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_sinh", self.toATensor()).newTensor()

proc th_sinh_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_sinh", self.toATensor()).newTensor()

proc th_tan_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_tan", self.toATensor()).newTensor()

proc th_tan_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_tan", self.toATensor()).newTensor()

proc th_atan_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_atan", self.toATensor()).newTensor()

proc th_atan_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_atan", self.toATensor()).newTensor()

proc th_tanh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_tanh", self.toATensor()).newTensor()

proc th_tanh_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_tanh", self.toATensor()).newTensor()

proc th_erf_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_erf", self.toATensor()).newTensor()

proc th_erf_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_erf", self.toATensor()).newTensor()

proc th_erfc_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_erfc", self.toATensor()).newTensor()

proc th_erfc_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_erfc", self.toATensor()).newTensor()

proc th_erfinv_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_erfinv_", self.toATensor()); self

proc th_erfinv_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_erfinv_", self.toATensor()); self

proc th_erfinv_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_erfinv", self.toATensor()).newTensor()

proc th_erfinv_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_erfinv", self.toATensor()).newTensor()

proc th_sqrt_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_sqrt", self.toATensor()).newTensor()

proc th_sqrt_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_sqrt", self.toATensor()).newTensor()

proc th_rsqrt_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_rsqrt", self.toATensor()).newTensor()

proc th_rsqrt_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_rsqrt", self.toATensor()).newTensor()

proc th_ceil_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_ceil", self.toATensor()).newTensor()

proc th_ceil_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_ceil", self.toATensor()).newTensor()

proc th_floor_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_floor", self.toATensor()).newTensor()

proc th_floor_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_floor", self.toATensor()).newTensor()

proc th_round_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_round", self.toATensor()).newTensor()

proc th_round_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_round", self.toATensor()).newTensor()

proc th_trunc_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_trunc", self.toATensor()).newTensor()

proc th_trunc_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_trunc", self.toATensor()).newTensor()

proc th_frac_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_frac_", self.toATensor()); self

proc th_frac_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_frac_", self.toATensor()); self

proc th_frac_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_frac", self.toATensor()).newTensor()

proc th_frac_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_frac", self.toATensor()).newTensor()

proc th_var_impl*(ty: TensorType; self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_var", self.toATensor(), dim, unbiased, keepdim).newTensor()

proc th_var_impl*(self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_var", self.toATensor(), dim, unbiased, keepdim).newTensor()

proc th_var_impl*(ty: TensorType; self: Tensor; unbiased: bool = true): float {.inline.} = 
  ty[].atenMethod(float, "_th_var", self.toATensor(), unbiased)

proc th_var_impl*(self: Tensor; unbiased: bool = true): float {.inline.} = 
  atenFunction(float, "at::_th_var", self.toATensor(), unbiased)

proc th_std_impl*(ty: TensorType; self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_std", self.toATensor(), dim, unbiased, keepdim).newTensor()

proc th_std_impl*(self: Tensor; dim: int; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_std", self.toATensor(), dim, unbiased, keepdim).newTensor()

proc th_std_impl*(ty: TensorType; self: Tensor; unbiased: bool = true): float {.inline.} = 
  ty[].atenMethod(float, "_th_std", self.toATensor(), unbiased)

proc th_std_impl*(self: Tensor; unbiased: bool = true): float {.inline.} = 
  atenFunction(float, "at::_th_std", self.toATensor(), unbiased)

proc th_renorm_impl*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_renorm", self.toATensor(), p, dim, maxnorm).newTensor()

proc th_renorm_impl*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_renorm", self.toATensor(), p, dim, maxnorm).newTensor()

proc th_renorm_impl_inplace*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_renorm_", self.toATensor(), p, dim, maxnorm); self

proc th_renorm_impl_inplace*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_renorm_", self.toATensor(), p, dim, maxnorm); self

proc th_dist_impl*(ty: TensorType; self: Tensor; other: Tensor; p: float = 2): float {.inline.} = 
  ty[].atenMethod(float, "_th_dist", self.toATensor(), other.toATensor(), p)

proc th_dist_impl*(self: Tensor; other: Tensor; p: float = 2): float {.inline.} = 
  atenFunction(float, "at::_th_dist", self.toATensor(), other.toATensor(), p)

proc th_reciprocal_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_reciprocal", self.toATensor()).newTensor()

proc th_reciprocal_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_reciprocal", self.toATensor()).newTensor()

proc th_reciprocal_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_reciprocal_", self.toATensor()); self

proc th_reciprocal_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_reciprocal_", self.toATensor()); self

proc th_neg_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_neg", self.toATensor()).newTensor()

proc th_neg_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_neg", self.toATensor()).newTensor()

proc th_neg_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_neg_", self.toATensor()); self

proc th_neg_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_neg_", self.toATensor()); self

proc th_atan2_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_atan2", self.toATensor(), other.toATensor()).newTensor()

proc th_atan2_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_atan2", self.toATensor(), other.toATensor()).newTensor()

proc th_atan2_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_atan2_", self.toATensor(), other.toATensor()); self

proc th_atan2_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_atan2_", self.toATensor(), other.toATensor()); self

proc th_pow_impl*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_pow", self.toATensor(), exponent).newTensor()

proc th_pow_impl*(self: Tensor; exponent: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_pow", self.toATensor(), exponent).newTensor()

proc th_pow_impl*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_pow", self.toATensor(), exponent.toATensor()).newTensor()

proc th_pow_impl*(self: Tensor; exponent: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_pow", self.toATensor(), exponent.toATensor()).newTensor()

proc th_pow_impl*(ty: TensorType; self: float; exponent: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_pow", self, exponent.toATensor()).newTensor()

proc th_pow_impl*(self: float; exponent: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_pow", self, exponent.toATensor()).newTensor()

proc th_pow_impl_inplace*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_pow_", self.toATensor(), exponent); self

proc th_pow_impl_inplace*(self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_pow_", self.toATensor(), exponent); self

proc th_pow_impl_inplace*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_pow_", self.toATensor(), exponent.toATensor()); self

proc th_pow_impl_inplace*(self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_pow_", self.toATensor(), exponent.toATensor()); self

proc th_lerp_impl*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_lerp", self.toATensor(), end_special.toATensor(), weight).newTensor()

proc th_lerp_impl*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_lerp", self.toATensor(), end_special.toATensor(), weight).newTensor()

proc th_lerp_impl_inplace*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_lerp_", self.toATensor(), end_special.toATensor(), weight); self

proc th_lerp_impl_inplace*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_lerp_", self.toATensor(), end_special.toATensor(), weight); self

proc th_histc_impl*(ty: TensorType; self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_histc", self.toATensor(), bins, min, max).newTensor()

proc th_histc_impl*(self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_histc", self.toATensor(), bins, min, max).newTensor()

proc th_zero_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_zero_", self.toATensor()); self

proc th_zero_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_zero_", self.toATensor()); self

proc th_cumsum_impl*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_cumsum", self.toATensor(), dim).newTensor()

proc th_cumsum_impl*(self: Tensor; dim: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_cumsum", self.toATensor(), dim).newTensor()

proc th_cumprod_impl*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_cumprod", self.toATensor(), dim).newTensor()

proc th_cumprod_impl*(self: Tensor; dim: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_cumprod", self.toATensor(), dim).newTensor()

proc th_sign_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_sign", self.toATensor()).newTensor()

proc th_sign_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_sign", self.toATensor()).newTensor()

proc th_sign_impl_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_sign_", self.toATensor()); self

proc th_sign_impl_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_sign_", self.toATensor()); self

proc th_trace_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty[].atenMethod(float, "_th_trace", self.toATensor())

proc th_trace_impl*(self: Tensor): float {.inline.} = 
  atenFunction(float, "at::_th_trace", self.toATensor())

proc th_fmod_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_fmod", self.toATensor(), other).newTensor()

proc th_fmod_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_fmod", self.toATensor(), other).newTensor()

proc th_fmod_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_fmod", self.toATensor(), other.toATensor()).newTensor()

proc th_fmod_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_fmod", self.toATensor(), other.toATensor()).newTensor()

proc th_fmod_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_fmod_", self.toATensor(), other); self

proc th_fmod_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_fmod_", self.toATensor(), other); self

proc th_fmod_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_fmod_", self.toATensor(), other.toATensor()); self

proc th_fmod_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_fmod_", self.toATensor(), other.toATensor()); self

proc th_remainder_impl*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_remainder", self.toATensor(), other).newTensor()

proc th_remainder_impl*(self: Tensor; other: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_remainder", self.toATensor(), other).newTensor()

proc th_remainder_impl*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_remainder", self.toATensor(), other.toATensor()).newTensor()

proc th_remainder_impl*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_remainder", self.toATensor(), other.toATensor()).newTensor()

proc th_remainder_impl_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_remainder_", self.toATensor(), other); self

proc th_remainder_impl_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_remainder_", self.toATensor(), other); self

proc th_remainder_impl_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_remainder_", self.toATensor(), other.toATensor()); self

proc th_remainder_impl_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_remainder_", self.toATensor(), other.toATensor()); self

proc th_clamp_impl*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_clamp", self.toATensor(), min, max).newTensor()

proc th_clamp_impl*(self: Tensor; min: float; max: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_clamp", self.toATensor(), min, max).newTensor()

proc th_clamp_min_impl*(ty: TensorType; self: Tensor; min: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_clamp_min", self.toATensor(), min).newTensor()

proc th_clamp_min_impl*(self: Tensor; min: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_clamp_min", self.toATensor(), min).newTensor()

proc th_clamp_max_impl*(ty: TensorType; self: Tensor; max: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_clamp_max", self.toATensor(), max).newTensor()

proc th_clamp_max_impl*(self: Tensor; max: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_clamp_max", self.toATensor(), max).newTensor()

proc th_dot_impl*(ty: TensorType; self: Tensor; tensor: Tensor): float {.inline.} = 
  ty[].atenMethod(float, "_th_dot", self.toATensor(), tensor.toATensor())

proc th_dot_impl*(self: Tensor; tensor: Tensor): float {.inline.} = 
  atenFunction(float, "at::_th_dot", self.toATensor(), tensor.toATensor())

proc th_cross_impl*(ty: TensorType; self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_cross", self.toATensor(), other.toATensor(), dim).newTensor()

proc th_cross_impl*(self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_cross", self.toATensor(), other.toATensor(), dim).newTensor()

proc th_diag_impl*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_diag", self.toATensor(), diagonal).newTensor()

proc th_diag_impl*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_diag", self.toATensor(), diagonal).newTensor()

proc th_addmm_impl*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).newTensor()

proc th_addmm_impl*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).newTensor()

proc th_addmm_impl_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha); self

proc th_addmm_impl_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha); self

proc th_addmv_impl*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_addmv", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha).newTensor()

proc th_addmv_impl*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_addmv", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha).newTensor()

proc th_addmv_impl_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_addmv_", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha); self

proc th_addmv_impl_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_addmv_", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha); self

proc th_addr_impl*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_addr", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha).newTensor()

proc th_addr_impl*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_addr", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha).newTensor()

proc th_addr_impl_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_addr_", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha); self

proc th_addr_impl_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_addr_", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha); self

proc th_ger_impl*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_ger", self.toATensor(), vec2.toATensor()).newTensor()

proc th_ger_impl*(self: Tensor; vec2: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_ger", self.toATensor(), vec2.toATensor()).newTensor()

proc th_mv_impl*(ty: TensorType; self: Tensor; vec: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_mv", self.toATensor(), vec.toATensor()).newTensor()

proc th_mv_impl*(self: Tensor; vec: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_mv", self.toATensor(), vec.toATensor()).newTensor()

proc th_mm_impl*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_mm", self.toATensor(), mat2.toATensor()).newTensor()

proc th_mm_impl*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_mm", self.toATensor(), mat2.toATensor()).newTensor()

proc th_bmm_impl*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_bmm", self.toATensor(), mat2.toATensor()).newTensor()

proc th_bmm_impl*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_bmm", self.toATensor(), mat2.toATensor()).newTensor()

proc th_addbmm_impl*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_addbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).newTensor()

proc th_addbmm_impl*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_addbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).newTensor()

proc th_addbmm_impl_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_addbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc th_addbmm_impl_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_addbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc th_baddbmm_impl*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_baddbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).newTensor()

proc th_baddbmm_impl*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_baddbmm", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha).newTensor()

proc th_addcmul_impl*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_addcmul", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).newTensor()

proc th_addcmul_impl*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_addcmul", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).newTensor()

proc th_addcmul_impl_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_addcmul_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value); self

proc th_addcmul_impl_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_addcmul_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value); self

proc th_addcdiv_impl*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_addcdiv", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).newTensor()

proc th_addcdiv_impl*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_addcdiv", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value).newTensor()

proc th_addcdiv_impl_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_addcdiv_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value); self

proc th_addcdiv_impl_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_addcdiv_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value); self

proc th_gels_impl*(ty: TensorType; self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_gels", self.toATensor(), A.toATensor()).toNimTuple().newTensors()

proc th_gels_impl*(self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_gels", self.toATensor(), A.toATensor()).toNimTuple().newTensors()

proc th_trtrs_impl*(ty: TensorType; self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_trtrs", self.toATensor(), A.toATensor(), upper, transpose, unitriangular).toNimTuple().newTensors()

proc th_trtrs_impl*(self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_trtrs", self.toATensor(), A.toATensor(), upper, transpose, unitriangular).toNimTuple().newTensors()

proc th_symeig_impl*(ty: TensorType; self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_symeig", self.toATensor(), eigenvectors, upper).toNimTuple().newTensors()

proc th_symeig_impl*(self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_symeig", self.toATensor(), eigenvectors, upper).toNimTuple().newTensors()

proc th_eig_impl*(ty: TensorType; self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_eig", self.toATensor(), eigenvectors).toNimTuple().newTensors()

proc th_eig_impl*(self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_eig", self.toATensor(), eigenvectors).toNimTuple().newTensors()

proc th_svd_impl*(ty: TensorType; self: Tensor; some: bool = true; compute_uv: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_th_svd", self.toATensor(), some, compute_uv).toNimTuple().newTensors()

proc th_svd_impl*(self: Tensor; some: bool = true; compute_uv: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_th_svd", self.toATensor(), some, compute_uv).toNimTuple().newTensors()

proc th_getri_single_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_getri_single", self.toATensor()).newTensor()

proc th_getri_single_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_getri_single", self.toATensor()).newTensor()

proc th_potri_impl*(ty: TensorType; self: Tensor; upper: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_potri", self.toATensor(), upper).newTensor()

proc th_potri_impl*(self: Tensor; upper: bool = true): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_potri", self.toATensor(), upper).newTensor()

proc th_pstrf_impl*(ty: TensorType; self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_pstrf", self.toATensor(), upper, tol).toNimTuple().newTensors()

proc th_pstrf_impl*(self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_pstrf", self.toATensor(), upper, tol).toNimTuple().newTensors()

proc th_qr_impl*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_qr", self.toATensor()).toNimTuple().newTensors()

proc th_qr_impl*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_qr", self.toATensor()).toNimTuple().newTensors()

proc th_geqrf_impl*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_geqrf", self.toATensor()).toNimTuple().newTensors()

proc th_geqrf_impl*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_geqrf", self.toATensor()).toNimTuple().newTensors()

proc th_orgqr_impl*(ty: TensorType; self: Tensor; input2: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_orgqr", self.toATensor(), input2.toATensor()).newTensor()

proc th_orgqr_impl*(self: Tensor; input2: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_orgqr", self.toATensor(), input2.toATensor()).newTensor()

proc th_ormqr_impl*(ty: TensorType; self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_ormqr", self.toATensor(), input2.toATensor(), input3.toATensor(), left, transpose).newTensor()

proc th_ormqr_impl*(self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_ormqr", self.toATensor(), input2.toATensor(), input3.toATensor(), left, transpose).newTensor()

proc th_btrifact_impl*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_th_btrifact", self.toATensor(), pivot).toNimTuple().newTensors()

proc th_btrifact_impl*(self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_th_btrifact", self.toATensor(), pivot).toNimTuple().newTensors()

proc th_btrifact_with_info_impl*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor, info: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_th_btrifact_with_info", self.toATensor(), pivot).toNimTuple().newTensors()

proc th_btrifact_with_info_impl*(self: Tensor; pivot: bool = true): tuple[result_special: Tensor, pivots: Tensor, info: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_th_btrifact_with_info", self.toATensor(), pivot).toNimTuple().newTensors()

proc th_btrisolve_impl*(ty: TensorType; self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_btrisolve", self.toATensor(), LU_data.toATensor(), LU_pivots.toATensor()).newTensor()

proc th_btrisolve_impl*(self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_btrisolve", self.toATensor(), LU_data.toATensor(), LU_pivots.toATensor()).newTensor()

proc th_random_impl_inplace*(ty: TensorType; self: Tensor; from_special: int; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_random_", self.toATensor(), from_special, to_special, generator); self

proc th_random_impl_inplace*(self: Tensor; from_special: int; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_random_", self.toATensor(), from_special, to_special, generator); self

proc th_random_impl_inplace*(ty: TensorType; self: Tensor; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_random_", self.toATensor(), to_special, generator); self

proc th_random_impl_inplace*(self: Tensor; to_special: int; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_random_", self.toATensor(), to_special, generator); self

proc th_random_impl_inplace*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_random_", self.toATensor(), generator); self

proc th_random_impl_inplace*(self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_random_", self.toATensor(), generator); self

proc th_multinomial_impl*(ty: TensorType; self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_multinomial", self.toATensor(), num_samples, replacement, generator).newTensor()

proc th_multinomial_impl*(self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_multinomial", self.toATensor(), num_samples, replacement, generator).newTensor()

proc th_uniform_impl_inplace*(ty: TensorType; self: Tensor; from_special: float64 = 0; to_special: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_uniform_", self.toATensor(), from_special, to_special, generator); self

proc th_uniform_impl_inplace*(self: Tensor; from_special: float64 = 0; to_special: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_uniform_", self.toATensor(), from_special, to_special, generator); self

proc th_normal_impl*(ty: TensorType; mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_normal", mean.toATensor(), std, generator).newTensor()

proc th_normal_impl*(mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_normal", mean.toATensor(), std, generator).newTensor()

proc th_normal_impl*(ty: TensorType; mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_normal", mean, std.toATensor(), generator).newTensor()

proc th_normal_impl*(mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_normal", mean, std.toATensor(), generator).newTensor()

proc th_normal_impl*(ty: TensorType; mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_normal", mean.toATensor(), std.toATensor(), generator).newTensor()

proc th_normal_impl*(mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_normal", mean.toATensor(), std.toATensor(), generator).newTensor()

proc th_normal_impl_inplace*(ty: TensorType; self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_normal_", self.toATensor(), mean, std, generator); self

proc th_normal_impl_inplace*(self: Tensor; mean: float64 = 0; std: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_normal_", self.toATensor(), mean, std, generator); self

proc th_cauchy_impl_inplace*(ty: TensorType; self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_cauchy_", self.toATensor(), median, sigma, generator); self

proc th_cauchy_impl_inplace*(self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_cauchy_", self.toATensor(), median, sigma, generator); self

proc th_log_normal_impl_inplace*(ty: TensorType; self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_log_normal_", self.toATensor(), mean, std, generator); self

proc th_log_normal_impl_inplace*(self: Tensor; mean: float64 = 1; std: float64 = 2; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_log_normal_", self.toATensor(), mean, std, generator); self

proc th_exponential_impl_inplace*(ty: TensorType; self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_exponential_", self.toATensor(), lambd, generator); self

proc th_exponential_impl_inplace*(self: Tensor; lambd: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_exponential_", self.toATensor(), lambd, generator); self

proc th_geometric_impl_inplace*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_geometric_", self.toATensor(), p, generator); self

proc th_geometric_impl_inplace*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_geometric_", self.toATensor(), p, generator); self

proc th_dirichlet_grad_impl*(ty: TensorType; x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).newTensor()

proc th_dirichlet_grad_impl*(x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).newTensor()

proc th_alias_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_alias", self.toATensor()).newTensor()

proc th_alias_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_alias", self.toATensor()).newTensor()

proc th_copy_ignoring_overlaps_impl_inplace*(ty: TensorType; self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_th_copy_ignoring_overlaps_", self.toATensor(), src.toATensor()); self

proc th_copy_ignoring_overlaps_impl_inplace*(self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_th_copy_ignoring_overlaps_", self.toATensor(), src.toATensor()); self

proc th_cat_impl*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_th_cat", tensors.toATensors(), dim).newTensor()

proc th_cat_impl*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_th_cat", tensors.toATensors(), dim).newTensor()

proc thnn_binary_cross_entropy_impl*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_binary_cross_entropy_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction).newTensor()

proc thnn_binary_cross_entropy_impl*(self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_binary_cross_entropy_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction).newTensor()

proc thnn_binary_cross_entropy_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).newTensor()

proc thnn_binary_cross_entropy_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).newTensor()

proc thnn_l1_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_l1_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_l1_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_l1_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_mse_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_mse_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_mse_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_mse_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_mse_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_mse_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_multi_margin_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_multi_margin_loss_forward", self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).newTensor()

proc thnn_multi_margin_loss_impl*(self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_multi_margin_loss_forward", self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).newTensor()

proc thnn_multi_margin_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).newTensor()

proc thnn_multi_margin_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).newTensor()

proc thnn_multilabel_margin_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_multilabel_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).toNimTuple().newTensors()

proc thnn_multilabel_margin_loss_impl*(self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_multilabel_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).toNimTuple().newTensors()

proc thnn_multilabel_margin_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).newTensor()

proc thnn_multilabel_margin_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).newTensor()

proc thnn_nll_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_nll_loss_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).toNimTuple().newTensors()

proc thnn_nll_loss_impl*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_nll_loss_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).toNimTuple().newTensors()

proc thnn_nll_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_nll_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).newTensor()

proc thnn_nll_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_nll_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).newTensor()

proc thnn_nll_loss2d_impl*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_nll_loss2d_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).toNimTuple().newTensors()

proc thnn_nll_loss2d_impl*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_nll_loss2d_forward", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).toNimTuple().newTensors()

proc thnn_nll_loss2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_nll_loss2d_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).newTensor()

proc thnn_nll_loss2d_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_nll_loss2d_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index, total_weight.toATensor()).newTensor()

proc thnn_smooth_l1_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_smooth_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_smooth_l1_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_smooth_l1_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_smooth_l1_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_smooth_l1_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_soft_margin_loss_impl*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_soft_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_soft_margin_loss_impl*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_soft_margin_loss_forward", self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_soft_margin_loss_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_soft_margin_loss_backward_impl*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc thnn_elu_impl*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_elu_forward", self.toATensor(), alpha, scale, input_scale).newTensor()

proc thnn_elu_impl*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_elu_forward", self.toATensor(), alpha, scale, input_scale).newTensor()

proc thnn_elu_backward_impl*(ty: TensorType; grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).newTensor()

proc thnn_elu_backward_impl*(grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).newTensor()

proc thnn_elu_impl_inplace*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_thnn_elu_forward_", self.toATensor(), alpha, scale, input_scale); self

proc thnn_elu_impl_inplace*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_thnn_elu_forward_", self.toATensor(), alpha, scale, input_scale); self

proc thnn_glu_impl*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_glu_forward", self.toATensor(), dim).newTensor()

proc thnn_glu_impl*(self: Tensor; dim: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_glu_forward", self.toATensor(), dim).newTensor()

proc thnn_glu_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_glu_backward", grad_output.toATensor(), self.toATensor(), dim).newTensor()

proc thnn_glu_backward_impl*(grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_glu_backward", grad_output.toATensor(), self.toATensor(), dim).newTensor()

proc thnn_hardtanh_impl*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_hardtanh_forward", self.toATensor(), min_val, max_val).newTensor()

proc thnn_hardtanh_impl*(self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_hardtanh_forward", self.toATensor(), min_val, max_val).newTensor()

proc thnn_hardtanh_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_hardtanh_backward", grad_output.toATensor(), self.toATensor(), min_val, max_val).newTensor()

proc thnn_hardtanh_backward_impl*(grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_hardtanh_backward", grad_output.toATensor(), self.toATensor(), min_val, max_val).newTensor()

proc thnn_hardtanh_impl_inplace*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_thnn_hardtanh_forward_", self.toATensor(), min_val, max_val); self

proc thnn_hardtanh_impl_inplace*(self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_thnn_hardtanh_forward_", self.toATensor(), min_val, max_val); self

proc thnn_leaky_relu_impl*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_leaky_relu_forward", self.toATensor(), negative_slope).newTensor()

proc thnn_leaky_relu_impl*(self: Tensor; negative_slope: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_leaky_relu_forward", self.toATensor(), negative_slope).newTensor()

proc thnn_leaky_relu_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_leaky_relu_backward", grad_output.toATensor(), self.toATensor(), negative_slope).newTensor()

proc thnn_leaky_relu_backward_impl*(grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_leaky_relu_backward", grad_output.toATensor(), self.toATensor(), negative_slope).newTensor()

proc thnn_leaky_relu_impl_inplace*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_thnn_leaky_relu_forward_", self.toATensor(), negative_slope); self

proc thnn_leaky_relu_impl_inplace*(self: Tensor; negative_slope: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_thnn_leaky_relu_forward_", self.toATensor(), negative_slope); self

proc thnn_log_sigmoid_impl*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_log_sigmoid_forward", self.toATensor()).toNimTuple().newTensors()

proc thnn_log_sigmoid_impl*(self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_log_sigmoid_forward", self.toATensor()).toNimTuple().newTensors()

proc thnn_log_sigmoid_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).newTensor()

proc thnn_log_sigmoid_backward_impl*(grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).newTensor()

proc thnn_rrelu_with_noise_impl*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_rrelu_with_noise_forward", self.toATensor(), noise.toATensor(), lower, upper, training, generator).newTensor()

proc thnn_rrelu_with_noise_impl*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_rrelu_with_noise_forward", self.toATensor(), noise.toATensor(), lower, upper, training, generator).newTensor()

proc thnn_rrelu_with_noise_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_rrelu_with_noise_backward", grad_output.toATensor(), self.toATensor(), noise.toATensor(), lower, upper, training).newTensor()

proc thnn_rrelu_with_noise_backward_impl*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_rrelu_with_noise_backward", grad_output.toATensor(), self.toATensor(), noise.toATensor(), lower, upper, training).newTensor()

proc thnn_rrelu_with_noise_impl_inplace*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_thnn_rrelu_with_noise_forward_", self.toATensor(), noise.toATensor(), lower, upper, training, generator); self

proc thnn_rrelu_with_noise_impl_inplace*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_thnn_rrelu_with_noise_forward_", self.toATensor(), noise.toATensor(), lower, upper, training, generator); self

proc thnn_softplus_impl*(ty: TensorType; self: Tensor; beta: float; threshold: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_softplus_forward", self.toATensor(), beta, threshold).newTensor()

proc thnn_softplus_impl*(self: Tensor; beta: float; threshold: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_softplus_forward", self.toATensor(), beta, threshold).newTensor()

proc thnn_softplus_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).newTensor()

proc thnn_softplus_backward_impl*(grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).newTensor()

proc thnn_softshrink_impl*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_softshrink_forward", self.toATensor(), lambd).newTensor()

proc thnn_softshrink_impl*(self: Tensor; lambd: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_softshrink_forward", self.toATensor(), lambd).newTensor()

proc thnn_softshrink_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_softshrink_backward", grad_output.toATensor(), self.toATensor(), lambd).newTensor()

proc thnn_softshrink_backward_impl*(grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_softshrink_backward", grad_output.toATensor(), self.toATensor(), lambd).newTensor()

proc thnn_adaptive_avg_pool3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_adaptive_avg_pool3d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_adaptive_avg_pool3d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_adaptive_avg_pool3d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_adaptive_avg_pool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_adaptive_avg_pool3d_backward", grad_output.toATensor(), self.toATensor()).newTensor()

proc thnn_adaptive_avg_pool3d_backward_impl*(grad_output: Tensor; self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_adaptive_avg_pool3d_backward", grad_output.toATensor(), self.toATensor()).newTensor()

proc thnn_adaptive_max_pool2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_adaptive_max_pool2d_forward", self.toATensor(), output_size.toAIntList()).toNimTuple().newTensors()

proc thnn_adaptive_max_pool2d_impl*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_adaptive_max_pool2d_forward", self.toATensor(), output_size.toAIntList()).toNimTuple().newTensors()

proc thnn_adaptive_max_pool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

proc thnn_adaptive_max_pool2d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

proc thnn_adaptive_max_pool3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_adaptive_max_pool3d_forward", self.toATensor(), output_size.toAIntList()).toNimTuple().newTensors()

proc thnn_adaptive_max_pool3d_impl*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_adaptive_max_pool3d_forward", self.toATensor(), output_size.toAIntList()).toNimTuple().newTensors()

proc thnn_adaptive_max_pool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

proc thnn_adaptive_max_pool3d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

proc thnn_avg_pool2d_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_avg_pool2d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_avg_pool2d_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_avg_pool2d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_avg_pool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_avg_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_avg_pool2d_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_avg_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_avg_pool3d_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_avg_pool3d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_avg_pool3d_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_avg_pool3d_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_avg_pool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_avg_pool3d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_avg_pool3d_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_avg_pool3d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).newTensor()

proc thnn_max_pool2d_with_indices_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_max_pool2d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).toNimTuple().newTensors()

proc thnn_max_pool2d_with_indices_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_max_pool2d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).toNimTuple().newTensors()

proc thnn_max_pool2d_with_indices_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc thnn_max_pool2d_with_indices_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc thnn_max_pool3d_with_indices_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_max_pool3d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).toNimTuple().newTensors()

proc thnn_max_pool3d_with_indices_impl*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_max_pool3d_with_indices_forward", self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).toNimTuple().newTensors()

proc thnn_max_pool3d_with_indices_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc thnn_max_pool3d_with_indices_backward_impl*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc thnn_max_unpool2d_impl*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_max_unpool2d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_max_unpool2d_impl*(self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_max_unpool2d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_max_unpool2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_max_unpool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_max_unpool2d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_max_unpool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_max_unpool3d_impl*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_max_unpool3d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).newTensor()

proc thnn_max_unpool3d_impl*(self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_max_unpool3d_forward", self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).newTensor()

proc thnn_max_unpool3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).newTensor()

proc thnn_max_unpool3d_backward_impl*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).newTensor()

proc thnn_upsample_linear1d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_linear1d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_linear1d_impl*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_linear1d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_linear1d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_linear1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_linear1d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_linear1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bilinear2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_bilinear2d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bilinear2d_impl*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_bilinear2d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bilinear2d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_bilinear2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bilinear2d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_bilinear2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bicubic2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_bicubic2d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bicubic2d_impl*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_bicubic2d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bicubic2d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_bicubic2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_bicubic2d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_bicubic2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_trilinear3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_trilinear3d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_trilinear3d_impl*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_trilinear3d_forward", self.toATensor(), output_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_trilinear3d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_trilinear3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_trilinear3d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_trilinear3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList(), align_corners).newTensor()

proc thnn_upsample_nearest1d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_nearest1d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_upsample_nearest1d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_nearest1d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_upsample_nearest1d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_nearest1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).newTensor()

proc thnn_upsample_nearest1d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_nearest1d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).newTensor()

proc thnn_upsample_nearest2d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_nearest2d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_upsample_nearest2d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_nearest2d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_upsample_nearest2d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_nearest2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).newTensor()

proc thnn_upsample_nearest2d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_nearest2d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).newTensor()

proc thnn_upsample_nearest3d_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_nearest3d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_upsample_nearest3d_impl*(self: Tensor; output_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_nearest3d_forward", self.toATensor(), output_size.toAIntList()).newTensor()

proc thnn_upsample_nearest3d_backward_impl*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_upsample_nearest3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).newTensor()

proc thnn_upsample_nearest3d_backward_impl*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_upsample_nearest3d_backward", grad_output.toATensor(), output_size.toAIntList(), input_size.toAIntList()).newTensor()

proc thnn_sigmoid_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_sigmoid_forward", self.toATensor()).newTensor()

proc thnn_sigmoid_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_sigmoid_forward", self.toATensor()).newTensor()

proc thnn_sigmoid_backward_impl*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_sigmoid_backward", grad_output.toATensor(), output.toATensor()).newTensor()

proc thnn_sigmoid_backward_impl*(grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_sigmoid_backward", grad_output.toATensor(), output.toATensor()).newTensor()

proc thnn_tanh_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_tanh_forward", self.toATensor()).newTensor()

proc thnn_tanh_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_tanh_forward", self.toATensor()).newTensor()

proc thnn_tanh_backward_impl*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_tanh_backward", grad_output.toATensor(), output.toATensor()).newTensor()

proc thnn_tanh_backward_impl*(grad_output: Tensor; output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_tanh_backward", grad_output.toATensor(), output.toATensor()).newTensor()

proc thnn_conv_transpose2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_transpose2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_transpose2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_transpose2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_transpose3d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_transpose3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_transpose3d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_transpose3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).toNimTuple().newTensors()

proc thnn_conv2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).toNimTuple().newTensors()

proc thnn_conv2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_conv_depthwise2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).newTensor()

proc thnn_conv_depthwise2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_conv_depthwise2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).newTensor()

proc thnn_conv_depthwise2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).toNimTuple().newTensors()

proc thnn_conv3d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).toNimTuple().newTensors()

proc thnn_conv3d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList()).toNimTuple().newTensors()

proc thnn_conv3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv3d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated2d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_dilated2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_dilated2d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_dilated2d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated3d_impl*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_dilated3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_dilated3d_impl*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_dilated3d_forward", self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), bias.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList()).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward_impl*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward_impl*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_col2im_impl*(ty: TensorType; self: Tensor; output_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_col2im_forward", self.toATensor(), output_size.toAIntList(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_col2im_impl*(self: Tensor; output_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_col2im_forward", self.toATensor(), output_size.toAIntList(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_col2im_backward_impl*(ty: TensorType; grad_output: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_col2im_backward", grad_output.toATensor(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_col2im_backward_impl*(grad_output: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_col2im_backward", grad_output.toATensor(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_im2col_impl*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_im2col_forward", self.toATensor(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_im2col_impl*(self: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_im2col_forward", self.toATensor(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_im2col_backward_impl*(ty: TensorType; grad_output: Tensor; input_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_thnn_im2col_backward", grad_output.toATensor(), input_size.toAIntList(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_im2col_backward_impl*(grad_output: Tensor; input_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_thnn_im2col_backward", grad_output.toATensor(), input_size.toAIntList(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc cast_Byte_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Byte", self.toATensor(), non_blocking).newTensor()

proc cast_Byte_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Byte", self.toATensor(), non_blocking).newTensor()

proc cast_Char_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Char", self.toATensor(), non_blocking).newTensor()

proc cast_Char_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Char", self.toATensor(), non_blocking).newTensor()

proc cast_Double_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Double", self.toATensor(), non_blocking).newTensor()

proc cast_Double_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Double", self.toATensor(), non_blocking).newTensor()

proc cast_Float_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Float", self.toATensor(), non_blocking).newTensor()

proc cast_Float_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Float", self.toATensor(), non_blocking).newTensor()

proc cast_Int_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Int", self.toATensor(), non_blocking).newTensor()

proc cast_Int_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Int", self.toATensor(), non_blocking).newTensor()

proc cast_Long_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Long", self.toATensor(), non_blocking).newTensor()

proc cast_Long_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Long", self.toATensor(), non_blocking).newTensor()

proc cast_Short_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Short", self.toATensor(), non_blocking).newTensor()

proc cast_Short_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Short", self.toATensor(), non_blocking).newTensor()

proc cast_Half_impl*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cast_Half", self.toATensor(), non_blocking).newTensor()

proc cast_Half_impl*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cast_Half", self.toATensor(), non_blocking).newTensor()

proc cudnn_ctc_loss_impl*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc cudnn_ctc_loss_impl*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc cudnn_rnn_flatten_weight_impl*(ty: TensorType; weight_arr: openarray[Tensor]; weight_stride0: int; input_size: int; mode: int; hidden_size: int; num_layers: int; batch_first: bool; bidirectional: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cudnn_rnn_flatten_weight", weight_arr.toATensors(), weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).newTensor()

proc cudnn_rnn_flatten_weight_impl*(weight_arr: openarray[Tensor]; weight_stride0: int; input_size: int; mode: int; hidden_size: int; num_layers: int; batch_first: bool; bidirectional: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cudnn_rnn_flatten_weight", weight_arr.toATensors(), weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).newTensor()

proc cudnn_rnn_impl*(ty: TensorType; input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.}

proc cudnn_rnn_impl*(input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.}

proc cudnn_rnn_backward_impl*(ty: TensorType; input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline.} = 
  ty[].atenMethod(StdTuple4[ATensor, ATensor, ATensor, ATensors], "_cudnn_rnn_backward", input.toATensor(), weight.toATensors(), weight_stride0, weight_buf.toATensor(), hx.toATensor(), cx.toATensor(), output.toATensor(), grad_output.toATensor(), grad_hy.toATensor(), grad_cy.toATensor(), mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.toATensor(), reserve.toATensor(), output_mask).toNimTuple().newTensors()

proc cudnn_rnn_backward_impl*(input: Tensor; weight: openarray[Tensor]; weight_stride0: int; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int; hidden_size: int; num_layers: int; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[int]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline.} = 
  atenFunction(StdTuple4[ATensor, ATensor, ATensor, ATensors], "at::_cudnn_rnn_backward", input.toATensor(), weight.toATensors(), weight_stride0, weight_buf.toATensor(), hx.toATensor(), cx.toATensor(), output.toATensor(), grad_output.toATensor(), grad_hy.toATensor(), grad_cy.toATensor(), mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.toATensor(), reserve.toATensor(), output_mask).toNimTuple().newTensors()

proc cudnn_init_dropout_state_impl*(ty: TensorType; dropout: float64; train: bool; dropout_seed: int; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cudnn_init_dropout_state", dropout, train, dropout_seed, options).newTensor()

proc cudnn_init_dropout_state_impl*(dropout: float64; train: bool; dropout_seed: int; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cudnn_init_dropout_state", dropout, train, dropout_seed, options).newTensor()

proc fused_dropout_impl*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_fused_dropout", self.toATensor(), p, generator).toNimTuple().newTensors()

proc fused_dropout_impl*(self: Tensor; p: float64; generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_fused_dropout", self.toATensor(), p, generator).toNimTuple().newTensors()

proc masked_scale_impl*(ty: TensorType; self: Tensor; mask: Tensor; scale: float64): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_masked_scale", self.toATensor(), mask.toATensor(), scale).newTensor()

proc masked_scale_impl*(self: Tensor; mask: Tensor; scale: float64): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_masked_scale", self.toATensor(), mask.toATensor(), scale).newTensor()

proc reshape_from_tensor_impl*(ty: TensorType; self: Tensor; shape: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_reshape_from_tensor", self.toATensor(), shape.toATensor()).newTensor()

proc reshape_from_tensor_impl*(self: Tensor; shape: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_reshape_from_tensor", self.toATensor(), shape.toATensor()).newTensor()

proc shape_as_tensor_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_shape_as_tensor", self.toATensor()).newTensor()

proc shape_as_tensor_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_shape_as_tensor", self.toATensor()).newTensor()

proc abs*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc abs*(self: Tensor): Tensor {.inline.}

proc abs_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "abs_", self.toATensor()); self

proc abs_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "abs_"); self

proc acos*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc acos*(self: Tensor): Tensor {.inline.}

proc acos_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "acos_", self.toATensor()); self

proc acos_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "acos_"); self

proc add*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc add*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc add_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "add_", self.toATensor(), other.toATensor(), alpha); self

proc add_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "add_", other.toATensor(), alpha); self

proc add*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc add*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc add_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "add_", self.toATensor(), other, alpha); self

proc add_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "add_", other, alpha); self

proc addmv*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmv*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmv_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "addmv_", self.toATensor(), mat.toATensor(), vec.toATensor(), beta, alpha); self

proc addmv_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "addmv_", mat.toATensor(), vec.toATensor(), beta, alpha); self

proc addr_special*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addr_special*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addr_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "addr_", self.toATensor(), vec1.toATensor(), vec2.toATensor(), beta, alpha); self

proc addr_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "addr_", vec1.toATensor(), vec2.toATensor(), beta, alpha); self

proc affine_grid_generator*(ty: TensorType; theta: Tensor; size: openarray[int]): Tensor {.inline.}

proc affine_grid_generator*(theta: Tensor; size: openarray[int]): Tensor {.inline.}

proc affine_grid_generator_backward*(ty: TensorType; grad: Tensor; size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "affine_grid_generator_backward", grad.toATensor(), size.toAIntList()).newTensor()

proc affine_grid_generator_backward*(grad: Tensor; size: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::affine_grid_generator_backward", grad.toATensor(), size.toAIntList()).newTensor()

proc all*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "all", self.toATensor(), dim, keepdim).newTensor()

proc all*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "all", dim, keepdim).newTensor()

proc allclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool {.inline.} = 
  ty[].atenMethod(bool, "allclose", self.toATensor(), other.toATensor(), rtol, atol, equal_nan)

proc allclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool {.inline.} = 
  self.tensor.atenMethod(bool, "allclose", other.toATensor(), rtol, atol, equal_nan)

proc any*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "any", self.toATensor(), dim, keepdim).newTensor()

proc any*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "any", dim, keepdim).newTensor()

proc arange*(ty: TensorType; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "arange", end_special, options).newTensor()

proc arange*(end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::arange", end_special, options).newTensor()

proc arange*(ty: TensorType; start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "arange", start, end_special, options).newTensor()

proc arange*(start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::arange", start, end_special, options).newTensor()

proc arange*(ty: TensorType; start: float; end_special: float; step: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "arange", start, end_special, step, options).newTensor()

proc arange*(start: float; end_special: float; step: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::arange", start, end_special, step, options).newTensor()

proc dim_arange_impl*(ty: TensorType; like: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_dim_arange", like.toATensor(), dim).newTensor()

proc dim_arange_impl*(like: Tensor; dim: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_dim_arange", like.toATensor(), dim).newTensor()

proc argmax*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "argmax", self.toATensor(), dim, keepdim).newTensor()

proc argmax*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "argmax", dim, keepdim).newTensor()

proc argmax*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "argmax", self.toATensor()).newTensor()

proc argmax*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "argmax").newTensor()

proc argmax_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_argmax", self.toATensor(), dim, keepdim).newTensor()

proc argmax_impl*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_argmax", self.toATensor(), dim, keepdim).newTensor()

proc argmin*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "argmin", self.toATensor(), dim, keepdim).newTensor()

proc argmin*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "argmin", dim, keepdim).newTensor()

proc argmin*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "argmin", self.toATensor()).newTensor()

proc argmin*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "argmin").newTensor()

proc argmin_impl*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_argmin", self.toATensor(), dim, keepdim).newTensor()

proc argmin_impl*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_argmin", self.toATensor(), dim, keepdim).newTensor()

proc as_strided*(ty: TensorType; self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "as_strided", self.toATensor(), size.toAIntList(), stride.toAIntList(), storage_offset).newTensor()

proc as_strided*(self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "as_strided", size.toAIntList(), stride.toAIntList(), storage_offset).newTensor()

proc as_strided_inplace*(ty: TensorType; self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "as_strided_", self.toATensor(), size.toAIntList(), stride.toAIntList(), storage_offset); self

proc as_strided_inplace*(self: Tensor; size: openarray[int]; stride: openarray[int]; storage_offset: int): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "as_strided_", size.toAIntList(), stride.toAIntList(), storage_offset); self

proc asin*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc asin*(self: Tensor): Tensor {.inline.}

proc asin_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "asin_", self.toATensor()); self

proc asin_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "asin_"); self

proc atan*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc atan*(self: Tensor): Tensor {.inline.}

proc atan_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "atan_", self.toATensor()); self

proc atan_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "atan_"); self

proc baddbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc baddbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc baddbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "baddbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc baddbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "baddbmm_", batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc baddbmm_mkl_impl_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_baddbmm_mkl_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc baddbmm_mkl_impl_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::_baddbmm_mkl_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc bartlett_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "bartlett_window", window_length, options).newTensor()

proc bartlett_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::bartlett_window", window_length, options).newTensor()

proc bartlett_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "bartlett_window", window_length, periodic, options).newTensor()

proc bartlett_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::bartlett_window", window_length, periodic, options).newTensor()

proc batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "batch_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), training, momentum, eps, cudnn_enabled).newTensor()

proc batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::batch_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), training, momentum, eps, cudnn_enabled).newTensor()

proc bernoulli*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc bernoulli*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli_inplace*(self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli_inplace*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.}

proc bernoulli*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "bernoulli", self.toATensor(), p, generator).newTensor()

proc bernoulli*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "bernoulli", p, generator).newTensor()

proc bilinear_internal*(ty: TensorType; input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "bilinear", input1.toATensor(), input2.toATensor(), weight.toATensor(), bias.toATensor()).newTensor()

proc bilinear_internal*(input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::bilinear", input1.toATensor(), input2.toATensor(), weight.toATensor(), bias.toATensor()).newTensor()

proc binary_cross_entropy_with_logits*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "binary_cross_entropy_with_logits", self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).newTensor()

proc binary_cross_entropy_with_logits*(self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::binary_cross_entropy_with_logits", self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).newTensor()

proc binary_cross_entropy_with_logits_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "binary_cross_entropy_with_logits_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).newTensor()

proc binary_cross_entropy_with_logits_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; pos_weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::binary_cross_entropy_with_logits_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), pos_weight.toATensor(), reduction).newTensor()

proc bincount*(ty: TensorType; self: Tensor; weights: Tensor; minlength: int = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "bincount", self.toATensor(), weights.toATensor(), minlength).newTensor()

proc bincount*(self: Tensor; weights: Tensor; minlength: int = 0): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "bincount", weights.toATensor(), minlength).newTensor()

proc blackman_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "blackman_window", window_length, options).newTensor()

proc blackman_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::blackman_window", window_length, options).newTensor()

proc blackman_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "blackman_window", window_length, periodic, options).newTensor()

proc blackman_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::blackman_window", window_length, periodic, options).newTensor()

proc bmm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.}

proc bmm*(self: Tensor; mat2: Tensor): Tensor {.inline.}

proc broadcast_tensors*(ty: TensorType; tensors: openarray[Tensor]): TensorList {.inline.} = 
  ty[].atenMethod(ATensors, "broadcast_tensors", tensors.toATensors()).newTensors()

proc broadcast_tensors*(tensors: openarray[Tensor]): TensorList {.inline.} = 
  atenFunction(ATensors, "at::broadcast_tensors", tensors.toATensors()).newTensors()

proc cat*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc cat*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc ceil*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc ceil*(self: Tensor): Tensor {.inline.}

proc ceil_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "ceil_", self.toATensor()); self

proc ceil_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "ceil_"); self

proc chain_matmul*(ty: TensorType; matrices: openarray[Tensor]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "chain_matmul", matrices.toATensors()).newTensor()

proc chain_matmul*(matrices: openarray[Tensor]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::chain_matmul", matrices.toATensors()).newTensor()

proc clamp*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "clamp", self.toATensor(), min, max).newTensor()

proc clamp*(self: Tensor; min: float; max: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "clamp", min, max).newTensor()

proc clamp_inplace*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "clamp_", self.toATensor(), min, max); self

proc clamp_inplace*(self: Tensor; min: float; max: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "clamp_", min, max); self

proc clamp_max*(ty: TensorType; self: Tensor; max: float): Tensor {.inline.}

proc clamp_max*(self: Tensor; max: float): Tensor {.inline.}

proc clamp_max_inplace*(ty: TensorType; self: Tensor; max: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "clamp_max_", self.toATensor(), max); self

proc clamp_max_inplace*(self: Tensor; max: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "clamp_max_", max); self

proc clamp_min*(ty: TensorType; self: Tensor; min: float): Tensor {.inline.}

proc clamp_min*(self: Tensor; min: float): Tensor {.inline.}

proc clamp_min_inplace*(ty: TensorType; self: Tensor; min: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "clamp_min_", self.toATensor(), min); self

proc clamp_min_inplace*(self: Tensor; min: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "clamp_min_", min); self

proc cudnn_is_acceptable*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "cudnn_is_acceptable", self.toATensor())

proc cudnn_is_acceptable*(self: Tensor): bool {.inline.} = 
  atenFunction(bool, "at::cudnn_is_acceptable", self.toATensor())

proc constant_pad_nd*(ty: TensorType; self: Tensor; pad: openarray[int]; value: float = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "constant_pad_nd", self.toATensor(), pad.toAIntList(), value).newTensor()

proc constant_pad_nd*(self: Tensor; pad: openarray[int]; value: float = 0): Tensor {.inline.} = 
  atenFunction(ATensor, "at::constant_pad_nd", self.toATensor(), pad.toAIntList(), value).newTensor()

proc convolution_double_backward_impl*(ty: TensorType; ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; transposed: bool; output_padding: openarray[int]; groups: int; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_convolution_double_backward", ggI.toATensor(), ggW.toATensor(), ggb.toATensor(), gO.toATensor(), weight.toATensor(), self.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList(), groups, benchmark, deterministic, cudnn_enabled, output_mask).toNimTuple().newTensors()

proc convolution_double_backward_impl*(ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; transposed: bool; output_padding: openarray[int]; groups: int; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_convolution_double_backward", ggI.toATensor(), ggW.toATensor(), ggb.toATensor(), gO.toATensor(), weight.toATensor(), self.toATensor(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList(), groups, benchmark, deterministic, cudnn_enabled, output_mask).toNimTuple().newTensors()

proc conv_tbc*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; pad: int = 0): Tensor {.inline.}

proc conv_tbc*(self: Tensor; weight: Tensor; bias: Tensor; pad: int = 0): Tensor {.inline.}

proc conv_tbc_backward*(ty: TensorType; self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "conv_tbc_backward", self.toATensor(), input.toATensor(), weight.toATensor(), bias.toATensor(), pad).toNimTuple().newTensors()

proc conv_tbc_backward*(self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::conv_tbc_backward", self.toATensor(), input.toATensor(), weight.toATensor(), bias.toATensor(), pad).toNimTuple().newTensors()

proc s_copy_inplace*(ty: TensorType; self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "s_copy_", self.toATensor(), src.toATensor(), non_blocking); self

proc s_copy_inplace*(self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::s_copy_", self.toATensor(), src.toATensor(), non_blocking); self

proc s_copy_from_impl*(ty: TensorType; self: Tensor; dst: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_s_copy_from", self.toATensor(), dst.toATensor(), non_blocking).newTensor()

proc s_copy_from_impl*(self: Tensor; dst: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_s_copy_from", self.toATensor(), dst.toATensor(), non_blocking).newTensor()

proc copy_same_type_impl_inplace*(ty: TensorType; self: Tensor; src: Tensor): void {.inline, discardable.} = 
  ty[].atenMethod(void, "_copy_same_type_", self.toATensor(), src.toATensor())

proc copy_same_type_impl_inplace*(self: Tensor; src: Tensor): void {.inline, discardable.} = 
  atenFunction(void, "at::_copy_same_type_", self.toATensor(), src.toATensor())

proc cos*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc cos*(self: Tensor): Tensor {.inline.}

proc cos_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "cos_", self.toATensor()); self

proc cos_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "cos_"); self

proc cosh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc cosh*(self: Tensor): Tensor {.inline.}

proc cosh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "cosh_", self.toATensor()); self

proc cosh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "cosh_"); self

proc cosine_embedding_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cosine_embedding_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).newTensor()

proc cosine_embedding_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cosine_embedding_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).newTensor()

proc cudnn_affine_grid_generator*(ty: TensorType; theta: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.}

proc cudnn_affine_grid_generator*(theta: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.}

proc cudnn_affine_grid_generator_backward*(ty: TensorType; grad: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cudnn_affine_grid_generator_backward", grad.toATensor(), N, C, H, W).newTensor()

proc cudnn_affine_grid_generator_backward*(grad: Tensor; N: int; C: int; H: int; W: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cudnn_affine_grid_generator_backward", grad.toATensor(), N, C, H, W).newTensor()

proc cudnn_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc cudnn_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc cudnn_batch_norm_backward*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "cudnn_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).toNimTuple().newTensors()

proc cudnn_batch_norm_backward*(input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::cudnn_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).toNimTuple().newTensors()

proc cudnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_backward_input*(ty: TensorType; self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cudnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_convolution_backward_input*(self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cudnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "cudnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc cudnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::cudnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc cudnn_convolution_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cudnn_convolution_backward_bias", grad_output.toATensor()).newTensor()

proc cudnn_convolution_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cudnn_convolution_backward_bias", grad_output.toATensor()).newTensor()

proc cudnn_convolution_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cudnn_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_convolution_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cudnn_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_convolution_transpose*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_transpose*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_transpose_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "cudnn_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::cudnn_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cudnn_convolution_transpose_backward_bias", grad_output.toATensor()).newTensor()

proc cudnn_convolution_transpose_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cudnn_convolution_transpose_backward_bias", grad_output.toATensor()).newTensor()

proc cudnn_convolution_transpose_backward_input*(ty: TensorType; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cudnn_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_convolution_transpose_backward_input*(grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cudnn_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_convolution_transpose_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cudnn_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_convolution_transpose_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cudnn_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc cudnn_grid_sampler*(ty: TensorType; self: Tensor; grid: Tensor): Tensor {.inline.}

proc cudnn_grid_sampler*(self: Tensor; grid: Tensor): Tensor {.inline.}

proc cudnn_grid_sampler_backward*(ty: TensorType; self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "cudnn_grid_sampler_backward", self.toATensor(), grid.toATensor(), grad_output.toATensor()).toNimTuple().newTensors()

proc cudnn_grid_sampler_backward*(self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::cudnn_grid_sampler_backward", self.toATensor(), grid.toATensor(), grad_output.toATensor()).toNimTuple().newTensors()

proc cumsum*(ty: TensorType; self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cumsum", self.toATensor(), dim, dtype).newTensor()

proc cumsum*(self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "cumsum", dim, dtype).newTensor()

proc cumsum*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cumsum", self.toATensor(), dim).newTensor()

proc cumsum*(self: Tensor; dim: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "cumsum", dim).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cumprod", self.toATensor(), dim, dtype).newTensor()

proc cumprod*(self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "cumprod", dim, dtype).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cumprod", self.toATensor(), dim).newTensor()

proc cumprod*(self: Tensor; dim: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "cumprod", dim).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), blank, reduction).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), blank, reduction).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int = 0; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toATensor(), target_lengths.toATensor(), blank, reduction).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int = 0; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::ctc_loss", log_probs.toATensor(), targets.toATensor(), input_lengths.toATensor(), target_lengths.toATensor(), blank, reduction).newTensor()

proc ctc_loss_impl*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc ctc_loss_impl*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; blank: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc ctc_loss_backward_impl*(ty: TensorType; grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_ctc_loss_backward", grad.toATensor(), log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), neg_log_likelihood.toATensor(), log_alpha.toATensor(), blank).newTensor()

proc ctc_loss_backward_impl*(grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[int]; target_lengths: openarray[int]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_ctc_loss_backward", grad.toATensor(), log_probs.toATensor(), targets.toATensor(), input_lengths.toAIntList(), target_lengths.toAIntList(), neg_log_likelihood.toATensor(), log_alpha.toATensor(), blank).newTensor()

proc det*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "det", self.toATensor()).newTensor()

proc det*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "det").newTensor()

proc diag_embed*(ty: TensorType; self: Tensor; offset: int = 0; dim1: int = -2; dim2: int = -1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "diag_embed", self.toATensor(), offset, dim1, dim2).newTensor()

proc diag_embed*(self: Tensor; offset: int = 0; dim1: int = -2; dim2: int = -1): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "diag_embed", offset, dim1, dim2).newTensor()

proc diagflat*(ty: TensorType; self: Tensor; offset: int = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "diagflat", self.toATensor(), offset).newTensor()

proc diagflat*(self: Tensor; offset: int = 0): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "diagflat", offset).newTensor()

proc diagonal*(ty: TensorType; self: Tensor; offset: int = 0; dim1: int = 0; dim2: int = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "diagonal", self.toATensor(), offset, dim1, dim2).newTensor()

proc diagonal*(self: Tensor; offset: int = 0; dim1: int = 0; dim2: int = 1): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "diagonal", offset, dim1, dim2).newTensor()

proc div_special*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc div_special*(self: Tensor; other: Tensor): Tensor {.inline.}

proc div_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "div_", self.toATensor(), other.toATensor()); self

proc div_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "div_", other.toATensor()); self

proc div_special*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc div_special*(self: Tensor; other: float): Tensor {.inline.}

proc div_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "div_", self.toATensor(), other); self

proc div_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "div_", other); self

proc dot*(ty: TensorType; self: Tensor; tensor: Tensor): Tensor {.inline.}

proc dot*(self: Tensor; tensor: Tensor): Tensor {.inline.}

proc einsum*(ty: TensorType; equation: StdString; tensors: openarray[Tensor]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "einsum", equation, tensors.toATensors()).newTensor()

proc einsum*(equation: StdString; tensors: openarray[Tensor]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::einsum", equation, tensors.toATensors()).newTensor()

proc embedding*(ty: TensorType; weight: Tensor; indices: Tensor; padding_idx: int = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.}

proc embedding*(weight: Tensor; indices: Tensor; padding_idx: int = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.}

proc embedding_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool; sparse: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "embedding_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq, sparse).newTensor()

proc embedding_backward*(grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool; sparse: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::embedding_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq, sparse).newTensor()

proc embedding_dense_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "embedding_dense_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).newTensor()

proc embedding_dense_backward*(grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::embedding_dense_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).newTensor()

proc embedding_renorm_inplace*(ty: TensorType; self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "embedding_renorm_", self.toATensor(), indices.toATensor(), max_norm, norm_type); self

proc embedding_renorm_inplace*(self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::embedding_renorm_", self.toATensor(), indices.toATensor(), max_norm, norm_type); self

proc embedding_sparse_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "embedding_sparse_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).newTensor()

proc embedding_sparse_backward*(grad: Tensor; indices: Tensor; num_weights: int; padding_idx: int; scale_grad_by_freq: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::embedding_sparse_backward", grad.toATensor(), indices.toATensor(), num_weights, padding_idx, scale_grad_by_freq).newTensor()

proc embedding_bag*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple4[ATensor, ATensor, ATensor, ATensor], "embedding_bag", weight.toATensor(), indices.toATensor(), offsets.toATensor(), scale_grad_by_freq, mode, sparse).toNimTuple().newTensors()

proc embedding_bag*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
  atenFunction(StdTuple4[ATensor, ATensor, ATensor, ATensor], "at::embedding_bag", weight.toATensor(), indices.toATensor(), offsets.toATensor(), scale_grad_by_freq, mode, sparse).toNimTuple().newTensors()

proc embedding_bag_impl*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.}

proc embedding_bag_impl*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.}

proc embedding_bag_backward_impl*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int; sparse: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_embedding_bag_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode, sparse).newTensor()

proc embedding_bag_backward_impl*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int; sparse: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_embedding_bag_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode, sparse).newTensor()

proc embedding_bag_sparse_backward_impl*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_embedding_bag_sparse_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), num_weights, scale_grad_by_freq, mode).newTensor()

proc embedding_bag_sparse_backward_impl*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_embedding_bag_sparse_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), num_weights, scale_grad_by_freq, mode).newTensor()

proc embedding_bag_dense_backward_impl*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_embedding_bag_dense_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode).newTensor()

proc embedding_bag_dense_backward_impl*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int; scale_grad_by_freq: bool; mode: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_embedding_bag_dense_backward", grad.toATensor(), indices.toATensor(), offsets.toATensor(), offset2bag.toATensor(), bag_size.toATensor(), maximum_indices.toATensor(), num_weights, scale_grad_by_freq, mode).newTensor()

proc empty*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "empty", size.toAIntList(), options).newTensor()

proc empty*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::empty", size.toAIntList(), options).newTensor()

proc resize_inplace*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "resize_", self.toATensor(), size.toAIntList()); self

proc resize_inplace*(self: Tensor; size: openarray[int]): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "resize_", size.toAIntList()); self

proc empty_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "empty_like", self.toATensor()).newTensor()

proc empty_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::empty_like", self.toATensor()).newTensor()

proc empty_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "empty_like", self.toATensor(), options).newTensor()

proc empty_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::empty_like", self.toATensor(), options).newTensor()

proc empty_strided*(ty: TensorType; size: openarray[int]; stride: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "empty_strided", size.toAIntList(), stride.toAIntList(), options).newTensor()

proc empty_strided*(size: openarray[int]; stride: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::empty_strided", size.toAIntList(), stride.toAIntList(), options).newTensor()

proc erf*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erf*(self: Tensor): Tensor {.inline.}

proc erf_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "erf_", self.toATensor()); self

proc erf_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "erf_"); self

proc erfc*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erfc*(self: Tensor): Tensor {.inline.}

proc erfc_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "erfc_", self.toATensor()); self

proc erfc_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "erfc_"); self

proc exp*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc exp*(self: Tensor): Tensor {.inline.}

proc exp_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "exp_", self.toATensor()); self

proc exp_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "exp_"); self

proc expm1*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc expm1*(self: Tensor): Tensor {.inline.}

proc expm1_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "expm1_", self.toATensor()); self

proc expm1_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "expm1_"); self

proc expand*(ty: TensorType; self: Tensor; size: openarray[int]; implicit: bool = false): Tensor {.inline.}

proc expand*(self: Tensor; size: openarray[int]; implicit: bool = false): Tensor {.inline.}

proc eye*(ty: TensorType; n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "eye", n, options).newTensor()

proc eye*(n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::eye", n, options).newTensor()

proc eye*(ty: TensorType; n: int; m: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "eye", n, m, options).newTensor()

proc eye*(n: int; m: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::eye", n, m, options).newTensor()

proc flatten*(ty: TensorType; self: Tensor; start_dim: int = 0; end_dim: int = -1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "flatten", self.toATensor(), start_dim, end_dim).newTensor()

proc flatten*(self: Tensor; start_dim: int = 0; end_dim: int = -1): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "flatten", start_dim, end_dim).newTensor()

proc fill_inplace*(ty: TensorType; self: Tensor; value: float): Tensor {.inline, discardable.}

proc fill_inplace*(self: Tensor; value: float): Tensor {.inline, discardable.}

proc fill_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc fill_inplace*(self: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc floor*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc floor*(self: Tensor): Tensor {.inline.}

proc floor_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "floor_", self.toATensor()); self

proc floor_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "floor_"); self

proc full*(ty: TensorType; size: openarray[int]; fill_value: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "full", size.toAIntList(), fill_value, options).newTensor()

proc full*(size: openarray[int]; fill_value: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::full", size.toAIntList(), fill_value, options).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "full_like", self.toATensor(), fill_value).newTensor()

proc full_like*(self: Tensor; fill_value: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::full_like", self.toATensor(), fill_value).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "full_like", self.toATensor(), fill_value, options).newTensor()

proc full_like*(self: Tensor; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::full_like", self.toATensor(), fill_value, options).newTensor()

proc grid_sampler*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "grid_sampler", input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).newTensor()

proc grid_sampler*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::grid_sampler", input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).newTensor()

proc grid_sampler_2d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_2d*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_2d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "grid_sampler_2d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).toNimTuple().newTensors()

proc grid_sampler_2d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::grid_sampler_2d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).toNimTuple().newTensors()

proc grid_sampler_3d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_3d*(input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): Tensor {.inline.}

proc grid_sampler_3d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "grid_sampler_3d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).toNimTuple().newTensors()

proc grid_sampler_3d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int; padding_mode: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::grid_sampler_3d_backward", grad_output.toATensor(), input.toATensor(), grid.toATensor(), interpolation_mode, padding_mode).toNimTuple().newTensors()

proc hann_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hann_window", window_length, options).newTensor()

proc hann_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hann_window", window_length, options).newTensor()

proc hann_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hann_window", window_length, periodic, options).newTensor()

proc hann_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hann_window", window_length, periodic, options).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hamming_window", window_length, options).newTensor()

proc hamming_window*(window_length: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hamming_window", window_length, options).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hamming_window", window_length, periodic, options).newTensor()

proc hamming_window*(window_length: int; periodic: bool; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hamming_window", window_length, periodic, options).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; periodic: bool; alpha: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hamming_window", window_length, periodic, alpha, options).newTensor()

proc hamming_window*(window_length: int; periodic: bool; alpha: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hamming_window", window_length, periodic, alpha, options).newTensor()

proc hamming_window*(ty: TensorType; window_length: int; periodic: bool; alpha: float64; beta: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hamming_window", window_length, periodic, alpha, beta, options).newTensor()

proc hamming_window*(window_length: int; periodic: bool; alpha: float64; beta: float64; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hamming_window", window_length, periodic, alpha, beta, options).newTensor()

proc hinge_embedding_loss*(ty: TensorType; self: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hinge_embedding_loss", self.toATensor(), target.toATensor(), margin, reduction).newTensor()

proc hinge_embedding_loss*(self: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hinge_embedding_loss", self.toATensor(), target.toATensor(), margin, reduction).newTensor()

proc ger*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor {.inline.}

proc ger*(self: Tensor; vec2: Tensor): Tensor {.inline.}

proc gesv*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "gesv", self.toATensor(), A.toATensor()).toNimTuple().newTensors()

proc gesv*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "gesv", A.toATensor()).toNimTuple().newTensors()

proc gesv_helper_impl*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_gesv_helper", self.toATensor(), A.toATensor()).toNimTuple().newTensors()

proc gesv_helper_impl*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_gesv_helper", self.toATensor(), A.toATensor()).toNimTuple().newTensors()

proc group_norm*(ty: TensorType; input: Tensor; num_groups: int; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "group_norm", input.toATensor(), num_groups, weight.toATensor(), bias.toATensor(), eps, cudnn_enabled).newTensor()

proc group_norm*(input: Tensor; num_groups: int; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor {.inline.} = 
  atenFunction(ATensor, "at::group_norm", input.toATensor(), num_groups, weight.toATensor(), bias.toATensor(), eps, cudnn_enabled).newTensor()

proc fft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "fft", self.toATensor(), signal_ndim, normalized).newTensor()

proc fft*(self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "fft", signal_ndim, normalized).newTensor()

proc ifft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ifft", self.toATensor(), signal_ndim, normalized).newTensor()

proc ifft*(self: Tensor; signal_ndim: int; normalized: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "ifft", signal_ndim, normalized).newTensor()

proc rfft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rfft", self.toATensor(), signal_ndim, normalized, onesided).newTensor()

proc rfft*(self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "rfft", signal_ndim, normalized, onesided).newTensor()

proc irfft*(ty: TensorType; self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "irfft", self.toATensor(), signal_ndim, normalized, onesided, signal_sizes.toAIntList()).newTensor()

proc irfft*(self: Tensor; signal_ndim: int; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[int]): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "irfft", signal_ndim, normalized, onesided, signal_sizes.toAIntList()).newTensor()

proc fft_with_size_impl*(ty: TensorType; self: Tensor; signal_ndim: int; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[int]; normalized: bool; onesided: bool; output_sizes: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_fft_with_size", self.toATensor(), signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList(), normalized, onesided, output_sizes.toAIntList()).newTensor()

proc fft_with_size_impl*(self: Tensor; signal_ndim: int; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[int]; normalized: bool; onesided: bool; output_sizes: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_fft_with_size", self.toATensor(), signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList(), normalized, onesided, output_sizes.toAIntList()).newTensor()

proc cufft_get_plan_cache_size_impl*(ty: TensorType; ): int {.inline.} = 
  ty[].atenMethod(int, "_cufft_get_plan_cache_size")

proc cufft_get_plan_cache_size_impl*(): int {.inline.} = 
  atenFunction(int, "at::_cufft_get_plan_cache_size")

proc cufft_get_plan_cache_max_size_impl*(ty: TensorType; ): int {.inline.} = 
  ty[].atenMethod(int, "_cufft_get_plan_cache_max_size")

proc cufft_get_plan_cache_max_size_impl*(): int {.inline.} = 
  atenFunction(int, "at::_cufft_get_plan_cache_max_size")

proc cufft_set_plan_cache_max_size_impl*(ty: TensorType; max_size: int): void {.inline.} = 
  ty[].atenMethod(void, "_cufft_set_plan_cache_max_size", max_size)

proc cufft_set_plan_cache_max_size_impl*(max_size: int): void {.inline.} = 
  atenFunction(void, "at::_cufft_set_plan_cache_max_size", max_size)

proc cufft_clear_plan_cache_impl*(ty: TensorType; ): void {.inline.} = 
  ty[].atenMethod(void, "_cufft_clear_plan_cache")

proc cufft_clear_plan_cache_impl*(): void {.inline.} = 
  atenFunction(void, "at::_cufft_clear_plan_cache")

proc index*(ty: TensorType; self: Tensor; indices: openarray[Tensor]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "index", self.toATensor(), indices.toATensors()).newTensor()

proc index*(self: Tensor; indices: openarray[Tensor]): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "index", indices.toATensors()).newTensor()

proc index_copy_inplace*(ty: TensorType; self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_copy_inplace*(self: Tensor; dim: int; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_put*(ty: TensorType; self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "index_put", self.toATensor(), indices.toATensors(), values.toATensor(), accumulate).newTensor()

proc index_put*(self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "index_put", indices.toATensors(), values.toATensor(), accumulate).newTensor()

proc index_put_inplace*(ty: TensorType; self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc index_put_inplace*(self: Tensor; indices: openarray[Tensor]; values: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc instance_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; use_input_stats: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "instance_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), use_input_stats, momentum, eps, cudnn_enabled).newTensor()

proc instance_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; use_input_stats: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::instance_norm", input.toATensor(), weight.toATensor(), bias.toATensor(), running_mean.toATensor(), running_var.toATensor(), use_input_stats, momentum, eps, cudnn_enabled).newTensor()

proc inverse*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc inverse*(self: Tensor): Tensor {.inline.}

proc inverse_helper_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_inverse_helper", self.toATensor()).newTensor()

proc inverse_helper_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_inverse_helper", self.toATensor()).newTensor()

proc isclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "isclose", self.toATensor(), other.toATensor(), rtol, atol, equal_nan).newTensor()

proc isclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "isclose", other.toATensor(), rtol, atol, equal_nan).newTensor()

proc isnan*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "isnan", self.toATensor()).newTensor()

proc isnan*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::isnan", self.toATensor()).newTensor()

proc is_distributed*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_distributed", self.toATensor())

proc is_distributed*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_distributed")

proc is_floating_point*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_floating_point", self.toATensor())

proc is_floating_point*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_floating_point")

proc is_complex*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_complex", self.toATensor())

proc is_complex*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_complex")

proc is_nonzero*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_nonzero", self.toATensor())

proc is_nonzero*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_nonzero")

proc is_same_size*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_same_size", self.toATensor(), other.toATensor())

proc is_same_size*(self: Tensor; other: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_same_size", other.toATensor())

proc is_signed*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_signed", self.toATensor())

proc is_signed*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_signed")

proc kl_div*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "kl_div", self.toATensor(), target.toATensor(), reduction).newTensor()

proc kl_div*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::kl_div", self.toATensor(), target.toATensor(), reduction).newTensor()

proc kl_div_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "kl_div_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc kl_div_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::kl_div_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc kthvalue*(ty: TensorType; self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "kthvalue", self.toATensor(), k, dim, keepdim).toNimTuple().newTensors()

proc kthvalue*(self: Tensor; k: int; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "kthvalue", k, dim, keepdim).toNimTuple().newTensors()

proc layer_norm*(ty: TensorType; input: Tensor; normalized_shape: openarray[int]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "layer_norm", input.toATensor(), normalized_shape.toAIntList(), weight.toATensor(), bias.toATensor(), eps, cudnn_enable).newTensor()

proc layer_norm*(input: Tensor; normalized_shape: openarray[int]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor {.inline.} = 
  atenFunction(ATensor, "at::layer_norm", input.toATensor(), normalized_shape.toAIntList(), weight.toATensor(), bias.toATensor(), eps, cudnn_enable).newTensor()

proc linear_internal*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "linear", input.toATensor(), weight.toATensor(), bias.toATensor()).newTensor()

proc linear_internal*(input: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::linear", input.toATensor(), weight.toATensor(), bias.toATensor()).newTensor()

proc fbgemm_linear_int8_weight*(ty: TensorType; input: Tensor; weight: Tensor; packed: Tensor; col_offsets: Tensor; weight_scale: float; weight_zero_point: float; bias: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "fbgemm_linear_int8_weight", input.toATensor(), weight.toATensor(), packed.toATensor(), col_offsets.toATensor(), weight_scale, weight_zero_point, bias.toATensor()).newTensor()

proc fbgemm_linear_int8_weight*(input: Tensor; weight: Tensor; packed: Tensor; col_offsets: Tensor; weight_scale: float; weight_zero_point: float; bias: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::fbgemm_linear_int8_weight", input.toATensor(), weight.toATensor(), packed.toATensor(), col_offsets.toATensor(), weight_scale, weight_zero_point, bias.toATensor()).newTensor()

proc fbgemm_linear_quantize_weight*(ty: TensorType; input: Tensor): tuple[result0: Tensor, result1: Tensor, result2: float64, result3: int] {.inline.} = 
  ty[].atenMethod(StdTuple4[ATensor, ATensor, float64, int], "fbgemm_linear_quantize_weight", input.toATensor()).toNimTuple().newTensors()

proc fbgemm_linear_quantize_weight*(input: Tensor): tuple[result0: Tensor, result1: Tensor, result2: float64, result3: int] {.inline.} = 
  atenFunction(StdTuple4[ATensor, ATensor, float64, int], "at::fbgemm_linear_quantize_weight", input.toATensor()).toNimTuple().newTensors()

proc fbgemm_pack_quantized_matrix*(ty: TensorType; input: Tensor; K: int; N: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "fbgemm_pack_quantized_matrix", input.toATensor(), K, N).newTensor()

proc fbgemm_pack_quantized_matrix*(input: Tensor; K: int; N: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::fbgemm_pack_quantized_matrix", input.toATensor(), K, N).newTensor()

proc fbgemm_is_cpu_supported*(ty: TensorType; ): bool {.inline.} = 
  ty[].atenMethod(bool, "fbgemm_is_cpu_supported")

proc fbgemm_is_cpu_supported*(): bool {.inline.} = 
  atenFunction(bool, "at::fbgemm_is_cpu_supported")

proc linspace*(ty: TensorType; start: float; end_special: float; steps: int = 100; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "linspace", start, end_special, steps, options).newTensor()

proc linspace*(start: float; end_special: float; steps: int = 100; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::linspace", start, end_special, steps, options).newTensor()

proc log*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log*(self: Tensor): Tensor {.inline.}

proc log_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "log_", self.toATensor()); self

proc log_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "log_"); self

proc log10*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log10*(self: Tensor): Tensor {.inline.}

proc log10_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "log10_", self.toATensor()); self

proc log10_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "log10_"); self

proc log1p*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "log1p", self.toATensor()).newTensor()

proc log1p*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "log1p").newTensor()

proc log1p_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "log1p_", self.toATensor()); self

proc log1p_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "log1p_"); self

proc log2*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log2*(self: Tensor): Tensor {.inline.}

proc log2_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "log2_", self.toATensor()); self

proc log2_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "log2_"); self

proc logdet*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "logdet", self.toATensor()).newTensor()

proc logdet*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "logdet").newTensor()

proc logspace*(ty: TensorType; start: float; end_special: float; steps: int = 100; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "logspace", start, end_special, steps, options).newTensor()

proc logspace*(start: float; end_special: float; steps: int = 100; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::logspace", start, end_special, steps, options).newTensor()

proc log_softmax_impl*(ty: TensorType; self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc log_softmax_impl*(self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc log_softmax_backward_data_impl*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_log_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).newTensor()

proc log_softmax_backward_data_impl*(grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_log_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).newTensor()

proc logsumexp*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "logsumexp", self.toATensor(), dim, keepdim).newTensor()

proc logsumexp*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "logsumexp", dim, keepdim).newTensor()

proc margin_ranking_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "margin_ranking_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).newTensor()

proc margin_ranking_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::margin_ranking_loss", input1.toATensor(), input2.toATensor(), target.toATensor(), margin, reduction).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; tol: float64; symmetric: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "matrix_rank", self.toATensor(), tol, symmetric).newTensor()

proc matrix_rank*(self: Tensor; tol: float64; symmetric: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::matrix_rank", self.toATensor(), tol, symmetric).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; symmetric: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "matrix_rank", self.toATensor(), symmetric).newTensor()

proc matrix_rank*(self: Tensor; symmetric: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::matrix_rank", self.toATensor(), symmetric).newTensor()

proc matrix_power*(ty: TensorType; self: Tensor; n: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "matrix_power", self.toATensor(), n).newTensor()

proc matrix_power*(self: Tensor; n: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "matrix_power", n).newTensor()

proc max*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "max", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc max*(self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "max", dim, keepdim).toNimTuple().newTensors()

proc max_values*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "max_values", self.toATensor(), dim, keepdim).newTensor()

proc max_values*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "max_values", dim, keepdim).newTensor()

proc mean*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "mean", self.toATensor(), dtype).newTensor()

proc mean*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "mean", dtype).newTensor()

proc mean*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc mean*(self: Tensor): Tensor {.inline.}

proc mean*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "mean", self.toATensor(), dim.toAIntList(), keepdim, dtype).newTensor()

proc mean*(self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "mean", dim.toAIntList(), keepdim, dtype).newTensor()

proc mean*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc mean*(self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc mean*(ty: TensorType; self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "mean", self.toATensor(), dim.toAIntList(), dtype).newTensor()

proc mean*(self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "mean", dim.toAIntList(), dtype).newTensor()

proc median*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "median", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc median*(self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "median", dim, keepdim).toNimTuple().newTensors()

proc min*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "min", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc min*(self: Tensor; dim: int; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "min", dim, keepdim).toNimTuple().newTensors()

proc min_values*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "min_values", self.toATensor(), dim, keepdim).newTensor()

proc min_values*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "min_values", dim, keepdim).newTensor()

proc mkldnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int): Tensor {.inline.}

proc mkldnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int): Tensor {.inline.}

proc mkldnn_convolution_backward_input*(ty: TensorType; self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "mkldnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).newTensor()

proc mkldnn_convolution_backward_input*(self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::mkldnn_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).newTensor()

proc mkldnn_convolution_backward_weights*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "mkldnn_convolution_backward_weights", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).toNimTuple().newTensors()

proc mkldnn_convolution_backward_weights*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::mkldnn_convolution_backward_weights", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "mkldnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, output_mask).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::mkldnn_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, output_mask).toNimTuple().newTensors()

proc miopen_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc miopen_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc miopen_batch_norm_backward*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "miopen_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).toNimTuple().newTensors()

proc miopen_batch_norm_backward*(input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::miopen_batch_norm_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_var.toATensor(), epsilon).toNimTuple().newTensors()

proc miopen_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution_backward_input*(ty: TensorType; self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "miopen_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc miopen_convolution_backward_input*(self_size: openarray[int]; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::miopen_convolution_backward_input", self_size.toAIntList(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc miopen_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "miopen_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc miopen_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::miopen_convolution_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc miopen_convolution_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "miopen_convolution_backward_bias", grad_output.toATensor()).newTensor()

proc miopen_convolution_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::miopen_convolution_backward_bias", grad_output.toATensor()).newTensor()

proc miopen_convolution_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "miopen_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc miopen_convolution_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::miopen_convolution_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc miopen_convolution_transpose*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution_transpose*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc miopen_convolution_transpose_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "miopen_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc miopen_convolution_transpose_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::miopen_convolution_transpose_backward", self.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).toNimTuple().newTensors()

proc miopen_convolution_transpose_backward_input*(ty: TensorType; grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "miopen_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc miopen_convolution_transpose_backward_input*(grad_output: Tensor; weight: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::miopen_convolution_transpose_backward_input", grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc miopen_convolution_transpose_backward_weight*(ty: TensorType; weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "miopen_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc miopen_convolution_transpose_backward_weight*(weight_size: openarray[int]; grad_output: Tensor; self: Tensor; padding: openarray[int]; stride: openarray[int]; dilation: openarray[int]; groups: int; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::miopen_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.toATensor(), self.toATensor(), padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).newTensor()

proc mm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.}

proc mm*(self: Tensor; mat2: Tensor): Tensor {.inline.}

proc sparse_mm_impl*(ty: TensorType; sparse: Tensor; dense: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_mm", sparse.toATensor(), dense.toATensor()).newTensor()

proc sparse_mm_impl*(sparse: Tensor; dense: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_mm", sparse.toATensor(), dense.toATensor()).newTensor()

proc mode*(ty: TensorType; self: Tensor; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "mode", self.toATensor(), dim, keepdim).toNimTuple().newTensors()

proc mode*(self: Tensor; dim: int = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "mode", dim, keepdim).toNimTuple().newTensors()

proc mul*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc mul*(self: Tensor; other: Tensor): Tensor {.inline.}

proc mul_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "mul_", self.toATensor(), other.toATensor()); self

proc mul_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "mul_", other.toATensor()); self

proc mul*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc mul*(self: Tensor; other: float): Tensor {.inline.}

proc mul_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "mul_", self.toATensor(), other); self

proc mul_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "mul_", other); self

proc mv*(ty: TensorType; self: Tensor; vec: Tensor): Tensor {.inline.}

proc mv*(self: Tensor; vec: Tensor): Tensor {.inline.}

proc mvlgamma*(ty: TensorType; self: Tensor; p: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "mvlgamma", self.toATensor(), p).newTensor()

proc mvlgamma*(self: Tensor; p: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "mvlgamma", p).newTensor()

proc mvlgamma_inplace*(ty: TensorType; self: Tensor; p: int): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "mvlgamma_", self.toATensor(), p); self

proc mvlgamma_inplace*(self: Tensor; p: int): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "mvlgamma_", p); self

proc narrow_copy*(ty: TensorType; self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "narrow_copy", self.toATensor(), dim, start, length).newTensor()

proc narrow_copy*(self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "narrow_copy", dim, start, length).newTensor()

proc narrow*(ty: TensorType; self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "narrow", self.toATensor(), dim, start, length).newTensor()

proc narrow*(self: Tensor; dim: int; start: int; length: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "narrow", dim, start, length).newTensor()

proc native_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc native_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc native_batch_norm_backward*(ty: TensorType; grad_out: Tensor; input: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_invstd: Tensor; train: bool; eps: float64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "native_batch_norm_backward", grad_out.toATensor(), input.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_invstd.toATensor(), train, eps, output_mask).toNimTuple().newTensors()

proc native_batch_norm_backward*(grad_out: Tensor; input: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_invstd: Tensor; train: bool; eps: float64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::native_batch_norm_backward", grad_out.toATensor(), input.toATensor(), weight.toATensor(), running_mean.toATensor(), running_var.toATensor(), save_mean.toATensor(), save_invstd.toATensor(), train, eps, output_mask).toNimTuple().newTensors()

proc batch_norm_update_stats*(ty: TensorType; input: Tensor; running_mean: Tensor; running_var: Tensor; momentum: float64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "batch_norm_update_stats", input.toATensor(), running_mean.toATensor(), running_var.toATensor(), momentum).toNimTuple().newTensors()

proc batch_norm_update_stats*(input: Tensor; running_mean: Tensor; running_var: Tensor; momentum: float64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::batch_norm_update_stats", input.toATensor(), running_mean.toATensor(), running_var.toATensor(), momentum).toNimTuple().newTensors()

proc nnpack_available_impl*(ty: TensorType; ): bool {.inline.} = 
  ty[].atenMethod(bool, "_nnpack_available")

proc nnpack_available_impl*(): bool {.inline.} = 
  atenFunction(bool, "at::_nnpack_available")

proc nnpack_spatial_convolution_impl*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]): Tensor {.inline.}

proc nnpack_spatial_convolution_impl*(input: Tensor; weight: Tensor; bias: Tensor; padding: openarray[int]): Tensor {.inline.}

proc nnpack_spatial_convolution_backward_impl*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "_nnpack_spatial_convolution_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_mask).toNimTuple().newTensors()

proc nnpack_spatial_convolution_backward_impl*(input: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::_nnpack_spatial_convolution_backward", input.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList(), output_mask).toNimTuple().newTensors()

proc nnpack_spatial_convolution_backward_input_impl*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_nnpack_spatial_convolution_backward_input", input.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList()).newTensor()

proc nnpack_spatial_convolution_backward_input_impl*(input: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_nnpack_spatial_convolution_backward_input", input.toATensor(), grad_output.toATensor(), weight.toATensor(), padding.toAIntList()).newTensor()

proc nnpack_spatial_convolution_backward_weight_impl*(ty: TensorType; input: Tensor; weightsize: openarray[int]; grad_output: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_nnpack_spatial_convolution_backward_weight", input.toATensor(), weightsize.toAIntList(), grad_output.toATensor(), padding.toAIntList()).newTensor()

proc nnpack_spatial_convolution_backward_weight_impl*(input: Tensor; weightsize: openarray[int]; grad_output: Tensor; padding: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_nnpack_spatial_convolution_backward_weight", input.toATensor(), weightsize.toAIntList(), grad_output.toATensor(), padding.toAIntList()).newTensor()

proc ones*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ones", size.toAIntList(), options).newTensor()

proc ones*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::ones", size.toAIntList(), options).newTensor()

proc ones_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ones_like", self.toATensor()).newTensor()

proc ones_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::ones_like", self.toATensor()).newTensor()

proc ones_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ones_like", self.toATensor(), options).newTensor()

proc ones_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::ones_like", self.toATensor(), options).newTensor()

proc pairwise_distance*(ty: TensorType; x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "pairwise_distance", x1.toATensor(), x2.toATensor(), p, eps, keepdim).newTensor()

proc pairwise_distance*(x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::pairwise_distance", x1.toATensor(), x2.toATensor(), p, eps, keepdim).newTensor()

proc pdist*(ty: TensorType; self: Tensor; p: float64 = 2): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "pdist", self.toATensor(), p).newTensor()

proc pdist*(self: Tensor; p: float64 = 2): Tensor {.inline.} = 
  atenFunction(ATensor, "at::pdist", self.toATensor(), p).newTensor()

proc pdist_forward_impl*(ty: TensorType; self: Tensor; p: float64 = 2): Tensor {.inline.}

proc pdist_forward_impl*(self: Tensor; p: float64 = 2): Tensor {.inline.}

proc pdist_backward_impl*(ty: TensorType; grad: Tensor; self: Tensor; p: float64; pdist: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_pdist_backward", grad.toATensor(), self.toATensor(), p, pdist.toATensor()).newTensor()

proc pdist_backward_impl*(grad: Tensor; self: Tensor; p: float64; pdist: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_pdist_backward", grad.toATensor(), self.toATensor(), p, pdist.toATensor()).newTensor()

proc cosine_similarity*(ty: TensorType; x1: Tensor; x2: Tensor; dim: int = 1; eps: float64): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cosine_similarity", x1.toATensor(), x2.toATensor(), dim, eps).newTensor()

proc cosine_similarity*(x1: Tensor; x2: Tensor; dim: int = 1; eps: float64): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cosine_similarity", x1.toATensor(), x2.toATensor(), dim, eps).newTensor()

proc permute*(ty: TensorType; self: Tensor; dims: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "permute", self.toATensor(), dims.toAIntList()).newTensor()

proc permute*(self: Tensor; dims: openarray[int]): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "permute", dims.toAIntList()).newTensor()

proc pixel_shuffle*(ty: TensorType; self: Tensor; upscale_factor: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "pixel_shuffle", self.toATensor(), upscale_factor).newTensor()

proc pixel_shuffle*(self: Tensor; upscale_factor: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::pixel_shuffle", self.toATensor(), upscale_factor).newTensor()

proc pin_memory*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "pin_memory", self.toATensor()).newTensor()

proc pin_memory*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "pin_memory").newTensor()

proc pinverse*(ty: TensorType; self: Tensor; rcond: float64): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "pinverse", self.toATensor(), rcond).newTensor()

proc pinverse*(self: Tensor; rcond: float64): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "pinverse", rcond).newTensor()

proc scalar_tensor*(ty: TensorType; s: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "scalar_tensor", s, options).newTensor()

proc scalar_tensor*(s: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::scalar_tensor", s, options).newTensor()

proc rand*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rand", size.toAIntList(), options).newTensor()

proc rand*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::rand", size.toAIntList(), options).newTensor()

proc rand*(ty: TensorType; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rand", size.toAIntList(), generator, options).newTensor()

proc rand*(size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::rand", size.toAIntList(), generator, options).newTensor()

proc rand_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rand_like", self.toATensor()).newTensor()

proc rand_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::rand_like", self.toATensor()).newTensor()

proc rand_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rand_like", self.toATensor(), options).newTensor()

proc rand_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::rand_like", self.toATensor(), options).newTensor()

proc randint*(ty: TensorType; high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint", high, size.toAIntList(), options).newTensor()

proc randint*(high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint", high, size.toAIntList(), options).newTensor()

proc randint*(ty: TensorType; high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint", high, size.toAIntList(), generator, options).newTensor()

proc randint*(high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint", high, size.toAIntList(), generator, options).newTensor()

proc randint*(ty: TensorType; low: int; high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint", low, high, size.toAIntList(), options).newTensor()

proc randint*(low: int; high: int; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint", low, high, size.toAIntList(), options).newTensor()

proc randint*(ty: TensorType; low: int; high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint", low, high, size.toAIntList(), generator, options).newTensor()

proc randint*(low: int; high: int; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint", low, high, size.toAIntList(), generator, options).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint_like", self.toATensor(), high).newTensor()

proc randint_like*(self: Tensor; high: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint_like", self.toATensor(), high).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int; high: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint_like", self.toATensor(), low, high).newTensor()

proc randint_like*(self: Tensor; low: int; high: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint_like", self.toATensor(), low, high).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint_like", self.toATensor(), high, options).newTensor()

proc randint_like*(self: Tensor; high: int; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint_like", self.toATensor(), high, options).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int; high: int; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randint_like", self.toATensor(), low, high, options).newTensor()

proc randint_like*(self: Tensor; low: int; high: int; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randint_like", self.toATensor(), low, high, options).newTensor()

proc randn*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randn", size.toAIntList(), options).newTensor()

proc randn*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randn", size.toAIntList(), options).newTensor()

proc randn*(ty: TensorType; size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randn", size.toAIntList(), generator, options).newTensor()

proc randn*(size: openarray[int]; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randn", size.toAIntList(), generator, options).newTensor()

proc randn_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randn_like", self.toATensor()).newTensor()

proc randn_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randn_like", self.toATensor()).newTensor()

proc randn_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randn_like", self.toATensor(), options).newTensor()

proc randn_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randn_like", self.toATensor(), options).newTensor()

proc randperm*(ty: TensorType; n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randperm", n, options).newTensor()

proc randperm*(n: int; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randperm", n, options).newTensor()

proc randperm*(ty: TensorType; n: int; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "randperm", n, generator, options).newTensor()

proc randperm*(n: int; generator: Generator; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::randperm", n, generator, options).newTensor()

proc range*(ty: TensorType; start: float; end_special: float; step: float = 1; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "range", start, end_special, step, options).newTensor()

proc range*(start: float; end_special: float; step: float = 1; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::range", start, end_special, step, options).newTensor()

proc range*(ty: TensorType; start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "range", start, end_special, options).newTensor()

proc range*(start: float; end_special: float; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::range", start, end_special, options).newTensor()

proc repeat*(ty: TensorType; self: Tensor; repeats: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "repeat", self.toATensor(), repeats.toAIntList()).newTensor()

proc repeat*(self: Tensor; repeats: openarray[int]): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "repeat", repeats.toAIntList()).newTensor()

proc reshape*(ty: TensorType; self: Tensor; shape: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "reshape", self.toATensor(), shape.toAIntList()).newTensor()

proc reshape*(self: Tensor; shape: openarray[int]): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "reshape", shape.toAIntList()).newTensor()

proc reshape_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "reshape_as", self.toATensor(), other.toATensor()).newTensor()

proc reshape_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "reshape_as", other.toATensor()).newTensor()

proc RoiPooling2d_forward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc RoiPooling2d_forward*(input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc RoiPooling2d_backward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "RoiPooling2d_backward", input.toATensor(), rois.toATensor(), pooledHeight, pooledWidth, spatialScale, gradOutput.toATensor(), argmaxes.toATensor()).newTensor()

proc RoiPooling2d_backward*(input: Tensor; rois: Tensor; pooledHeight: int; pooledWidth: int; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::RoiPooling2d_backward", input.toATensor(), rois.toATensor(), pooledHeight, pooledWidth, spatialScale, gradOutput.toATensor(), argmaxes.toATensor()).newTensor()

proc round*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc round*(self: Tensor): Tensor {.inline.}

proc round_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "round_", self.toATensor()); self

proc round_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "round_"); self

proc rrelu*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rrelu", self.toATensor(), lower, upper, training, generator).newTensor()

proc rrelu*(self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  atenFunction(ATensor, "at::rrelu", self.toATensor(), lower, upper, training, generator).newTensor()

proc rrelu_inplace*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "rrelu_", self.toATensor(), lower, upper, training, generator); self

proc rrelu_inplace*(self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::rrelu_", self.toATensor(), lower, upper, training, generator); self

proc relu*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc relu*(self: Tensor): Tensor {.inline.}

proc relu_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.}

proc relu_inplace*(self: Tensor): Tensor {.inline, discardable.}

proc prelu*(ty: TensorType; self: Tensor; weight: Tensor): Tensor {.inline.}

proc prelu*(self: Tensor; weight: Tensor): Tensor {.inline.}

proc prelu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "prelu_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor()).toNimTuple().newTensors()

proc prelu_backward*(grad_output: Tensor; self: Tensor; weight: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "prelu_backward", grad_output.toATensor(), weight.toATensor()).toNimTuple().newTensors()

proc hardshrink*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink*(self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink_backward*(ty: TensorType; grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink_backward*(grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc rsqrt*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc rsqrt*(self: Tensor): Tensor {.inline.}

proc rsqrt_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "rsqrt_", self.toATensor()); self

proc rsqrt_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "rsqrt_"); self

proc select*(ty: TensorType; self: Tensor; dim: int; index: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "select", self.toATensor(), dim, index).newTensor()

proc select*(self: Tensor; dim: int; index: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "select", dim, index).newTensor()

proc selu*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "selu", self.toATensor()).newTensor()

proc selu*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::selu", self.toATensor()).newTensor()

proc selu_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "selu_", self.toATensor()); self

proc selu_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::selu_", self.toATensor()); self

proc celu*(ty: TensorType; self: Tensor; alpha: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "celu", self.toATensor(), alpha).newTensor()

proc celu*(self: Tensor; alpha: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::celu", self.toATensor(), alpha).newTensor()

proc celu_inplace*(ty: TensorType; self: Tensor; alpha: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "celu_", self.toATensor(), alpha); self

proc celu_inplace*(self: Tensor; alpha: float): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::celu_", self.toATensor(), alpha); self

proc sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sigmoid*(self: Tensor): Tensor {.inline.}

proc sigmoid_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sigmoid_", self.toATensor()); self

proc sigmoid_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sigmoid_"); self

proc sin*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sin*(self: Tensor): Tensor {.inline.}

proc sin_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sin_", self.toATensor()); self

proc sin_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sin_"); self

proc sinh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sinh*(self: Tensor): Tensor {.inline.}

proc sinh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sinh_", self.toATensor()); self

proc sinh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sinh_"); self

proc size*(ty: TensorType; self: Tensor; dim: int): int {.inline.} = 
  ty[].atenMethod(int, "size", self.toATensor(), dim)

proc size*(self: Tensor; dim: int): int {.inline.} = 
  self.tensor.atenMethod(int, "size", dim)

proc slice*(ty: TensorType; self: Tensor; dim: int = 0; start: int = 0; end_special: int = int.high; step: int = 1): Tensor {.inline.}

proc slice*(self: Tensor; dim: int = 0; start: int = 0; end_special: int = int.high; step: int = 1): Tensor {.inline.}

proc slogdet*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "slogdet", self.toATensor()).toNimTuple().newTensors()

proc slogdet*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "slogdet").toNimTuple().newTensors()

proc smm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "smm", self.toATensor(), mat2.toATensor()).newTensor()

proc smm*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "smm", mat2.toATensor()).newTensor()

proc softmax_impl*(ty: TensorType; self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc softmax_impl*(self: Tensor; dim: int; half_to_float: bool): Tensor {.inline.}

proc softmax_backward_data_impl*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).newTensor()

proc softmax_backward_data_impl*(grad_output: Tensor; output: Tensor; dim: int; self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_softmax_backward_data", grad_output.toATensor(), output.toATensor(), dim, self.toATensor()).newTensor()

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
  ty[].atenMethod(ATensor, "sspaddmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).newTensor()

proc sspaddmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "sspaddmm", mat1.toATensor(), mat2.toATensor(), beta, alpha).newTensor()

proc stack*(ty: TensorType; tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc stack*(tensors: openarray[Tensor]; dim: int = 0): Tensor {.inline.}

proc stft*(ty: TensorType; self: Tensor; n_fft: int; hop_length: int; win_length: int; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "stft", self.toATensor(), n_fft, hop_length, win_length, window.toATensor(), normalized, onesided).newTensor()

proc stft*(self: Tensor; n_fft: int; hop_length: int; win_length: int; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "stft", n_fft, hop_length, win_length, window.toATensor(), normalized, onesided).newTensor()

proc stride*(ty: TensorType; self: Tensor; dim: int): int {.inline.} = 
  ty[].atenMethod(int, "stride", self.toATensor(), dim)

proc stride*(self: Tensor; dim: int): int {.inline.} = 
  self.tensor.atenMethod(int, "stride", dim)

proc sum*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sum", self.toATensor(), dtype).newTensor()

proc sum*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "sum", dtype).newTensor()

proc sum*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sum*(self: Tensor): Tensor {.inline.}

proc sum*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sum", self.toATensor(), dim.toAIntList(), keepdim, dtype).newTensor()

proc sum*(self: Tensor; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "sum", dim.toAIntList(), keepdim, dtype).newTensor()

proc sum*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc sum*(self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.}

proc sum*(ty: TensorType; self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sum", self.toATensor(), dim.toAIntList(), dtype).newTensor()

proc sum*(self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "sum", dim.toAIntList(), dtype).newTensor()

proc sum_to_size*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sum_to_size", self.toATensor(), size.toAIntList()).newTensor()

proc sum_to_size*(self: Tensor; size: openarray[int]): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "sum_to_size", size.toAIntList()).newTensor()

proc sqrt*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sqrt*(self: Tensor): Tensor {.inline.}

proc sqrt_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sqrt_", self.toATensor()); self

proc sqrt_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sqrt_"); self

proc std*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "std", self.toATensor(), unbiased).newTensor()

proc std*(self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "std", unbiased).newTensor()

proc std*(ty: TensorType; self: Tensor; dim: openarray[int]; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "std", self.toATensor(), dim.toAIntList(), unbiased, keepdim).newTensor()

proc std*(self: Tensor; dim: openarray[int]; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "std", dim.toAIntList(), unbiased, keepdim).newTensor()

proc prod*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "prod", self.toATensor(), dtype).newTensor()

proc prod*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "prod", dtype).newTensor()

proc prod*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "prod", self.toATensor()).newTensor()

proc prod*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "prod").newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "prod", self.toATensor(), dim, keepdim, dtype).newTensor()

proc prod*(self: Tensor; dim: int; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "prod", dim, keepdim, dtype).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "prod", self.toATensor(), dim, keepdim).newTensor()

proc prod*(self: Tensor; dim: int; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "prod", dim, keepdim).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "prod", self.toATensor(), dim, dtype).newTensor()

proc prod*(self: Tensor; dim: int; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "prod", dim, dtype).newTensor()

proc t*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc t*(self: Tensor): Tensor {.inline.}

proc t_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "t_", self.toATensor()); self

proc t_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "t_"); self

proc tan*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc tan*(self: Tensor): Tensor {.inline.}

proc tan_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "tan_", self.toATensor()); self

proc tan_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "tan_"); self

proc tanh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc tanh*(self: Tensor): Tensor {.inline.}

proc tanh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "tanh_", self.toATensor()); self

proc tanh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "tanh_"); self

proc tensordot*(ty: TensorType; self: Tensor; other: Tensor; dims_self: openarray[int]; dims_other: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "tensordot", self.toATensor(), other.toATensor(), dims_self.toAIntList(), dims_other.toAIntList()).newTensor()

proc tensordot*(self: Tensor; other: Tensor; dims_self: openarray[int]; dims_other: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::tensordot", self.toATensor(), other.toATensor(), dims_self.toAIntList(), dims_other.toAIntList()).newTensor()

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

proc one_hot*(ty: TensorType; self: Tensor; num_classes: int = -1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "one_hot", self.toATensor(), num_classes).newTensor()

proc one_hot*(self: Tensor; num_classes: int = -1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::one_hot", self.toATensor(), num_classes).newTensor()

proc flip*(ty: TensorType; self: Tensor; dims: openarray[int]): Tensor {.inline.}

proc flip*(self: Tensor; dims: openarray[int]): Tensor {.inline.}

proc roll*(ty: TensorType; self: Tensor; shifts: openarray[int]; dims: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "roll", self.toATensor(), shifts.toAIntList(), dims.toAIntList()).newTensor()

proc roll*(self: Tensor; shifts: openarray[int]; dims: openarray[int]): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "roll", shifts.toAIntList(), dims.toAIntList()).newTensor()

proc rot90*(ty: TensorType; self: Tensor; k: int = 1; dims: openarray[int]): Tensor {.inline.}

proc rot90*(self: Tensor; k: int = 1; dims: openarray[int]): Tensor {.inline.}

proc trilinear_impl*(ty: TensorType; i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[int]; expand2: openarray[int]; expand3: openarray[int]; sumdim: openarray[int]; unroll_dim: int = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_trilinear", i1.toATensor(), i2.toATensor(), i3.toATensor(), expand1.toAIntList(), expand2.toAIntList(), expand3.toAIntList(), sumdim.toAIntList(), unroll_dim).newTensor()

proc trilinear_impl*(i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[int]; expand2: openarray[int]; expand3: openarray[int]; sumdim: openarray[int]; unroll_dim: int = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_trilinear", i1.toATensor(), i2.toATensor(), i3.toATensor(), expand1.toAIntList(), expand2.toAIntList(), expand3.toAIntList(), sumdim.toAIntList(), unroll_dim).newTensor()

proc triplet_margin_loss*(ty: TensorType; anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "triplet_margin_loss", anchor.toATensor(), positive.toATensor(), negative.toATensor(), margin, p, eps, swap, reduction).newTensor()

proc triplet_margin_loss*(anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::triplet_margin_loss", anchor.toATensor(), positive.toATensor(), negative.toATensor(), margin, p, eps, swap, reduction).newTensor()

proc trunc*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc trunc*(self: Tensor): Tensor {.inline.}

proc trunc_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "trunc_", self.toATensor()); self

proc trunc_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "trunc_"); self

proc type_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "type_as", self.toATensor(), other.toATensor()).newTensor()

proc type_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "type_as", other.toATensor()).newTensor()

proc unique_impl*(ty: TensorType; self: Tensor; sorted: bool = true; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_unique", self.toATensor(), sorted, return_inverse).toNimTuple().newTensors()

proc unique_impl*(self: Tensor; sorted: bool = true; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_unique", self.toATensor(), sorted, return_inverse).toNimTuple().newTensors()

proc unique_dim_impl*(ty: TensorType; self: Tensor; dim: int; sorted: bool = true; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_unique_dim", self.toATensor(), dim, sorted, return_inverse).toNimTuple().newTensors()

proc unique_dim_impl*(self: Tensor; dim: int; sorted: bool = true; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_unique_dim", self.toATensor(), dim, sorted, return_inverse).toNimTuple().newTensors()

proc unsafe_view_impl*(ty: TensorType; self: Tensor; size: openarray[int]): Tensor {.inline.}

proc unsafe_view_impl*(self: Tensor; size: openarray[int]): Tensor {.inline.}

proc unsqueeze*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline.}

proc unsqueeze*(self: Tensor; dim: int): Tensor {.inline.}

proc unsqueeze_inplace*(ty: TensorType; self: Tensor; dim: int): Tensor {.inline, discardable.}

proc unsqueeze_inplace*(self: Tensor; dim: int): Tensor {.inline, discardable.}

proc var_special*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "var", self.toATensor(), unbiased).newTensor()

proc var_special*(self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "var", unbiased).newTensor()

proc var_special*(ty: TensorType; self: Tensor; dim: openarray[int]; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "var", self.toATensor(), dim.toAIntList(), unbiased, keepdim).newTensor()

proc var_special*(self: Tensor; dim: openarray[int]; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "var", dim.toAIntList(), unbiased, keepdim).newTensor()

proc view_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "view_as", self.toATensor(), other.toATensor()).newTensor()

proc view_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "view_as", other.toATensor()).newTensor()

proc where*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "where", condition.toATensor(), self.toATensor(), other.toATensor()).newTensor()

proc where*(condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "where", condition.toATensor(), other.toATensor()).newTensor()

proc s_where_impl*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.}

proc s_where_impl*(condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.}

proc norm_except_dim*(ty: TensorType; v: Tensor; pow: int = 2; dim: int = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "norm_except_dim", v.toATensor(), pow, dim).newTensor()

proc norm_except_dim*(v: Tensor; pow: int = 2; dim: int = 0): Tensor {.inline.} = 
  atenFunction(ATensor, "at::norm_except_dim", v.toATensor(), pow, dim).newTensor()

proc weight_norm_impl*(ty: TensorType; v: Tensor; g: Tensor; dim: int = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_weight_norm", v.toATensor(), g.toATensor(), dim).newTensor()

proc weight_norm_impl*(v: Tensor; g: Tensor; dim: int = 0): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_weight_norm", v.toATensor(), g.toATensor(), dim).newTensor()

proc weight_norm_cuda_interface_impl*(ty: TensorType; v: Tensor; g: Tensor; dim: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_weight_norm_cuda_interface", v.toATensor(), g.toATensor(), dim).toNimTuple().newTensors()

proc weight_norm_cuda_interface_impl*(v: Tensor; g: Tensor; dim: int = 0): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_weight_norm_cuda_interface", v.toATensor(), g.toATensor(), dim).toNimTuple().newTensors()

proc weight_norm_cuda_interface_backward_impl*(ty: TensorType; grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_weight_norm_cuda_interface_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).toNimTuple().newTensors()

proc weight_norm_cuda_interface_backward_impl*(grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_weight_norm_cuda_interface_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).toNimTuple().newTensors()

proc weight_norm_differentiable_backward_impl*(ty: TensorType; grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_weight_norm_differentiable_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).toNimTuple().newTensors()

proc weight_norm_differentiable_backward_impl*(grad_w: Tensor; saved_v: Tensor; saved_g: Tensor; saved_norms: Tensor; dim: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_weight_norm_differentiable_backward", grad_w.toATensor(), saved_v.toATensor(), saved_g.toATensor(), saved_norms.toATensor(), dim).toNimTuple().newTensors()

proc zeros*(ty: TensorType; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "zeros", size.toAIntList(), options).newTensor()

proc zeros*(size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::zeros", size.toAIntList(), options).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "zeros_like", self.toATensor()).newTensor()

proc zeros_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::zeros_like", self.toATensor()).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "zeros_like", self.toATensor(), options).newTensor()

proc zeros_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::zeros_like", self.toATensor(), options).newTensor()

proc standard_gamma_grad_impl*(ty: TensorType; self: Tensor; output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_standard_gamma_grad", self.toATensor(), output.toATensor()).newTensor()

proc standard_gamma_grad_impl*(self: Tensor; output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_standard_gamma_grad", self.toATensor(), output.toATensor()).newTensor()

proc standard_gamma_impl*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc standard_gamma_impl*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc poisson*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc poisson*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc native_norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "native_norm", self.toATensor(), p).newTensor()

proc native_norm*(self: Tensor; p: float = 2): Tensor {.inline.} = 
  atenFunction(ATensor, "at::native_norm", self.toATensor(), p).newTensor()

proc sparse_sum_impl*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_sum", self.toATensor()).newTensor()

proc sparse_sum_impl*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_sum", self.toATensor()).newTensor()

proc sparse_sum_impl*(ty: TensorType; self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_sum", self.toATensor(), dtype).newTensor()

proc sparse_sum_impl*(self: Tensor; dtype: ScalarType): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_sum", self.toATensor(), dtype).newTensor()

proc sparse_sum_impl*(ty: TensorType; self: Tensor; dim: openarray[int]): Tensor {.inline.}

proc sparse_sum_impl*(self: Tensor; dim: openarray[int]): Tensor {.inline.}

proc sparse_sum_impl*(ty: TensorType; self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_sum", self.toATensor(), dim.toAIntList(), dtype).newTensor()

proc sparse_sum_impl*(self: Tensor; dim: openarray[int]; dtype: ScalarType): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_sum", self.toATensor(), dim.toAIntList(), dtype).newTensor()

proc sparse_sum_backward_impl*(ty: TensorType; grad: Tensor; self: Tensor; dim: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_sum_backward", grad.toATensor(), self.toATensor(), dim.toAIntList()).newTensor()

proc sparse_sum_backward_impl*(grad: Tensor; self: Tensor; dim: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_sum_backward", grad.toATensor(), self.toATensor(), dim.toAIntList()).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "norm", self.toATensor(), p, dtype).newTensor()

proc norm*(self: Tensor; p: float; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "norm", p, dtype).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "norm", self.toATensor(), p).newTensor()

proc norm*(self: Tensor; p: float = 2): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "norm", p).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "norm", self.toATensor(), p, dim.toAIntList(), keepdim, dtype).newTensor()

proc norm*(self: Tensor; p: float; dim: openarray[int]; keepdim: bool; dtype: ScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "norm", p, dim.toAIntList(), keepdim, dtype).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "norm", self.toATensor(), p, dim.toAIntList(), keepdim).newTensor()

proc norm*(self: Tensor; p: float; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "norm", p, dim.toAIntList(), keepdim).newTensor()

proc frobenius_norm*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "frobenius_norm", self.toATensor()).newTensor()

proc frobenius_norm*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::frobenius_norm", self.toATensor()).newTensor()

proc frobenius_norm*(ty: TensorType; self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "frobenius_norm", self.toATensor(), dim.toAIntList(), keepdim).newTensor()

proc frobenius_norm*(self: Tensor; dim: openarray[int]; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::frobenius_norm", self.toATensor(), dim.toAIntList(), keepdim).newTensor()

proc nuclear_norm*(ty: TensorType; self: Tensor; keepdim: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "nuclear_norm", self.toATensor(), keepdim).newTensor()

proc nuclear_norm*(self: Tensor; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::nuclear_norm", self.toATensor(), keepdim).newTensor()

proc native_clone*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "native_clone", self.toATensor()).newTensor()

proc native_clone*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::native_clone", self.toATensor()).newTensor()

proc clone*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc clone*(self: Tensor): Tensor {.inline.}

proc native_resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "native_resize_as_", self.toATensor(), the_template.toATensor()); self

proc native_resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::native_resize_as_", self.toATensor(), the_template.toATensor()); self

proc resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "resize_as_", self.toATensor(), the_template.toATensor()); self

proc resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "resize_as_", the_template.toATensor()); self

proc native_pow*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "native_pow", self.toATensor(), exponent).newTensor()

proc native_pow*(self: Tensor; exponent: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::native_pow", self.toATensor(), exponent).newTensor()

proc pow*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.}

proc pow*(self: Tensor; exponent: float): Tensor {.inline.}

proc native_zero_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "native_zero_", self.toATensor()); self

proc native_zero_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::native_zero_", self.toATensor()); self

proc zero_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.}

proc zero_inplace*(self: Tensor): Tensor {.inline, discardable.}

proc sub*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc sub*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc sub_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sub_", self.toATensor(), other.toATensor(), alpha); self

proc sub_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sub_", other.toATensor(), alpha); self

proc sub*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc sub*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc sub_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sub_", self.toATensor(), other, alpha); self

proc sub_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sub_", other, alpha); self

proc rsub*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc rsub*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc rsub*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc rsub*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc s_native_addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "s_native_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).newTensor()

proc s_native_addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::s_native_addmm", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha).newTensor()

proc s_native_addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "s_native_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha); self

proc s_native_addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::s_native_addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha); self

proc sparse_addmm_impl*(ty: TensorType; self: Tensor; sparse: Tensor; dense: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_addmm", self.toATensor(), sparse.toATensor(), dense.toATensor(), beta, alpha).newTensor()

proc sparse_addmm_impl*(self: Tensor; sparse: Tensor; dense: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_addmm", self.toATensor(), sparse.toATensor(), dense.toATensor(), beta, alpha).newTensor()

proc addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "addmm_", self.toATensor(), mat1.toATensor(), mat2.toATensor(), beta, alpha); self

proc addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "addmm_", mat1.toATensor(), mat2.toATensor(), beta, alpha); self

proc sparse_coo_tensor*(ty: TensorType; size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sparse_coo_tensor", size.toAIntList(), options).newTensor()

proc sparse_coo_tensor*(size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::sparse_coo_tensor", size.toAIntList(), options).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sparse_coo_tensor", indices.toATensor(), values.toATensor(), options).newTensor()

proc sparse_coo_tensor*(indices: Tensor; values: Tensor; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::sparse_coo_tensor", indices.toATensor(), values.toATensor(), options).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sparse_coo_tensor", indices.toATensor(), values.toATensor(), size.toAIntList(), options).newTensor()

proc sparse_coo_tensor*(indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::sparse_coo_tensor", indices.toATensor(), values.toATensor(), size.toAIntList(), options).newTensor()

proc sparse_coo_tensor_unsafe_impl*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_coo_tensor_unsafe", indices.toATensor(), values.toATensor(), size.toAIntList(), options).newTensor()

proc sparse_coo_tensor_unsafe_impl*(indices: Tensor; values: Tensor; size: openarray[int]; options: TensorOptions = defaultOptions()): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_coo_tensor_unsafe", indices.toATensor(), values.toATensor(), size.toAIntList(), options).newTensor()

proc sparse_coo_tensor_with_dims_impl*(ty: TensorType; sparse_dim: int; dense_dim: int; size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_coo_tensor_with_dims", sparse_dim, dense_dim, size.toAIntList(), options).newTensor()

proc sparse_coo_tensor_with_dims_impl*(sparse_dim: int; dense_dim: int; size: openarray[int]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_coo_tensor_with_dims", sparse_dim, dense_dim, size.toAIntList(), options).newTensor()

proc sparse_coo_tensor_with_dims_and_tensors_impl*(ty: TensorType; sparse_dim: int; dense_dim: int; size: openarray[int]; indices: Tensor; values: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_sparse_coo_tensor_with_dims_and_tensors", sparse_dim, dense_dim, size.toAIntList(), indices.toATensor(), values.toATensor(), options).newTensor()

proc sparse_coo_tensor_with_dims_and_tensors_impl*(sparse_dim: int; dense_dim: int; size: openarray[int]; indices: Tensor; values: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_sparse_coo_tensor_with_dims_and_tensors", sparse_dim, dense_dim, size.toAIntList(), indices.toATensor(), values.toATensor(), options).newTensor()

proc sparse_resize_inplace*(ty: TensorType; self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sparse_resize_", self.toATensor(), size.toAIntList(), sparse_dim, dense_dim); self

proc sparse_resize_inplace*(self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sparse_resize_", size.toAIntList(), sparse_dim, dense_dim); self

proc sparse_resize_and_clear_inplace*(ty: TensorType; self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sparse_resize_and_clear_", self.toATensor(), size.toAIntList(), sparse_dim, dense_dim); self

proc sparse_resize_and_clear_inplace*(self: Tensor; size: openarray[int]; sparse_dim: int; dense_dim: int): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sparse_resize_and_clear_", size.toAIntList(), sparse_dim, dense_dim); self

proc sparse_mask*(ty: TensorType; self: Tensor; mask: ASparseTensorRef): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "sparse_mask", self.toATensor(), mask).newTensor()

proc sparse_mask*(self: Tensor; mask: ASparseTensorRef): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "sparse_mask", mask).newTensor()

proc to_dense*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "to_dense", self.toATensor()).newTensor()

proc to_dense*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "to_dense").newTensor()

proc sparse_dim*(ty: TensorType; self: Tensor): int {.inline.} = 
  ty[].atenMethod(int, "sparse_dim", self.toATensor())

proc sparse_dim*(self: Tensor): int {.inline.} = 
  self.tensor.atenMethod(int, "sparse_dim")

proc dimI_impl*(ty: TensorType; self: Tensor): int {.inline.} = 
  ty[].atenMethod(int, "_dimI", self.toATensor())

proc dimI_impl*(self: Tensor): int {.inline.} = 
  self.tensor.atenMethod(int, "_dimI")

proc dense_dim*(ty: TensorType; self: Tensor): int {.inline.} = 
  ty[].atenMethod(int, "dense_dim", self.toATensor())

proc dense_dim*(self: Tensor): int {.inline.} = 
  self.tensor.atenMethod(int, "dense_dim")

proc dimV_impl*(ty: TensorType; self: Tensor): int {.inline.} = 
  ty[].atenMethod(int, "_dimV", self.toATensor())

proc dimV_impl*(self: Tensor): int {.inline.} = 
  self.tensor.atenMethod(int, "_dimV")

proc nnz_impl*(ty: TensorType; self: Tensor): int {.inline.} = 
  ty[].atenMethod(int, "_nnz", self.toATensor())

proc nnz_impl*(self: Tensor): int {.inline.} = 
  self.tensor.atenMethod(int, "_nnz")

proc coalesce*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc coalesce*(self: Tensor): Tensor {.inline.}

proc is_coalesced*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_coalesced", self.toATensor())

proc is_coalesced*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_coalesced")

proc indices_impl*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc indices_impl*(self: Tensor): Tensor {.inline.}

proc values_impl*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc values_impl*(self: Tensor): Tensor {.inline.}

proc coalesced_impl_inplace*(ty: TensorType; self: Tensor; coalesced: bool): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "_coalesced_", self.toATensor(), coalesced); self

proc coalesced_impl_inplace*(self: Tensor; coalesced: bool): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "_coalesced_", coalesced); self

proc indices*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc indices*(self: Tensor): Tensor {.inline.}

proc values*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc values*(self: Tensor): Tensor {.inline.}

proc hspmm*(ty: TensorType; mat1: Tensor; mat2: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "hspmm", mat1.toATensor(), mat2.toATensor()).newTensor()

proc hspmm*(mat1: Tensor; mat2: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::hspmm", mat1.toATensor(), mat2.toATensor()).newTensor()

proc copy_sparse_to_sparse_inplace*(ty: TensorType; self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "copy_sparse_to_sparse_", self.toATensor(), src.toATensor(), non_blocking); self

proc copy_sparse_to_sparse_inplace*(self: Tensor; src: Tensor; non_blocking: bool = false): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::copy_sparse_to_sparse_", self.toATensor(), src.toATensor(), non_blocking); self

proc numel*(ty: TensorType; self: Tensor): int {.inline.} = 
  ty[].atenMethod(int, "numel", self.toATensor())

proc numel*(self: Tensor): int {.inline.} = 
  self.tensor.atenMethod(int, "numel")

proc unbind*(ty: TensorType; self: Tensor; dim: int = 0): TensorList {.inline.} = 
  ty[].atenMethod(ATensors, "unbind", self.toATensor(), dim).newTensors()

proc unbind*(self: Tensor; dim: int = 0): TensorList {.inline.} = 
  self.tensor.atenMethod(ATensors, "unbind", dim).newTensors()

proc to_sparse*(ty: TensorType; self: Tensor; sparse_dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "to_sparse", self.toATensor(), sparse_dim).newTensor()

proc to_sparse*(self: Tensor; sparse_dim: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "to_sparse", sparse_dim).newTensor()

proc to_sparse*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "to_sparse", self.toATensor()).newTensor()

proc to_sparse*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "to_sparse").newTensor()

proc to_special*(ty: TensorType; self: Tensor; options: TensorOptions; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "to", self.toATensor(), options, non_blocking, copy).newTensor()

proc to_special*(self: Tensor; options: TensorOptions; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "to", options, non_blocking, copy).newTensor()

proc to_special*(ty: TensorType; self: Tensor; dtype: ScalarType; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "to", self.toATensor(), dtype, non_blocking, copy).newTensor()

proc to_special*(self: Tensor; dtype: ScalarType; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "to", dtype, non_blocking, copy).newTensor()

proc to_special*(ty: TensorType; self: Tensor; other: Tensor; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "to", self.toATensor(), other.toATensor(), non_blocking, copy).newTensor()

proc to_special*(self: Tensor; other: Tensor; non_blocking: bool = false; copy: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "to", other.toATensor(), non_blocking, copy).newTensor()

proc meshgrid*(ty: TensorType; tensors: openarray[Tensor]): TensorList {.inline.} = 
  ty[].atenMethod(ATensors, "meshgrid", tensors.toATensors()).newTensors()

proc meshgrid*(tensors: openarray[Tensor]): TensorList {.inline.} = 
  atenFunction(ATensors, "at::meshgrid", tensors.toATensors()).newTensors()

proc cartesian_prod*(ty: TensorType; tensors: openarray[Tensor]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cartesian_prod", tensors.toATensors()).newTensor()

proc cartesian_prod*(tensors: openarray[Tensor]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::cartesian_prod", tensors.toATensors()).newTensor()

proc combinations*(ty: TensorType; self: Tensor; r: int = 2; with_replacement: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "combinations", self.toATensor(), r, with_replacement).newTensor()

proc combinations*(self: Tensor; r: int = 2; with_replacement: bool = false): Tensor {.inline.} = 
  atenFunction(ATensor, "at::combinations", self.toATensor(), r, with_replacement).newTensor()

proc item*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty[].atenMethod(float, "item", self.toATensor())

proc item*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod(float, "item")

proc local_scalar_dense_impl*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty[].atenMethod(float, "_local_scalar_dense", self.toATensor())

proc local_scalar_dense_impl*(self: Tensor): float {.inline.} = 
  atenFunction(float, "at::_local_scalar_dense", self.toATensor())

proc thnn_fused_lstm_cell_impl*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc thnn_fused_lstm_cell_impl*(input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc thnn_fused_lstm_cell_backward_impl*(ty: TensorType; grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor], "_thnn_fused_lstm_cell_backward", grad_hy.toATensor(), grad_cy.toATensor(), cx.toATensor(), cy.toATensor(), workspace.toATensor(), has_bias).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_backward_impl*(grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  atenFunction(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor], "at::_thnn_fused_lstm_cell_backward", grad_hy.toATensor(), grad_cy.toATensor(), cx.toATensor(), cy.toATensor(), workspace.toATensor(), has_bias).toNimTuple().newTensors()

proc thnn_fused_gru_cell_impl*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc thnn_fused_gru_cell_impl*(input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc thnn_fused_gru_cell_backward_impl*(ty: TensorType; grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor], "_thnn_fused_gru_cell_backward", grad_hy.toATensor(), workspace.toATensor(), has_bias).toNimTuple().newTensors()

proc thnn_fused_gru_cell_backward_impl*(grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  atenFunction(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor], "at::_thnn_fused_gru_cell_backward", grad_hy.toATensor(), workspace.toATensor(), has_bias).toNimTuple().newTensors()

proc lstm*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "lstm", input.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc lstm*(input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::lstm", input.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc lstm*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "lstm", data.toATensor(), batch_sizes.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc lstm*(data: Tensor; batch_sizes: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::lstm", data.toATensor(), batch_sizes.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc gru*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "gru", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc gru*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::gru", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc gru*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "gru", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc gru*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::gru", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "rnn_tanh", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc rnn_tanh*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::rnn_tanh", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "rnn_tanh", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc rnn_tanh*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::rnn_tanh", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "rnn_relu", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc rnn_relu*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::rnn_relu", input.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "rnn_relu", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc rnn_relu*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::rnn_relu", data.toATensor(), batch_sizes.toATensor(), hx.toATensor(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).toNimTuple().newTensors()

proc lstm_cell*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "lstm_cell", input.toATensor(), hx.toATensors(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).toNimTuple().newTensors()

proc lstm_cell*(input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::lstm_cell", input.toATensor(), hx.toATensors(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).toNimTuple().newTensors()

proc rnn_tanh_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rnn_tanh_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).newTensor()

proc rnn_tanh_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::rnn_tanh_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).newTensor()

proc rnn_relu_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "rnn_relu_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).newTensor()

proc rnn_relu_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::rnn_relu_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor()).newTensor()

proc quantized_lstm*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "quantized_lstm", input.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc quantized_lstm*(input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::quantized_lstm", input.toATensor(), hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).toNimTuple().newTensors()

proc quantized_lstm_cell*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "quantized_lstm_cell", input.toATensor(), hx.toATensors(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).toNimTuple().newTensors()

proc quantized_lstm_cell*(input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::quantized_lstm_cell", input.toATensor(), hx.toATensors(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).toNimTuple().newTensors()

proc quantized_gru_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "quantized_gru_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).newTensor()

proc quantized_gru_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::quantized_gru_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).newTensor()

proc quantized_rnn_relu_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "quantized_rnn_relu_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).newTensor()

proc quantized_rnn_relu_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::quantized_rnn_relu_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).newTensor()

proc quantized_rnn_tanh_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "quantized_rnn_tanh_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).newTensor()

proc quantized_rnn_tanh_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor; packed_ih: Tensor; packed_hh: Tensor; col_offsets_ih: Tensor; col_offsets_hh: Tensor; scale_ih: float; scale_hh: float; zero_point_ih: float; zero_point_hh: float): Tensor {.inline.} = 
  atenFunction(ATensor, "at::quantized_rnn_tanh_cell", input.toATensor(), hx.toATensor(), w_ih.toATensor(), w_hh.toATensor(), b_ih.toATensor(), b_hh.toATensor(), packed_ih.toATensor(), packed_hh.toATensor(), col_offsets_ih.toATensor(), col_offsets_hh.toATensor(), scale_ih, scale_hh, zero_point_ih, zero_point_hh).newTensor()

proc pack_padded_sequence_impl*(ty: TensorType; input: Tensor; lengths: Tensor; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc pack_padded_sequence_impl*(input: Tensor; lengths: Tensor; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc pack_padded_sequence_backward_impl*(ty: TensorType; grad: Tensor; input_size: openarray[int]; batch_sizes: Tensor; batch_first: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_pack_padded_sequence_backward", grad.toATensor(), input_size.toAIntList(), batch_sizes.toATensor(), batch_first).newTensor()

proc pack_padded_sequence_backward_impl*(grad: Tensor; input_size: openarray[int]; batch_sizes: Tensor; batch_first: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_pack_padded_sequence_backward", grad.toATensor(), input_size.toAIntList(), batch_sizes.toATensor(), batch_first).newTensor()

proc pad_packed_sequence_impl*(ty: TensorType; data: Tensor; batch_sizes: Tensor; batch_first: bool; padding_value: float; total_length: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "_pad_packed_sequence", data.toATensor(), batch_sizes.toATensor(), batch_first, padding_value, total_length).toNimTuple().newTensors()

proc pad_packed_sequence_impl*(data: Tensor; batch_sizes: Tensor; batch_first: bool; padding_value: float; total_length: int): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::_pad_packed_sequence", data.toATensor(), batch_sizes.toATensor(), batch_first, padding_value, total_length).toNimTuple().newTensors()

proc data_ptr*(ty: TensorType; self: Tensor): pointer {.inline.} = 
  ty[].atenMethod(pointer, "data_ptr", self.toATensor())

proc data_ptr*(self: Tensor): pointer {.inline.} = 
  self.tensor.atenMethod(pointer, "data_ptr")

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "set_", self.toATensor(), source); self

proc set_inplace*(self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "set_", source); self

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "set_", self.toATensor(), source, storage_offset, size.toAIntList(), stride.toAIntList()); self

proc set_inplace*(self: Tensor; source: AStorage; storage_offset: int; size: openarray[int]; stride: openarray[int]): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "set_", source, storage_offset, size.toAIntList(), stride.toAIntList()); self

proc set_inplace*(ty: TensorType; self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "set_", self.toATensor(), source.toATensor()); self

proc set_inplace*(self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "set_", source.toATensor()); self

proc set_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "set_", self.toATensor()); self

proc set_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "set_"); self

proc is_set_to*(ty: TensorType; self: Tensor; tensor: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "is_set_to", self.toATensor(), tensor.toATensor())

proc is_set_to*(self: Tensor; tensor: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "is_set_to", tensor.toATensor())

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.}

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.}

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc masked_scatter_inplace*(ty: TensorType; self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "masked_scatter_", self.toATensor(), mask.toATensor(), source.toATensor()); self

proc masked_scatter_inplace*(self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "masked_scatter_", mask.toATensor(), source.toATensor()); self

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
  ty[].atenMethod(ATensor, "__and__", self.toATensor(), other).newTensor()

proc and_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__and__", other).newTensor()

proc and_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__and__", self.toATensor(), other.toATensor()).newTensor()

proc and_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__and__", other.toATensor()).newTensor()

proc iand_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__iand__", self.toATensor(), other); self

proc iand_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__iand__", other); self

proc iand_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__iand__", self.toATensor(), other.toATensor()); self

proc iand_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__iand__", other.toATensor()); self

proc or_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__or__", self.toATensor(), other).newTensor()

proc or_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__or__", other).newTensor()

proc or_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__or__", self.toATensor(), other.toATensor()).newTensor()

proc or_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__or__", other.toATensor()).newTensor()

proc ior_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__ior__", self.toATensor(), other); self

proc ior_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__ior__", other); self

proc ior_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__ior__", self.toATensor(), other.toATensor()); self

proc ior_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__ior__", other.toATensor()); self

proc xor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__xor__", self.toATensor(), other).newTensor()

proc xor_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__xor__", other).newTensor()

proc xor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__xor__", self.toATensor(), other.toATensor()).newTensor()

proc xor_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__xor__", other.toATensor()).newTensor()

proc ixor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__ixor__", self.toATensor(), other); self

proc ixor_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__ixor__", other); self

proc ixor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__ixor__", self.toATensor(), other.toATensor()); self

proc ixor_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__ixor__", other.toATensor()); self

proc lshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__lshift__", self.toATensor(), other).newTensor()

proc lshift_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__lshift__", other).newTensor()

proc lshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__lshift__", self.toATensor(), other.toATensor()).newTensor()

proc lshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__lshift__", other.toATensor()).newTensor()

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__ilshift__", self.toATensor(), other); self

proc ilshift_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__ilshift__", other); self

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__ilshift__", self.toATensor(), other.toATensor()); self

proc ilshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__ilshift__", other.toATensor()); self

proc rshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__rshift__", self.toATensor(), other).newTensor()

proc rshift_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__rshift__", other).newTensor()

proc rshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "__rshift__", self.toATensor(), other.toATensor()).newTensor()

proc rshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "__rshift__", other.toATensor()).newTensor()

proc irshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__irshift__", self.toATensor(), other); self

proc irshift_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__irshift__", other); self

proc irshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "__irshift__", self.toATensor(), other.toATensor()); self

proc irshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "__irshift__", other.toATensor()); self

proc lgamma_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "lgamma_", self.toATensor()); self

proc lgamma_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "lgamma_"); self

proc atan2_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "atan2_", self.toATensor(), other.toATensor()); self

proc atan2_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "atan2_", other.toATensor()); self

proc tril_inplace*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "tril_", self.toATensor(), diagonal); self

proc tril_inplace*(self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "tril_", diagonal); self

proc triu_inplace*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "triu_", self.toATensor(), diagonal); self

proc triu_inplace*(self: Tensor; diagonal: int = 0): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "triu_", diagonal); self

proc digamma_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "digamma_", self.toATensor()); self

proc digamma_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "digamma_"); self

proc polygamma_inplace*(ty: TensorType; self: Tensor; n: int): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "polygamma_", self.toATensor(), n); self

proc polygamma_inplace*(self: Tensor; n: int): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "polygamma_", n); self

proc erfinv_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "erfinv_", self.toATensor()); self

proc erfinv_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "erfinv_"); self

proc frac_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "frac_", self.toATensor()); self

proc frac_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "frac_"); self

proc renorm_inplace*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "renorm_", self.toATensor(), p, dim, maxnorm); self

proc renorm_inplace*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "renorm_", p, dim, maxnorm); self

proc reciprocal_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "reciprocal_", self.toATensor()); self

proc reciprocal_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "reciprocal_"); self

proc neg_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "neg_", self.toATensor()); self

proc neg_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "neg_"); self

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "pow_", self.toATensor(), exponent); self

proc pow_inplace*(self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "pow_", exponent); self

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "pow_", self.toATensor(), exponent.toATensor()); self

proc pow_inplace*(self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "pow_", exponent.toATensor()); self

proc lerp_inplace*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "lerp_", self.toATensor(), end_special.toATensor(), weight); self

proc lerp_inplace*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "lerp_", end_special.toATensor(), weight); self

proc sign_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "sign_", self.toATensor()); self

proc sign_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "sign_"); self

proc fmod_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "fmod_", self.toATensor(), other); self

proc fmod_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "fmod_", other); self

proc fmod_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "fmod_", self.toATensor(), other.toATensor()); self

proc fmod_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "fmod_", other.toATensor()); self

proc remainder_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "remainder_", self.toATensor(), other); self

proc remainder_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "remainder_", other); self

proc remainder_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "remainder_", self.toATensor(), other.toATensor()); self

proc remainder_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "remainder_", other.toATensor()); self

proc addbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "addbmm_", self.toATensor(), batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc addbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "addbmm_", batch1.toATensor(), batch2.toATensor(), beta, alpha); self

proc addbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addcmul_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "addcmul_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value); self

proc addcmul_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "addcmul_", tensor1.toATensor(), tensor2.toATensor(), value); self

proc addcdiv_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "addcdiv_", self.toATensor(), tensor1.toATensor(), tensor2.toATensor(), value); self

proc addcdiv_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod(void, "addcdiv_", tensor1.toATensor(), tensor2.toATensor(), value); self

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
  ty[].atenMethod(ATensor, "diag", self.toATensor(), diagonal).newTensor()

proc diag*(self: Tensor; diagonal: int = 0): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "diag", diagonal).newTensor()

proc cross*(ty: TensorType; self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.}

proc cross*(self: Tensor; other: Tensor; dim: int = -1): Tensor {.inline.}

proc triu*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc triu*(self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc tril*(ty: TensorType; self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc tril*(self: Tensor; diagonal: int = 0): Tensor {.inline.}

proc tril_indices*(ty: TensorType; row: int; col: int; offset: int = 0; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "tril_indices", row, col, offset, options).newTensor()

proc tril_indices*(row: int; col: int; offset: int = 0; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::tril_indices", row, col, offset, options).newTensor()

proc triu_indices*(ty: TensorType; row: int; col: int; offset: int = 0; options: TensorOptions): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "triu_indices", row, col, offset, options).newTensor()

proc triu_indices*(row: int; col: int; offset: int = 0; options: TensorOptions): Tensor {.inline.} = 
  atenFunction(ATensor, "at::triu_indices", row, col, offset, options).newTensor()

proc trace*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "trace", self.toATensor()).newTensor()

proc trace*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "trace").newTensor()

proc ne*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ne", self.toATensor(), other).newTensor()

proc ne*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "ne", other).newTensor()

proc ne*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ne", self.toATensor(), other.toATensor()).newTensor()

proc ne*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "ne", other.toATensor()).newTensor()

proc eq*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "eq", self.toATensor(), other).newTensor()

proc eq*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "eq", other).newTensor()

proc eq*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "eq", self.toATensor(), other.toATensor()).newTensor()

proc eq*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "eq", other.toATensor()).newTensor()

proc ge*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ge", self.toATensor(), other).newTensor()

proc ge*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "ge", other).newTensor()

proc ge*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ge", self.toATensor(), other.toATensor()).newTensor()

proc ge*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "ge", other.toATensor()).newTensor()

proc le*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "le", self.toATensor(), other).newTensor()

proc le*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "le", other).newTensor()

proc le*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "le", self.toATensor(), other.toATensor()).newTensor()

proc le*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "le", other.toATensor()).newTensor()

proc gt*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "gt", self.toATensor(), other).newTensor()

proc gt*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "gt", other).newTensor()

proc gt*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "gt", self.toATensor(), other.toATensor()).newTensor()

proc gt*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "gt", other.toATensor()).newTensor()

proc lt*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "lt", self.toATensor(), other).newTensor()

proc lt*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "lt", other).newTensor()

proc lt*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "lt", self.toATensor(), other.toATensor()).newTensor()

proc lt*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "lt", other.toATensor()).newTensor()

proc take*(ty: TensorType; self: Tensor; index: Tensor): Tensor {.inline.}

proc take*(self: Tensor; index: Tensor): Tensor {.inline.}

proc index_select*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc index_select*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc masked_select*(ty: TensorType; self: Tensor; mask: Tensor): Tensor {.inline.}

proc masked_select*(self: Tensor; mask: Tensor): Tensor {.inline.}

proc nonzero*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "nonzero", self.toATensor()).newTensor()

proc nonzero*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "nonzero").newTensor()

proc gather*(ty: TensorType; self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc gather*(self: Tensor; dim: int; index: Tensor): Tensor {.inline.}

proc addcmul*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcmul*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcdiv*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcdiv*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc gels*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "gels", self.toATensor(), A.toATensor()).toNimTuple().newTensors()

proc gels*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "gels", A.toATensor()).toNimTuple().newTensors()

proc trtrs*(ty: TensorType; self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "trtrs", self.toATensor(), A.toATensor(), upper, transpose, unitriangular).toNimTuple().newTensors()

proc trtrs*(self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "trtrs", A.toATensor(), upper, transpose, unitriangular).toNimTuple().newTensors()

proc symeig*(ty: TensorType; self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc symeig*(self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc eig*(ty: TensorType; self: Tensor; eigenvectors: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "eig", self.toATensor(), eigenvectors).toNimTuple().newTensors()

proc eig*(self: Tensor; eigenvectors: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "eig", eigenvectors).toNimTuple().newTensors()

proc svd*(ty: TensorType; self: Tensor; some: bool = true; compute_uv: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "svd", self.toATensor(), some, compute_uv).toNimTuple().newTensors()

proc svd*(self: Tensor; some: bool = true; compute_uv: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple3[ATensor, ATensor, ATensor], "svd", some, compute_uv).toNimTuple().newTensors()

proc cholesky*(ty: TensorType; self: Tensor; upper: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cholesky", self.toATensor(), upper).newTensor()

proc cholesky*(self: Tensor; upper: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "cholesky", upper).newTensor()

proc cholesky_helper_impl*(ty: TensorType; self: Tensor; upper: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cholesky_helper", self.toATensor(), upper).newTensor()

proc cholesky_helper_impl*(self: Tensor; upper: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cholesky_helper", self.toATensor(), upper).newTensor()

proc cholesky_solve*(ty: TensorType; self: Tensor; input2: Tensor; upper: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "cholesky_solve", self.toATensor(), input2.toATensor(), upper).newTensor()

proc cholesky_solve*(self: Tensor; input2: Tensor; upper: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "cholesky_solve", input2.toATensor(), upper).newTensor()

proc cholesky_solve_helper_impl*(ty: TensorType; self: Tensor; A: Tensor; upper: bool): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "_cholesky_solve_helper", self.toATensor(), A.toATensor(), upper).newTensor()

proc cholesky_solve_helper_impl*(self: Tensor; A: Tensor; upper: bool): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_cholesky_solve_helper", self.toATensor(), A.toATensor(), upper).newTensor()

proc potri*(ty: TensorType; self: Tensor; upper: bool = true): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "potri", self.toATensor(), upper).newTensor()

proc potri*(self: Tensor; upper: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "potri", upper).newTensor()

proc pstrf*(ty: TensorType; self: Tensor; upper: bool = true; tol: float = -1): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "pstrf", self.toATensor(), upper, tol).toNimTuple().newTensors()

proc pstrf*(self: Tensor; upper: bool = true; tol: float = -1): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "pstrf", upper, tol).toNimTuple().newTensors()

proc qr*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "qr", self.toATensor()).toNimTuple().newTensors()

proc qr*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "qr").toNimTuple().newTensors()

proc geqrf*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "geqrf", self.toATensor()).toNimTuple().newTensors()

proc geqrf*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "geqrf").toNimTuple().newTensors()

proc orgqr*(ty: TensorType; self: Tensor; input2: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "orgqr", self.toATensor(), input2.toATensor()).newTensor()

proc orgqr*(self: Tensor; input2: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "orgqr", input2.toATensor()).newTensor()

proc ormqr*(ty: TensorType; self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "ormqr", self.toATensor(), input2.toATensor(), input3.toATensor(), left, transpose).newTensor()

proc ormqr*(self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "ormqr", input2.toATensor(), input3.toATensor(), left, transpose).newTensor()

proc btrifact*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "btrifact", self.toATensor(), pivot).toNimTuple().newTensors()

proc btrifact*(self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "btrifact", pivot).toNimTuple().newTensors()

proc btrifact_with_info*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "btrifact_with_info", self.toATensor(), pivot).toNimTuple().newTensors()

proc btrifact_with_info*(self: Tensor; pivot: bool = true): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple3[ATensor, ATensor, ATensor], "btrifact_with_info", pivot).toNimTuple().newTensors()

proc btrisolve*(ty: TensorType; self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "btrisolve", self.toATensor(), LU_data.toATensor(), LU_pivots.toATensor()).newTensor()

proc btrisolve*(self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "btrisolve", LU_data.toATensor(), LU_pivots.toATensor()).newTensor()

proc multinomial*(ty: TensorType; self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "multinomial", self.toATensor(), num_samples, replacement, generator).newTensor()

proc multinomial*(self: Tensor; num_samples: int; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "multinomial", num_samples, replacement, generator).newTensor()

proc lgamma*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc lgamma*(self: Tensor): Tensor {.inline.}

proc digamma*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc digamma*(self: Tensor): Tensor {.inline.}

proc polygamma*(ty: TensorType; n: int; self: Tensor): Tensor {.inline.}

proc polygamma*(n: int; self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "polygamma", n).newTensor()

proc erfinv*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erfinv*(self: Tensor): Tensor {.inline.}

proc frac*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc frac*(self: Tensor): Tensor {.inline.}

proc dist*(ty: TensorType; self: Tensor; other: Tensor; p: float = 2): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "dist", self.toATensor(), other.toATensor(), p).newTensor()

proc dist*(self: Tensor; other: Tensor; p: float = 2): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "dist", other.toATensor(), p).newTensor()

proc reciprocal*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc reciprocal*(self: Tensor): Tensor {.inline.}

proc neg*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc neg*(self: Tensor): Tensor {.inline.}

proc atan2*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc atan2*(self: Tensor; other: Tensor): Tensor {.inline.}

proc lerp*(ty: TensorType; self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "lerp", self.toATensor(), end_special.toATensor(), weight).newTensor()

proc lerp*(self: Tensor; end_special: Tensor; weight: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "lerp", end_special.toATensor(), weight).newTensor()

proc histc*(ty: TensorType; self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "histc", self.toATensor(), bins, min, max).newTensor()

proc histc*(self: Tensor; bins: int = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "histc", bins, min, max).newTensor()

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
  ty[].atenMethod(ATensor, "min", self.toATensor()).newTensor()

proc min*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "min").newTensor()

proc max*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc max*(self: Tensor; other: Tensor): Tensor {.inline.}

proc max*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "max", self.toATensor()).newTensor()

proc max*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "max").newTensor()

proc median*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "median", self.toATensor()).newTensor()

proc median*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "median").newTensor()

proc sort*(ty: TensorType; self: Tensor; dim: int = -1; descending: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "sort", self.toATensor(), dim, descending).toNimTuple().newTensors()

proc sort*(self: Tensor; dim: int = -1; descending: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "sort", dim, descending).toNimTuple().newTensors()

proc topk*(ty: TensorType; self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "topk", self.toATensor(), k, dim, largest, sorted).toNimTuple().newTensors()

proc topk*(self: Tensor; k: int; dim: int = -1; largest: bool = true; sorted: bool = true): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod(StdTuple2[ATensor, ATensor], "topk", k, dim, largest, sorted).toNimTuple().newTensors()

proc all*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "all", self.toATensor()).newTensor()

proc all*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "all").newTensor()

proc any*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "any", self.toATensor()).newTensor()

proc any*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "any").newTensor()

proc renorm*(ty: TensorType; self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "renorm", self.toATensor(), p, dim, maxnorm).newTensor()

proc renorm*(self: Tensor; p: float; dim: int; maxnorm: float): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "renorm", p, dim, maxnorm).newTensor()

proc unfold*(ty: TensorType; self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "unfold", self.toATensor(), dimension, size, step).newTensor()

proc unfold*(self: Tensor; dimension: int; size: int; step: int): Tensor {.inline.} = 
  self.tensor.atenMethod(ATensor, "unfold", dimension, size, step).newTensor()

proc equal*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  ty[].atenMethod(bool, "equal", self.toATensor(), other.toATensor())

proc equal*(self: Tensor; other: Tensor): bool {.inline.} = 
  self.tensor.atenMethod(bool, "equal", other.toATensor())

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
  ty[].atenMethod(ATensor, "_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).newTensor()

proc dirichlet_grad_impl*(x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::_dirichlet_grad", x.toATensor(), alpha.toATensor(), total.toATensor()).newTensor()

proc binary_cross_entropy*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.}

proc binary_cross_entropy*(self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.}

proc binary_cross_entropy_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).newTensor()

proc binary_cross_entropy_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::binary_cross_entropy_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), weight.toATensor(), reduction).newTensor()

proc mse_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc mse_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc mse_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc mse_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::mse_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc l1_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc multi_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; p: float = 1; margin: float = 1; weight: Tensor; reduction: int): Tensor {.inline.}

proc multi_margin_loss*(self: Tensor; target: Tensor; p: float = 1; margin: float = 1; weight: Tensor; reduction: int): Tensor {.inline.}

proc multi_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).newTensor()

proc multi_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::multi_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), p, margin, weight.toATensor(), reduction).newTensor()

proc multilabel_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "multilabel_margin_loss", self.toATensor(), target.toATensor(), reduction).newTensor()

proc multilabel_margin_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::multilabel_margin_loss", self.toATensor(), target.toATensor(), reduction).newTensor()

proc multilabel_margin_loss_forward*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.}

proc multilabel_margin_loss_forward*(self: Tensor; target: Tensor; reduction: int): tuple[output: Tensor, is_target: Tensor] {.inline.}

proc multilabel_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).newTensor()

proc multilabel_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int; is_target: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::multilabel_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction, is_target.toATensor()).newTensor()

proc nll_loss*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "nll_loss", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).newTensor()

proc nll_loss*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  atenFunction(ATensor, "at::nll_loss", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).newTensor()

proc nll_loss_forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss_forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc nll_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc nll_loss2d*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "nll_loss2d", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).newTensor()

proc nll_loss2d*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int = -100): Tensor {.inline.} = 
  atenFunction(ATensor, "at::nll_loss2d", self.toATensor(), target.toATensor(), weight.toATensor(), reduction, ignore_index).newTensor()

proc nll_loss2d_forward*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss2d_forward*(self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc nll_loss2d_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int; ignore_index: int; total_weight: Tensor): Tensor {.inline.}

proc smooth_l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc smooth_l1_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc smooth_l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc smooth_l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::smooth_l1_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc soft_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc soft_margin_loss*(self: Tensor; target: Tensor; reduction: int): Tensor {.inline.}

proc soft_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc soft_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::soft_margin_loss_backward", grad_output.toATensor(), self.toATensor(), target.toATensor(), reduction).newTensor()

proc elu*(ty: TensorType; self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline.}

proc elu*(self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline.}

proc elu_backward*(ty: TensorType; grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).newTensor()

proc elu_backward*(grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::elu_backward", grad_output.toATensor(), alpha, scale, input_scale, output.toATensor()).newTensor()

proc elu_inplace*(ty: TensorType; self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline, discardable.} = 
  ty[].atenMethod(void, "elu_", self.toATensor(), alpha, scale, input_scale); self

proc elu_inplace*(self: Tensor; alpha: float = 1; scale: float = 1; input_scale: float = 1): Tensor {.inline, discardable.} = 
  atenFunction(void, "at::elu_", self.toATensor(), alpha, scale, input_scale); self

proc glu*(ty: TensorType; self: Tensor; dim: int = -1): Tensor {.inline.}

proc glu*(self: Tensor; dim: int = -1): Tensor {.inline.}

proc glu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "glu_backward", grad_output.toATensor(), self.toATensor(), dim).newTensor()

proc glu_backward*(grad_output: Tensor; self: Tensor; dim: int): Tensor {.inline.} = 
  atenFunction(ATensor, "at::glu_backward", grad_output.toATensor(), self.toATensor(), dim).newTensor()

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
  ty[].atenMethod(ATensor, "log_sigmoid", self.toATensor()).newTensor()

proc log_sigmoid*(self: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::log_sigmoid", self.toATensor()).newTensor()

proc log_sigmoid_forward*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.}

proc log_sigmoid_forward*(self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.}

proc log_sigmoid_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).newTensor()

proc log_sigmoid_backward*(grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::log_sigmoid_backward", grad_output.toATensor(), self.toATensor(), buffer.toATensor()).newTensor()

proc rrelu_with_noise*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.}

proc rrelu_with_noise*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.}

proc rrelu_with_noise_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.}

proc rrelu_with_noise_backward*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.}

proc rrelu_with_noise_inplace*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.}

proc rrelu_with_noise_inplace*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.}

proc softplus*(ty: TensorType; self: Tensor; beta: float = 1; threshold: float = 20): Tensor {.inline.}

proc softplus*(self: Tensor; beta: float = 1; threshold: float = 20): Tensor {.inline.}

proc softplus_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).newTensor()

proc softplus_backward*(grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::softplus_backward", grad_output.toATensor(), self.toATensor(), beta, threshold, output.toATensor()).newTensor()

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
  ty[].atenMethod(ATensor, "adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

proc adaptive_max_pool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::adaptive_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

proc adaptive_max_pool3d*(ty: TensorType; self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool3d*(self: Tensor; output_size: openarray[int]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

proc adaptive_max_pool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::adaptive_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor()).newTensor()

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
  ty[].atenMethod(ATensor, "fractional_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).newTensor()

proc fractional_max_pool2d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::fractional_max_pool2d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).newTensor()

proc fractional_max_pool3d*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.}

proc fractional_max_pool3d*(self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.}

proc fractional_max_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "fractional_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).newTensor()

proc fractional_max_pool3d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; output_size: openarray[int]; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::fractional_max_pool3d_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), output_size.toAIntList(), indices.toATensor()).newTensor()

proc max_pool2d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool2d_with_indices*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool2d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc max_pool2d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::max_pool2d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc max_pool3d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool3d_with_indices*(self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int] = [0]; dilation: openarray[int] = [1]; ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool3d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc max_pool3d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  atenFunction(ATensor, "at::max_pool3d_with_indices_backward", grad_output.toATensor(), self.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.toATensor()).newTensor()

proc max_unpool2d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool2d*(self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]): Tensor {.inline.}

proc max_unpool3d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.}

proc max_unpool3d*(self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.}

proc max_unpool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).newTensor()

proc max_unpool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[int]; stride: openarray[int]; padding: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::max_unpool3d_backward", grad_output.toATensor(), self.toATensor(), indices.toATensor(), output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).newTensor()

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

proc upsample_bicubic2d*(ty: TensorType; self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_bicubic2d*(self: Tensor; output_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_bicubic2d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

proc upsample_bicubic2d_backward*(grad_output: Tensor; output_size: openarray[int]; input_size: openarray[int]; align_corners: bool): Tensor {.inline.}

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
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::thnn_conv_transpose2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_transpose3d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv_transpose3d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv_transpose3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; output_padding: openarray[int]; dilation: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::thnn_conv_transpose3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv2d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv2d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::thnn_conv2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.}

proc thnn_conv_depthwise2d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): Tensor {.inline.}

proc thnn_conv_depthwise2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple2[ATensor, ATensor], "thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  atenFunction(StdTuple2[ATensor, ATensor], "at::thnn_conv_depthwise2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).toNimTuple().newTensors()

proc thnn_conv3d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv3d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::thnn_conv3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.toATensor(), fgrad_input.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated2d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated2d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::thnn_conv_dilated2d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated3d_forward*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated3d_forward*(self: Tensor; weight: Tensor; kernel_size: openarray[int]; bias: Tensor; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty[].atenMethod(StdTuple3[ATensor, ATensor, ATensor], "thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[int]; stride: openarray[int]; padding: openarray[int]; dilation: openarray[int]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction(StdTuple3[ATensor, ATensor, ATensor], "at::thnn_conv_dilated3d_backward", grad_output.toATensor(), self.toATensor(), weight.toATensor(), kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.toATensor(), ones.toATensor(), output_mask).toNimTuple().newTensors()

proc thnn_col2im*(ty: TensorType; self: Tensor; output_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.}

proc thnn_col2im*(self: Tensor; output_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.}

proc thnn_col2im_backward*(ty: TensorType; grad_output: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "thnn_col2im_backward", grad_output.toATensor(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_col2im_backward*(grad_output: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::thnn_col2im_backward", grad_output.toATensor(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_im2col*(ty: TensorType; self: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.}

proc thnn_im2col*(self: Tensor; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.}

proc thnn_im2col_backward*(ty: TensorType; grad_output: Tensor; input_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  ty[].atenMethod(ATensor, "thnn_im2col_backward", grad_output.toATensor(), input_size.toAIntList(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

proc thnn_im2col_backward*(grad_output: Tensor; input_size: openarray[int]; kernel_size: openarray[int]; dilation: openarray[int]; padding: openarray[int]; stride: openarray[int]): Tensor {.inline.} = 
  atenFunction(ATensor, "at::thnn_im2col_backward", grad_output.toATensor(), input_size.toAIntList(), kernel_size.toAIntList(), dilation.toAIntList(), padding.toAIntList(), stride.toAIntList()).newTensor()

