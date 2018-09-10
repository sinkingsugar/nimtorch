# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

import math
import ../torch
import autograd_helpers

const M_PI = math.PI

proc storage_offset(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("storage_offset", self.tensor).to(int64)

proc storage_offset(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("storage_offset").to(int64)

proc resize_inplace(ty: TensorType; self: Tensor, size: IntList): Tensor = 
  ty.dynamicCppCall("resize_", self.tensor, size).to(ATensor).newTensor()

proc resize_inplace(self: Tensorself: Tensor, size: IntList): Tensor = 
  self.dynamicCppCall("resize_", size).to(ATensor).newTensor()

proc set_inplace(ty: TensorType; self: Tensor, source: AStorage): Tensor = 
  ty.dynamicCppCall("set_", self.tensor, source).to(ATensor).newTensor()

proc set_inplace(self: Tensorself: Tensor, source: AStorage): Tensor = 
  self.dynamicCppCall("set_", source).to(ATensor).newTensor()

proc set_inplace(ty: TensorType; self: Tensor, source: AStorage, storage_offset: int64, size: IntList, stride: IntList): Tensor = 
  ty.dynamicCppCall("set_", self.tensor, source, storage_offset, size, stride).to(ATensor).newTensor()

proc set_inplace(self: Tensorself: Tensor, source: AStorage, storage_offset: int64, size: IntList, stride: IntList): Tensor = 
  self.dynamicCppCall("set_", source, storage_offset, size, stride).to(ATensor).newTensor()

proc set_inplace(ty: TensorType; self: Tensor, source: Tensor): Tensor = 
  ty.dynamicCppCall("set_", self.tensor, source.tensor).to(ATensor).newTensor()

proc set_inplace(self: Tensorself: Tensor, source: Tensor): Tensor = 
  self.dynamicCppCall("set_", source.tensor).to(ATensor).newTensor()

proc set_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("set_", self.tensor).to(ATensor).newTensor()

proc set_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("set_").to(ATensor).newTensor()

proc fill_internal_inplace(ty: TensorType; self: Tensor, value: float): Tensor = 
  ty.dynamicCppCall("_fill_", self.tensor, value).to(ATensor).newTensor()

proc fill_internal_inplace(self: Tensorself: Tensor, value: float): Tensor = 
  self.dynamicCppCall("_fill_", value).to(ATensor).newTensor()

proc fill_internal_inplace(ty: TensorType; self: Tensor, value: Tensor): Tensor = 
  ty.dynamicCppCall("_fill_", self.tensor, value.tensor).to(ATensor).newTensor()

proc fill_internal_inplace(self: Tensorself: Tensor, value: Tensor): Tensor = 
  self.dynamicCppCall("_fill_", value.tensor).to(ATensor).newTensor()

proc is_contiguous(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_contiguous", self.tensor).to(bool)

proc is_contiguous(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_contiguous").to(bool)

proc is_set_to(ty: TensorType; self: Tensor, tensor: Tensor): bool = 
  ty.dynamicCppCall("is_set_to", self.tensor, tensor.tensor).to(bool)

proc is_set_to(self: Tensorself: Tensor, tensor: Tensor): bool = 
  self.dynamicCppCall("is_set_to", tensor.tensor).to(bool)

proc masked_fill_inplace(self: Tensorself: Tensor, mask: Tensor, value: float): Tensor

proc masked_fill_inplace(self: Tensorself: Tensor, mask: Tensor, value: Tensor): Tensor

proc masked_scatter_inplace(ty: TensorType; self: Tensor, mask: Tensor, source: Tensor): Tensor = 
  ty.dynamicCppCall("masked_scatter_", self.tensor, mask.tensor, source.tensor).to(ATensor).newTensor()

proc masked_scatter_inplace(self: Tensorself: Tensor, mask: Tensor, source: Tensor): Tensor = 
  self.dynamicCppCall("masked_scatter_", mask.tensor, source.tensor).to(ATensor).newTensor()

proc nonzero(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("nonzero", self.tensor).to(ATensor).newTensor()

proc nonzero(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("nonzero").to(ATensor).newTensor()

proc contiguous(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("contiguous", self.tensor).to(ATensor).newTensor()

proc contiguous(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("contiguous").to(ATensor).newTensor()

proc th_clone(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("th_clone", self.tensor).to(ATensor).newTensor()

proc th_clone(self: Tensor): Tensor = 
  dynamicCCall("at::th_clone", self.tensor).to(ATensor).newTensor()

proc view(self: Tensorself: Tensor, size: IntList): Tensor

proc th_resize_as_inplace(ty: TensorType; self: Tensor, the_template: Tensor): Tensor = 
  ty.dynamicCppCall("th_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc th_resize_as_inplace(self: Tensor, the_template: Tensor): Tensor = 
  dynamicCCall("at::th_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc index_select(ty: TensorType; self: Tensor, dim: int64, index: Tensor): Tensor = 
  ty.dynamicCppCall("index_select", self.tensor, dim, index.tensor).to(ATensor).newTensor()

proc index_select(self: Tensorself: Tensor, dim: int64, index: Tensor): Tensor = 
  self.dynamicCppCall("index_select", dim, index.tensor).to(ATensor).newTensor()

proc indexCopy_internal_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor = 
  ty.dynamicCppCall("_indexCopy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()

proc indexCopy_internal_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor = 
  self.dynamicCppCall("_indexCopy_", dim, index.tensor, source.tensor).to(ATensor).newTensor()

proc take(self: Tensorself: Tensor, index: Tensor): Tensor

proc put_inplace(self: Tensorself: Tensor, index: Tensor, source: Tensor, accumulate: bool = false): Tensor

proc index_fill_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, value: float): Tensor

proc index_fill_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, value: Tensor): Tensor

proc unfold(ty: TensorType; self: Tensor, dimension: int64, size: int64, step: int64): Tensor = 
  ty.dynamicCppCall("unfold", self.tensor, dimension, size, step).to(ATensor).newTensor()

proc unfold(self: Tensorself: Tensor, dimension: int64, size: int64, step: int64): Tensor = 
  self.dynamicCppCall("unfold", dimension, size, step).to(ATensor).newTensor()

proc range_internal(ty: TensorType; start: float, end_name: float, step: float = 1): Tensor = 
  ty.dynamicCppCall("_range", start, end_name, step).to(ATensor).newTensor()

proc arange_internal(ty: TensorType; start: float, end_name: float, step: float = 1): Tensor = 
  ty.dynamicCppCall("_arange", start, end_name, step).to(ATensor).newTensor()

proc arange_internal(ty: TensorType; end_name: float): Tensor = 
  ty.dynamicCppCall("_arange", end_name).to(ATensor).newTensor()

proc scatter_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, src: Tensor): Tensor

proc scatter_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, value: float): Tensor

proc gather(ty: TensorType; self: Tensor, dim: int64, index: Tensor): Tensor = 
  ty.dynamicCppCall("gather", self.tensor, dim, index.tensor).to(ATensor).newTensor()

proc gather(self: Tensorself: Tensor, dim: int64, index: Tensor): Tensor = 
  self.dynamicCppCall("gather", dim, index.tensor).to(ATensor).newTensor()

proc data_ptr(ty: TensorType; self: Tensor): pointer = 
  ty.dynamicCppCall("data_ptr", self.tensor).to(pointer)

proc data_ptr(self: Tensorself: Tensor): pointer = 
  self.dynamicCppCall("data_ptr").to(pointer)

proc equal(ty: TensorType; self: Tensor, other: Tensor): bool = 
  ty.dynamicCppCall("equal", self.tensor, other.tensor).to(bool)

proc equal(self: Tensorself: Tensor, other: Tensor): bool = 
  self.dynamicCppCall("equal", other.tensor).to(bool)

proc and_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__and__", self.tensor, other).to(ATensor).newTensor()

proc and_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__and__", other).to(ATensor).newTensor()

proc and_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__and__", self.tensor, other.tensor).to(ATensor).newTensor()

proc and_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__and__", other.tensor).to(ATensor).newTensor()

proc iand_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__iand__", self.tensor, other).to(ATensor).newTensor()

proc iand_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__iand__", other).to(ATensor).newTensor()

proc iand_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__iand__", self.tensor, other.tensor).to(ATensor).newTensor()

proc iand_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__iand__", other.tensor).to(ATensor).newTensor()

proc or_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__or__", self.tensor, other).to(ATensor).newTensor()

proc or_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__or__", other).to(ATensor).newTensor()

proc or_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__or__", self.tensor, other.tensor).to(ATensor).newTensor()

proc or_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__or__", other.tensor).to(ATensor).newTensor()

proc ior_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__ior__", self.tensor, other).to(ATensor).newTensor()

proc ior_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__ior__", other).to(ATensor).newTensor()

proc ior_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__ior__", self.tensor, other.tensor).to(ATensor).newTensor()

proc ior_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__ior__", other.tensor).to(ATensor).newTensor()

proc xor_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__xor__", self.tensor, other).to(ATensor).newTensor()

proc xor_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__xor__", other).to(ATensor).newTensor()

proc xor_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__xor__", self.tensor, other.tensor).to(ATensor).newTensor()

proc xor_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__xor__", other.tensor).to(ATensor).newTensor()

proc ixor_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__ixor__", self.tensor, other).to(ATensor).newTensor()

proc ixor_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__ixor__", other).to(ATensor).newTensor()

proc ixor_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__ixor__", self.tensor, other.tensor).to(ATensor).newTensor()

proc ixor_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__ixor__", other.tensor).to(ATensor).newTensor()

proc lshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__lshift__", self.tensor, other).to(ATensor).newTensor()

proc lshift_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__lshift__", other).to(ATensor).newTensor()

proc lshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__lshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc lshift_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__lshift__", other.tensor).to(ATensor).newTensor()

proc ilshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__ilshift__", self.tensor, other).to(ATensor).newTensor()

proc ilshift_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__ilshift__", other).to(ATensor).newTensor()

proc ilshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__ilshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc ilshift_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__ilshift__", other.tensor).to(ATensor).newTensor()

proc rshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__rshift__", self.tensor, other).to(ATensor).newTensor()

proc rshift_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__rshift__", other).to(ATensor).newTensor()

proc rshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__rshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc rshift_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__rshift__", other.tensor).to(ATensor).newTensor()

proc irshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("__irshift__", self.tensor, other).to(ATensor).newTensor()

proc irshift_builtin_internal_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("__irshift__", other).to(ATensor).newTensor()

proc irshift_builtin_internal_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("__irshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc irshift_builtin_internal_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("__irshift__", other.tensor).to(ATensor).newTensor()

proc lt(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("lt", self.tensor, other).to(ATensor).newTensor()

proc lt(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("lt", other).to(ATensor).newTensor()

proc lt(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("lt", self.tensor, other.tensor).to(ATensor).newTensor()

proc lt(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("lt", other.tensor).to(ATensor).newTensor()

proc gt(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("gt", self.tensor, other).to(ATensor).newTensor()

proc gt(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("gt", other).to(ATensor).newTensor()

proc gt(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("gt", self.tensor, other.tensor).to(ATensor).newTensor()

proc gt(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("gt", other.tensor).to(ATensor).newTensor()

proc le(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("le", self.tensor, other).to(ATensor).newTensor()

proc le(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("le", other).to(ATensor).newTensor()

proc le(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("le", self.tensor, other.tensor).to(ATensor).newTensor()

proc le(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("le", other.tensor).to(ATensor).newTensor()

proc ge(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("ge", self.tensor, other).to(ATensor).newTensor()

proc ge(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("ge", other).to(ATensor).newTensor()

proc ge(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("ge", self.tensor, other.tensor).to(ATensor).newTensor()

proc ge(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("ge", other.tensor).to(ATensor).newTensor()

proc eq(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("eq", self.tensor, other).to(ATensor).newTensor()

proc eq(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("eq", other).to(ATensor).newTensor()

proc eq(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("eq", self.tensor, other.tensor).to(ATensor).newTensor()

proc eq(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("eq", other.tensor).to(ATensor).newTensor()

proc ne(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("ne", self.tensor, other).to(ATensor).newTensor()

proc ne(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("ne", other).to(ATensor).newTensor()

proc ne(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("ne", self.tensor, other.tensor).to(ATensor).newTensor()

proc ne(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("ne", other.tensor).to(ATensor).newTensor()

proc min(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("min", self.tensor).to(float)

proc min(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("min").to(float)

proc th_min_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] = 
  ty.dynamicCppCall("_th_min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_min_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] = 
  self.dynamicCppCall("_th_min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("max", self.tensor).to(float)

proc max(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("max").to(float)

proc th_max_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] = 
  ty.dynamicCppCall("_th_max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_max_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] = 
  self.dynamicCppCall("_th_max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_internal(ty: TensorType; self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("_th_kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_internal(self: Tensorself: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.dynamicCppCall("_th_kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_internal(ty: TensorType; self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("_th_mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_internal(self: Tensorself: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.dynamicCppCall("_th_mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc median(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("median", self.tensor).to(float)

proc median(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("median").to(float)

proc th_median_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("_th_median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_median_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.dynamicCppCall("_th_median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc sort(ty: TensorType; self: Tensor, dim: int64 = -1, descending: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("sort", self.tensor, dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc sort(self: Tensorself: Tensor, dim: int64 = -1, descending: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.dynamicCppCall("sort", dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk(ty: TensorType; self: Tensor, k: int64, dim: int64 = -1, largest: bool = true, sorted: bool = true): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("topk", self.tensor, k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk(self: Tensorself: Tensor, k: int64, dim: int64 = -1, largest: bool = true, sorted: bool = true): tuple[values: Tensor, indices: Tensor] = 
  self.dynamicCppCall("topk", k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc all(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("all", self.tensor).to(float)

proc all(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("all").to(float)

proc th_all_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_all", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_all_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_th_all", dim, keepdim).to(ATensor).newTensor()

proc any(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("any", self.tensor).to(float)

proc any(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("any").to(float)

proc th_any_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_any", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_any_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_th_any", dim, keepdim).to(ATensor).newTensor()

proc th_get_device_internal(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_th_get_device", self.tensor).to(int64)

proc th_get_device_internal(self: Tensor): int64 = 
  dynamicCCall("at::_th_get_device", self.tensor).to(int64)

proc abs_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_abs", self.tensor).to(ATensor).newTensor()

proc abs_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_abs").to(ATensor).newTensor()

proc th_sigmoid_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_th_sigmoid", self.tensor).to(ATensor).newTensor()

proc th_sigmoid_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_th_sigmoid").to(ATensor).newTensor()

proc log_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log", self.tensor).to(ATensor).newTensor()

proc log_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_log").to(ATensor).newTensor()

proc log10_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log10", self.tensor).to(ATensor).newTensor()

proc log10_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_log10").to(ATensor).newTensor()

proc log1p_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log1p", self.tensor).to(ATensor).newTensor()

proc log1p_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_log1p").to(ATensor).newTensor()

proc log2_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log2", self.tensor).to(ATensor).newTensor()

proc log2_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_log2").to(ATensor).newTensor()

proc lgamma_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("lgamma_", self.tensor).to(ATensor).newTensor()

proc lgamma_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("lgamma_").to(ATensor).newTensor()

proc digamma(self: Tensorself: Tensor): Tensor

proc digamma_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("digamma_", self.tensor).to(ATensor).newTensor()

proc digamma_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("digamma_").to(ATensor).newTensor()

proc polygamma(self: Tensorn: int64, self: Tensor): Tensor = 
  self.dynamicCppCall("polygamma", n).to(ATensor).newTensor()

proc polygamma_inplace(ty: TensorType; self: Tensor, n: int64): Tensor = 
  ty.dynamicCppCall("polygamma_", self.tensor, n).to(ATensor).newTensor()

proc polygamma_inplace(self: Tensorself: Tensor, n: int64): Tensor = 
  self.dynamicCppCall("polygamma_", n).to(ATensor).newTensor()

proc exp_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_exp", self.tensor).to(ATensor).newTensor()

proc exp_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_exp").to(ATensor).newTensor()

proc expm1_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_expm1", self.tensor).to(ATensor).newTensor()

proc expm1_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_expm1").to(ATensor).newTensor()

proc cos_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_cos", self.tensor).to(ATensor).newTensor()

proc cos_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_cos").to(ATensor).newTensor()

proc acos_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_acos", self.tensor).to(ATensor).newTensor()

proc acos_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_acos").to(ATensor).newTensor()

proc cosh_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_cosh", self.tensor).to(ATensor).newTensor()

proc cosh_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_cosh").to(ATensor).newTensor()

proc sin_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sin", self.tensor).to(ATensor).newTensor()

proc sin_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_sin").to(ATensor).newTensor()

proc asin_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_asin", self.tensor).to(ATensor).newTensor()

proc asin_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_asin").to(ATensor).newTensor()

proc sinh_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sinh", self.tensor).to(ATensor).newTensor()

proc sinh_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_sinh").to(ATensor).newTensor()

proc tan_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_tan", self.tensor).to(ATensor).newTensor()

proc tan_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_tan").to(ATensor).newTensor()

proc atan_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_atan", self.tensor).to(ATensor).newTensor()

proc atan_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_atan").to(ATensor).newTensor()

proc th_tanh_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_th_tanh", self.tensor).to(ATensor).newTensor()

proc th_tanh_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_th_tanh").to(ATensor).newTensor()

proc erf_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_erf", self.tensor).to(ATensor).newTensor()

proc erf_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_erf").to(ATensor).newTensor()

proc erfc_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_erfc", self.tensor).to(ATensor).newTensor()

proc erfc_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_erfc").to(ATensor).newTensor()

proc erfinv_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("erfinv_", self.tensor).to(ATensor).newTensor()

proc erfinv_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("erfinv_").to(ATensor).newTensor()

proc sqrt_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sqrt", self.tensor).to(ATensor).newTensor()

proc sqrt_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_sqrt").to(ATensor).newTensor()

proc rsqrt_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_rsqrt", self.tensor).to(ATensor).newTensor()

proc rsqrt_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_rsqrt").to(ATensor).newTensor()

proc ceil_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_ceil", self.tensor).to(ATensor).newTensor()

proc ceil_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_ceil").to(ATensor).newTensor()

proc floor_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_floor", self.tensor).to(ATensor).newTensor()

proc floor_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_floor").to(ATensor).newTensor()

proc round_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_round", self.tensor).to(ATensor).newTensor()

proc round_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_round").to(ATensor).newTensor()

proc trunc_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_trunc", self.tensor).to(ATensor).newTensor()

proc trunc_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_trunc").to(ATensor).newTensor()

proc frac_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("frac_", self.tensor).to(ATensor).newTensor()

proc frac_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("frac_").to(ATensor).newTensor()

proc th_var_internal(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_var", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_internal(self: Tensorself: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_th_var", dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_internal(ty: TensorType; self: Tensor, unbiased: bool = true): float = 
  ty.dynamicCppCall("_th_var", self.tensor, unbiased).to(float)

proc th_var_internal(self: Tensorself: Tensor, unbiased: bool = true): float = 
  self.dynamicCppCall("_th_var", unbiased).to(float)

proc th_std_internal(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_std", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_internal(self: Tensorself: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_th_std", dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_internal(ty: TensorType; self: Tensor, unbiased: bool = true): float = 
  ty.dynamicCppCall("_th_std", self.tensor, unbiased).to(float)

proc th_std_internal(self: Tensorself: Tensor, unbiased: bool = true): float = 
  self.dynamicCppCall("_th_std", unbiased).to(float)

proc th_norm(ty: TensorType; self: Tensor, p: float = 2): float = 
  ty.dynamicCppCall("th_norm", self.tensor, p).to(float)

proc th_norm(self: Tensor, p: float = 2): float = 
  dynamicCCall("at::th_norm", self.tensor, p).to(float)

proc th_norm_internal(ty: TensorType; self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_norm", self.tensor, p, dim, keepdim).to(ATensor).newTensor()

proc th_norm_internal(self: Tensorself: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_th_norm", p, dim, keepdim).to(ATensor).newTensor()

proc renorm(ty: TensorType; self: Tensor, p: float, dim: int64, maxnorm: float): Tensor = 
  ty.dynamicCppCall("renorm", self.tensor, p, dim, maxnorm).to(ATensor).newTensor()

proc renorm(self: Tensorself: Tensor, p: float, dim: int64, maxnorm: float): Tensor = 
  self.dynamicCppCall("renorm", p, dim, maxnorm).to(ATensor).newTensor()

proc renorm_inplace(ty: TensorType; self: Tensor, p: float, dim: int64, maxnorm: float): Tensor = 
  ty.dynamicCppCall("renorm_", self.tensor, p, dim, maxnorm).to(ATensor).newTensor()

proc renorm_inplace(self: Tensorself: Tensor, p: float, dim: int64, maxnorm: float): Tensor = 
  self.dynamicCppCall("renorm_", p, dim, maxnorm).to(ATensor).newTensor()

proc dist(ty: TensorType; self: Tensor, other: Tensor, p: float = 2): float = 
  ty.dynamicCppCall("dist", self.tensor, other.tensor, p).to(float)

proc dist(self: Tensorself: Tensor, other: Tensor, p: float = 2): float = 
  self.dynamicCppCall("dist", other.tensor, p).to(float)

proc reciprocal_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("reciprocal_", self.tensor).to(ATensor).newTensor()

proc reciprocal_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("reciprocal_").to(ATensor).newTensor()

proc neg(self: Tensorself: Tensor): Tensor

proc neg_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("neg_", self.tensor).to(ATensor).newTensor()

proc neg_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("neg_").to(ATensor).newTensor()

proc atan2_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("atan2_", self.tensor, other.tensor).to(ATensor).newTensor()

proc atan2_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("atan2_", other.tensor).to(ATensor).newTensor()

proc th_pow(ty: TensorType; self: Tensor, exponent: float): Tensor = 
  ty.dynamicCppCall("th_pow", self.tensor, exponent).to(ATensor).newTensor()

proc th_pow(self: Tensor, exponent: float): Tensor = 
  dynamicCCall("at::th_pow", self.tensor, exponent).to(ATensor).newTensor()

proc pow(self: Tensorself: Tensor, exponent: Tensor): Tensor

proc pow(ty: TensorType; base: float, self: Tensor): Tensor = 
  ty.dynamicCppCall("pow", base, self.tensor).to(ATensor).newTensor()

proc pow(base: float, self: Tensor): Tensor = 
  dynamicCCall("at::pow", base, self.tensor).to(ATensor).newTensor()

proc pow_inplace(ty: TensorType; self: Tensor, exponent: float): Tensor = 
  ty.dynamicCppCall("pow_", self.tensor, exponent).to(ATensor).newTensor()

proc pow_inplace(self: Tensorself: Tensor, exponent: float): Tensor = 
  self.dynamicCppCall("pow_", exponent).to(ATensor).newTensor()

proc pow_inplace(ty: TensorType; self: Tensor, exponent: Tensor): Tensor = 
  ty.dynamicCppCall("pow_", self.tensor, exponent.tensor).to(ATensor).newTensor()

proc pow_inplace(self: Tensorself: Tensor, exponent: Tensor): Tensor = 
  self.dynamicCppCall("pow_", exponent.tensor).to(ATensor).newTensor()

proc lerp(ty: TensorType; self: Tensor, end_name: Tensor, weight: float): Tensor = 
  ty.dynamicCppCall("lerp", self.tensor, end_name.tensor, weight).to(ATensor).newTensor()

proc lerp(self: Tensorself: Tensor, end_name: Tensor, weight: float): Tensor = 
  self.dynamicCppCall("lerp", end_name.tensor, weight).to(ATensor).newTensor()

proc lerp_inplace(ty: TensorType; self: Tensor, end_name: Tensor, weight: float): Tensor = 
  ty.dynamicCppCall("lerp_", self.tensor, end_name.tensor, weight).to(ATensor).newTensor()

proc lerp_inplace(self: Tensorself: Tensor, end_name: Tensor, weight: float): Tensor = 
  self.dynamicCppCall("lerp_", end_name.tensor, weight).to(ATensor).newTensor()

proc linspace_internal(ty: TensorType; start: float, end_name: float, steps: int64 = 100): Tensor = 
  ty.dynamicCppCall("_linspace", start, end_name, steps).to(ATensor).newTensor()

proc logspace_internal(ty: TensorType; start: float, end_name: float, steps: int64 = 100): Tensor = 
  ty.dynamicCppCall("_logspace", start, end_name, steps).to(ATensor).newTensor()

proc histc(ty: TensorType; self: Tensor, bins: int64 = 100, min: float = 0, max: float = 0): Tensor = 
  ty.dynamicCppCall("histc", self.tensor, bins, min, max).to(ATensor).newTensor()

proc histc(self: Tensorself: Tensor, bins: int64 = 100, min: float = 0, max: float = 0): Tensor = 
  self.dynamicCppCall("histc", bins, min, max).to(ATensor).newTensor()

proc th_zero_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("th_zero_", self.tensor).to(ATensor).newTensor()

proc th_zero_inplace(self: Tensor): Tensor = 
  dynamicCCall("at::th_zero_", self.tensor).to(ATensor).newTensor()

proc sumall_internal(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_sumall", self.tensor).to(float)

proc sumall_internal(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("_sumall").to(float)

proc th_sum_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_sum", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_sum_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_th_sum", dim, keepdim).to(ATensor).newTensor()

proc prodall_internal(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_prodall", self.tensor).to(float)

proc prodall_internal(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("_prodall").to(float)

proc th_prod_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_prod_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_th_prod", dim, keepdim).to(ATensor).newTensor()

proc cumsum_internal(ty: TensorType; self: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("_cumsum", self.tensor, dim).to(ATensor).newTensor()

proc cumsum_internal(self: Tensorself: Tensor, dim: int64): Tensor = 
  self.dynamicCppCall("_cumsum", dim).to(ATensor).newTensor()

proc cumprod_internal(ty: TensorType; self: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("_cumprod", self.tensor, dim).to(ATensor).newTensor()

proc cumprod_internal(self: Tensorself: Tensor, dim: int64): Tensor = 
  self.dynamicCppCall("_cumprod", dim).to(ATensor).newTensor()

proc sign(self: Tensorself: Tensor): Tensor

proc sign_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sign_", self.tensor).to(ATensor).newTensor()

proc sign_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("sign_").to(ATensor).newTensor()

proc trace(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("trace", self.tensor).to(float)

proc trace(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("trace").to(float)

proc fmod_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("fmod_", self.tensor, other).to(ATensor).newTensor()

proc fmod_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("fmod_", other).to(ATensor).newTensor()

proc fmod_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("fmod_", self.tensor, other.tensor).to(ATensor).newTensor()

proc fmod_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("fmod_", other.tensor).to(ATensor).newTensor()

proc remainder_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("remainder_", self.tensor, other).to(ATensor).newTensor()

proc remainder_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("remainder_", other).to(ATensor).newTensor()

proc remainder_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("remainder_", self.tensor, other.tensor).to(ATensor).newTensor()

proc remainder_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("remainder_", other.tensor).to(ATensor).newTensor()

proc th_clamp_internal(ty: TensorType; self: Tensor, min: float, max: float): Tensor = 
  ty.dynamicCppCall("_th_clamp", self.tensor, min, max).to(ATensor).newTensor()

proc th_clamp_internal(self: Tensorself: Tensor, min: float, max: float): Tensor = 
  self.dynamicCppCall("_th_clamp", min, max).to(ATensor).newTensor()

proc th_clamp_min_internal(ty: TensorType; self: Tensor, min: float): Tensor = 
  ty.dynamicCppCall("_th_clamp_min", self.tensor, min).to(ATensor).newTensor()

proc th_clamp_min_internal(self: Tensorself: Tensor, min: float): Tensor = 
  self.dynamicCppCall("_th_clamp_min", min).to(ATensor).newTensor()

proc th_clamp_max_internal(ty: TensorType; self: Tensor, max: float): Tensor = 
  ty.dynamicCppCall("_th_clamp_max", self.tensor, max).to(ATensor).newTensor()

proc th_clamp_max_internal(self: Tensorself: Tensor, max: float): Tensor = 
  self.dynamicCppCall("_th_clamp_max", max).to(ATensor).newTensor()

proc dot_internal(ty: TensorType; self: Tensor, tensor: Tensor): float = 
  ty.dynamicCppCall("_dot", self.tensor, tensor.tensor).to(float)

proc dot_internal(self: Tensorself: Tensor, tensor: Tensor): float = 
  self.dynamicCppCall("_dot", tensor.tensor).to(float)

proc tril(self: Tensorself: Tensor, diagonal: int64 = 0): Tensor

proc tril_inplace(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor = 
  ty.dynamicCppCall("tril_", self.tensor, diagonal).to(ATensor).newTensor()

proc tril_inplace(self: Tensorself: Tensor, diagonal: int64 = 0): Tensor = 
  self.dynamicCppCall("tril_", diagonal).to(ATensor).newTensor()

proc triu(self: Tensorself: Tensor, diagonal: int64 = 0): Tensor

proc triu_inplace(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor = 
  ty.dynamicCppCall("triu_", self.tensor, diagonal).to(ATensor).newTensor()

proc triu_inplace(self: Tensorself: Tensor, diagonal: int64 = 0): Tensor = 
  self.dynamicCppCall("triu_", diagonal).to(ATensor).newTensor()

proc cross(self: Tensorself: Tensor, other: Tensor, dim: int64 = -1): Tensor

proc diag(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor = 
  ty.dynamicCppCall("diag", self.tensor, diagonal).to(ATensor).newTensor()

proc diag(self: Tensorself: Tensor, diagonal: int64 = 0): Tensor = 
  self.dynamicCppCall("diag", diagonal).to(ATensor).newTensor()

proc th_addmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc th_addmm(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  dynamicCCall("at::th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc th_addmm_inplace(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc th_addmm_inplace(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  dynamicCCall("at::th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_internal_inplace(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("_addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_internal_inplace(self: Tensorself: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("_addmv_", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_internal_inplace(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("_addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_internal_inplace(self: Tensorself: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("_addr_", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc ger_internal(ty: TensorType; self: Tensor, vec2: Tensor): Tensor = 
  ty.dynamicCppCall("_ger", self.tensor, vec2.tensor).to(ATensor).newTensor()

proc ger_internal(self: Tensorself: Tensor, vec2: Tensor): Tensor = 
  self.dynamicCppCall("_ger", vec2.tensor).to(ATensor).newTensor()

proc mv_internal(ty: TensorType; self: Tensor, vec: Tensor): Tensor = 
  ty.dynamicCppCall("_mv", self.tensor, vec.tensor).to(ATensor).newTensor()

proc mv_internal(self: Tensorself: Tensor, vec: Tensor): Tensor = 
  self.dynamicCppCall("_mv", vec.tensor).to(ATensor).newTensor()

proc mm_internal(ty: TensorType; self: Tensor, mat2: Tensor): Tensor = 
  ty.dynamicCppCall("_mm", self.tensor, mat2.tensor).to(ATensor).newTensor()

proc mm_internal(self: Tensorself: Tensor, mat2: Tensor): Tensor = 
  self.dynamicCppCall("_mm", mat2.tensor).to(ATensor).newTensor()

proc bmm(self: Tensorself: Tensor, mat2: Tensor): Tensor

proc addbmm_inplace(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc addbmm_inplace(self: Tensorself: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("addbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc baddbmm_inplace(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("baddbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc baddbmm_inplace(self: Tensorself: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("baddbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc addcmul_inplace(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor = 
  ty.dynamicCppCall("addcmul_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc addcmul_inplace(self: Tensorself: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor = 
  self.dynamicCppCall("addcmul_", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc addcdiv_inplace(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor = 
  ty.dynamicCppCall("addcdiv_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc addcdiv_inplace(self: Tensorself: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor = 
  self.dynamicCppCall("addcdiv_", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc gesv_single_internal(ty: TensorType; self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] = 
  ty.dynamicCppCall("_gesv_single", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_single_internal(self: Tensorself: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] = 
  self.dynamicCppCall("_gesv_single", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gels(ty: TensorType; self: Tensor, A: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("gels", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gels(self: Tensorself: Tensor, A: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  self.dynamicCppCall("gels", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs(ty: TensorType; self: Tensor, A: Tensor, upper: bool = true, transpose: bool = false, unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("trtrs", self.tensor, A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs(self: Tensorself: Tensor, A: Tensor, upper: bool = true, transpose: bool = false, unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  self.dynamicCppCall("trtrs", A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc symeig(ty: TensorType; self: Tensor, eigenvectors: bool = false, upper: bool = true): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("symeig", self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc symeig(self: Tensorself: Tensor, eigenvectors: bool = false, upper: bool = true): tuple[res1: Tensor, res2: Tensor] = 
  self.dynamicCppCall("symeig", eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc eig(ty: TensorType; self: Tensor, eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("eig", self.tensor, eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc eig(self: Tensorself: Tensor, eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  self.dynamicCppCall("eig", eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc svd(ty: TensorType; self: Tensor, some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] = 
  ty.dynamicCppCall("svd", self.tensor, some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc svd(self: Tensorself: Tensor, some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] = 
  self.dynamicCppCall("svd", some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc getri_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_getri", self.tensor).to(ATensor).newTensor()

proc getri_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_getri").to(ATensor).newTensor()

proc potrf(ty: TensorType; self: Tensor, upper: bool = true): Tensor = 
  ty.dynamicCppCall("potrf", self.tensor, upper).to(ATensor).newTensor()

proc potrf(self: Tensorself: Tensor, upper: bool = true): Tensor = 
  self.dynamicCppCall("potrf", upper).to(ATensor).newTensor()

proc potrs(ty: TensorType; self: Tensor, input2: Tensor, upper: bool = true): Tensor = 
  ty.dynamicCppCall("potrs", self.tensor, input2.tensor, upper).to(ATensor).newTensor()

proc potrs(self: Tensorself: Tensor, input2: Tensor, upper: bool = true): Tensor = 
  self.dynamicCppCall("potrs", input2.tensor, upper).to(ATensor).newTensor()

proc potri(ty: TensorType; self: Tensor, upper: bool = true): Tensor = 
  ty.dynamicCppCall("potri", self.tensor, upper).to(ATensor).newTensor()

proc potri(self: Tensorself: Tensor, upper: bool = true): Tensor = 
  self.dynamicCppCall("potri", upper).to(ATensor).newTensor()

proc pstrf(ty: TensorType; self: Tensor, upper: bool = true, tol: float = -1): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("pstrf", self.tensor, upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc pstrf(self: Tensorself: Tensor, upper: bool = true, tol: float = -1): tuple[res1: Tensor, res2: Tensor] = 
  self.dynamicCppCall("pstrf", upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("qr", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr(self: Tensorself: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  self.dynamicCppCall("qr").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("geqrf", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf(self: Tensorself: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  self.dynamicCppCall("geqrf").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc orgqr(ty: TensorType; self: Tensor, input2: Tensor): Tensor = 
  ty.dynamicCppCall("orgqr", self.tensor, input2.tensor).to(ATensor).newTensor()

proc orgqr(self: Tensorself: Tensor, input2: Tensor): Tensor = 
  self.dynamicCppCall("orgqr", input2.tensor).to(ATensor).newTensor()

proc ormqr(ty: TensorType; self: Tensor, input2: Tensor, input3: Tensor, left: bool = true, transpose: bool = false): Tensor = 
  ty.dynamicCppCall("ormqr", self.tensor, input2.tensor, input3.tensor, left, transpose).to(ATensor).newTensor()

proc ormqr(self: Tensorself: Tensor, input2: Tensor, input3: Tensor, left: bool = true, transpose: bool = false): Tensor = 
  self.dynamicCppCall("ormqr", input2.tensor, input3.tensor, left, transpose).to(ATensor).newTensor()

proc btrifact(ty: TensorType; self: Tensor, pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor] = 
  ty.dynamicCppCall("btrifact", self.tensor, pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact(self: Tensorself: Tensor, pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor] = 
  self.dynamicCppCall("btrifact", pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info(ty: TensorType; self: Tensor, pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor, info: Tensor] = 
  ty.dynamicCppCall("btrifact_with_info", self.tensor, pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info(self: Tensorself: Tensor, pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor, info: Tensor] = 
  self.dynamicCppCall("btrifact_with_info", pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrisolve(ty: TensorType; self: Tensor, LU_data: Tensor, LU_pivots: Tensor): Tensor = 
  ty.dynamicCppCall("btrisolve", self.tensor, LU_data.tensor, LU_pivots.tensor).to(ATensor).newTensor()

proc btrisolve(self: Tensorself: Tensor, LU_data: Tensor, LU_pivots: Tensor): Tensor = 
  self.dynamicCppCall("btrisolve", LU_data.tensor, LU_pivots.tensor).to(ATensor).newTensor()

proc multinomial(ty: TensorType; self: Tensor, num_samples: int64, replacement: bool = false, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("multinomial", self.tensor, num_samples, replacement, generator).to(ATensor).newTensor()

proc multinomial(self: Tensorself: Tensor, num_samples: int64, replacement: bool = false, generator: pointer = nil): Tensor = 
  self.dynamicCppCall("multinomial", num_samples, replacement, generator).to(ATensor).newTensor()

proc normal(ty: TensorType; mean: Tensor, std: float64 = 1, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("normal", mean.tensor, std, generator).to(ATensor).newTensor()

proc normal(mean: Tensor, std: float64 = 1, generator: pointer = nil): Tensor = 
  dynamicCCall("at::normal", mean.tensor, std, generator).to(ATensor).newTensor()

proc normal(ty: TensorType; mean: float64, std: Tensor, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("normal", mean, std.tensor, generator).to(ATensor).newTensor()

proc normal(mean: float64, std: Tensor, generator: pointer = nil): Tensor = 
  dynamicCCall("at::normal", mean, std.tensor, generator).to(ATensor).newTensor()

proc normal(ty: TensorType; mean: Tensor, std: Tensor, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("normal", mean.tensor, std.tensor, generator).to(ATensor).newTensor()

proc normal(mean: Tensor, std: Tensor, generator: pointer = nil): Tensor = 
  dynamicCCall("at::normal", mean.tensor, std.tensor, generator).to(ATensor).newTensor()

proc bernoulli_internal_inplace(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("_bernoulli_", self.tensor, p, generator).to(ATensor).newTensor()

proc bernoulli_internal_inplace(self: Tensorself: Tensor, p: float64, generator: pointer = nil): Tensor = 
  self.dynamicCppCall("_bernoulli_", p, generator).to(ATensor).newTensor()

proc th_bernoulli_internal(ty: TensorType; self: Tensor, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("_th_bernoulli", self.tensor, generator).to(ATensor).newTensor()

proc th_bernoulli_internal(self: Tensorself: Tensor, generator: pointer = nil): Tensor = 
  self.dynamicCppCall("_th_bernoulli", generator).to(ATensor).newTensor()

proc dirichlet_grad_internal(ty: TensorType; x: Tensor, alpha: Tensor, total: Tensor): Tensor = 
  ty.dynamicCppCall("_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor).newTensor()

proc dirichlet_grad_internal(x: Tensor, alpha: Tensor, total: Tensor): Tensor = 
  dynamicCCall("at::_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor).newTensor()

proc th_tensor(ty: TensorType; size: IntList): Tensor = 
  ty.dynamicCppCall("th_tensor", size).to(ATensor).newTensor()

proc th_tensor(ty: TensorType; ): Tensor = 
  ty.dynamicCppCall("th_tensor").to(ATensor).newTensor()

proc tensor(ty: TensorType; storage: AStorage, storageOffset: int64, size: IntList, stride: IntList): Tensor = 
  ty.dynamicCppCall("tensor", storage, storageOffset, size, stride).to(ATensor).newTensor()

proc tensor(ty: TensorType; size: IntList, stride: IntList): Tensor = 
  ty.dynamicCppCall("tensor", size, stride).to(ATensor).newTensor()

proc copy_ignoring_overlaps_internal_inplace(ty: TensorType; self: Tensor, src: Tensor): Tensor = 
  ty.dynamicCppCall("_copy_ignoring_overlaps_", self.tensor, src.tensor).to(ATensor).newTensor()

proc copy_ignoring_overlaps_internal_inplace(self: Tensorself: Tensor, src: Tensor): Tensor = 
  self.dynamicCppCall("_copy_ignoring_overlaps_", src.tensor).to(ATensor).newTensor()

proc cat_internal(ty: TensorType; tensors: TensorList, dim: int64 = 0): Tensor = 
  ty.dynamicCppCall("_cat", tensors, dim).to(ATensor).newTensor()

proc cat_internal(tensors: TensorList, dim: int64 = 0): Tensor = 
  dynamicCCall("at::_cat", tensors, dim).to(ATensor).newTensor()

proc binary_cross_entropy_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()

proc binary_cross_entropy_backward(grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()

proc kl_div(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div(self: Tensor, target: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div_backward(grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc l1_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc l1_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc mse_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc mse_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc multi_margin_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()

proc multi_margin_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()

proc multilabel_margin_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64, is_target: Tensor): Tensor = 
  ty.dynamicCppCall("multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor).newTensor()

proc multilabel_margin_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64, is_target: Tensor): Tensor = 
  dynamicCCall("at::multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor).newTensor()

proc nll_loss(self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor]

proc nll_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor

proc nll_loss2d(self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor]

proc nll_loss2d_backward(grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor

proc smooth_l1_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc smooth_l1_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc soft_margin_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  ty.dynamicCppCall("soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc soft_margin_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor = 
  dynamicCCall("at::soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc elu_backward(ty: TensorType; grad_output: Tensor, alpha: float, scale: float, input_scale: float, output: Tensor): Tensor = 
  ty.dynamicCppCall("elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor).newTensor()

proc elu_backward(grad_output: Tensor, alpha: float, scale: float, input_scale: float, output: Tensor): Tensor = 
  dynamicCCall("at::elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor).newTensor()

proc elu_inplace(ty: TensorType; self: Tensor, alpha: float, scale: float, input_scale: float): Tensor = 
  ty.dynamicCppCall("elu_forward_", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()

proc elu_inplace(self: Tensor, alpha: float, scale: float, input_scale: float): Tensor = 
  dynamicCCall("at::elu_forward_", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()

proc glu_backward(ty: TensorType; grad_output: Tensor, self: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor).newTensor()

proc glu_backward(grad_output: Tensor, self: Tensor, dim: int64): Tensor = 
  dynamicCCall("at::glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor).newTensor()

proc hardtanh_backward(grad_output: Tensor, self: Tensor, min_val: float, max_val: float): Tensor

proc leaky_relu_backward(grad_output: Tensor, self: Tensor, negative_slope: float): Tensor

proc log_sigmoid_backward(ty: TensorType; grad_output: Tensor, self: Tensor, buffer: Tensor): Tensor = 
  ty.dynamicCppCall("log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor).newTensor()

proc log_sigmoid_backward(grad_output: Tensor, self: Tensor, buffer: Tensor): Tensor = 
  dynamicCCall("at::log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor).newTensor()

proc prelu_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  ty.dynamicCppCall("prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc prelu_backward(grad_output: Tensor, self: Tensor, weight: Tensor, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  dynamicCCall("at::prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rrelu_with_noise_backward(grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): Tensor

proc softplus_backward(ty: TensorType; grad_output: Tensor, self: Tensor, beta: float, threshold: float, output: Tensor): Tensor = 
  ty.dynamicCppCall("softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor).newTensor()

proc softplus_backward(grad_output: Tensor, self: Tensor, beta: float, threshold: float, output: Tensor): Tensor = 
  dynamicCCall("at::softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor).newTensor()

proc softshrink_backward(grad_output: Tensor, self: Tensor, lambd: float): Tensor

proc threshold_backward(grad_output: Tensor, self: Tensor, threshold: float, value: float): Tensor

proc adaptive_avg_pool2d(self: Tensor, output_size: IntList): Tensor

proc adaptive_avg_pool2d_backward(grad_output: Tensor, self: Tensor): Tensor

proc adaptive_avg_pool3d(self: Tensor, output_size: IntList): Tensor

proc adaptive_avg_pool3d_backward(grad_output: Tensor, self: Tensor): Tensor

proc adaptive_max_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor): Tensor = 
  ty.dynamicCppCall("adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool2d_backward(grad_output: Tensor, self: Tensor, indices: Tensor): Tensor = 
  dynamicCCall("at::adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor): Tensor = 
  ty.dynamicCppCall("adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool3d_backward(grad_output: Tensor, self: Tensor, indices: Tensor): Tensor = 
  dynamicCCall("at::adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc avg_pool2d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor

proc avg_pool2d_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor

proc avg_pool3d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor

proc avg_pool3d_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor

proc fractional_max_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, indices: Tensor): Tensor = 
  ty.dynamicCppCall("fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, output_size, indices.tensor).to(ATensor).newTensor()

proc fractional_max_pool2d_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, indices: Tensor): Tensor = 
  dynamicCCall("at::fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, output_size, indices.tensor).to(ATensor).newTensor()

proc max_pool2d_with_indices_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor = 
  ty.dynamicCppCall("max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool2d_with_indices_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor = 
  dynamicCCall("at::max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool3d_with_indices_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor = 
  ty.dynamicCppCall("max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool3d_with_indices_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor = 
  dynamicCCall("at::max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_unpool2d(self: Tensor, indices: Tensor, output_size: IntList): Tensor

proc max_unpool2d_backward(grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor

proc max_unpool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor = 
  ty.dynamicCppCall("max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()

proc max_unpool3d_backward(grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor = 
  dynamicCCall("at::max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()

proc reflection_pad1d(self: Tensor, padding: IntList): Tensor

proc reflection_pad1d_backward(grad_output: Tensor, self: Tensor, padding: IntList): Tensor

proc reflection_pad2d(self: Tensor, padding: IntList): Tensor

proc reflection_pad2d_backward(grad_output: Tensor, self: Tensor, padding: IntList): Tensor

proc replication_pad1d(self: Tensor, padding: IntList): Tensor

proc replication_pad1d_backward(grad_output: Tensor, self: Tensor, padding: IntList): Tensor

proc replication_pad2d(self: Tensor, padding: IntList): Tensor

proc replication_pad2d_backward(grad_output: Tensor, self: Tensor, padding: IntList): Tensor

proc replication_pad3d(self: Tensor, padding: IntList): Tensor

proc replication_pad3d_backward(grad_output: Tensor, self: Tensor, padding: IntList): Tensor

proc upsample_linear1d(self: Tensor, output_size: IntList, align_corners: bool): Tensor

proc upsample_linear1d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor

proc upsample_bilinear2d(self: Tensor, output_size: IntList, align_corners: bool): Tensor

proc upsample_bilinear2d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor

proc upsample_trilinear3d(self: Tensor, output_size: IntList, align_corners: bool): Tensor

proc upsample_trilinear3d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor

proc upsample_nearest1d(self: Tensor, output_size: IntList): Tensor

proc upsample_nearest1d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor

proc upsample_nearest2d(self: Tensor, output_size: IntList): Tensor

proc upsample_nearest2d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor

proc upsample_nearest3d(self: Tensor, output_size: IntList): Tensor

proc upsample_nearest3d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor

proc sigmoid_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sigmoid_forward", self.tensor).to(ATensor).newTensor()

proc sigmoid_internal(self: Tensor): Tensor = 
  dynamicCCall("at::_sigmoid_forward", self.tensor).to(ATensor).newTensor()

proc sigmoid_backward_internal(grad_output: Tensor, output: Tensor): Tensor

proc tanh_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_tanh_forward", self.tensor).to(ATensor).newTensor()

proc tanh_internal(self: Tensor): Tensor = 
  dynamicCCall("at::_tanh_forward", self.tensor).to(ATensor).newTensor()

proc tanh_backward_internal(grad_output: Tensor, output: Tensor): Tensor

proc thnn_batch_norm_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, eps: float64, save_mean: Tensor, save_std: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_batch_norm_backward(grad_output: Tensor, self: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, eps: float64, save_mean: Tensor, save_std: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward(grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward(grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_backward(grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  ty.dynamicCppCall("thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward(grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  dynamicCCall("at::thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_backward(grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward(grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward(grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cast_Byte_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Byte", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Byte_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Byte", non_blocking).to(ATensor).newTensor()

proc cast_Char_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Char", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Char_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Char", non_blocking).to(ATensor).newTensor()

proc cast_Double_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Double", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Double_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Double", non_blocking).to(ATensor).newTensor()

proc cast_Float_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Float", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Float_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Float", non_blocking).to(ATensor).newTensor()

proc cast_Int_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Int", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Int_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Int", non_blocking).to(ATensor).newTensor()

proc cast_Long_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Long", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Long_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Long", non_blocking).to(ATensor).newTensor()

proc cast_Short_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Short", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Short_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Short", non_blocking).to(ATensor).newTensor()

proc cast_Half_internal(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Half", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Half_internal(self: Tensorself: Tensor, non_blocking: bool = false): Tensor = 
  self.dynamicCppCall("_cast_Half", non_blocking).to(ATensor).newTensor()

proc cudnn_rnn_flatten_weight_internal(ty: TensorType; weight_arr: TensorList, weight_stride0: int64, input_size: int64, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, bidirectional: bool): Tensor = 
  ty.dynamicCppCall("_cudnn_rnn_flatten_weight", weight_arr, weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_flatten_weight_internal(weight_arr: TensorList, weight_stride0: int64, input_size: int64, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, bidirectional: bool): Tensor = 
  dynamicCCall("at::_cudnn_rnn_flatten_weight", weight_arr, weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_internal(ty: TensorType; input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  ty.dynamicCppCall("_cudnn_rnn", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_rnn_internal(input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  dynamicCCall("at::_cudnn_rnn", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_rnn_backward_internal(ty: TensorType; input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, output: Tensor, grad_output: Tensor, grad_hy: Tensor, grad_cy: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor, reserve: Tensor, output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] = 
  ty.dynamicCppCall("_cudnn_rnn_backward", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, TensorList]).toNimTuple().newTensors()

proc cudnn_rnn_backward_internal(input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, output: Tensor, grad_output: Tensor, grad_hy: Tensor, grad_cy: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor, reserve: Tensor, output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] = 
  dynamicCCall("at::_cudnn_rnn_backward", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, TensorList]).toNimTuple().newTensors()

proc cudnn_init_dropout_state_internal(ty: TensorType; self_ty: TensorType, dropout: float64, train: bool, dropout_seed: int64): Tensor = 
  ty.dynamicCppCall("_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor).newTensor()

proc cudnn_init_dropout_state_internal(self_ty: TensorType, dropout: float64, train: bool, dropout_seed: int64): Tensor = 
  dynamicCCall("at::_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor).newTensor()

proc fused_dropout_internal(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("_fused_dropout", self.tensor, p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc fused_dropout_internal(self: Tensorself: Tensor, p: float64, generator: pointer = nil): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("_fused_dropout", p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc masked_scale_internal(ty: TensorType; self: Tensor, mask: Tensor, scale: float64): Tensor = 
  ty.dynamicCppCall("_masked_scale", self.tensor, mask.tensor, scale).to(ATensor).newTensor()

proc masked_scale_internal(self: Tensorself: Tensor, mask: Tensor, scale: float64): Tensor = 
  self.dynamicCppCall("_masked_scale", mask.tensor, scale).to(ATensor).newTensor()

proc dropout(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("dropout", input.tensor, p, train).to(ATensor).newTensor()

proc dropout(input: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::dropout", input.tensor, p, train).to(ATensor).newTensor()

proc dropout_inplace(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc dropout_inplace(self: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("feature_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout(input: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::feature_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout_inplace(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("feature_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout_inplace(self: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::feature_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout(input: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout_inplace(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout_inplace(self: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("feature_alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout(input: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::feature_alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout_inplace(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor = 
  ty.dynamicCppCall("feature_alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout_inplace(self: Tensor, p: float64, train: bool): Tensor = 
  dynamicCCall("at::feature_alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc abs_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("abs_", self.tensor).to(ATensor).newTensor()

proc abs_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("abs_").to(ATensor).newTensor()

proc acos_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("acos_", self.tensor).to(ATensor).newTensor()

proc acos_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("acos_").to(ATensor).newTensor()

proc avg_pool1d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], ceil_mode: bool = false, count_include_pad: bool = true): Tensor = 
  ty.dynamicCppCall("avg_pool1d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()

proc avg_pool1d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], ceil_mode: bool = false, count_include_pad: bool = true): Tensor = 
  dynamicCCall("at::avg_pool1d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()

proc adaptive_avg_pool1d(ty: TensorType; self: Tensor, output_size: IntList): Tensor = 
  ty.dynamicCppCall("adaptive_avg_pool1d", self.tensor, output_size).to(ATensor).newTensor()

proc adaptive_avg_pool1d(self: Tensor, output_size: IntList): Tensor = 
  dynamicCCall("at::adaptive_avg_pool1d", self.tensor, output_size).to(ATensor).newTensor()

proc adaptive_max_pool1d(ty: TensorType; self: Tensor, output_size: IntList): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("adaptive_max_pool1d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc adaptive_max_pool1d(self: Tensor, output_size: IntList): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::adaptive_max_pool1d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc add_inplace(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("add_", self.tensor, other.tensor, alpha).to(ATensor).newTensor()

proc add_inplace(self: Tensorself: Tensor, other: Tensor, alpha: float = 1): Tensor = 
  self.dynamicCppCall("add_", other.tensor, alpha).to(ATensor).newTensor()

proc add_inplace(ty: TensorType; self: Tensor, other: float, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("add_", self.tensor, other, alpha).to(ATensor).newTensor()

proc add_inplace(self: Tensorself: Tensor, other: float, alpha: float = 1): Tensor = 
  self.dynamicCppCall("add_", other, alpha).to(ATensor).newTensor()

proc addmv(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv(self: Tensorself: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_inplace(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_inplace(self: Tensorself: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("addmv_", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addr(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr(self: Tensorself: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_inplace(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_inplace(self: Tensorself: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("addr_", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc all(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("all", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc all(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("all", dim, keepdim).to(ATensor).newTensor()

proc allclose(ty: TensorType; self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): bool = 
  ty.dynamicCppCall("allclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(bool)

proc allclose(self: Tensorself: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): bool = 
  self.dynamicCppCall("allclose", other.tensor, rtol, atol, equal_nan).to(bool)

proc any(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("any", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc any(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("any", dim, keepdim).to(ATensor).newTensor()

proc arange(ty: TensorType; start: float, end_name: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("arange", start, end_name, options).to(ATensor).newTensor()

proc arange(start: float, end_name: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::arange", start, end_name, options).to(ATensor).newTensor()

proc arange(ty: TensorType; start: float, end_name: float, step: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("arange", start, end_name, step, options).to(ATensor).newTensor()

proc arange(start: float, end_name: float, step: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::arange", start, end_name, step, options).to(ATensor).newTensor()

proc arange(ty: TensorType; end_name: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("arange", end_name, options).to(ATensor).newTensor()

proc arange(end_name: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::arange", end_name, options).to(ATensor).newTensor()

proc dim_arange_internal(ty: TensorType; like: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("_dim_arange", like.tensor, dim).to(ATensor).newTensor()

proc dim_arange_internal(like: Tensor, dim: int64): Tensor = 
  dynamicCCall("at::_dim_arange", like.tensor, dim).to(ATensor).newTensor()

proc argmax(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("argmax", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmax(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("argmax", dim, keepdim).to(ATensor).newTensor()

proc argmax(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("argmax", self.tensor).to(ATensor).newTensor()

proc argmax(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("argmax").to(ATensor).newTensor()

proc argmax_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_argmax", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmax_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_argmax", dim, keepdim).to(ATensor).newTensor()

proc argmin(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("argmin", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmin(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("argmin", dim, keepdim).to(ATensor).newTensor()

proc argmin(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("argmin", self.tensor).to(ATensor).newTensor()

proc argmin(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("argmin").to(ATensor).newTensor()

proc argmin_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_argmin", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmin_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_argmin", dim, keepdim).to(ATensor).newTensor()

proc as_strided(ty: TensorType; self: Tensor, size: IntList, stride: IntList): Tensor = 
  ty.dynamicCppCall("as_strided", self.tensor, size, stride).to(ATensor).newTensor()

proc as_strided(self: Tensorself: Tensor, size: IntList, stride: IntList): Tensor = 
  self.dynamicCppCall("as_strided", size, stride).to(ATensor).newTensor()

proc as_strided_inplace(ty: TensorType; self: Tensor, size: IntList, stride: IntList): Tensor = 
  ty.dynamicCppCall("as_strided_", self.tensor, size, stride).to(ATensor).newTensor()

proc as_strided_inplace(self: Tensorself: Tensor, size: IntList, stride: IntList): Tensor = 
  self.dynamicCppCall("as_strided_", size, stride).to(ATensor).newTensor()

proc as_strided(ty: TensorType; self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor = 
  ty.dynamicCppCall("as_strided", self.tensor, size, stride, storage_offset).to(ATensor).newTensor()

proc as_strided(self: Tensorself: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor = 
  self.dynamicCppCall("as_strided", size, stride, storage_offset).to(ATensor).newTensor()

proc as_strided_inplace(ty: TensorType; self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor = 
  ty.dynamicCppCall("as_strided_", self.tensor, size, stride, storage_offset).to(ATensor).newTensor()

proc as_strided_inplace(self: Tensorself: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor = 
  self.dynamicCppCall("as_strided_", size, stride, storage_offset).to(ATensor).newTensor()

proc asin_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("asin_", self.tensor).to(ATensor).newTensor()

proc asin_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("asin_").to(ATensor).newTensor()

proc atan_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("atan_", self.tensor).to(ATensor).newTensor()

proc atan_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("atan_").to(ATensor).newTensor()

proc bartlett_window(ty: TensorType; window_length: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window(window_length: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc bartlett_window(window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  dynamicCCall("at::bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc batch_norm(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64, cudnn_enabled: bool): Tensor = 
  ty.dynamicCppCall("batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc batch_norm(input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64, cudnn_enabled: bool): Tensor = 
  dynamicCCall("at::batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc bernoulli(ty: TensorType; self: Tensor, p: Tensor, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("bernoulli", self.tensor, p.tensor, generator).to(ATensor).newTensor()

proc bernoulli(self: Tensorself: Tensor, p: Tensor, generator: pointer = nil): Tensor = 
  self.dynamicCppCall("bernoulli", p.tensor, generator).to(ATensor).newTensor()

proc bernoulli(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("bernoulli", self.tensor).to(ATensor).newTensor()

proc bernoulli(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("bernoulli").to(ATensor).newTensor()

proc bernoulli_inplace(ty: TensorType; self: Tensor, p: Tensor, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("bernoulli_", self.tensor, p.tensor, generator).to(ATensor).newTensor()

proc bernoulli_inplace(self: Tensorself: Tensor, p: Tensor, generator: pointer = nil): Tensor = 
  self.dynamicCppCall("bernoulli_", p.tensor, generator).to(ATensor).newTensor()

proc bernoulli_inplace(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("bernoulli_", self.tensor, p, generator).to(ATensor).newTensor()

proc bernoulli_inplace(self: Tensorself: Tensor, p: float64, generator: pointer = nil): Tensor = 
  self.dynamicCppCall("bernoulli_", p, generator).to(ATensor).newTensor()

proc bernoulli_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("bernoulli_", self.tensor).to(ATensor).newTensor()

proc bernoulli_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("bernoulli_").to(ATensor).newTensor()

proc bilinear(ty: TensorType; input1: Tensor, input2: Tensor, weight: Tensor, bias: Tensor): Tensor = 
  ty.dynamicCppCall("bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor).newTensor()

proc bilinear(input1: Tensor, input2: Tensor, weight: Tensor, bias: Tensor): Tensor = 
  dynamicCCall("at::bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor).newTensor()

proc bincount(ty: TensorType; self: Tensor, weights: Tensor, minlength: int64 = 0): Tensor = 
  ty.dynamicCppCall("bincount", self.tensor, weights.tensor, minlength).to(ATensor).newTensor()

proc bincount(self: Tensorself: Tensor, weights: Tensor, minlength: int64 = 0): Tensor = 
  self.dynamicCppCall("bincount", weights.tensor, minlength).to(ATensor).newTensor()

proc blackman_window(ty: TensorType; window_length: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window(window_length: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc blackman_window(window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  dynamicCCall("at::blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc broadcast_tensors(ty: TensorType; tensors: TensorList): TensorList = 
  ty.dynamicCppCall("broadcast_tensors", tensors).to(TensorList)

proc broadcast_tensors(tensors: TensorList): TensorList = 
  dynamicCCall("at::broadcast_tensors", tensors).to(TensorList)

proc cat(ty: TensorType; tensors: TensorList, dim: int64 = 0): Tensor = 
  ty.dynamicCppCall("cat", tensors, dim).to(ATensor).newTensor()

proc cat(tensors: TensorList, dim: int64 = 0): Tensor = 
  dynamicCCall("at::cat", tensors, dim).to(ATensor).newTensor()

proc ceil_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("ceil_", self.tensor).to(ATensor).newTensor()

proc ceil_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("ceil_").to(ATensor).newTensor()

proc chunk(ty: TensorType; self: Tensor, chunks: int64, dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("chunk", self.tensor, chunks, dim).to(TensorList)

proc chunk(self: Tensorself: Tensor, chunks: int64, dim: int64 = 0): TensorList = 
  self.dynamicCppCall("chunk", chunks, dim).to(TensorList)

proc clamp(ty: TensorType; self: Tensor, min: float, max: float): Tensor = 
  ty.dynamicCppCall("clamp", self.tensor, min, max).to(ATensor).newTensor()

proc clamp(self: Tensorself: Tensor, min: float, max: float): Tensor = 
  self.dynamicCppCall("clamp", min, max).to(ATensor).newTensor()

proc clamp_inplace(ty: TensorType; self: Tensor, min: float, max: float): Tensor = 
  ty.dynamicCppCall("clamp_", self.tensor, min, max).to(ATensor).newTensor()

proc clamp_inplace(self: Tensorself: Tensor, min: float, max: float): Tensor = 
  self.dynamicCppCall("clamp_", min, max).to(ATensor).newTensor()

proc clamp_max_inplace(ty: TensorType; self: Tensor, max: float): Tensor = 
  ty.dynamicCppCall("clamp_max_", self.tensor, max).to(ATensor).newTensor()

proc clamp_max_inplace(self: Tensorself: Tensor, max: float): Tensor = 
  self.dynamicCppCall("clamp_max_", max).to(ATensor).newTensor()

proc clamp_min_inplace(ty: TensorType; self: Tensor, min: float): Tensor = 
  ty.dynamicCppCall("clamp_min_", self.tensor, min).to(ATensor).newTensor()

proc clamp_min_inplace(self: Tensorself: Tensor, min: float): Tensor = 
  self.dynamicCppCall("clamp_min_", min).to(ATensor).newTensor()

proc cudnn_is_acceptable(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("cudnn_is_acceptable", self.tensor).to(bool)

proc cudnn_is_acceptable(self: Tensor): bool = 
  dynamicCCall("at::cudnn_is_acceptable", self.tensor).to(bool)

proc convolution(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64): Tensor = 
  ty.dynamicCppCall("convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups).to(ATensor).newTensor()

proc convolution(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64): Tensor = 
  dynamicCCall("at::convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups).to(ATensor).newTensor()

proc convolution_internal(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool): Tensor = 
  ty.dynamicCppCall("_convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled).to(ATensor).newTensor()

proc convolution_internal(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool): Tensor = 
  dynamicCCall("at::_convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled).to(ATensor).newTensor()

proc convolution_nogroup_internal(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList): Tensor = 
  ty.dynamicCppCall("_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding).to(ATensor).newTensor()

proc convolution_nogroup_internal(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList): Tensor = 
  dynamicCCall("at::_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding).to(ATensor).newTensor()

proc convolution_double_backward_internal(ty: TensorType; ggI: Tensor, ggW: Tensor, ggb: Tensor, gO: Tensor, weight: Tensor, self: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc convolution_double_backward_internal(ggI: Tensor, ggW: Tensor, ggb: Tensor, gO: Tensor, weight: Tensor, self: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv1d(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor = 
  ty.dynamicCppCall("conv1d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor).newTensor()

proc conv1d(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor = 
  dynamicCCall("at::conv1d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor).newTensor()

proc conv2d(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor = 
  ty.dynamicCppCall("conv2d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor).newTensor()

proc conv2d(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor = 
  dynamicCCall("at::conv2d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor).newTensor()

proc conv3d(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor = 
  ty.dynamicCppCall("conv3d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor).newTensor()

proc conv3d(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor = 
  dynamicCCall("at::conv3d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor).newTensor()

proc conv_tbc_backward(ty: TensorType; self: Tensor, input: Tensor, weight: Tensor, bias: Tensor, pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_tbc_backward(self: Tensor, input: Tensor, weight: Tensor, bias: Tensor, pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_transpose1d(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor = 
  ty.dynamicCppCall("conv_transpose1d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor).newTensor()

proc conv_transpose1d(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor = 
  dynamicCCall("at::conv_transpose1d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor).newTensor()

proc conv_transpose2d(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor = 
  ty.dynamicCppCall("conv_transpose2d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor).newTensor()

proc conv_transpose2d(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor = 
  dynamicCCall("at::conv_transpose2d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor).newTensor()

proc conv_transpose3d(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor = 
  ty.dynamicCppCall("conv_transpose3d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor).newTensor()

proc conv_transpose3d(input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor = 
  dynamicCCall("at::conv_transpose3d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor).newTensor()

proc cos(self: Tensorself: Tensor): Tensor

proc cos_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("cos_", self.tensor).to(ATensor).newTensor()

proc cos_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("cos_").to(ATensor).newTensor()

proc cosh(self: Tensorself: Tensor): Tensor

proc cosh_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("cosh_", self.tensor).to(ATensor).newTensor()

proc cosh_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("cosh_").to(ATensor).newTensor()

proc cosine_embedding_loss(ty: TensorType; input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor = 
  ty.dynamicCppCall("cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc cosine_embedding_loss(input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor = 
  dynamicCCall("at::cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc cudnn_affine_grid_generator_backward(ty: TensorType; grad: Tensor, N: int64, C: int64, H: int64, W: int64): Tensor = 
  ty.dynamicCppCall("cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor).newTensor()

proc cudnn_affine_grid_generator_backward(grad: Tensor, N: int64, C: int64, H: int64, W: int64): Tensor = 
  dynamicCCall("at::cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor).newTensor()

proc cudnn_batch_norm_backward(ty: TensorType; input: Tensor, grad_output: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, save_mean: Tensor, save_var: Tensor, epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_batch_norm_backward(input: Tensor, grad_output: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, save_mean: Tensor, save_var: Tensor, epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward_input(ty: TensorType; self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_input(self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward(ty: TensorType; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward(self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward_bias(ty: TensorType; grad_output: Tensor): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_backward_bias(grad_output: Tensor): Tensor = 
  dynamicCCall("at::cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight(ty: TensorType; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight(weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward(ty: TensorType; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward(self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward_bias(ty: TensorType; grad_output: Tensor): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_bias(grad_output: Tensor): Tensor = 
  dynamicCCall("at::cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input(ty: TensorType; grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input(grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight(ty: TensorType; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight(weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_transpose_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_grid_sampler_backward(ty: TensorType; self: Tensor, grid: Tensor, grad_output: Tensor): tuple[self: Tensor, grid: Tensor] = 
  ty.dynamicCppCall("cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_grid_sampler_backward(self: Tensor, grid: Tensor, grad_output: Tensor): tuple[self: Tensor, grid: Tensor] = 
  dynamicCCall("at::cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cumsum(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("cumsum", self.tensor, dim, dtype).to(ATensor).newTensor()

proc cumsum(self: Tensorself: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("cumsum", dim, dtype).to(ATensor).newTensor()

proc cumsum(ty: TensorType; self: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("cumsum", self.tensor, dim).to(ATensor).newTensor()

proc cumsum(self: Tensorself: Tensor, dim: int64): Tensor = 
  self.dynamicCppCall("cumsum", dim).to(ATensor).newTensor()

proc cumprod(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("cumprod", self.tensor, dim, dtype).to(ATensor).newTensor()

proc cumprod(self: Tensorself: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("cumprod", dim, dtype).to(ATensor).newTensor()

proc cumprod(ty: TensorType; self: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("cumprod", self.tensor, dim).to(ATensor).newTensor()

proc cumprod(self: Tensorself: Tensor, dim: int64): Tensor = 
  self.dynamicCppCall("cumprod", dim).to(ATensor).newTensor()

proc ctc_loss(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0, reduction: int64): Tensor = 
  ty.dynamicCppCall("ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, reduction).to(ATensor).newTensor()

proc ctc_loss(log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0, reduction: int64): Tensor = 
  dynamicCCall("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, reduction).to(ATensor).newTensor()

proc ctc_loss(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: Tensor, target_lengths: Tensor, blank: int64 = 0, reduction: int64): Tensor = 
  ty.dynamicCppCall("ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor).newTensor()

proc ctc_loss(log_probs: Tensor, targets: Tensor, input_lengths: Tensor, target_lengths: Tensor, blank: int64 = 0, reduction: int64): Tensor = 
  dynamicCCall("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor).newTensor()

proc ctc_loss_backward_internal(ty: TensorType; grad: Tensor, log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, neg_log_likelihood: Tensor, log_alpha: Tensor, blank: int64): Tensor = 
  ty.dynamicCppCall("_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths, target_lengths, neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor).newTensor()

proc ctc_loss_backward_internal(grad: Tensor, log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, neg_log_likelihood: Tensor, log_alpha: Tensor, blank: int64): Tensor = 
  dynamicCCall("at::_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths, target_lengths, neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor).newTensor()

proc det(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("det", self.tensor).to(ATensor).newTensor()

proc det(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("det").to(ATensor).newTensor()

proc diagflat(ty: TensorType; self: Tensor, offset: int64 = 0): Tensor = 
  ty.dynamicCppCall("diagflat", self.tensor, offset).to(ATensor).newTensor()

proc diagflat(self: Tensorself: Tensor, offset: int64 = 0): Tensor = 
  self.dynamicCppCall("diagflat", offset).to(ATensor).newTensor()

proc diagonal(ty: TensorType; self: Tensor, offset: int64 = 0, dim1: int64 = 0, dim2: int64 = 1): Tensor = 
  ty.dynamicCppCall("diagonal", self.tensor, offset, dim1, dim2).to(ATensor).newTensor()

proc diagonal(self: Tensorself: Tensor, offset: int64 = 0, dim1: int64 = 0, dim2: int64 = 1): Tensor = 
  self.dynamicCppCall("diagonal", offset, dim1, dim2).to(ATensor).newTensor()

proc div_name(self: Tensorself: Tensor, other: Tensor): Tensor

proc div_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("div_", self.tensor, other.tensor).to(ATensor).newTensor()

proc div_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("div_", other.tensor).to(ATensor).newTensor()

proc div_name(self: Tensorself: Tensor, other: float): Tensor

proc div_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("div_", self.tensor, other).to(ATensor).newTensor()

proc div_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("div_", other).to(ATensor).newTensor()

proc einsum(ty: TensorType; equation: StdString, tensors: TensorList): Tensor = 
  ty.dynamicCppCall("einsum", equation, tensors).to(ATensor).newTensor()

proc einsum(equation: StdString, tensors: TensorList): Tensor = 
  dynamicCCall("at::einsum", equation, tensors).to(ATensor).newTensor()

proc embedding_backward(ty: TensorType; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool, sparse: bool): Tensor = 
  ty.dynamicCppCall("embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_backward(grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool, sparse: bool): Tensor = 
  dynamicCCall("at::embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_dense_backward(ty: TensorType; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor = 
  ty.dynamicCppCall("embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_dense_backward(grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor = 
  dynamicCCall("at::embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_renorm_inplace(ty: TensorType; self: Tensor, indices: Tensor, max_norm: float64, norm_type: float64): Tensor = 
  ty.dynamicCppCall("embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(ATensor).newTensor()

proc embedding_renorm_inplace(self: Tensor, indices: Tensor, max_norm: float64, norm_type: float64): Tensor = 
  dynamicCCall("at::embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(ATensor).newTensor()

proc embedding_sparse_backward(ty: TensorType; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor = 
  ty.dynamicCppCall("embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_sparse_backward(grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor = 
  dynamicCCall("at::embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_bag(ty: TensorType; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] = 
  ty.dynamicCppCall("embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag(weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] = 
  dynamicCCall("at::embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag_backward_internal(ty: TensorType; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64, sparse: bool): Tensor = 
  ty.dynamicCppCall("_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_backward_internal(grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64, sparse: bool): Tensor = 
  dynamicCCall("at::_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_internal(ty: TensorType; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor = 
  ty.dynamicCppCall("_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_internal(grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor = 
  dynamicCCall("at::_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_internal(ty: TensorType; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor = 
  ty.dynamicCppCall("_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_internal(grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor = 
  dynamicCCall("at::_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc empty(ty: TensorType; size: IntList, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("empty", size, options).to(ATensor).newTensor()

proc empty(size: IntList, options: TensorOptions): Tensor = 
  dynamicCCall("at::empty", size, options).to(ATensor).newTensor()

proc empty_like(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("empty_like", self.tensor).to(ATensor).newTensor()

proc empty_like(self: Tensor): Tensor = 
  dynamicCCall("at::empty_like", self.tensor).to(ATensor).newTensor()

proc empty_like(ty: TensorType; self: Tensor, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("empty_like", self.tensor, options).to(ATensor).newTensor()

proc empty_like(self: Tensor, options: TensorOptions): Tensor = 
  dynamicCCall("at::empty_like", self.tensor, options).to(ATensor).newTensor()

proc erf_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("erf_", self.tensor).to(ATensor).newTensor()

proc erf_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("erf_").to(ATensor).newTensor()

proc erfc_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("erfc_", self.tensor).to(ATensor).newTensor()

proc erfc_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("erfc_").to(ATensor).newTensor()

proc exp(self: Tensorself: Tensor): Tensor

proc exp_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("exp_", self.tensor).to(ATensor).newTensor()

proc exp_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("exp_").to(ATensor).newTensor()

proc expm1_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("expm1_", self.tensor).to(ATensor).newTensor()

proc expm1_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("expm1_").to(ATensor).newTensor()

proc expand(ty: TensorType; self: Tensor, size: IntList, implicit: bool = false): Tensor = 
  ty.dynamicCppCall("expand", self.tensor, size, implicit).to(ATensor).newTensor()

proc expand(self: Tensorself: Tensor, size: IntList, implicit: bool = false): Tensor = 
  self.dynamicCppCall("expand", size, implicit).to(ATensor).newTensor()

proc expand_as(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("expand_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc expand_as(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("expand_as", other.tensor).to(ATensor).newTensor()

proc eye(ty: TensorType; n: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("eye", n, options).to(ATensor).newTensor()

proc eye(n: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::eye", n, options).to(ATensor).newTensor()

proc eye(ty: TensorType; n: int64, m: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("eye", n, m, options).to(ATensor).newTensor()

proc eye(n: int64, m: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::eye", n, m, options).to(ATensor).newTensor()

proc flatten(ty: TensorType; self: Tensor, start_dim: int64 = 0, end_dim: int64 = -1): Tensor = 
  ty.dynamicCppCall("flatten", self.tensor, start_dim, end_dim).to(ATensor).newTensor()

proc flatten(self: Tensorself: Tensor, start_dim: int64 = 0, end_dim: int64 = -1): Tensor = 
  self.dynamicCppCall("flatten", start_dim, end_dim).to(ATensor).newTensor()

proc floor_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("floor_", self.tensor).to(ATensor).newTensor()

proc floor_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("floor_").to(ATensor).newTensor()

proc full(ty: TensorType; size: IntList, fill_value: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("full", size, fill_value, options).to(ATensor).newTensor()

proc full(size: IntList, fill_value: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::full", size, fill_value, options).to(ATensor).newTensor()

proc full_like(ty: TensorType; self: Tensor, fill_value: float): Tensor = 
  ty.dynamicCppCall("full_like", self.tensor, fill_value).to(ATensor).newTensor()

proc full_like(self: Tensor, fill_value: float): Tensor = 
  dynamicCCall("at::full_like", self.tensor, fill_value).to(ATensor).newTensor()

proc full_like(ty: TensorType; self: Tensor, fill_value: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("full_like", self.tensor, fill_value, options).to(ATensor).newTensor()

proc full_like(self: Tensor, fill_value: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::full_like", self.tensor, fill_value, options).to(ATensor).newTensor()

proc grid_sampler(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor = 
  ty.dynamicCppCall("grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler(input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor = 
  dynamicCCall("at::grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler_2d_backward(ty: TensorType; grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_2d_backward(grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d_backward(ty: TensorType; grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d_backward(grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc hann_window(ty: TensorType; window_length: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window(window_length: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hann_window(window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  dynamicCCall("at::hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window(ty: TensorType; window_length: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window(window_length: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window(window_length: int64, periodic: bool, options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window(ty: TensorType; window_length: int64, periodic: bool, alpha: float64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window(window_length: int64, periodic: bool, alpha: float64, options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window(ty: TensorType; window_length: int64, periodic: bool, alpha: float64, beta: float64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hamming_window(window_length: int64, periodic: bool, alpha: float64, beta: float64, options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hinge_embedding_loss(ty: TensorType; self: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor = 
  ty.dynamicCppCall("hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc hinge_embedding_loss(self: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor = 
  dynamicCCall("at::hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc ger(self: Tensorself: Tensor, vec2: Tensor): Tensor

proc gesv(ty: TensorType; self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("gesv", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv(self: Tensorself: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("gesv", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_internal(ty: TensorType; self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("_gesv_helper", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_internal(self: Tensorself: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("_gesv_helper", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc group_norm(ty: TensorType; input: Tensor, num_groups: int64, weight: Tensor, bias: Tensor, eps: float64, cudnn_enabled: bool = true): Tensor = 
  ty.dynamicCppCall("group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor).newTensor()

proc group_norm(input: Tensor, num_groups: int64, weight: Tensor, bias: Tensor, eps: float64, cudnn_enabled: bool = true): Tensor = 
  dynamicCCall("at::group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor).newTensor()

proc fft(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor = 
  ty.dynamicCppCall("fft", self.tensor, signal_ndim, normalized).to(ATensor).newTensor()

proc fft(self: Tensorself: Tensor, signal_ndim: int64, normalized: bool = false): Tensor = 
  self.dynamicCppCall("fft", signal_ndim, normalized).to(ATensor).newTensor()

proc ifft(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor = 
  ty.dynamicCppCall("ifft", self.tensor, signal_ndim, normalized).to(ATensor).newTensor()

proc ifft(self: Tensorself: Tensor, signal_ndim: int64, normalized: bool = false): Tensor = 
  self.dynamicCppCall("ifft", signal_ndim, normalized).to(ATensor).newTensor()

proc rfft(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true): Tensor = 
  ty.dynamicCppCall("rfft", self.tensor, signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc rfft(self: Tensorself: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true): Tensor = 
  self.dynamicCppCall("rfft", signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc irfft(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true, signal_sizes: IntList): Tensor = 
  ty.dynamicCppCall("irfft", self.tensor, signal_ndim, normalized, onesided, signal_sizes).to(ATensor).newTensor()

proc irfft(self: Tensorself: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true, signal_sizes: IntList): Tensor = 
  self.dynamicCppCall("irfft", signal_ndim, normalized, onesided, signal_sizes).to(ATensor).newTensor()

proc fft_with_size_internal(ty: TensorType; self: Tensor, signal_ndim: int64, complex_input: bool, complex_output: bool, inverse: bool, checked_signal_sizes: IntList, normalized: bool, onesided: bool, output_sizes: IntList): Tensor = 
  ty.dynamicCppCall("_fft_with_size", self.tensor, signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes, normalized, onesided, output_sizes).to(ATensor).newTensor()

proc fft_with_size_internal(self: Tensorself: Tensor, signal_ndim: int64, complex_input: bool, complex_output: bool, inverse: bool, checked_signal_sizes: IntList, normalized: bool, onesided: bool, output_sizes: IntList): Tensor = 
  self.dynamicCppCall("_fft_with_size", signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes, normalized, onesided, output_sizes).to(ATensor).newTensor()

proc cufft_get_plan_cache_size_internal(ty: TensorType; ): int64 = 
  ty.dynamicCppCall("_cufft_get_plan_cache_size").to(int64)

proc cufft_get_plan_cache_size_internal(): int64 = 
  dynamicCCall("at::_cufft_get_plan_cache_size").to(int64)

proc cufft_get_plan_cache_max_size_internal(ty: TensorType; ): int64 = 
  ty.dynamicCppCall("_cufft_get_plan_cache_max_size").to(int64)

proc cufft_get_plan_cache_max_size_internal(): int64 = 
  dynamicCCall("at::_cufft_get_plan_cache_max_size").to(int64)

proc cufft_set_plan_cache_max_size_internal(ty: TensorType; max_size: int64): void = 
  ty.dynamicCppCall("_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_set_plan_cache_max_size_internal(max_size: int64): void = 
  dynamicCCall("at::_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_clear_plan_cache_internal(ty: TensorType; ): void = 
  ty.dynamicCppCall("_cufft_clear_plan_cache").to(void)

proc cufft_clear_plan_cache_internal(): void = 
  dynamicCCall("at::_cufft_clear_plan_cache").to(void)

proc index(ty: TensorType; self: Tensor, indices: TensorList): Tensor = 
  ty.dynamicCppCall("index", self.tensor, indices).to(ATensor).newTensor()

proc index(self: Tensorself: Tensor, indices: TensorList): Tensor = 
  self.dynamicCppCall("index", indices).to(ATensor).newTensor()

proc index_put(ty: TensorType; self: Tensor, indices: TensorList, values: Tensor): Tensor = 
  ty.dynamicCppCall("index_put", self.tensor, indices, values.tensor).to(ATensor).newTensor()

proc index_put(self: Tensorself: Tensor, indices: TensorList, values: Tensor): Tensor = 
  self.dynamicCppCall("index_put", indices, values.tensor).to(ATensor).newTensor()

proc index_put_inplace(ty: TensorType; self: Tensor, indices: TensorList, values: Tensor): Tensor = 
  ty.dynamicCppCall("index_put_", self.tensor, indices, values.tensor).to(ATensor).newTensor()

proc index_put_inplace(self: Tensorself: Tensor, indices: TensorList, values: Tensor): Tensor = 
  self.dynamicCppCall("index_put_", indices, values.tensor).to(ATensor).newTensor()

proc isclose(ty: TensorType; self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): Tensor = 
  ty.dynamicCppCall("isclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(ATensor).newTensor()

proc isclose(self: Tensorself: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): Tensor = 
  self.dynamicCppCall("isclose", other.tensor, rtol, atol, equal_nan).to(ATensor).newTensor()

proc is_cuda(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_cuda", self.tensor).to(bool)

proc is_cuda(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_cuda").to(bool)

proc is_distributed(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_distributed", self.tensor).to(bool)

proc is_distributed(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_distributed").to(bool)

proc is_floating_point(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_floating_point", self.tensor).to(bool)

proc is_floating_point(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_floating_point").to(bool)

proc is_nonzero(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_nonzero", self.tensor).to(bool)

proc is_nonzero(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_nonzero").to(bool)

proc is_same_size(ty: TensorType; self: Tensor, other: Tensor): bool = 
  ty.dynamicCppCall("is_same_size", self.tensor, other.tensor).to(bool)

proc is_same_size(self: Tensorself: Tensor, other: Tensor): bool = 
  self.dynamicCppCall("is_same_size", other.tensor).to(bool)

proc is_signed(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_signed", self.tensor).to(bool)

proc is_signed(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_signed").to(bool)

proc is_sparse(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_sparse", self.tensor).to(bool)

proc is_sparse(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_sparse").to(bool)

proc kthvalue(ty: TensorType; self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc kthvalue(self: Tensorself: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc layer_norm(ty: TensorType; input: Tensor, normalized_shape: IntList, weight: Tensor, bias: Tensor, eps: float64, cudnn_enable: bool = true): Tensor = 
  ty.dynamicCppCall("layer_norm", input.tensor, normalized_shape, weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor).newTensor()

proc layer_norm(input: Tensor, normalized_shape: IntList, weight: Tensor, bias: Tensor, eps: float64, cudnn_enable: bool = true): Tensor = 
  dynamicCCall("at::layer_norm", input.tensor, normalized_shape, weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor).newTensor()

proc linspace(ty: TensorType; start: float, end_name: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("linspace", start, end_name, options).to(ATensor).newTensor()

proc linspace(start: float, end_name: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::linspace", start, end_name, options).to(ATensor).newTensor()

proc linspace(ty: TensorType; start: float, end_name: float, steps: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("linspace", start, end_name, steps, options).to(ATensor).newTensor()

proc linspace(start: float, end_name: float, steps: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::linspace", start, end_name, steps, options).to(ATensor).newTensor()

proc log_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log_", self.tensor).to(ATensor).newTensor()

proc log_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("log_").to(ATensor).newTensor()

proc log10_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log10_", self.tensor).to(ATensor).newTensor()

proc log10_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("log10_").to(ATensor).newTensor()

proc log1p(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log1p", self.tensor).to(ATensor).newTensor()

proc log1p(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("log1p").to(ATensor).newTensor()

proc log1p_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log1p_", self.tensor).to(ATensor).newTensor()

proc log1p_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("log1p_").to(ATensor).newTensor()

proc log2_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log2_", self.tensor).to(ATensor).newTensor()

proc log2_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("log2_").to(ATensor).newTensor()

proc logdet(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("logdet", self.tensor).to(ATensor).newTensor()

proc logdet(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("logdet").to(ATensor).newTensor()

proc logspace(ty: TensorType; start: float, end_name: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("logspace", start, end_name, options).to(ATensor).newTensor()

proc logspace(start: float, end_name: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::logspace", start, end_name, options).to(ATensor).newTensor()

proc logspace(ty: TensorType; start: float, end_name: float, steps: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("logspace", start, end_name, steps, options).to(ATensor).newTensor()

proc logspace(start: float, end_name: float, steps: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::logspace", start, end_name, steps, options).to(ATensor).newTensor()

proc log_softmax_backward_data(ty: TensorType; grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor = 
  ty.dynamicCppCall("log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc log_softmax_backward_data(grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor = 
  dynamicCCall("at::log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc logsumexp(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("logsumexp", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc logsumexp(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("logsumexp", dim, keepdim).to(ATensor).newTensor()

proc margin_ranking_loss(ty: TensorType; input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor = 
  ty.dynamicCppCall("margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc margin_ranking_loss(input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor = 
  dynamicCCall("at::margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc matmul(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("matmul", self.tensor, other.tensor).to(ATensor).newTensor()

proc matmul(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("matmul", other.tensor).to(ATensor).newTensor()

proc matrix_rank(ty: TensorType; self: Tensor, tol: float64, symmetric: bool = false): Tensor = 
  ty.dynamicCppCall("matrix_rank", self.tensor, tol, symmetric).to(ATensor).newTensor()

proc matrix_rank(self: Tensor, tol: float64, symmetric: bool = false): Tensor = 
  dynamicCCall("at::matrix_rank", self.tensor, tol, symmetric).to(ATensor).newTensor()

proc matrix_rank(ty: TensorType; self: Tensor, symmetric: bool = false): Tensor = 
  ty.dynamicCppCall("matrix_rank", self.tensor, symmetric).to(ATensor).newTensor()

proc matrix_rank(self: Tensor, symmetric: bool = false): Tensor = 
  dynamicCCall("at::matrix_rank", self.tensor, symmetric).to(ATensor).newTensor()

proc max(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_values(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("max_values", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc max_values(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("max_values", dim, keepdim).to(ATensor).newTensor()

proc max_pool1d_with_indices(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("max_pool1d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_pool1d_with_indices(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::max_pool1d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_pool1d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor = 
  ty.dynamicCppCall("max_pool1d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor).newTensor()

proc max_pool1d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor = 
  dynamicCCall("at::max_pool1d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor).newTensor()

proc max_pool2d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor = 
  ty.dynamicCppCall("max_pool2d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor).newTensor()

proc max_pool2d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor = 
  dynamicCCall("at::max_pool2d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor).newTensor()

proc max_pool3d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor = 
  ty.dynamicCppCall("max_pool3d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor).newTensor()

proc max_pool3d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor = 
  dynamicCCall("at::max_pool3d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor).newTensor()

proc mean(ty: TensorType; self: Tensor, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dtype).to(ATensor).newTensor()

proc mean(self: Tensorself: Tensor, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("mean", dtype).to(ATensor).newTensor()

proc mean(ty: TensorType; self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dim, keepdim, dtype).to(ATensor).newTensor()

proc mean(self: Tensorself: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("mean", dim, keepdim, dtype).to(ATensor).newTensor()

proc mean(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc mean(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("mean", dim, keepdim).to(ATensor).newTensor()

proc mean(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dim, dtype).to(ATensor).newTensor()

proc mean(self: Tensorself: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("mean", dim, dtype).to(ATensor).newTensor()

proc median(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc median(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min_values(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("min_values", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc min_values(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("min_values", dim, keepdim).to(ATensor).newTensor()

proc mkldnn_convolution_backward_input(ty: TensorType; self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): Tensor = 
  ty.dynamicCppCall("mkldnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_input(self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): Tensor = 
  dynamicCCall("at::mkldnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_weights(ty: TensorType; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("mkldnn_convolution_backward_weights", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward_weights(weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::mkldnn_convolution_backward_weights", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward(ty: TensorType; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward(self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc mm(ty: TensorType; self: Tensor, mat2: Tensor): Tensor = 
  ty.dynamicCppCall("mm", self.tensor, mat2.tensor).to(ATensor).newTensor()

proc mm(self: Tensorself: Tensor, mat2: Tensor): Tensor = 
  self.dynamicCppCall("mm", mat2.tensor).to(ATensor).newTensor()

proc mode(ty: TensorType; self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mode(self: Tensorself: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mul_inplace(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("mul_", self.tensor, other.tensor).to(ATensor).newTensor()

proc mul_inplace(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("mul_", other.tensor).to(ATensor).newTensor()

proc mul_inplace(ty: TensorType; self: Tensor, other: float): Tensor = 
  ty.dynamicCppCall("mul_", self.tensor, other).to(ATensor).newTensor()

proc mul_inplace(self: Tensorself: Tensor, other: float): Tensor = 
  self.dynamicCppCall("mul_", other).to(ATensor).newTensor()

proc mv(self: Tensorself: Tensor, vec: Tensor): Tensor

proc mvlgamma(ty: TensorType; self: Tensor, p: int64): Tensor = 
  ty.dynamicCppCall("mvlgamma", self.tensor, p).to(ATensor).newTensor()

proc mvlgamma(self: Tensorself: Tensor, p: int64): Tensor = 
  self.dynamicCppCall("mvlgamma", p).to(ATensor).newTensor()

proc mvlgamma_inplace(ty: TensorType; self: Tensor, p: int64): Tensor = 
  ty.dynamicCppCall("mvlgamma_", self.tensor, p).to(ATensor).newTensor()

proc mvlgamma_inplace(self: Tensorself: Tensor, p: int64): Tensor = 
  self.dynamicCppCall("mvlgamma_", p).to(ATensor).newTensor()

proc narrow(ty: TensorType; self: Tensor, dim: int64, start: int64, length: int64): Tensor = 
  ty.dynamicCppCall("narrow", self.tensor, dim, start, length).to(ATensor).newTensor()

proc narrow(self: Tensorself: Tensor, dim: int64, start: int64, length: int64): Tensor = 
  self.dynamicCppCall("narrow", dim, start, length).to(ATensor).newTensor()

proc ones(ty: TensorType; size: IntList, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("ones", size, options).to(ATensor).newTensor()

proc ones(size: IntList, options: TensorOptions): Tensor = 
  dynamicCCall("at::ones", size, options).to(ATensor).newTensor()

proc ones_like(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("ones_like", self.tensor).to(ATensor).newTensor()

proc ones_like(self: Tensor): Tensor = 
  dynamicCCall("at::ones_like", self.tensor).to(ATensor).newTensor()

proc ones_like(ty: TensorType; self: Tensor, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("ones_like", self.tensor, options).to(ATensor).newTensor()

proc ones_like(self: Tensor, options: TensorOptions): Tensor = 
  dynamicCCall("at::ones_like", self.tensor, options).to(ATensor).newTensor()

proc pairwise_distance(ty: TensorType; x1: Tensor, x2: Tensor, p: float64 = 2, eps: float64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor).newTensor()

proc pairwise_distance(x1: Tensor, x2: Tensor, p: float64 = 2, eps: float64, keepdim: bool = false): Tensor = 
  dynamicCCall("at::pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor).newTensor()

proc permute(ty: TensorType; self: Tensor, dims: IntList): Tensor = 
  ty.dynamicCppCall("permute", self.tensor, dims).to(ATensor).newTensor()

proc permute(self: Tensorself: Tensor, dims: IntList): Tensor = 
  self.dynamicCppCall("permute", dims).to(ATensor).newTensor()

proc pin_memory(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("pin_memory", self.tensor).to(ATensor).newTensor()

proc pin_memory(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("pin_memory").to(ATensor).newTensor()

proc pinverse(ty: TensorType; self: Tensor, rcond: float64): Tensor = 
  ty.dynamicCppCall("pinverse", self.tensor, rcond).to(ATensor).newTensor()

proc pinverse(self: Tensorself: Tensor, rcond: float64): Tensor = 
  self.dynamicCppCall("pinverse", rcond).to(ATensor).newTensor()

proc rand(ty: TensorType; size: IntList, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("rand", size, options).to(ATensor).newTensor()

proc rand(size: IntList, options: TensorOptions): Tensor = 
  dynamicCCall("at::rand", size, options).to(ATensor).newTensor()

proc rand(ty: TensorType; size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("rand", size, generator, options).to(ATensor).newTensor()

proc rand(size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  dynamicCCall("at::rand", size, generator, options).to(ATensor).newTensor()

proc rand_like(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("rand_like", self.tensor).to(ATensor).newTensor()

proc rand_like(self: Tensor): Tensor = 
  dynamicCCall("at::rand_like", self.tensor).to(ATensor).newTensor()

proc rand_like(ty: TensorType; self: Tensor, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("rand_like", self.tensor, options).to(ATensor).newTensor()

proc rand_like(self: Tensor, options: TensorOptions): Tensor = 
  dynamicCCall("at::rand_like", self.tensor, options).to(ATensor).newTensor()

proc randint(ty: TensorType; high: int64, size: IntList, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", high, size, options).to(ATensor).newTensor()

proc randint(high: int64, size: IntList, options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", high, size, options).to(ATensor).newTensor()

proc randint(ty: TensorType; high: int64, size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", high, size, generator, options).to(ATensor).newTensor()

proc randint(high: int64, size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", high, size, generator, options).to(ATensor).newTensor()

proc randint(ty: TensorType; low: int64, high: int64, size: IntList, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", low, high, size, options).to(ATensor).newTensor()

proc randint(low: int64, high: int64, size: IntList, options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", low, high, size, options).to(ATensor).newTensor()

proc randint(ty: TensorType; low: int64, high: int64, size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", low, high, size, generator, options).to(ATensor).newTensor()

proc randint(low: int64, high: int64, size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", low, high, size, generator, options).to(ATensor).newTensor()

proc randint_like(ty: TensorType; self: Tensor, high: int64): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, high).to(ATensor).newTensor()

proc randint_like(self: Tensor, high: int64): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, high).to(ATensor).newTensor()

proc randint_like(ty: TensorType; self: Tensor, low: int64, high: int64): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, low, high).to(ATensor).newTensor()

proc randint_like(self: Tensor, low: int64, high: int64): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, low, high).to(ATensor).newTensor()

proc randint_like(ty: TensorType; self: Tensor, high: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, high, options).to(ATensor).newTensor()

proc randint_like(self: Tensor, high: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, high, options).to(ATensor).newTensor()

proc randint_like(ty: TensorType; self: Tensor, low: int64, high: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, low, high, options).to(ATensor).newTensor()

proc randint_like(self: Tensor, low: int64, high: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, low, high, options).to(ATensor).newTensor()

proc randn(ty: TensorType; size: IntList, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randn", size, options).to(ATensor).newTensor()

proc randn(size: IntList, options: TensorOptions): Tensor = 
  dynamicCCall("at::randn", size, options).to(ATensor).newTensor()

proc randn(ty: TensorType; size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randn", size, generator, options).to(ATensor).newTensor()

proc randn(size: IntList, generator: pointer, options: TensorOptions): Tensor = 
  dynamicCCall("at::randn", size, generator, options).to(ATensor).newTensor()

proc randn_like(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("randn_like", self.tensor).to(ATensor).newTensor()

proc randn_like(self: Tensor): Tensor = 
  dynamicCCall("at::randn_like", self.tensor).to(ATensor).newTensor()

proc randn_like(ty: TensorType; self: Tensor, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randn_like", self.tensor, options).to(ATensor).newTensor()

proc randn_like(self: Tensor, options: TensorOptions): Tensor = 
  dynamicCCall("at::randn_like", self.tensor, options).to(ATensor).newTensor()

proc randperm(ty: TensorType; n: int64, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randperm", n, options).to(ATensor).newTensor()

proc randperm(n: int64, options: TensorOptions): Tensor = 
  dynamicCCall("at::randperm", n, options).to(ATensor).newTensor()

proc randperm(ty: TensorType; n: int64, generator: pointer, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randperm", n, generator, options).to(ATensor).newTensor()

proc randperm(n: int64, generator: pointer, options: TensorOptions): Tensor = 
  dynamicCCall("at::randperm", n, generator, options).to(ATensor).newTensor()

proc range(ty: TensorType; start: float, end_name: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("range", start, end_name, options).to(ATensor).newTensor()

proc range(start: float, end_name: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::range", start, end_name, options).to(ATensor).newTensor()

proc range(ty: TensorType; start: float, end_name: float, step: float, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("range", start, end_name, step, options).to(ATensor).newTensor()

proc range(start: float, end_name: float, step: float, options: TensorOptions): Tensor = 
  dynamicCCall("at::range", start, end_name, step, options).to(ATensor).newTensor()

proc repeat(ty: TensorType; self: Tensor, repeats: IntList): Tensor = 
  ty.dynamicCppCall("repeat", self.tensor, repeats).to(ATensor).newTensor()

proc repeat(self: Tensorself: Tensor, repeats: IntList): Tensor = 
  self.dynamicCppCall("repeat", repeats).to(ATensor).newTensor()

proc reshape(ty: TensorType; self: Tensor, shape: IntList): Tensor = 
  ty.dynamicCppCall("reshape", self.tensor, shape).to(ATensor).newTensor()

proc reshape(self: Tensorself: Tensor, shape: IntList): Tensor = 
  self.dynamicCppCall("reshape", shape).to(ATensor).newTensor()

proc reshape_as(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("reshape_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc reshape_as(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("reshape_as", other.tensor).to(ATensor).newTensor()

proc RoiPooling2d_backward(ty: TensorType; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64, gradOutput: Tensor, argmaxes: Tensor): Tensor = 
  ty.dynamicCppCall("RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor).newTensor()

proc RoiPooling2d_backward(input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64, gradOutput: Tensor, argmaxes: Tensor): Tensor = 
  dynamicCCall("at::RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor).newTensor()

proc round_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("round_", self.tensor).to(ATensor).newTensor()

proc round_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("round_").to(ATensor).newTensor()

proc rrelu(ty: TensorType; self: Tensor, lower: float, upper: float, training: bool = false, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("rrelu", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu(self: Tensor, lower: float, upper: float, training: bool = false, generator: pointer = nil): Tensor = 
  dynamicCCall("at::rrelu", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu_inplace(ty: TensorType; self: Tensor, lower: float, upper: float, training: bool = false, generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("rrelu_", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu_inplace(self: Tensor, lower: float, upper: float, training: bool = false, generator: pointer = nil): Tensor = 
  dynamicCCall("at::rrelu_", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc relu_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("relu_", self.tensor).to(ATensor).newTensor()

proc relu_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("relu_").to(ATensor).newTensor()

proc hardshrink_backward(self: Tensorgrad_out: Tensor, self: Tensor, lambd: float): Tensor

proc rsqrt(self: Tensorself: Tensor): Tensor

proc rsqrt_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("rsqrt_", self.tensor).to(ATensor).newTensor()

proc rsqrt_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("rsqrt_").to(ATensor).newTensor()

proc select(ty: TensorType; self: Tensor, dim: int64, index: int64): Tensor = 
  ty.dynamicCppCall("select", self.tensor, dim, index).to(ATensor).newTensor()

proc select(self: Tensorself: Tensor, dim: int64, index: int64): Tensor = 
  self.dynamicCppCall("select", dim, index).to(ATensor).newTensor()

proc selu(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("selu", self.tensor).to(ATensor).newTensor()

proc selu(self: Tensor): Tensor = 
  dynamicCCall("at::selu", self.tensor).to(ATensor).newTensor()

proc selu_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("selu_", self.tensor).to(ATensor).newTensor()

proc selu_inplace(self: Tensor): Tensor = 
  dynamicCCall("at::selu_", self.tensor).to(ATensor).newTensor()

proc celu(ty: TensorType; self: Tensor, alpha: float): Tensor = 
  ty.dynamicCppCall("celu", self.tensor, alpha).to(ATensor).newTensor()

proc celu(self: Tensor, alpha: float): Tensor = 
  dynamicCCall("at::celu", self.tensor, alpha).to(ATensor).newTensor()

proc celu_inplace(ty: TensorType; self: Tensor, alpha: float): Tensor = 
  ty.dynamicCppCall("celu_", self.tensor, alpha).to(ATensor).newTensor()

proc celu_inplace(self: Tensor, alpha: float): Tensor = 
  dynamicCCall("at::celu_", self.tensor, alpha).to(ATensor).newTensor()

proc sigmoid_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sigmoid_", self.tensor).to(ATensor).newTensor()

proc sigmoid_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("sigmoid_").to(ATensor).newTensor()

proc sin(self: Tensorself: Tensor): Tensor

proc sin_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sin_", self.tensor).to(ATensor).newTensor()

proc sin_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("sin_").to(ATensor).newTensor()

proc sinh(self: Tensorself: Tensor): Tensor

proc sinh_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sinh_", self.tensor).to(ATensor).newTensor()

proc sinh_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("sinh_").to(ATensor).newTensor()

proc size(ty: TensorType; self: Tensor, dim: int64): int64 = 
  ty.dynamicCppCall("size", self.tensor, dim).to(int64)

proc size(self: Tensorself: Tensor, dim: int64): int64 = 
  self.dynamicCppCall("size", dim).to(int64)

proc slice(ty: TensorType; self: Tensor, dim: int64 = 0, start: int64 = 0, end_name: int64 = 9223372036854775807, step: int64 = 1): Tensor = 
  ty.dynamicCppCall("slice", self.tensor, dim, start, end_name, step).to(ATensor).newTensor()

proc slice(self: Tensorself: Tensor, dim: int64 = 0, start: int64 = 0, end_name: int64 = 9223372036854775807, step: int64 = 1): Tensor = 
  self.dynamicCppCall("slice", dim, start, end_name, step).to(ATensor).newTensor()

proc slogdet(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("slogdet", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc slogdet(self: Tensorself: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("slogdet").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc smm(ty: TensorType; self: Tensor, mat2: Tensor): Tensor = 
  ty.dynamicCppCall("smm", self.tensor, mat2.tensor).to(ATensor).newTensor()

proc smm(self: Tensorself: Tensor, mat2: Tensor): Tensor = 
  self.dynamicCppCall("smm", mat2.tensor).to(ATensor).newTensor()

proc softmax_backward_data(ty: TensorType; grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor = 
  ty.dynamicCppCall("softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc softmax_backward_data(grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor = 
  dynamicCCall("at::softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc split(ty: TensorType; self: Tensor, split_size: int64, dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("split", self.tensor, split_size, dim).to(TensorList)

proc split(self: Tensorself: Tensor, split_size: int64, dim: int64 = 0): TensorList = 
  self.dynamicCppCall("split", split_size, dim).to(TensorList)

proc split_with_sizes(ty: TensorType; self: Tensor, split_sizes: IntList, dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("split_with_sizes", self.tensor, split_sizes, dim).to(TensorList)

proc split_with_sizes(self: Tensorself: Tensor, split_sizes: IntList, dim: int64 = 0): TensorList = 
  self.dynamicCppCall("split_with_sizes", split_sizes, dim).to(TensorList)

proc squeeze(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("squeeze", self.tensor).to(ATensor).newTensor()

proc squeeze(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("squeeze").to(ATensor).newTensor()

proc squeeze(ty: TensorType; self: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("squeeze", self.tensor, dim).to(ATensor).newTensor()

proc squeeze(self: Tensorself: Tensor, dim: int64): Tensor = 
  self.dynamicCppCall("squeeze", dim).to(ATensor).newTensor()

proc squeeze_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("squeeze_", self.tensor).to(ATensor).newTensor()

proc squeeze_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("squeeze_").to(ATensor).newTensor()

proc squeeze_inplace(ty: TensorType; self: Tensor, dim: int64): Tensor = 
  ty.dynamicCppCall("squeeze_", self.tensor, dim).to(ATensor).newTensor()

proc squeeze_inplace(self: Tensorself: Tensor, dim: int64): Tensor = 
  self.dynamicCppCall("squeeze_", dim).to(ATensor).newTensor()

proc sspaddmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("sspaddmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc sspaddmm(self: Tensorself: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("sspaddmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc stft(ty: TensorType; self: Tensor, n_fft: int64, hop_length: int64, win_length: int64, window: Tensor, normalized: bool = false, onesided: bool = true): Tensor = 
  ty.dynamicCppCall("stft", self.tensor, n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor).newTensor()

proc stft(self: Tensorself: Tensor, n_fft: int64, hop_length: int64, win_length: int64, window: Tensor, normalized: bool = false, onesided: bool = true): Tensor = 
  self.dynamicCppCall("stft", n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor).newTensor()

proc stride(ty: TensorType; self: Tensor, dim: int64): int64 = 
  ty.dynamicCppCall("stride", self.tensor, dim).to(int64)

proc stride(self: Tensorself: Tensor, dim: int64): int64 = 
  self.dynamicCppCall("stride", dim).to(int64)

proc sum(ty: TensorType; self: Tensor, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dtype).to(ATensor).newTensor()

proc sum(self: Tensorself: Tensor, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("sum", dtype).to(ATensor).newTensor()

proc sum(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sum", self.tensor).to(ATensor).newTensor()

proc sum(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("sum").to(ATensor).newTensor()

proc sum(ty: TensorType; self: Tensor, dim: IntList, keepdim: bool, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dim, keepdim, dtype).to(ATensor).newTensor()

proc sum(self: Tensorself: Tensor, dim: IntList, keepdim: bool, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("sum", dim, keepdim, dtype).to(ATensor).newTensor()

proc sum(ty: TensorType; self: Tensor, dim: IntList, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc sum(self: Tensorself: Tensor, dim: IntList, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("sum", dim, keepdim).to(ATensor).newTensor()

proc sum(ty: TensorType; self: Tensor, dim: IntList, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dim, dtype).to(ATensor).newTensor()

proc sum(self: Tensorself: Tensor, dim: IntList, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("sum", dim, dtype).to(ATensor).newTensor()

proc sum_internal(ty: TensorType; self: Tensor, dim: IntList, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_sum", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc sum_internal(self: Tensorself: Tensor, dim: IntList, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_sum", dim, keepdim).to(ATensor).newTensor()

proc sqrt(self: Tensorself: Tensor): Tensor

proc sqrt_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sqrt_", self.tensor).to(ATensor).newTensor()

proc sqrt_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("sqrt_").to(ATensor).newTensor()

proc std(ty: TensorType; self: Tensor, unbiased: bool = true): Tensor = 
  ty.dynamicCppCall("std", self.tensor, unbiased).to(ATensor).newTensor()

proc std(self: Tensorself: Tensor, unbiased: bool = true): Tensor = 
  self.dynamicCppCall("std", unbiased).to(ATensor).newTensor()

proc std(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("std", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc std(self: Tensorself: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("std", dim, unbiased, keepdim).to(ATensor).newTensor()

proc prod(ty: TensorType; self: Tensor, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dtype).to(ATensor).newTensor()

proc prod(self: Tensorself: Tensor, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("prod", dtype).to(ATensor).newTensor()

proc prod(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("prod", self.tensor).to(ATensor).newTensor()

proc prod(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("prod").to(ATensor).newTensor()

proc prod_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_prod", self.tensor).to(ATensor).newTensor()

proc prod_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_prod").to(ATensor).newTensor()

proc prod(ty: TensorType; self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dim, keepdim, dtype).to(ATensor).newTensor()

proc prod(self: Tensorself: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("prod", dim, keepdim, dtype).to(ATensor).newTensor()

proc prod(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc prod(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("prod", dim, keepdim).to(ATensor).newTensor()

proc prod(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dim, dtype).to(ATensor).newTensor()

proc prod(self: Tensorself: Tensor, dim: int64, dtype: AScalarType): Tensor = 
  self.dynamicCppCall("prod", dim, dtype).to(ATensor).newTensor()

proc prod_internal(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc prod_internal(self: Tensorself: Tensor, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("_prod", dim, keepdim).to(ATensor).newTensor()

proc t(self: Tensorself: Tensor): Tensor

proc t_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("t_", self.tensor).to(ATensor).newTensor()

proc t_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("t_").to(ATensor).newTensor()

proc tan_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("tan_", self.tensor).to(ATensor).newTensor()

proc tan_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("tan_").to(ATensor).newTensor()

proc tanh_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("tanh_", self.tensor).to(ATensor).newTensor()

proc tanh_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("tanh_").to(ATensor).newTensor()

proc transpose(self: Tensorself: Tensor, dim0: int64, dim1: int64): Tensor

proc flip(self: Tensorself: Tensor, dims: IntList): Tensor

proc rot90(self: Tensorself: Tensor, k: int64 = 1, dims: IntList): Tensor

proc trilinear_internal(ty: TensorType; i1: Tensor, i2: Tensor, i3: Tensor, expand1: IntList, expand2: IntList, expand3: IntList, sumdim: IntList, unroll_dim: int64 = 1): Tensor = 
  ty.dynamicCppCall("_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1, expand2, expand3, sumdim, unroll_dim).to(ATensor).newTensor()

proc trilinear_internal(i1: Tensor, i2: Tensor, i3: Tensor, expand1: IntList, expand2: IntList, expand3: IntList, sumdim: IntList, unroll_dim: int64 = 1): Tensor = 
  dynamicCCall("at::_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1, expand2, expand3, sumdim, unroll_dim).to(ATensor).newTensor()

proc triplet_margin_loss(ty: TensorType; anchor: Tensor, positive: Tensor, negative: Tensor, margin: float64, p: float64 = 2, eps: float64, swap: bool = false, reduction: int64): Tensor = 
  ty.dynamicCppCall("triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc triplet_margin_loss(anchor: Tensor, positive: Tensor, negative: Tensor, margin: float64, p: float64 = 2, eps: float64, swap: bool = false, reduction: int64): Tensor = 
  dynamicCCall("at::triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc trunc_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("trunc_", self.tensor).to(ATensor).newTensor()

proc trunc_inplace(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("trunc_").to(ATensor).newTensor()

proc type_as(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("type_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc type_as(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("type_as", other.tensor).to(ATensor).newTensor()

proc unique_internal(ty: TensorType; self: Tensor, sorted: bool = false, return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("_unique", self.tensor, sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unique_internal(self: Tensorself: Tensor, sorted: bool = false, return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.dynamicCppCall("_unique", sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unsqueeze(self: Tensorself: Tensor, dim: int64): Tensor

proc var_name(ty: TensorType; self: Tensor, unbiased: bool = true): Tensor = 
  ty.dynamicCppCall("var", self.tensor, unbiased).to(ATensor).newTensor()

proc var_name(self: Tensorself: Tensor, unbiased: bool = true): Tensor = 
  self.dynamicCppCall("var", unbiased).to(ATensor).newTensor()

proc var_name(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("var", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc var_name(self: Tensorself: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("var", dim, unbiased, keepdim).to(ATensor).newTensor()

proc view_as(ty: TensorType; self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("view_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc view_as(self: Tensorself: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("view_as", other.tensor).to(ATensor).newTensor()

proc where(ty: TensorType; condition: Tensor, self: Tensor, other: Tensor): Tensor = 
  ty.dynamicCppCall("where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()

proc where(self: Tensorcondition: Tensor, self: Tensor, other: Tensor): Tensor = 
  self.dynamicCppCall("where", condition.tensor, other.tensor).to(ATensor).newTensor()

proc zeros(ty: TensorType; size: IntList, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("zeros", size, options).to(ATensor).newTensor()

proc zeros(size: IntList, options: TensorOptions): Tensor = 
  dynamicCCall("at::zeros", size, options).to(ATensor).newTensor()

proc zeros_like(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("zeros_like", self.tensor).to(ATensor).newTensor()

proc zeros_like(self: Tensor): Tensor = 
  dynamicCCall("at::zeros_like", self.tensor).to(ATensor).newTensor()

proc zeros_like(ty: TensorType; self: Tensor, options: TensorOptions): Tensor = 
  ty.dynamicCppCall("zeros_like", self.tensor, options).to(ATensor).newTensor()

proc zeros_like(self: Tensor, options: TensorOptions): Tensor = 
  dynamicCCall("at::zeros_like", self.tensor, options).to(ATensor).newTensor()

proc standard_gamma_grad_internal(ty: TensorType; self: Tensor, output: Tensor): Tensor = 
  ty.dynamicCppCall("_standard_gamma_grad", self.tensor, output.tensor).to(ATensor).newTensor()

proc standard_gamma_grad_internal(self: Tensorself: Tensor, output: Tensor): Tensor = 
  self.dynamicCppCall("_standard_gamma_grad", output.tensor).to(ATensor).newTensor()

proc native_norm(ty: TensorType; self: Tensor, p: float = 2): Tensor = 
  ty.dynamicCppCall("native_norm", self.tensor, p).to(ATensor).newTensor()

proc native_norm(self: Tensor, p: float = 2): Tensor = 
  dynamicCCall("at::native_norm", self.tensor, p).to(ATensor).newTensor()

proc norm(ty: TensorType; self: Tensor, p: float = 2): Tensor = 
  ty.dynamicCppCall("norm", self.tensor, p).to(ATensor).newTensor()

proc norm(self: Tensorself: Tensor, p: float = 2): Tensor = 
  self.dynamicCppCall("norm", p).to(ATensor).newTensor()

proc norm(ty: TensorType; self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("norm", self.tensor, p, dim, keepdim).to(ATensor).newTensor()

proc norm(self: Tensorself: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor = 
  self.dynamicCppCall("norm", p, dim, keepdim).to(ATensor).newTensor()

proc native_clone(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("native_clone", self.tensor).to(ATensor).newTensor()

proc native_clone(self: Tensor): Tensor = 
  dynamicCCall("at::native_clone", self.tensor).to(ATensor).newTensor()

proc clone(self: Tensorself: Tensor): Tensor

proc native_resize_as_inplace(ty: TensorType; self: Tensor, the_template: Tensor): Tensor = 
  ty.dynamicCppCall("native_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc native_resize_as_inplace(self: Tensor, the_template: Tensor): Tensor = 
  dynamicCCall("at::native_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc resize_as_inplace(ty: TensorType; self: Tensor, the_template: Tensor): Tensor = 
  ty.dynamicCppCall("resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc resize_as_inplace(self: Tensorself: Tensor, the_template: Tensor): Tensor = 
  self.dynamicCppCall("resize_as_", the_template.tensor).to(ATensor).newTensor()

proc native_pow(ty: TensorType; self: Tensor, exponent: float): Tensor = 
  ty.dynamicCppCall("native_pow", self.tensor, exponent).to(ATensor).newTensor()

proc native_pow(self: Tensor, exponent: float): Tensor = 
  dynamicCCall("at::native_pow", self.tensor, exponent).to(ATensor).newTensor()

proc pow(self: Tensorself: Tensor, exponent: float): Tensor

proc native_zero_inplace(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("native_zero_", self.tensor).to(ATensor).newTensor()

proc native_zero_inplace(self: Tensor): Tensor = 
  dynamicCCall("at::native_zero_", self.tensor).to(ATensor).newTensor()

proc sub_inplace(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("sub_", self.tensor, other.tensor, alpha).to(ATensor).newTensor()

proc sub_inplace(self: Tensorself: Tensor, other: Tensor, alpha: float = 1): Tensor = 
  self.dynamicCppCall("sub_", other.tensor, alpha).to(ATensor).newTensor()

proc sub_inplace(ty: TensorType; self: Tensor, other: float, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("sub_", self.tensor, other, alpha).to(ATensor).newTensor()

proc sub_inplace(self: Tensorself: Tensor, other: float, alpha: float = 1): Tensor = 
  self.dynamicCppCall("sub_", other, alpha).to(ATensor).newTensor()

proc s_native_addmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc s_native_addmm(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  dynamicCCall("at::s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc s_native_addmm_inplace(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc s_native_addmm_inplace(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  dynamicCCall("at::s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm(self: Tensorself: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("addmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm_inplace(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm_inplace(self: Tensorself: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor = 
  self.dynamicCppCall("addmm_", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc native_tensor(ty: TensorType; self_ty: TensorType): Tensor = 
  ty.dynamicCppCall("native_tensor", self_ty).to(ATensor).newTensor()

proc native_tensor(self_ty: TensorType): Tensor = 
  dynamicCCall("at::native_tensor", self_ty).to(ATensor).newTensor()

proc native_tensor(ty: TensorType; self_ty: TensorType, size: IntList): Tensor = 
  ty.dynamicCppCall("native_tensor", self_ty, size).to(ATensor).newTensor()

proc native_tensor(self_ty: TensorType, size: IntList): Tensor = 
  dynamicCCall("at::native_tensor", self_ty, size).to(ATensor).newTensor()

proc tensor(ty: TensorType; dtype: TensorType): Tensor = 
  ty.dynamicCppCall("tensor", dtype).to(ATensor).newTensor()

proc tensor(ty: TensorType; dtype: TensorType, size: IntList): Tensor = 
  ty.dynamicCppCall("tensor", dtype, size).to(ATensor).newTensor()

proc native_sparse_coo_tensor(ty: TensorType; indices: Tensor, values: Tensor): Tensor = 
  ty.dynamicCppCall("native_sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor).newTensor()

proc native_sparse_coo_tensor(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor = 
  ty.dynamicCppCall("native_sparse_coo_tensor", indices.tensor, values.tensor, size).to(ATensor).newTensor()

proc sparse_coo_tensor(ty: TensorType; indices: Tensor, values: Tensor): Tensor = 
  ty.dynamicCppCall("sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor).newTensor()

proc sparse_coo_tensor(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor = 
  ty.dynamicCppCall("sparse_coo_tensor", indices.tensor, values.tensor, size).to(ATensor).newTensor()

proc native_sparse_coo_tensor_unsafe_internal(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor = 
  ty.dynamicCppCall("_native_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_internal(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor = 
  ty.dynamicCppCall("_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_internal(indices: Tensor, values: Tensor, size: IntList): Tensor = 
  dynamicCCall("at::_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size).to(ATensor).newTensor()

proc sparse_raw_resize_inplace(ty: TensorType; self: Tensor, size: IntList, sparseDims: int64, denseDims: int64): Tensor = 
  ty.dynamicCppCall("sparse_raw_resize_", self.tensor, size, sparseDims, denseDims).to(ATensor).newTensor()

proc sparse_raw_resize_inplace(self: Tensorself: Tensor, size: IntList, sparseDims: int64, denseDims: int64): Tensor = 
  self.dynamicCppCall("sparse_raw_resize_", size, sparseDims, denseDims).to(ATensor).newTensor()

proc sparse_mask_internal(ty: TensorType; self: Tensor, mask: ASparseTensorRef): Tensor = 
  ty.dynamicCppCall("_sparse_mask", self.tensor, mask).to(ATensor).newTensor()

proc sparse_mask_internal(self: Tensorself: Tensor, mask: ASparseTensorRef): Tensor = 
  self.dynamicCppCall("_sparse_mask", mask).to(ATensor).newTensor()

proc to_dense(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("to_dense", self.tensor).to(ATensor).newTensor()

proc to_dense(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("to_dense").to(ATensor).newTensor()

proc sparseDims_internal(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_sparseDims", self.tensor).to(int64)

proc sparseDims_internal(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("_sparseDims").to(int64)

proc dimI_internal(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_dimI", self.tensor).to(int64)

proc dimI_internal(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("_dimI").to(int64)

proc denseDims_internal(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_denseDims", self.tensor).to(int64)

proc denseDims_internal(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("_denseDims").to(int64)

proc dimV_internal(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_dimV", self.tensor).to(int64)

proc dimV_internal(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("_dimV").to(int64)

proc nnz_internal(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_nnz", self.tensor).to(int64)

proc nnz_internal(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("_nnz").to(int64)

proc coalesce(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("coalesce", self.tensor).to(ATensor).newTensor()

proc coalesce(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("coalesce").to(ATensor).newTensor()

proc is_coalesced(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_coalesced", self.tensor).to(bool)

proc is_coalesced(self: Tensorself: Tensor): bool = 
  self.dynamicCppCall("is_coalesced").to(bool)

proc indices_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_indices", self.tensor).to(ATensor).newTensor()

proc indices_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_indices").to(ATensor).newTensor()

proc values_internal(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_values", self.tensor).to(ATensor).newTensor()

proc values_internal(self: Tensorself: Tensor): Tensor = 
  self.dynamicCppCall("_values").to(ATensor).newTensor()

proc hspmm(ty: TensorType; mat1: Tensor, mat2: Tensor): Tensor = 
  ty.dynamicCppCall("hspmm", mat1.tensor, mat2.tensor).to(ATensor).newTensor()

proc hspmm(mat1: Tensor, mat2: Tensor): Tensor = 
  dynamicCCall("at::hspmm", mat1.tensor, mat2.tensor).to(ATensor).newTensor()

proc raw_copy_sparse_inplace(ty: TensorType; self: Tensor, src: Tensor): Tensor = 
  ty.dynamicCppCall("raw_copy_sparse_", self.tensor, src.tensor).to(ATensor).newTensor()

proc raw_copy_sparse_inplace(self: Tensor, src: Tensor): Tensor = 
  dynamicCCall("at::raw_copy_sparse_", self.tensor, src.tensor).to(ATensor).newTensor()

proc numel(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("numel", self.tensor).to(int64)

proc numel(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("numel").to(int64)

proc unbind(ty: TensorType; self: Tensor, dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("unbind", self.tensor, dim).to(TensorList)

proc unbind(self: Tensorself: Tensor, dim: int64 = 0): TensorList = 
  self.dynamicCppCall("unbind", dim).to(TensorList)

proc native_get_device(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("native_get_device", self.tensor).to(int64)

proc native_get_device(self: Tensor): int64 = 
  dynamicCCall("at::native_get_device", self.tensor).to(int64)

proc get_device(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("get_device", self.tensor).to(int64)

proc get_device(self: Tensorself: Tensor): int64 = 
  self.dynamicCppCall("get_device").to(int64)

proc meshgrid(ty: TensorType; tensors: TensorList): TensorList = 
  ty.dynamicCppCall("meshgrid", tensors).to(TensorList)

proc meshgrid(tensors: TensorList): TensorList = 
  dynamicCCall("at::meshgrid", tensors).to(TensorList)

proc local_scalar_internal(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_local_scalar", self.tensor).to(float)

proc local_scalar_internal(self: Tensorself: Tensor): float = 
  self.dynamicCppCall("_local_scalar").to(float)

proc local_scalar_dense_internal(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_local_scalar_dense", self.tensor).to(float)

proc local_scalar_dense_internal(self: Tensor): float = 
  dynamicCCall("at::_local_scalar_dense", self.tensor).to(float)

proc thnn_fused_lstm_cell_internal(ty: TensorType; input_gates: Tensor, hidden_gates: Tensor, cx: Tensor, input_bias: Tensor, hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_internal(input_gates: Tensor, hidden_gates: Tensor, cx: Tensor, input_bias: Tensor, hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_backward_internal(ty: TensorType; grad_hy: Tensor, grad_cy: Tensor, cx: Tensor, cy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  ty.dynamicCppCall("_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_backward_internal(grad_hy: Tensor, grad_cy: Tensor, cx: Tensor, cy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  dynamicCCall("at::_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_backward_internal(ty: TensorType; grad_hy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  ty.dynamicCppCall("_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_backward_internal(grad_hy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  dynamicCCall("at::_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm(ty: TensorType; input: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("lstm", input.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm(input: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::lstm", input.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("lstm", data.tensor, batch_sizes.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm(data: Tensor, batch_sizes: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::lstm", data.tensor, batch_sizes.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc gru(ty: TensorType; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("gru", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru(input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::gru", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("gru", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru(data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::gru", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh(ty: TensorType; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_tanh", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh(input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_tanh", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh(data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu(ty: TensorType; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_relu", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu(input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_relu", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu(data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell(ty: TensorType; input: Tensor, hx: TensorList, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("lstm_cell", input.tensor, hx, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell(input: Tensor, hx: TensorList, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::lstm_cell", input.tensor, hx, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru_cell(ty: TensorType; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor = 
  ty.dynamicCppCall("gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc gru_cell(input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor = 
  dynamicCCall("at::gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_tanh_cell(ty: TensorType; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor = 
  ty.dynamicCppCall("rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_tanh_cell(input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor = 
  dynamicCCall("at::rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_relu_cell(ty: TensorType; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor = 
  ty.dynamicCppCall("rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_relu_cell(input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor = 
  dynamicCCall("at::rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

autograd masked_fill_inplace(ty: TensorType; self: Tensor, mask: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(mask, 0)

autograd masked_fill_inplace(self: Tensorself: Tensor, mask: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("masked_fill_", mask.tensor, value).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(mask, 0)

autograd masked_fill_inplace(ty: TensorType; self: Tensor, mask: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(mask, 0)
  value: where(mask, grad, zeros_like(grad)).sum()

autograd masked_fill_inplace(self: Tensorself: Tensor, mask: Tensor, value: Tensor) -> Tensor:
  result: self.dynamicCppCall("masked_fill_", mask.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(mask, 0)
  value: where(mask, grad, zeros_like(grad)).sum()

autograd masked_select(ty: TensorType; self: Tensor, mask: Tensor) -> Tensor:
  result: ty.dynamicCppCall("masked_select", self.tensor, mask.tensor).to(ATensor).newTensor()
  self: zeros_like(self).masked_scatter_inplace(mask, grad)

autograd masked_select(self: Tensorself: Tensor, mask: Tensor) -> Tensor:
  result: self.dynamicCppCall("masked_select", mask.tensor).to(ATensor).newTensor()
  self: zeros_like(self).masked_scatter_inplace(mask, grad)

autograd view(ty: TensorType; self: Tensor, size: IntList) -> Tensor:
  result: ty.dynamicCppCall("view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd view(self: Tensorself: Tensor, size: IntList) -> Tensor:
  result: self.dynamicCppCall("view", size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd take(ty: TensorType; self: Tensor, index: Tensor) -> Tensor:
  result: ty.dynamicCppCall("take", self.tensor, index.tensor).to(ATensor).newTensor()
  self: zeros_like(self).put_inplace(index, grad, true)

autograd take(self: Tensorself: Tensor, index: Tensor) -> Tensor:
  result: self.dynamicCppCall("take", index.tensor).to(ATensor).newTensor()
  self: zeros_like(self).put_inplace(index, grad, true)

autograd put_inplace(ty: TensorType; self: Tensor, index: Tensor, source: Tensor, accumulate: bool = false) -> Tensor:
  result: ty.dynamicCppCall("put_", self.tensor, index.tensor, source.tensor, accumulate).to(ATensor).newTensor()
  self: grad.clone().put_inplace(index, zeros_like(source), accumulate)
  source: grad.take(index)

autograd put_inplace(self: Tensorself: Tensor, index: Tensor, source: Tensor, accumulate: bool = false) -> Tensor:
  result: self.dynamicCppCall("put_", index.tensor, source.tensor, accumulate).to(ATensor).newTensor()
  self: grad.clone().put_inplace(index, zeros_like(source), accumulate)
  source: grad.take(index)

autograd index_add_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_add_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad
  source: grad.index_select(dim, index)

autograd index_add_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: self.dynamicCppCall("index_add_", dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad
  source: grad.index_select(dim, index)

autograd index_fill_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().index_fill_inplace(dim, index, 0)

autograd index_fill_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("index_fill_", dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().index_fill_inplace(dim, index, 0)

autograd index_fill_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_inplace(dim, index, 0)
  value: grad.index_select(dim, index).sum()

autograd index_fill_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, value: Tensor) -> Tensor:
  result: self.dynamicCppCall("index_fill_", dim, index.tensor, value.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_inplace(dim, index, 0)
  value: grad.index_select(dim, index).sum()

autograd scatter_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad.clone().scatter_inplace(dim, index, 0)
  src: grad.gather(dim, index)

autograd scatter_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: self.dynamicCppCall("scatter_", dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad.clone().scatter_inplace(dim, index, 0)
  src: grad.gather(dim, index)

autograd scatter_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().scatter_inplace(dim, index, 0)

autograd scatter_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("scatter_", dim, index.tensor, value).to(ATensor).newTensor()
  self: grad.clone().scatter_inplace(dim, index, 0)

autograd scatter_add_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: ty.dynamicCppCall("scatter_add_", self.tensor, dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad
  src: grad.gather(dim, index)

autograd scatter_add_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, src: Tensor) -> Tensor:
  result: self.dynamicCppCall("scatter_add_", dim, index.tensor, src.tensor).to(ATensor).newTensor()
  self: grad
  src: grad.gather(dim, index)

autograd lt_inplace(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("lt_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd lt_inplace(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("lt_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd lt_inplace(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("lt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd lt_inplace(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("lt_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd gt_inplace(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("gt_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd gt_inplace(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("gt_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd gt_inplace(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("gt_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd gt_inplace(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("gt_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd le_inplace(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("le_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd le_inplace(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("le_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd le_inplace(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("le_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd le_inplace(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("le_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd ge_inplace(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("ge_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ge_inplace(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("ge_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ge_inplace(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ge_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd ge_inplace(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("ge_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd eq_inplace(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("eq_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd eq_inplace(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("eq_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd eq_inplace(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("eq_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd eq_inplace(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("eq_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd ne_inplace(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("ne_", self.tensor, other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ne_inplace(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("ne_", other).to(ATensor).newTensor()
  self: zeros_like(self)

autograd ne_inplace(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ne_", self.tensor, other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd ne_inplace(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("ne_", other.tensor).to(ATensor).newTensor()
  self: zeros_like(self)
  other: zeros_like(other)

autograd min(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("min", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(self >= other, 0)
  other: grad.clone().masked_fill_inplace(self < other, 0)

autograd min(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("min", other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(self >= other, 0)
  other: grad.clone().masked_fill_inplace(self < other, 0)

autograd max(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("max", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(self <= other, 0)
  other: grad.clone().masked_fill_inplace(self > other, 0)

autograd max(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("max", other.tensor).to(ATensor).newTensor()
  self: grad.clone().masked_fill_inplace(self <= other, 0)
  other: grad.clone().masked_fill_inplace(self > other, 0)

autograd lgamma(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("lgamma", self.tensor).to(ATensor).newTensor()
  self: grad * digamma(self)

autograd lgamma(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("lgamma").to(ATensor).newTensor()
  self: grad * digamma(self)

autograd digamma(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("digamma", self.tensor).to(ATensor).newTensor()
  self: grad * polygamma(1, self)

autograd digamma(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("digamma").to(ATensor).newTensor()
  self: grad * polygamma(1, self)

autograd polygamma(ty: TensorType; n: int64, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("polygamma", n, self.tensor).to(ATensor).newTensor()
  self: grad * polygamma(n + 1, self)

autograd erfinv(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erfinv", self.tensor).to(ATensor).newTensor()
  self: 0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad

autograd erfinv(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("erfinv").to(ATensor).newTensor()
  self: 0.5 * sqrt(M_PI) * exp(self.erfinv().pow(2)) * grad

autograd frac(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("frac", self.tensor).to(ATensor).newTensor()
  self: grad

autograd frac(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("frac").to(ATensor).newTensor()
  self: grad

autograd reciprocal(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("reciprocal", self.tensor).to(ATensor).newTensor()
  self: -grad * fwd_result * fwd_result

autograd reciprocal(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("reciprocal").to(ATensor).newTensor()
  self: -grad * fwd_result * fwd_result

autograd neg(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("neg", self.tensor).to(ATensor).newTensor()
  self: grad.neg()

autograd neg(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("neg").to(ATensor).newTensor()
  self: grad.neg()

autograd atan2(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("atan2", self.tensor, other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd atan2(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("atan2", other.tensor).to(ATensor).newTensor()
  (self, other): atan2_backward(grad, self, other, grad_input_mask)

autograd pow(ty: TensorType; self: Tensor, exponent: Tensor) -> Tensor:
  result: ty.dynamicCppCall("pow", self.tensor, exponent.tensor).to(ATensor).newTensor()
  self: pow_backward_self(grad, self, exponent)
  exponent: pow_backward_exponent(grad, self, exponent)

autograd pow(self: Tensorself: Tensor, exponent: Tensor) -> Tensor:
  result: self.dynamicCppCall("pow", exponent.tensor).to(ATensor).newTensor()
  self: pow_backward_self(grad, self, exponent)
  exponent: pow_backward_exponent(grad, self, exponent)

autograd sign(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sign", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd sign(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sign").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd fmod(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("fmod", self.tensor, other).to(ATensor).newTensor()
  self: grad

autograd fmod(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("fmod", other).to(ATensor).newTensor()
  self: grad

autograd fmod(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("fmod", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad

autograd fmod(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("fmod", other.tensor).to(ATensor).newTensor()
  self: grad

autograd remainder(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("remainder", self.tensor, other).to(ATensor).newTensor()
  self: grad

autograd remainder(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("remainder", other).to(ATensor).newTensor()
  self: grad

autograd remainder(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("remainder", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad

autograd remainder(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("remainder", other.tensor).to(ATensor).newTensor()
  self: grad

autograd tril(ty: TensorType; self: Tensor, diagonal: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("tril", self.tensor, diagonal).to(ATensor).newTensor()
  self: grad.tril(diagonal)

autograd tril(self: Tensorself: Tensor, diagonal: int64 = 0) -> Tensor:
  result: self.dynamicCppCall("tril", diagonal).to(ATensor).newTensor()
  self: grad.tril(diagonal)

autograd triu(ty: TensorType; self: Tensor, diagonal: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("triu", self.tensor, diagonal).to(ATensor).newTensor()
  self: grad.triu(diagonal)

autograd triu(self: Tensorself: Tensor, diagonal: int64 = 0) -> Tensor:
  result: self.dynamicCppCall("triu", diagonal).to(ATensor).newTensor()
  self: grad.triu(diagonal)

autograd cross(ty: TensorType; self: Tensor, other: Tensor, dim: int64 = -1) -> Tensor:
  result: ty.dynamicCppCall("cross", self.tensor, other.tensor, dim).to(ATensor).newTensor()
  self: other.cross(grad, dim)
  other: grad.cross(self, dim)

autograd cross(self: Tensorself: Tensor, other: Tensor, dim: int64 = -1) -> Tensor:
  result: self.dynamicCppCall("cross", other.tensor, dim).to(ATensor).newTensor()
  self: other.cross(grad, dim)
  other: grad.cross(self, dim)

autograd addmv_internal(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat: grad.ger(vec) * alpha
  vec: mat.t().mv(grad) * alpha

autograd addmv_internal(self: Tensorself: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("_addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  mat: grad.ger(vec) * alpha
  vec: mat.t().mv(grad) * alpha

autograd addr_internal(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  vec1: grad.mv(vec2) * alpha
  vec2: grad.t().mv(vec1) * alpha

autograd addr_internal(self: Tensorself: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("_addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  vec1: grad.mv(vec2) * alpha
  vec2: grad.t().mv(vec1) * alpha

autograd bmm(ty: TensorType; self: Tensor, mat2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("bmm", self.tensor, mat2.tensor).to(ATensor).newTensor()
  self: grad.bmm(mat2.transpose(1, 2))
  mat2: self.transpose(1, 2).bmm(grad)

autograd bmm(self: Tensorself: Tensor, mat2: Tensor) -> Tensor:
  result: self.dynamicCppCall("bmm", mat2.tensor).to(ATensor).newTensor()
  self: grad.bmm(mat2.transpose(1, 2))
  mat2: self.transpose(1, 2).bmm(grad)

autograd addbmm(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha

autograd addbmm(self: Tensorself: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("addbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ]).bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad.unsqueeze(0).expand(@[ batch1.size(0), batch1.size(1), batch2.size(2) ])) * alpha

autograd baddbmm(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("baddbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad) * alpha

autograd baddbmm(self: Tensorself: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("baddbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()
  self: maybe_multiply(grad, beta)
  batch1: grad.bmm(batch2.transpose(1, 2)) * alpha
  batch2: batch1.transpose(1, 2).bmm(grad) * alpha

autograd addcmul(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addcmul", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * tensor2 * value
  tensor2: grad * tensor1 * value

autograd addcmul(self: Tensorself: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: self.dynamicCppCall("addcmul", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * tensor2 * value
  tensor2: grad * tensor1 * value

autograd addcdiv(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: ty.dynamicCppCall("addcdiv", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * value / tensor2
  tensor2: -grad * value * tensor1 / (tensor2 * tensor2)

autograd addcdiv(self: Tensorself: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1) -> Tensor:
  result: self.dynamicCppCall("addcdiv", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()
  self: grad
  tensor1: grad * value / tensor2
  tensor2: -grad * value * tensor1 / (tensor2 * tensor2)

autograd random_inplace(ty: TensorType; self: Tensor, from_name: int64, to_name: int64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, from_name, to_name, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_inplace(self: Tensorself: Tensor, from_name: int64, to_name: int64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("random_", from_name, to_name, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_inplace(ty: TensorType; self: Tensor, to_name: int64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, to_name, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_inplace(self: Tensorself: Tensor, to_name: int64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("random_", to_name, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_inplace(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("random_", self.tensor, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd random_inplace(self: Tensorself: Tensor, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("random_", generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd uniform_inplace(ty: TensorType; self: Tensor, from_name: float64 = 0, to_name: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("uniform_", self.tensor, from_name, to_name, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd uniform_inplace(self: Tensorself: Tensor, from_name: float64 = 0, to_name: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("uniform_", from_name, to_name, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd normal_inplace(ty: TensorType; self: Tensor, mean: float64 = 0, std: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd normal_inplace(self: Tensorself: Tensor, mean: float64 = 0, std: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("normal_", mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd cauchy_inplace(ty: TensorType; self: Tensor, median: float64 = 0, sigma: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("cauchy_", self.tensor, median, sigma, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd cauchy_inplace(self: Tensorself: Tensor, median: float64 = 0, sigma: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("cauchy_", median, sigma, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd log_normal_inplace(ty: TensorType; self: Tensor, mean: float64 = 1, std: float64 = 2, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("log_normal_", self.tensor, mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd log_normal_inplace(self: Tensorself: Tensor, mean: float64 = 1, std: float64 = 2, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("log_normal_", mean, std, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd exponential_inplace(ty: TensorType; self: Tensor, lambd: float64 = 1, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("exponential_", self.tensor, lambd, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd exponential_inplace(self: Tensorself: Tensor, lambd: float64 = 1, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("exponential_", lambd, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd geometric_inplace(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("geometric_", self.tensor, p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd geometric_inplace(self: Tensorself: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("geometric_", p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd alias(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("alias", self.tensor).to(ATensor).newTensor()
  self: grad

autograd alias(self: Tensor) -> Tensor:
  result: dynamicCCall("at::alias", self.tensor).to(ATensor).newTensor()
  self: grad

autograd binary_cross_entropy(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: binary_cross_entropy_backward(grad, self, target, weight, reduction)

autograd binary_cross_entropy(self: Tensor, target: Tensor, weight: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()
  self: binary_cross_entropy_backward(grad, self, target, weight, reduction)

autograd l1_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: l1_loss_backward(grad, self, target, reduction)

autograd l1_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: l1_loss_backward(grad, self, target, reduction)

autograd mse_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: mse_loss_backward(grad, self, target, reduction)

autograd mse_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: mse_loss_backward(grad, self, target, reduction)

autograd multi_margin_loss(ty: TensorType; self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)

autograd multi_margin_loss(self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()
  self: multi_margin_loss_backward(grad, self, target, p, margin, weight, reduction)

autograd multilabel_margin_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> tuple[output: Tensor, is_target: Tensor]:
  result: ty.dynamicCppCall("multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target)

autograd multilabel_margin_loss(self: Tensor, target: Tensor, reduction: int64) -> tuple[output: Tensor, is_target: Tensor]:
  result: dynamicCCall("at::multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: multilabel_margin_loss_backward(grad, self, target, reduction, fwd_result.is_target)

autograd nll_loss(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: ty.dynamicCppCall("nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd nll_loss(self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: dynamicCCall("at::nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd nll_loss_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd nll_loss_backward(grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: dynamicCCall("at::nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd nll_loss2d(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: ty.dynamicCppCall("nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd nll_loss2d(self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64) -> tuple[output: Tensor, total_weight: Tensor]:
  result: dynamicCCall("at::nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: nll_loss2d_backward(grad, self, target, weight, reduction, ignore_index, fwd_result.total_weight)

autograd nll_loss2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss2d(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd nll_loss2d_backward(grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor) -> Tensor:
  result: dynamicCCall("at::nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor).newTensor()
  grad_output: nll_loss2d(grad, target, weight, reduction, ignore_index)
  self: zeros_like(grad)

autograd smooth_l1_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: smooth_l1_loss_backward(grad, self, target, reduction)

autograd smooth_l1_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: smooth_l1_loss_backward(grad, self, target, reduction)

autograd soft_margin_loss(ty: TensorType; self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: ty.dynamicCppCall("soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: soft_margin_loss_backward(grad, self, target, reduction)

autograd soft_margin_loss(self: Tensor, target: Tensor, reduction: int64) -> Tensor:
  result: dynamicCCall("at::soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()
  self: soft_margin_loss_backward(grad, self, target, reduction)

autograd elu(ty: TensorType; self: Tensor, alpha: float, scale: float, input_scale: float) -> Tensor:
  result: ty.dynamicCppCall("elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: elu_backward(grad, alpha, scale, input_scale, fwd_result)

autograd elu(self: Tensor, alpha: float, scale: float, input_scale: float) -> Tensor:
  result: dynamicCCall("at::elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()
  self: elu_backward(grad, alpha, scale, input_scale, fwd_result)

autograd glu(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: glu_backward(grad, self, dim)

autograd glu(self: Tensor, dim: int64) -> Tensor:
  result: dynamicCCall("at::glu_forward", self.tensor, dim).to(ATensor).newTensor()
  self: glu_backward(grad, self, dim)

autograd hardtanh(ty: TensorType; self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, self, min_val, max_val)

autograd hardtanh(self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: dynamicCCall("at::hardtanh_forward", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, self, min_val, max_val)

autograd hardtanh_backward(ty: TensorType; grad_output: Tensor, self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: hardtanh_backward(grad, self, min_val, max_val)
  self: zeros_like(grad)

autograd hardtanh_backward(grad_output: Tensor, self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: dynamicCCall("at::hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor).newTensor()
  grad_output: hardtanh_backward(grad, self, min_val, max_val)
  self: zeros_like(grad)

autograd hardtanh_inplace(ty: TensorType; self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: ty.dynamicCppCall("hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, fwd_result, min_val, max_val)

autograd hardtanh_inplace(self: Tensor, min_val: float, max_val: float) -> Tensor:
  result: dynamicCCall("at::hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor).newTensor()
  self: hardtanh_backward(grad, fwd_result, min_val, max_val)

autograd leaky_relu(ty: TensorType; self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, self, negative_slope)

autograd leaky_relu(self: Tensor, negative_slope: float) -> Tensor:
  result: dynamicCCall("at::leaky_relu_forward", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, self, negative_slope)

autograd leaky_relu_backward(ty: TensorType; grad_output: Tensor, self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: leaky_relu_backward(grad, self, negative_slope)
  self: zeros_like(grad)

autograd leaky_relu_backward(grad_output: Tensor, self: Tensor, negative_slope: float) -> Tensor:
  result: dynamicCCall("at::leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor).newTensor()
  grad_output: leaky_relu_backward(grad, self, negative_slope)
  self: zeros_like(grad)

autograd leaky_relu_inplace(ty: TensorType; self: Tensor, negative_slope: float) -> Tensor:
  result: ty.dynamicCppCall("leaky_relu_forward_", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, fwd_result, negative_slope)

autograd leaky_relu_inplace(self: Tensor, negative_slope: float) -> Tensor:
  result: dynamicCCall("at::leaky_relu_forward_", self.tensor, negative_slope).to(ATensor).newTensor()
  self: leaky_relu_backward(grad, fwd_result, negative_slope)

autograd log_sigmoid(ty: TensorType; self: Tensor) -> tuple[output: Tensor, buffer: Tensor]:
  result: ty.dynamicCppCall("log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: log_sigmoid_backward(grad, self, fwd_result.buffer)

autograd log_sigmoid(self: Tensor) -> tuple[output: Tensor, buffer: Tensor]:
  result: dynamicCCall("at::log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: log_sigmoid_backward(grad, self, fwd_result.buffer)

autograd prelu(ty: TensorType; self: Tensor, weight: Tensor) -> Tensor:
  result: ty.dynamicCppCall("prelu_forward", self.tensor, weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight, grad_input_mask)

autograd prelu(self: Tensor, weight: Tensor) -> Tensor:
  result: dynamicCCall("at::prelu_forward", self.tensor, weight.tensor).to(ATensor).newTensor()
  (self, weight): prelu_backward(grad, self, weight, grad_input_mask)

autograd rrelu_with_noise(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)

autograd rrelu_with_noise(self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: dynamicCCall("at::rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)

autograd rrelu_with_noise_backward(ty: TensorType; grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  self: zeros_like(grad)

autograd rrelu_with_noise_backward(grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool) -> Tensor:
  result: dynamicCCall("at::rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor).newTensor()
  grad_output: rrelu_with_noise_backward(grad, self, noise, lower, upper, training)
  self: zeros_like(grad)

autograd rrelu_with_noise_inplace(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: ty.dynamicCppCall("rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)

autograd rrelu_with_noise_inplace(self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: pointer) -> Tensor:
  result: dynamicCCall("at::rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor).newTensor()
  self: rrelu_with_noise_backward(grad, fwd_result, noise, lower, upper, training)

autograd softplus(ty: TensorType; self: Tensor, beta: float, threshold: float) -> Tensor:
  result: ty.dynamicCppCall("softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: softplus_backward(grad, self, beta, threshold, fwd_result)

autograd softplus(self: Tensor, beta: float, threshold: float) -> Tensor:
  result: dynamicCCall("at::softplus_forward", self.tensor, beta, threshold).to(ATensor).newTensor()
  self: softplus_backward(grad, self, beta, threshold, fwd_result)

autograd softshrink(ty: TensorType; self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: softshrink_backward(grad, self, lambd)

autograd softshrink(self: Tensor, lambd: float) -> Tensor:
  result: dynamicCCall("at::softshrink_forward", self.tensor, lambd).to(ATensor).newTensor()
  self: softshrink_backward(grad, self, lambd)

autograd softshrink_backward(ty: TensorType; grad_output: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: softshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd softshrink_backward(grad_output: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: dynamicCCall("at::softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_output: softshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd threshold(ty: TensorType; self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, self, threshold, value)

autograd threshold(self: Tensor, threshold: float, value: float) -> Tensor:
  result: dynamicCCall("at::threshold_forward", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, self, threshold, value)

autograd threshold_backward(ty: TensorType; grad_output: Tensor, self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: threshold_backward(grad, self, threshold, value)
  self: zeros_like(grad)

autograd threshold_backward(grad_output: Tensor, self: Tensor, threshold: float, value: float) -> Tensor:
  result: dynamicCCall("at::threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor).newTensor()
  grad_output: threshold_backward(grad, self, threshold, value)
  self: zeros_like(grad)

autograd threshold_inplace(ty: TensorType; self: Tensor, threshold: float, value: float) -> Tensor:
  result: ty.dynamicCppCall("threshold_forward_", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, fwd_result, threshold, value)

autograd threshold_inplace(self: Tensor, threshold: float, value: float) -> Tensor:
  result: dynamicCCall("at::threshold_forward_", self.tensor, threshold, value).to(ATensor).newTensor()
  self: threshold_backward(grad, fwd_result, threshold, value)

autograd adaptive_avg_pool2d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool2d_backward(grad, self)

autograd adaptive_avg_pool2d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool2d_backward(grad, self)

autograd adaptive_avg_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd adaptive_avg_pool2d_backward(grad_output: Tensor, self: Tensor) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool2d(grad, @[ grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd adaptive_avg_pool3d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool3d_backward(grad, self)

autograd adaptive_avg_pool3d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: adaptive_avg_pool3d_backward(grad, self)

autograd adaptive_avg_pool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd adaptive_avg_pool3d_backward(grad_output: Tensor, self: Tensor) -> Tensor:
  result: dynamicCCall("at::adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor).newTensor()
  grad_output: adaptive_avg_pool3d(grad, @[ grad_output.size(-3), grad_output.size(-2), grad_output.size(-1) ])
  self: zeros_like(self)

autograd adaptive_max_pool2d(ty: TensorType; self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool2d_backward(grad, self, fwd_result.indices)

autograd adaptive_max_pool2d(self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool2d_backward(grad, self, fwd_result.indices)

autograd adaptive_max_pool3d(ty: TensorType; self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool3d_backward(grad, self, fwd_result.indices)

autograd adaptive_max_pool3d(self: Tensor, output_size: IntList) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: adaptive_max_pool3d_backward(grad, self, fwd_result.indices)

autograd avg_pool2d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd avg_pool2d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool2d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd avg_pool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd avg_pool2d_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool2d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd avg_pool3d(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd avg_pool3d(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  self: avg_pool3d_backward(grad, self, kernel_size, stride, padding, ceil_mode, count_include_pad)

autograd avg_pool3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: ty.dynamicCppCall("avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd avg_pool3d_backward(grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool) -> Tensor:
  result: dynamicCCall("at::avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor).newTensor()
  grad_output: avg_pool3d(grad, kernel_size, stride, padding, ceil_mode, count_include_pad)
  self: zeros_like(self)

autograd fractional_max_pool2d(ty: TensorType; self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices)

autograd fractional_max_pool2d(self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: fractional_max_pool2d_backward(grad, self, kernel_size, output_size, fwd_result.indices)

autograd max_pool2d_with_indices(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_pool2d_with_indices(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool2d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_pool3d_with_indices(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: ty.dynamicCppCall("max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_pool3d_with_indices(self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool) -> tuple[output: Tensor, indices: Tensor]:
  result: dynamicCCall("at::max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  self: max_pool3d_with_indices_backward(grad, self, kernel_size, stride, padding, dilation, ceil_mode, fwd_result.indices)

autograd max_unpool2d(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  self: max_unpool2d_backward(grad, self, indices, output_size)

autograd max_unpool2d(self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  self: max_unpool2d_backward(grad, self, indices, output_size)

autograd max_unpool2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  grad_output: max_unpool2d(grad, indices, output_size)
  self: zeros_like(self)

autograd max_unpool2d_backward(grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor).newTensor()
  grad_output: max_unpool2d(grad, indices, output_size)
  self: zeros_like(self)

autograd max_unpool3d(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()
  self: max_unpool3d_backward(grad, self, indices, output_size, stride, padding)

autograd max_unpool3d(self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList) -> Tensor:
  result: dynamicCCall("at::max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor).newTensor()
  self: max_unpool3d_backward(grad, self, indices, output_size, stride, padding)

autograd reflection_pad1d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad1d_backward(grad, self, padding)

autograd reflection_pad1d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad1d_backward(grad, self, padding)

autograd reflection_pad1d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad1d(grad, padding)
  self: zeros_like(self)

autograd reflection_pad1d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad1d(grad, padding)
  self: zeros_like(self)

autograd reflection_pad2d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad2d_backward(grad, self, padding)

autograd reflection_pad2d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: reflection_pad2d_backward(grad, self, padding)

autograd reflection_pad2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad2d(grad, padding)
  self: zeros_like(self)

autograd reflection_pad2d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: reflection_pad2d(grad, padding)
  self: zeros_like(self)

autograd replication_pad1d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad1d_backward(grad, self, padding)

autograd replication_pad1d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad1d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad1d_backward(grad, self, padding)

autograd replication_pad1d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad1d(grad, padding)
  self: zeros_like(self)

autograd replication_pad1d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad1d(grad, padding)
  self: zeros_like(self)

autograd replication_pad2d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad2d_backward(grad, self, padding)

autograd replication_pad2d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad2d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad2d_backward(grad, self, padding)

autograd replication_pad2d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad2d(grad, padding)
  self: zeros_like(self)

autograd replication_pad2d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad2d(grad, padding)
  self: zeros_like(self)

autograd replication_pad3d(ty: TensorType; self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad3d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad3d_backward(grad, self, padding)

autograd replication_pad3d(self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad3d_forward", self.tensor, padding).to(ATensor).newTensor()
  self: replication_pad3d_backward(grad, self, padding)

autograd replication_pad3d_backward(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: ty.dynamicCppCall("replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad3d(grad, padding)
  self: zeros_like(self)

autograd replication_pad3d_backward(grad_output: Tensor, self: Tensor, padding: IntList) -> Tensor:
  result: dynamicCCall("at::replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor).newTensor()
  grad_output: replication_pad3d(grad, padding)
  self: zeros_like(self)

autograd upsample_linear1d(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_linear1d(self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_linear1d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_linear1d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_linear1d(grad, output_size, align_corners)

autograd upsample_linear1d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_linear1d(grad, output_size, align_corners)

autograd upsample_bilinear2d(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_bilinear2d(self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_bilinear2d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_bilinear2d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_bilinear2d(grad, output_size, align_corners)

autograd upsample_bilinear2d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_bilinear2d(grad, output_size, align_corners)

autograd upsample_trilinear3d(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_trilinear3d(self: Tensor, output_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor).newTensor()
  self: upsample_trilinear3d_backward(grad, output_size, self.sizes(), align_corners)

autograd upsample_trilinear3d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: ty.dynamicCppCall("upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_trilinear3d(grad, output_size, align_corners)

autograd upsample_trilinear3d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool) -> Tensor:
  result: dynamicCCall("at::upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor).newTensor()
  grad_output: upsample_trilinear3d(grad, output_size, align_corners)

autograd upsample_nearest1d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest1d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest1d_backward(grad, output_size, self.sizes())

autograd upsample_nearest1d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest1d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest1d_backward(grad, output_size, self.sizes())

autograd upsample_nearest1d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest1d(grad, output_size)

autograd upsample_nearest1d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest1d(grad, output_size)

autograd upsample_nearest2d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest2d_backward(grad, output_size, self.sizes())

autograd upsample_nearest2d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest2d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest2d_backward(grad, output_size, self.sizes())

autograd upsample_nearest2d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest2d(grad, output_size)

autograd upsample_nearest2d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest2d(grad, output_size)

autograd upsample_nearest3d(ty: TensorType; self: Tensor, output_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest3d_backward(grad, output_size, self.sizes())

autograd upsample_nearest3d(self: Tensor, output_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest3d_forward", self.tensor, output_size).to(ATensor).newTensor()
  self: upsample_nearest3d_backward(grad, output_size, self.sizes())

autograd upsample_nearest3d_backward(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: ty.dynamicCppCall("upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest3d(grad, output_size)

autograd upsample_nearest3d_backward(grad_output: Tensor, output_size: IntList, input_size: IntList) -> Tensor:
  result: dynamicCCall("at::upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor).newTensor()
  grad_output: upsample_nearest3d(grad, output_size)

autograd sigmoid_backward_internal(ty: TensorType; grad_output: Tensor, output: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: sigmoid_backward_internal(grad, fwd_result)
  output: grad * grad_output * (-2 * fwd_result + 1)

autograd sigmoid_backward_internal(grad_output: Tensor, output: Tensor) -> Tensor:
  result: dynamicCCall("at::_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: sigmoid_backward_internal(grad, fwd_result)
  output: grad * grad_output * (-2 * fwd_result + 1)

autograd tanh_backward_internal(ty: TensorType; grad_output: Tensor, output: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: tanh_backward_internal(grad, fwd_result)
  output: -2 * fwd_result * grad * grad_output

autograd tanh_backward_internal(grad_output: Tensor, output: Tensor) -> Tensor:
  result: dynamicCCall("at::_tanh_backward", grad_output.tensor, output.tensor).to(ATensor).newTensor()
  grad_output: tanh_backward_internal(grad, fwd_result)
  output: -2 * fwd_result * grad * grad_output

autograd thnn_batch_norm(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64) -> tuple[output: Tensor, save_mean: Tensor, save_std: Tensor]:
  result: ty.dynamicCppCall("thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_batch_norm(self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64) -> tuple[output: Tensor, save_mean: Tensor, save_std: Tensor]:
  result: dynamicCCall("at::thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_batch_norm_backward(grad.contiguous(), self, weight, running_mean, running_var, training, eps, fwd_result.save_mean, fwd_result.save_std, grad_input_mask)

autograd thnn_conv_transpose2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: dynamicCCall("at::thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose2d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_transpose3d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_transpose3d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: dynamicCCall("at::thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_transpose3d_backward(grad, self, weight, kernel_size, stride, padding, output_padding, dilation, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: dynamicCCall("at::thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv2d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_depthwise2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> Tensor:
  result: ty.dynamicCppCall("thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1)

autograd thnn_conv_depthwise2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> Tensor:
  result: dynamicCCall("at::thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor).newTensor()
  (self, weight): thnn_conv_depthwise2d_backward(grad.contiguous(), self, weight, kernel_size, stride, padding, dilation, grad_input_mask)
  bias: grad.contiguous().view(@[grad.size(0), grad.size(1), -1]).sum(0).sum(1)

autograd thnn_conv3d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: ty.dynamicCppCall("thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv3d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList) -> tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]:
  result: dynamicCCall("at::thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv3d_backward(grad, self, weight, kernel_size, stride, padding, fwd_result.finput, fwd_result.fgrad_input, grad_input_mask)

autograd thnn_conv_dilated2d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated2d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: dynamicCCall("at::thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated2d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: ty.dynamicCppCall("thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd thnn_conv_dilated3d(self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList) -> tuple[output: Tensor, columns: Tensor, ones: Tensor]:
  result: dynamicCCall("at::thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (self, weight, bias): thnn_conv_dilated3d_backward(grad, self, weight, kernel_size, stride, padding, dilation, fwd_result.columns, fwd_result.ones, grad_input_mask)

autograd cudnn_ctc_loss_internal(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: fwd_result[1]

autograd cudnn_ctc_loss_internal(log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: fwd_result[1]

autograd abs(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("abs", self.tensor).to(ATensor).newTensor()
  self: grad * self.sign()

autograd abs(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("abs").to(ATensor).newTensor()
  self: grad * self.sign()

autograd acos(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("acos", self.tensor).to(ATensor).newTensor()
  self: grad * -((-self * self + 1).rsqrt())

autograd acos(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("acos").to(ATensor).newTensor()
  self: grad * -((-self * self + 1).rsqrt())

autograd add(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("add", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: maybe_multiply(grad, alpha)

autograd add(self: Tensorself: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("add", other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: maybe_multiply(grad, alpha)

autograd add(ty: TensorType; self: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("add", self.tensor, other, alpha).to(ATensor).newTensor()
  self: grad

autograd add(self: Tensorself: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("add", other, alpha).to(ATensor).newTensor()
  self: grad

autograd asin(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("asin", self.tensor).to(ATensor).newTensor()
  self: grad * (-self * self + 1).rsqrt()

autograd asin(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("asin").to(ATensor).newTensor()
  self: grad * (-self * self + 1).rsqrt()

autograd atan(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("atan", self.tensor).to(ATensor).newTensor()
  self: grad / (self * self + 1)

autograd atan(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("atan").to(ATensor).newTensor()
  self: grad / (self * self + 1)

autograd bernoulli(ty: TensorType; self: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("bernoulli", self.tensor, p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd bernoulli(self: Tensorself: Tensor, p: float64, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("bernoulli", p, generator).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd ceil(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ceil", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd ceil(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("ceil").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd clamp_max(ty: TensorType; self: Tensor, max: float) -> Tensor:
  result: ty.dynamicCppCall("clamp_max", self.tensor, max).to(ATensor).newTensor()
  self: grad * (self <= max).type_as(grad)

autograd clamp_max(self: Tensorself: Tensor, max: float) -> Tensor:
  result: self.dynamicCppCall("clamp_max", max).to(ATensor).newTensor()
  self: grad * (self <= max).type_as(grad)

autograd clamp_min(ty: TensorType; self: Tensor, min: float) -> Tensor:
  result: ty.dynamicCppCall("clamp_min", self.tensor, min).to(ATensor).newTensor()
  self: grad * (self >= min).type_as(grad)

autograd clamp_min(self: Tensorself: Tensor, min: float) -> Tensor:
  result: self.dynamicCppCall("clamp_min", min).to(ATensor).newTensor()
  self: grad * (self >= min).type_as(grad)

autograd conv_tbc(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, pad: int64) -> Tensor:
  result: ty.dynamicCppCall("conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd conv_tbc(self: Tensor, weight: Tensor, bias: Tensor, pad: int64) -> Tensor:
  result: dynamicCCall("at::conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor).newTensor()
  (self, weight, bias): conv_tbc_backward(grad, self, weight, bias, pad)

autograd cos(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cos", self.tensor).to(ATensor).newTensor()
  self: grad * -self.sin()

autograd cos(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("cos").to(ATensor).newTensor()
  self: grad * -self.sin()

autograd cosh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cosh", self.tensor).to(ATensor).newTensor()
  self: grad * self.sinh()

autograd cosh(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("cosh").to(ATensor).newTensor()
  self: grad * self.sinh()

autograd cudnn_affine_grid_generator(ty: TensorType; theta: Tensor, N: int64, C: int64, H: int64, W: int64) -> Tensor:
  result: ty.dynamicCppCall("cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: cudnn_affine_grid_generator_backward(grad, N, C, H, W)

autograd cudnn_affine_grid_generator(theta: Tensor, N: int64, C: int64, H: int64, W: int64) -> Tensor:
  result: dynamicCCall("at::cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor).newTensor()
  theta: cudnn_affine_grid_generator_backward(grad, N, C, H, W)

autograd cudnn_batch_norm(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor]:
  result: ty.dynamicCppCall("cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)

autograd cudnn_batch_norm(input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor]:
  result: dynamicCCall("at::cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  (input, weight, bias):  cudnn_batch_norm_backward(input, grad.contiguous(), weight, running_mean, running_var, fwd_result[1], fwd_result[2], epsilon) : thnn_batch_norm_backward(grad.contiguous(), input, weight, running_mean, running_var, training, epsilon, fwd_result[1], fwd_result[2], grad_input_mask)

autograd cudnn_convolution(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: ty.dynamicCppCall("cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution(self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: dynamicCCall("at::cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution_transpose(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: ty.dynamicCppCall("cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_convolution_transpose(self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool) -> Tensor:
  result: dynamicCCall("at::cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor).newTensor()
  (self, weight, bias): cudnn_convolution_transpose_backward(self, grad, weight, padding, output_padding, stride, dilation, groups, benchmark, deterministic, grad_input_mask)

autograd cudnn_grid_sampler(ty: TensorType; self: Tensor, grid: Tensor) -> Tensor:
  result: ty.dynamicCppCall("cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd cudnn_grid_sampler(self: Tensor, grid: Tensor) -> Tensor:
  result: dynamicCCall("at::cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor).newTensor()
  (self, grid): cudnn_grid_sampler_backward(self, grid, grad)

autograd ctc_loss_internal(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: ctc_loss_backward_internal(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank)

autograd ctc_loss_internal(log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  log_probs: ctc_loss_backward_internal(grad, log_probs, targets, input_lengths, target_lengths, fwd_result[0], fwd_result[1], blank)

autograd div_name(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("div", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad / other
  other: -grad * self / (other * other)

autograd div_name(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("div", other.tensor).to(ATensor).newTensor()
  self: grad / other
  other: -grad * self / (other * other)

autograd div_name(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("div", self.tensor, other).to(ATensor).newTensor()
  self: grad / other

autograd div_name(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("div", other).to(ATensor).newTensor()
  self: grad / other

autograd dot(ty: TensorType; self: Tensor, tensor: Tensor) -> Tensor:
  result: ty.dynamicCppCall("dot", self.tensor, tensor.tensor).to(ATensor).newTensor()
  self: grad * tensor
  tensor: grad * self

autograd dot(self: Tensorself: Tensor, tensor: Tensor) -> Tensor:
  result: self.dynamicCppCall("dot", tensor.tensor).to(ATensor).newTensor()
  self: grad * tensor
  tensor: grad * self

autograd embedding(ty: TensorType; weight: Tensor, indices: Tensor, padding_idx: int64 = -1, scale_grad_by_freq: bool = false, sparse: bool = false) -> Tensor:
  result: ty.dynamicCppCall("embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)

autograd embedding(weight: Tensor, indices: Tensor, padding_idx: int64 = -1, scale_grad_by_freq: bool = false, sparse: bool = false) -> Tensor:
  result: dynamicCCall("at::embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()
  weight: embedding_backward(grad, indices, weight.size(0), padding_idx, scale_grad_by_freq, sparse)

autograd embedding_bag_internal(ty: TensorType; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]:
  result: ty.dynamicCppCall("_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: embedding_bag_backward_internal(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse)

autograd embedding_bag_internal(weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false) -> tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]:
  result: dynamicCCall("at::_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()
  weight: embedding_bag_backward_internal(grad, indices, offsets, fwd_result[1], fwd_result[2], fwd_result[3], weight.size(0), scale_grad_by_freq, mode, sparse)

autograd erf(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erf", self.tensor).to(ATensor).newTensor()
  self: 2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd erf(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("erf").to(ATensor).newTensor()
  self: 2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd erfc(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("erfc", self.tensor).to(ATensor).newTensor()
  self: -2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd erfc(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("erfc").to(ATensor).newTensor()
  self: -2.0 / sqrt(M_PI) * exp(-(self.pow(2))) * grad

autograd exp(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("exp", self.tensor).to(ATensor).newTensor()
  self: grad * fwd_result

autograd exp(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("exp").to(ATensor).newTensor()
  self: grad * fwd_result

autograd expm1(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("expm1", self.tensor).to(ATensor).newTensor()
  self: grad * (fwd_result + 1)

autograd expm1(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("expm1").to(ATensor).newTensor()
  self: grad * (fwd_result + 1)

autograd fill_inplace(ty: TensorType; self: Tensor, value: float) -> Tensor:
  result: ty.dynamicCppCall("fill_", self.tensor, value).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd fill_inplace(self: Tensorself: Tensor, value: float) -> Tensor:
  result: self.dynamicCppCall("fill_", value).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd fill_inplace(ty: TensorType; self: Tensor, value: Tensor) -> Tensor:
  result: ty.dynamicCppCall("fill_", self.tensor, value.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)
  value: grad.sum()

autograd fill_inplace(self: Tensorself: Tensor, value: Tensor) -> Tensor:
  result: self.dynamicCppCall("fill_", value.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)
  value: grad.sum()

autograd floor(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("floor", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd floor(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("floor").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd grid_sampler_2d(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: ty.dynamicCppCall("grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_2d(input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: dynamicCCall("at::grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_2d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: ty.dynamicCppCall("grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd grid_sampler_3d(input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64) -> Tensor:
  result: dynamicCCall("at::grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()
  (input, grid): grid_sampler_3d_backward(grad, input, grid, interpolation_mode, padding_mode)

autograd ger(ty: TensorType; self: Tensor, vec2: Tensor) -> Tensor:
  result: ty.dynamicCppCall("ger", self.tensor, vec2.tensor).to(ATensor).newTensor()
  self: grad.mv(vec2)
  vec2: grad.t().mv(self)

autograd ger(self: Tensorself: Tensor, vec2: Tensor) -> Tensor:
  result: self.dynamicCppCall("ger", vec2.tensor).to(ATensor).newTensor()
  self: grad.mv(vec2)
  vec2: grad.t().mv(self)

autograd index_copy_inplace(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: ty.dynamicCppCall("index_copy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_inplace(dim, index, 0)
  source: grad.index_select(dim, index)

autograd index_copy_inplace(self: Tensorself: Tensor, dim: int64, index: Tensor, source: Tensor) -> Tensor:
  result: self.dynamicCppCall("index_copy_", dim, index.tensor, source.tensor).to(ATensor).newTensor()
  self: grad.clone().index_fill_inplace(dim, index, 0)
  source: grad.index_select(dim, index)

autograd inverse(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("inverse", self.tensor).to(ATensor).newTensor()
  self: -mm(fwd_result.t(), mm(grad, fwd_result.t()))

autograd inverse(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("inverse").to(ATensor).newTensor()
  self: -mm(fwd_result.t(), mm(grad, fwd_result.t()))

autograd log(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log", self.tensor).to(ATensor).newTensor()
  self: grad.div_name(self)

autograd log(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("log").to(ATensor).newTensor()
  self: grad.div_name(self)

autograd log10(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log10", self.tensor).to(ATensor).newTensor()
  self: grad / (self * 2.3025850929940456)

autograd log10(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("log10").to(ATensor).newTensor()
  self: grad / (self * 2.3025850929940456)

autograd log2(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("log2", self.tensor).to(ATensor).newTensor()
  self: grad / (self * 0.6931471805599453)

autograd log2(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("log2").to(ATensor).newTensor()
  self: grad / (self * 0.6931471805599453)

autograd log_softmax(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("log_softmax", self.tensor, dim).to(ATensor).newTensor()
  self: log_softmax_backward_data(grad, fwd_result, dim, self)

autograd log_softmax(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("log_softmax", dim).to(ATensor).newTensor()
  self: log_softmax_backward_data(grad, fwd_result, dim, self)

autograd mean(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mean", self.tensor).to(ATensor).newTensor()
  self: grad.expand(self.sizes()) / self.numel()

autograd mean(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("mean").to(ATensor).newTensor()
  self: grad.expand(self.sizes()) / self.numel()

autograd mkldnn_convolution(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64) -> Tensor:
  result: ty.dynamicCppCall("mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd mkldnn_convolution(self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64) -> Tensor:
  result: dynamicCCall("at::mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor).newTensor()
  (self, weight, bias): mkldnn_convolution_backward(self, grad, weight, padding, stride, dilation, groups, grad_input_mask)

autograd mul(ty: TensorType; self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mul", self.tensor, other.tensor).to(ATensor).newTensor()
  self: grad * other
  other: grad * self

autograd mul(self: Tensorself: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("mul", other.tensor).to(ATensor).newTensor()
  self: grad * other
  other: grad * self

autograd mul(ty: TensorType; self: Tensor, other: float) -> Tensor:
  result: ty.dynamicCppCall("mul", self.tensor, other).to(ATensor).newTensor()
  self: grad * other

autograd mul(self: Tensorself: Tensor, other: float) -> Tensor:
  result: self.dynamicCppCall("mul", other).to(ATensor).newTensor()
  self: grad * other

autograd mv(ty: TensorType; self: Tensor, vec: Tensor) -> Tensor:
  result: ty.dynamicCppCall("mv", self.tensor, vec.tensor).to(ATensor).newTensor()
  self: grad.ger(vec)
  vec: self.t().mv(grad)

autograd mv(self: Tensorself: Tensor, vec: Tensor) -> Tensor:
  result: self.dynamicCppCall("mv", vec.tensor).to(ATensor).newTensor()
  self: grad.ger(vec)
  vec: self.t().mv(grad)

autograd RoiPooling2d_forward(ty: TensorType; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1])

autograd RoiPooling2d_forward(input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  input: RoiPooling2d_backward(input, rois, pooledHeight, pooledWidth, spatialScale, grad, fwd_result[1])

autograd round(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("round", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd round(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("round").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd relu(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("relu", self.tensor).to(ATensor).newTensor()
  self: threshold_backward(grad, self, 0, 0)

autograd relu(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("relu").to(ATensor).newTensor()
  self: threshold_backward(grad, self, 0, 0)

autograd hardshrink(ty: TensorType; self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("hardshrink", self.tensor, lambd).to(ATensor).newTensor()
  self: hardshrink_backward(grad, self, lambd)

autograd hardshrink(self: Tensorself: Tensor, lambd: float) -> Tensor:
  result: self.dynamicCppCall("hardshrink", lambd).to(ATensor).newTensor()
  self: hardshrink_backward(grad, self, lambd)

autograd hardshrink_backward(ty: TensorType; grad_out: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: ty.dynamicCppCall("hardshrink_backward", grad_out.tensor, self.tensor, lambd).to(ATensor).newTensor()
  grad_out: hardshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd hardshrink_backward(self: Tensorgrad_out: Tensor, self: Tensor, lambd: float) -> Tensor:
  result: self.dynamicCppCall("hardshrink_backward", grad_out.tensor, lambd).to(ATensor).newTensor()
  grad_out: hardshrink_backward(grad, self, lambd)
  self: zeros_like(grad)

autograd rsqrt(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("rsqrt", self.tensor).to(ATensor).newTensor()
  self: -0.5 * grad * fwd_result.pow(3)

autograd rsqrt(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("rsqrt").to(ATensor).newTensor()
  self: -0.5 * grad * fwd_result.pow(3)

autograd sigmoid(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sigmoid", self.tensor).to(ATensor).newTensor()
  self: sigmoid_backward_internal(grad, fwd_result)

autograd sigmoid(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sigmoid").to(ATensor).newTensor()
  self: sigmoid_backward_internal(grad, fwd_result)

autograd sin(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sin", self.tensor).to(ATensor).newTensor()
  self: grad * self.cos()

autograd sin(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sin").to(ATensor).newTensor()
  self: grad * self.cos()

autograd sinh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sinh", self.tensor).to(ATensor).newTensor()
  self: grad * self.cosh()

autograd sinh(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sinh").to(ATensor).newTensor()
  self: grad * self.cosh()

autograd softmax(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("softmax", self.tensor, dim).to(ATensor).newTensor()
  self: softmax_backward_data(grad, fwd_result, dim, self)

autograd softmax(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("softmax", dim).to(ATensor).newTensor()
  self: softmax_backward_data(grad, fwd_result, dim, self)

autograd stack(ty: TensorType; tensors: TensorList, dim: int64 = 0) -> Tensor:
  result: ty.dynamicCppCall("stack", tensors, dim).to(ATensor).newTensor()
  tensors: unbind(grad, dim)

autograd stack(tensors: TensorList, dim: int64 = 0) -> Tensor:
  result: dynamicCCall("at::stack", tensors, dim).to(ATensor).newTensor()
  tensors: unbind(grad, dim)

autograd sum_internal(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_sum", self.tensor).to(ATensor).newTensor()
  self: grad.expand(self.sizes())

autograd sum_internal(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("_sum").to(ATensor).newTensor()
  self: grad.expand(self.sizes())

autograd sqrt(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("sqrt", self.tensor).to(ATensor).newTensor()
  self: grad / (2 * fwd_result)

autograd sqrt(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("sqrt").to(ATensor).newTensor()
  self: grad / (2 * fwd_result)

autograd t(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("t", self.tensor).to(ATensor).newTensor()
  self: grad.t()

autograd t(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("t").to(ATensor).newTensor()
  self: grad.t()

autograd tan(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("tan", self.tensor).to(ATensor).newTensor()
  self: grad * (1 + fwd_result.pow(2))

autograd tan(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("tan").to(ATensor).newTensor()
  self: grad * (1 + fwd_result.pow(2))

autograd tanh(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("tanh", self.tensor).to(ATensor).newTensor()
  self: tanh_backward_internal(grad, fwd_result)

autograd tanh(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("tanh").to(ATensor).newTensor()
  self: tanh_backward_internal(grad, fwd_result)

autograd transpose(ty: TensorType; self: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: ty.dynamicCppCall("transpose", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd transpose(self: Tensorself: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: self.dynamicCppCall("transpose", dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd transpose_inplace(ty: TensorType; self: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: ty.dynamicCppCall("transpose_", self.tensor, dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd transpose_inplace(self: Tensorself: Tensor, dim0: int64, dim1: int64) -> Tensor:
  result: self.dynamicCppCall("transpose_", dim0, dim1).to(ATensor).newTensor()
  self: grad.transpose(dim0, dim1)

autograd flip(ty: TensorType; self: Tensor, dims: IntList) -> Tensor:
  result: ty.dynamicCppCall("flip", self.tensor, dims).to(ATensor).newTensor()
  self: grad.flip(dims)

autograd flip(self: Tensorself: Tensor, dims: IntList) -> Tensor:
  result: self.dynamicCppCall("flip", dims).to(ATensor).newTensor()
  self: grad.flip(dims)

autograd rot90(ty: TensorType; self: Tensor, k: int64 = 1, dims: IntList) -> Tensor:
  result: ty.dynamicCppCall("rot90", self.tensor, k, dims).to(ATensor).newTensor()
  self: grad.rot90(-k, dims)

autograd rot90(self: Tensorself: Tensor, k: int64 = 1, dims: IntList) -> Tensor:
  result: self.dynamicCppCall("rot90", k, dims).to(ATensor).newTensor()
  self: grad.rot90(-k, dims)

autograd trunc(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("trunc", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd trunc(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("trunc").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd unsafe_view_internal(ty: TensorType; self: Tensor, size: IntList) -> Tensor:
  result: ty.dynamicCppCall("_unsafe_view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd unsafe_view_internal(self: Tensor, size: IntList) -> Tensor:
  result: dynamicCCall("at::_unsafe_view", self.tensor, size).to(ATensor).newTensor()
  self: grad.reshape(self.sizes())

autograd unsqueeze(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("unsqueeze", self.tensor, dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd unsqueeze(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("unsqueeze", dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd unsqueeze_inplace(ty: TensorType; self: Tensor, dim: int64) -> Tensor:
  result: ty.dynamicCppCall("unsqueeze_", self.tensor, dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd unsqueeze_inplace(self: Tensorself: Tensor, dim: int64) -> Tensor:
  result: self.dynamicCppCall("unsqueeze_", dim).to(ATensor).newTensor()
  self: grad.squeeze(dim)

autograd s_where_internal(ty: TensorType; condition: Tensor, self: Tensor, other: Tensor) -> Tensor:
  result: ty.dynamicCppCall("_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()
  self: where(condition, grad, zeros_like(grad))
  other: where(condition, zeros_like(grad), grad)

autograd s_where_internal(self: Tensorcondition: Tensor, self: Tensor, other: Tensor) -> Tensor:
  result: self.dynamicCppCall("_s_where", condition.tensor, other.tensor).to(ATensor).newTensor()
  self: where(condition, grad, zeros_like(grad))
  other: where(condition, zeros_like(grad), grad)

autograd standard_gamma_internal(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("_standard_gamma", self.tensor, generator).to(ATensor).newTensor()
  self: grad * self.standard_gamma_grad_internal(fwd_result)

autograd standard_gamma_internal(self: Tensorself: Tensor, generator: pointer = nil) -> Tensor:
  result: self.dynamicCppCall("_standard_gamma", generator).to(ATensor).newTensor()
  self: grad * self.standard_gamma_grad_internal(fwd_result)

autograd poisson(ty: TensorType; self: Tensor, generator: pointer = nil) -> Tensor:
  result: ty.dynamicCppCall("poisson", self.tensor, generator).to(ATensor).newTensor()
  self: zeros_like(self)

autograd poisson(self: Tensor, generator: pointer = nil) -> Tensor:
  result: dynamicCCall("at::poisson", self.tensor, generator).to(ATensor).newTensor()
  self: zeros_like(self)

autograd clone(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("clone", self.tensor).to(ATensor).newTensor()
  self: grad

autograd clone(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("clone").to(ATensor).newTensor()
  self: grad

autograd pow(ty: TensorType; self: Tensor, exponent: float) -> Tensor:
  result: ty.dynamicCppCall("pow", self.tensor, exponent).to(ATensor).newTensor()
  self: pow_backward(grad, self, exponent)

autograd pow(self: Tensorself: Tensor, exponent: float) -> Tensor:
  result: self.dynamicCppCall("pow", exponent).to(ATensor).newTensor()
  self: pow_backward(grad, self, exponent)

autograd zero_inplace(ty: TensorType; self: Tensor) -> Tensor:
  result: ty.dynamicCppCall("zero_", self.tensor).to(ATensor).newTensor()
  self: zeros_like(grad)

autograd zero_inplace(self: Tensorself: Tensor) -> Tensor:
  result: self.dynamicCppCall("zero_").to(ATensor).newTensor()
  self: zeros_like(grad)

autograd sub(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("sub", self.tensor, other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: -grad * alpha

autograd sub(self: Tensorself: Tensor, other: Tensor, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("sub", other.tensor, alpha).to(ATensor).newTensor()
  self: grad
  other: -grad * alpha

autograd sub(ty: TensorType; self: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: ty.dynamicCppCall("sub", self.tensor, other, alpha).to(ATensor).newTensor()
  self: grad

autograd sub(self: Tensorself: Tensor, other: float, alpha: float = 1) -> Tensor:
  result: self.dynamicCppCall("sub", other, alpha).to(ATensor).newTensor()
  self: grad

autograd thnn_fused_gru_cell_internal(ty: TensorType; input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor) -> tuple[result0: Tensor, result1: Tensor]:
  result: ty.dynamicCppCall("_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): thnn_fused_gru_cell_backward_internal(grad, fwd_result[1], input_bias.defined())

autograd thnn_fused_gru_cell_internal(input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor) -> tuple[result0: Tensor, result1: Tensor]:
  result: dynamicCCall("at::_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()
  (input_gates, hidden_gates, hx, input_bias, hidden_bias): thnn_fused_gru_cell_backward_internal(grad, fwd_result[1], input_bias.defined())

