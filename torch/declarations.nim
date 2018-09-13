# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

proc storage_offset*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("storage_offset", self.tensor).to(int64)

proc storage_offset*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("storage_offset").to(int64)

proc resize_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("resize_", self.tensor, size.toAIntList).to(ATensor).newTensor()

proc resize_inplace*(self: Tensor; size: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("resize_", size.toAIntList).to(ATensor).newTensor()

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage): Tensor = 
  ty.dynamicCppCall("set_", self.tensor, source).to(ATensor).newTensor()

proc set_inplace*(self: Tensor; source: AStorage): Tensor = 
  self.tensor.dynamicCppCall("set_", source).to(ATensor).newTensor()

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage; storage_offset: int64; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("set_", self.tensor, source, storage_offset, size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc set_inplace*(self: Tensor; source: AStorage; storage_offset: int64; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("set_", source, storage_offset, size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc set_inplace*(ty: TensorType; self: Tensor; source: Tensor): Tensor = 
  ty.dynamicCppCall("set_", self.tensor, source.tensor).to(ATensor).newTensor()

proc set_inplace*(self: Tensor; source: Tensor): Tensor = 
  self.tensor.dynamicCppCall("set_", source.tensor).to(ATensor).newTensor()

proc set_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("set_", self.tensor).to(ATensor).newTensor()

proc set_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("set_").to(ATensor).newTensor()

proc fill_internal_inplace*(ty: TensorType; self: Tensor; value: float): Tensor = 
  ty.dynamicCppCall("_fill_", self.tensor, value).to(ATensor).newTensor()

proc fill_internal_inplace*(self: Tensor; value: float): Tensor = 
  self.tensor.dynamicCppCall("_fill_", value).to(ATensor).newTensor()

proc fill_internal_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor = 
  ty.dynamicCppCall("_fill_", self.tensor, value.tensor).to(ATensor).newTensor()

proc fill_internal_inplace*(self: Tensor; value: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_fill_", value.tensor).to(ATensor).newTensor()

proc is_contiguous*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_contiguous", self.tensor).to(bool)

proc is_contiguous*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_contiguous").to(bool)

proc is_set_to*(ty: TensorType; self: Tensor; tensor: Tensor): bool = 
  ty.dynamicCppCall("is_set_to", self.tensor, tensor.tensor).to(bool)

proc is_set_to*(self: Tensor; tensor: Tensor): bool = 
  self.tensor.dynamicCppCall("is_set_to", tensor.tensor).to(bool)

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: float): Tensor

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: Tensor): Tensor

proc masked_scatter_inplace*(ty: TensorType; self: Tensor; mask: Tensor; source: Tensor): Tensor = 
  ty.dynamicCppCall("masked_scatter_", self.tensor, mask.tensor, source.tensor).to(ATensor).newTensor()

proc masked_scatter_inplace*(self: Tensor; mask: Tensor; source: Tensor): Tensor = 
  self.tensor.dynamicCppCall("masked_scatter_", mask.tensor, source.tensor).to(ATensor).newTensor()

proc masked_select*(ty: TensorType; self: Tensor; mask: Tensor): Tensor

proc masked_select*(self: Tensor; mask: Tensor): Tensor

proc nonzero*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("nonzero", self.tensor).to(ATensor).newTensor()

proc nonzero*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("nonzero").to(ATensor).newTensor()

proc contiguous*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("contiguous", self.tensor).to(ATensor).newTensor()

proc contiguous*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("contiguous").to(ATensor).newTensor()

proc th_clone*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("th_clone", self.tensor).to(ATensor).newTensor()

proc th_clone*(self: Tensor): Tensor = 
  dynamicCCall("at::th_clone", self.tensor).to(ATensor).newTensor()

proc view*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]): Tensor

proc view*(self: Tensor; size: openarray[SomeInteger]): Tensor

proc th_resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor = 
  ty.dynamicCppCall("th_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc th_resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor = 
  dynamicCCall("at::th_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc index_select*(ty: TensorType; self: Tensor; dim: int64; index: Tensor): Tensor = 
  ty.dynamicCppCall("index_select", self.tensor, dim, index.tensor).to(ATensor).newTensor()

proc index_select*(self: Tensor; dim: int64; index: Tensor): Tensor = 
  self.tensor.dynamicCppCall("index_select", dim, index.tensor).to(ATensor).newTensor()

proc indexCopy_internal_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor = 
  ty.dynamicCppCall("_indexCopy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor).newTensor()

proc indexCopy_internal_inplace*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_indexCopy_", dim, index.tensor, source.tensor).to(ATensor).newTensor()

proc take*(ty: TensorType; self: Tensor; index: Tensor): Tensor

proc take*(self: Tensor; index: Tensor): Tensor

proc put_inplace*(ty: TensorType; self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor

proc put_inplace*(self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor

proc index_add_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor

proc index_add_inplace*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor

proc index_fill_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: float): Tensor

proc index_fill_inplace*(self: Tensor; dim: int64; index: Tensor; value: float): Tensor

proc index_fill_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: Tensor): Tensor

proc index_fill_inplace*(self: Tensor; dim: int64; index: Tensor; value: Tensor): Tensor

proc unfold*(ty: TensorType; self: Tensor; dimension: int64; size: int64; step: int64): Tensor = 
  ty.dynamicCppCall("unfold", self.tensor, dimension, size, step).to(ATensor).newTensor()

proc unfold*(self: Tensor; dimension: int64; size: int64; step: int64): Tensor = 
  self.tensor.dynamicCppCall("unfold", dimension, size, step).to(ATensor).newTensor()

proc range_internal*(ty: TensorType; start: float; end_name: float; step: float = 1): Tensor = 
  ty.dynamicCppCall("_range", start, end_name, step).to(ATensor).newTensor()

proc arange_internal*(ty: TensorType; start: float; end_name: float; step: float = 1): Tensor = 
  ty.dynamicCppCall("_arange", start, end_name, step).to(ATensor).newTensor()

proc arange_internal*(ty: TensorType; end_name: float): Tensor = 
  ty.dynamicCppCall("_arange", end_name).to(ATensor).newTensor()

proc scatter_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor

proc scatter_inplace*(self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor

proc scatter_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: float): Tensor

proc scatter_inplace*(self: Tensor; dim: int64; index: Tensor; value: float): Tensor

proc scatter_add_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor

proc scatter_add_inplace*(self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor

proc gather*(ty: TensorType; self: Tensor; dim: int64; index: Tensor): Tensor = 
  ty.dynamicCppCall("gather", self.tensor, dim, index.tensor).to(ATensor).newTensor()

proc gather*(self: Tensor; dim: int64; index: Tensor): Tensor = 
  self.tensor.dynamicCppCall("gather", dim, index.tensor).to(ATensor).newTensor()

proc data_ptr*(ty: TensorType; self: Tensor): pointer = 
  ty.dynamicCppCall("data_ptr", self.tensor).to(pointer)

proc data_ptr*(self: Tensor): pointer = 
  self.tensor.dynamicCppCall("data_ptr").to(pointer)

proc equal*(ty: TensorType; self: Tensor; other: Tensor): bool = 
  ty.dynamicCppCall("equal", self.tensor, other.tensor).to(bool)

proc equal*(self: Tensor; other: Tensor): bool = 
  self.tensor.dynamicCppCall("equal", other.tensor).to(bool)

proc and_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__and__", self.tensor, other).to(ATensor).newTensor()

proc and_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__and__", other).to(ATensor).newTensor()

proc and_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__and__", self.tensor, other.tensor).to(ATensor).newTensor()

proc and_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__and__", other.tensor).to(ATensor).newTensor()

proc iand_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__iand__", self.tensor, other).to(ATensor).newTensor()

proc iand_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__iand__", other).to(ATensor).newTensor()

proc iand_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__iand__", self.tensor, other.tensor).to(ATensor).newTensor()

proc iand_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__iand__", other.tensor).to(ATensor).newTensor()

proc or_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__or__", self.tensor, other).to(ATensor).newTensor()

proc or_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__or__", other).to(ATensor).newTensor()

proc or_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__or__", self.tensor, other.tensor).to(ATensor).newTensor()

proc or_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__or__", other.tensor).to(ATensor).newTensor()

proc ior_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__ior__", self.tensor, other).to(ATensor).newTensor()

proc ior_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__ior__", other).to(ATensor).newTensor()

proc ior_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__ior__", self.tensor, other.tensor).to(ATensor).newTensor()

proc ior_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__ior__", other.tensor).to(ATensor).newTensor()

proc xor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__xor__", self.tensor, other).to(ATensor).newTensor()

proc xor_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__xor__", other).to(ATensor).newTensor()

proc xor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__xor__", self.tensor, other.tensor).to(ATensor).newTensor()

proc xor_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__xor__", other.tensor).to(ATensor).newTensor()

proc ixor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__ixor__", self.tensor, other).to(ATensor).newTensor()

proc ixor_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__ixor__", other).to(ATensor).newTensor()

proc ixor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__ixor__", self.tensor, other.tensor).to(ATensor).newTensor()

proc ixor_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__ixor__", other.tensor).to(ATensor).newTensor()

proc lshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__lshift__", self.tensor, other).to(ATensor).newTensor()

proc lshift_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__lshift__", other).to(ATensor).newTensor()

proc lshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__lshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc lshift_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__lshift__", other.tensor).to(ATensor).newTensor()

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__ilshift__", self.tensor, other).to(ATensor).newTensor()

proc ilshift_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__ilshift__", other).to(ATensor).newTensor()

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__ilshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc ilshift_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__ilshift__", other.tensor).to(ATensor).newTensor()

proc rshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__rshift__", self.tensor, other).to(ATensor).newTensor()

proc rshift_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__rshift__", other).to(ATensor).newTensor()

proc rshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__rshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc rshift_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__rshift__", other.tensor).to(ATensor).newTensor()

proc irshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("__irshift__", self.tensor, other).to(ATensor).newTensor()

proc irshift_builtin*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("__irshift__", other).to(ATensor).newTensor()

proc irshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("__irshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc irshift_builtin*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("__irshift__", other.tensor).to(ATensor).newTensor()

proc lt*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("lt", self.tensor, other).to(ATensor).newTensor()

proc lt*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("lt", other).to(ATensor).newTensor()

proc lt*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("lt", self.tensor, other.tensor).to(ATensor).newTensor()

proc lt*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("lt", other.tensor).to(ATensor).newTensor()

proc lt_inplace*(ty: TensorType; self: Tensor; other: float): Tensor

proc lt_inplace*(self: Tensor; other: float): Tensor

proc lt_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc lt_inplace*(self: Tensor; other: Tensor): Tensor

proc gt*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("gt", self.tensor, other).to(ATensor).newTensor()

proc gt*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("gt", other).to(ATensor).newTensor()

proc gt*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("gt", self.tensor, other.tensor).to(ATensor).newTensor()

proc gt*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("gt", other.tensor).to(ATensor).newTensor()

proc gt_inplace*(ty: TensorType; self: Tensor; other: float): Tensor

proc gt_inplace*(self: Tensor; other: float): Tensor

proc gt_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc gt_inplace*(self: Tensor; other: Tensor): Tensor

proc le*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("le", self.tensor, other).to(ATensor).newTensor()

proc le*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("le", other).to(ATensor).newTensor()

proc le*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("le", self.tensor, other.tensor).to(ATensor).newTensor()

proc le*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("le", other.tensor).to(ATensor).newTensor()

proc le_inplace*(ty: TensorType; self: Tensor; other: float): Tensor

proc le_inplace*(self: Tensor; other: float): Tensor

proc le_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc le_inplace*(self: Tensor; other: Tensor): Tensor

proc ge*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("ge", self.tensor, other).to(ATensor).newTensor()

proc ge*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("ge", other).to(ATensor).newTensor()

proc ge*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("ge", self.tensor, other.tensor).to(ATensor).newTensor()

proc ge*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("ge", other.tensor).to(ATensor).newTensor()

proc ge_inplace*(ty: TensorType; self: Tensor; other: float): Tensor

proc ge_inplace*(self: Tensor; other: float): Tensor

proc ge_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc ge_inplace*(self: Tensor; other: Tensor): Tensor

proc eq*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("eq", self.tensor, other).to(ATensor).newTensor()

proc eq*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("eq", other).to(ATensor).newTensor()

proc eq*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("eq", self.tensor, other.tensor).to(ATensor).newTensor()

proc eq*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("eq", other.tensor).to(ATensor).newTensor()

proc eq_inplace*(ty: TensorType; self: Tensor; other: float): Tensor

proc eq_inplace*(self: Tensor; other: float): Tensor

proc eq_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc eq_inplace*(self: Tensor; other: Tensor): Tensor

proc ne*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("ne", self.tensor, other).to(ATensor).newTensor()

proc ne*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("ne", other).to(ATensor).newTensor()

proc ne*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("ne", self.tensor, other.tensor).to(ATensor).newTensor()

proc ne*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("ne", other.tensor).to(ATensor).newTensor()

proc ne_inplace*(ty: TensorType; self: Tensor; other: float): Tensor

proc ne_inplace*(self: Tensor; other: float): Tensor

proc ne_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc ne_inplace*(self: Tensor; other: Tensor): Tensor

proc min*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc min*(self: Tensor; other: Tensor): Tensor

proc min*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("min", self.tensor).to(float)

proc min*(self: Tensor): float = 
  self.tensor.dynamicCppCall("min").to(float)

proc th_min_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] = 
  ty.dynamicCppCall("_th_min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_min_internal*(self: Tensor; dim: int64; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] = 
  self.tensor.dynamicCppCall("_th_min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc max*(self: Tensor; other: Tensor): Tensor

proc max*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("max", self.tensor).to(float)

proc max*(self: Tensor): float = 
  self.tensor.dynamicCppCall("max").to(float)

proc th_max_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] = 
  ty.dynamicCppCall("_th_max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_max_internal*(self: Tensor; dim: int64; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] = 
  self.tensor.dynamicCppCall("_th_max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_internal*(ty: TensorType; self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("_th_kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_internal*(self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.tensor.dynamicCppCall("_th_kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_internal*(ty: TensorType; self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("_th_mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_internal*(self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.tensor.dynamicCppCall("_th_mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc median*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("median", self.tensor).to(float)

proc median*(self: Tensor): float = 
  self.tensor.dynamicCppCall("median").to(float)

proc th_median_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("_th_median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_median_internal*(self: Tensor; dim: int64; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.tensor.dynamicCppCall("_th_median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc sort*(ty: TensorType; self: Tensor; dim: int64 = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("sort", self.tensor, dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc sort*(self: Tensor; dim: int64 = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] = 
  self.tensor.dynamicCppCall("sort", dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk*(ty: TensorType; self: Tensor; k: int64; dim: int64 = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] = 
  ty.dynamicCppCall("topk", self.tensor, k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk*(self: Tensor; k: int64; dim: int64 = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] = 
  self.tensor.dynamicCppCall("topk", k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc all*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("all", self.tensor).to(float)

proc all*(self: Tensor): float = 
  self.tensor.dynamicCppCall("all").to(float)

proc th_all_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_all", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_all_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_th_all", dim, keepdim).to(ATensor).newTensor()

proc any*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("any", self.tensor).to(float)

proc any*(self: Tensor): float = 
  self.tensor.dynamicCppCall("any").to(float)

proc th_any_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_any", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_any_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_th_any", dim, keepdim).to(ATensor).newTensor()

proc th_get_device_internal*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_th_get_device", self.tensor).to(int64)

proc th_get_device_internal*(self: Tensor): int64 = 
  dynamicCCall("at::_th_get_device", self.tensor).to(int64)

proc abs_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_abs", self.tensor).to(ATensor).newTensor()

proc abs_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_abs").to(ATensor).newTensor()

proc th_sigmoid_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_th_sigmoid", self.tensor).to(ATensor).newTensor()

proc th_sigmoid_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_th_sigmoid").to(ATensor).newTensor()

proc log_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log", self.tensor).to(ATensor).newTensor()

proc log_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_log").to(ATensor).newTensor()

proc log10_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log10", self.tensor).to(ATensor).newTensor()

proc log10_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_log10").to(ATensor).newTensor()

proc log1p_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log1p", self.tensor).to(ATensor).newTensor()

proc log1p_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_log1p").to(ATensor).newTensor()

proc log2_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_log2", self.tensor).to(ATensor).newTensor()

proc log2_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_log2").to(ATensor).newTensor()

proc lgamma*(ty: TensorType; self: Tensor): Tensor

proc lgamma*(self: Tensor): Tensor

proc lgamma_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("lgamma_", self.tensor).to(ATensor).newTensor()

proc lgamma_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("lgamma_").to(ATensor).newTensor()

proc digamma*(ty: TensorType; self: Tensor): Tensor

proc digamma*(self: Tensor): Tensor

proc digamma_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("digamma_", self.tensor).to(ATensor).newTensor()

proc digamma_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("digamma_").to(ATensor).newTensor()

proc polygamma*(ty: TensorType; n: int64; self: Tensor): Tensor

proc polygamma*(n: int64; self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("polygamma", n).to(ATensor).newTensor()

proc polygamma_inplace*(ty: TensorType; self: Tensor; n: int64): Tensor = 
  ty.dynamicCppCall("polygamma_", self.tensor, n).to(ATensor).newTensor()

proc polygamma_inplace*(self: Tensor; n: int64): Tensor = 
  self.tensor.dynamicCppCall("polygamma_", n).to(ATensor).newTensor()

proc exp_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_exp", self.tensor).to(ATensor).newTensor()

proc exp_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_exp").to(ATensor).newTensor()

proc expm1_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_expm1", self.tensor).to(ATensor).newTensor()

proc expm1_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_expm1").to(ATensor).newTensor()

proc cos_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_cos", self.tensor).to(ATensor).newTensor()

proc cos_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_cos").to(ATensor).newTensor()

proc acos_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_acos", self.tensor).to(ATensor).newTensor()

proc acos_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_acos").to(ATensor).newTensor()

proc cosh_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_cosh", self.tensor).to(ATensor).newTensor()

proc cosh_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_cosh").to(ATensor).newTensor()

proc sin_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sin", self.tensor).to(ATensor).newTensor()

proc sin_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_sin").to(ATensor).newTensor()

proc asin_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_asin", self.tensor).to(ATensor).newTensor()

proc asin_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_asin").to(ATensor).newTensor()

proc sinh_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sinh", self.tensor).to(ATensor).newTensor()

proc sinh_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_sinh").to(ATensor).newTensor()

proc tan_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_tan", self.tensor).to(ATensor).newTensor()

proc tan_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_tan").to(ATensor).newTensor()

proc atan_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_atan", self.tensor).to(ATensor).newTensor()

proc atan_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_atan").to(ATensor).newTensor()

proc th_tanh_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_th_tanh", self.tensor).to(ATensor).newTensor()

proc th_tanh_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_th_tanh").to(ATensor).newTensor()

proc erf_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_erf", self.tensor).to(ATensor).newTensor()

proc erf_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_erf").to(ATensor).newTensor()

proc erfc_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_erfc", self.tensor).to(ATensor).newTensor()

proc erfc_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_erfc").to(ATensor).newTensor()

proc erfinv_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("erfinv_", self.tensor).to(ATensor).newTensor()

proc erfinv_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("erfinv_").to(ATensor).newTensor()

proc erfinv*(ty: TensorType; self: Tensor): Tensor

proc erfinv*(self: Tensor): Tensor

proc sqrt_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sqrt", self.tensor).to(ATensor).newTensor()

proc sqrt_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_sqrt").to(ATensor).newTensor()

proc rsqrt_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_rsqrt", self.tensor).to(ATensor).newTensor()

proc rsqrt_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_rsqrt").to(ATensor).newTensor()

proc ceil_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_ceil", self.tensor).to(ATensor).newTensor()

proc ceil_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_ceil").to(ATensor).newTensor()

proc floor_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_floor", self.tensor).to(ATensor).newTensor()

proc floor_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_floor").to(ATensor).newTensor()

proc round_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_round", self.tensor).to(ATensor).newTensor()

proc round_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_round").to(ATensor).newTensor()

proc trunc_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_trunc", self.tensor).to(ATensor).newTensor()

proc trunc_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_trunc").to(ATensor).newTensor()

proc frac_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("frac_", self.tensor).to(ATensor).newTensor()

proc frac_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("frac_").to(ATensor).newTensor()

proc frac*(ty: TensorType; self: Tensor): Tensor

proc frac*(self: Tensor): Tensor

proc th_var_internal*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_var", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_internal*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_th_var", dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_internal*(ty: TensorType; self: Tensor; unbiased: bool = true): float = 
  ty.dynamicCppCall("_th_var", self.tensor, unbiased).to(float)

proc th_var_internal*(self: Tensor; unbiased: bool = true): float = 
  self.tensor.dynamicCppCall("_th_var", unbiased).to(float)

proc th_std_internal*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_std", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_internal*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_th_std", dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_internal*(ty: TensorType; self: Tensor; unbiased: bool = true): float = 
  ty.dynamicCppCall("_th_std", self.tensor, unbiased).to(float)

proc th_std_internal*(self: Tensor; unbiased: bool = true): float = 
  self.tensor.dynamicCppCall("_th_std", unbiased).to(float)

proc th_norm*(ty: TensorType; self: Tensor; p: float = 2): float = 
  ty.dynamicCppCall("th_norm", self.tensor, p).to(float)

proc th_norm*(self: Tensor; p: float = 2): float = 
  dynamicCCall("at::th_norm", self.tensor, p).to(float)

proc th_norm_internal*(ty: TensorType; self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_norm", self.tensor, p, dim, keepdim).to(ATensor).newTensor()

proc th_norm_internal*(self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_th_norm", p, dim, keepdim).to(ATensor).newTensor()

proc renorm*(ty: TensorType; self: Tensor; p: float; dim: int64; maxnorm: float): Tensor = 
  ty.dynamicCppCall("renorm", self.tensor, p, dim, maxnorm).to(ATensor).newTensor()

proc renorm*(self: Tensor; p: float; dim: int64; maxnorm: float): Tensor = 
  self.tensor.dynamicCppCall("renorm", p, dim, maxnorm).to(ATensor).newTensor()

proc renorm_inplace*(ty: TensorType; self: Tensor; p: float; dim: int64; maxnorm: float): Tensor = 
  ty.dynamicCppCall("renorm_", self.tensor, p, dim, maxnorm).to(ATensor).newTensor()

proc renorm_inplace*(self: Tensor; p: float; dim: int64; maxnorm: float): Tensor = 
  self.tensor.dynamicCppCall("renorm_", p, dim, maxnorm).to(ATensor).newTensor()

proc dist*(ty: TensorType; self: Tensor; other: Tensor; p: float = 2): float = 
  ty.dynamicCppCall("dist", self.tensor, other.tensor, p).to(float)

proc dist*(self: Tensor; other: Tensor; p: float = 2): float = 
  self.tensor.dynamicCppCall("dist", other.tensor, p).to(float)

proc reciprocal*(ty: TensorType; self: Tensor): Tensor

proc reciprocal*(self: Tensor): Tensor

proc reciprocal_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("reciprocal_", self.tensor).to(ATensor).newTensor()

proc reciprocal_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("reciprocal_").to(ATensor).newTensor()

proc neg*(ty: TensorType; self: Tensor): Tensor

proc neg*(self: Tensor): Tensor

proc neg_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("neg_", self.tensor).to(ATensor).newTensor()

proc neg_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("neg_").to(ATensor).newTensor()

proc atan2*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc atan2*(self: Tensor; other: Tensor): Tensor

proc atan2_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("atan2_", self.tensor, other.tensor).to(ATensor).newTensor()

proc atan2_inplace*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("atan2_", other.tensor).to(ATensor).newTensor()

proc th_pow*(ty: TensorType; self: Tensor; exponent: float): Tensor = 
  ty.dynamicCppCall("th_pow", self.tensor, exponent).to(ATensor).newTensor()

proc th_pow*(self: Tensor; exponent: float): Tensor = 
  dynamicCCall("at::th_pow", self.tensor, exponent).to(ATensor).newTensor()

proc pow*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor

proc pow*(self: Tensor; exponent: Tensor): Tensor

proc pow*(ty: TensorType; base: float; self: Tensor): Tensor = 
  ty.dynamicCppCall("pow", base, self.tensor).to(ATensor).newTensor()

proc pow*(base: float; self: Tensor): Tensor = 
  dynamicCCall("at::pow", base, self.tensor).to(ATensor).newTensor()

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: float): Tensor = 
  ty.dynamicCppCall("pow_", self.tensor, exponent).to(ATensor).newTensor()

proc pow_inplace*(self: Tensor; exponent: float): Tensor = 
  self.tensor.dynamicCppCall("pow_", exponent).to(ATensor).newTensor()

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor = 
  ty.dynamicCppCall("pow_", self.tensor, exponent.tensor).to(ATensor).newTensor()

proc pow_inplace*(self: Tensor; exponent: Tensor): Tensor = 
  self.tensor.dynamicCppCall("pow_", exponent.tensor).to(ATensor).newTensor()

proc lerp*(ty: TensorType; self: Tensor; end_name: Tensor; weight: float): Tensor = 
  ty.dynamicCppCall("lerp", self.tensor, end_name.tensor, weight).to(ATensor).newTensor()

proc lerp*(self: Tensor; end_name: Tensor; weight: float): Tensor = 
  self.tensor.dynamicCppCall("lerp", end_name.tensor, weight).to(ATensor).newTensor()

proc lerp_inplace*(ty: TensorType; self: Tensor; end_name: Tensor; weight: float): Tensor = 
  ty.dynamicCppCall("lerp_", self.tensor, end_name.tensor, weight).to(ATensor).newTensor()

proc lerp_inplace*(self: Tensor; end_name: Tensor; weight: float): Tensor = 
  self.tensor.dynamicCppCall("lerp_", end_name.tensor, weight).to(ATensor).newTensor()

proc linspace_internal*(ty: TensorType; start: float; end_name: float; steps: int64 = 100): Tensor = 
  ty.dynamicCppCall("_linspace", start, end_name, steps).to(ATensor).newTensor()

proc logspace_internal*(ty: TensorType; start: float; end_name: float; steps: int64 = 100): Tensor = 
  ty.dynamicCppCall("_logspace", start, end_name, steps).to(ATensor).newTensor()

proc histc*(ty: TensorType; self: Tensor; bins: int64 = 100; min: float = 0; max: float = 0): Tensor = 
  ty.dynamicCppCall("histc", self.tensor, bins, min, max).to(ATensor).newTensor()

proc histc*(self: Tensor; bins: int64 = 100; min: float = 0; max: float = 0): Tensor = 
  self.tensor.dynamicCppCall("histc", bins, min, max).to(ATensor).newTensor()

proc th_zero_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("th_zero_", self.tensor).to(ATensor).newTensor()

proc th_zero_inplace*(self: Tensor): Tensor = 
  dynamicCCall("at::th_zero_", self.tensor).to(ATensor).newTensor()

proc sumall_internal*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_sumall", self.tensor).to(float)

proc sumall_internal*(self: Tensor): float = 
  self.tensor.dynamicCppCall("_sumall").to(float)

proc th_sum_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_sum", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_sum_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_th_sum", dim, keepdim).to(ATensor).newTensor()

proc prodall_internal*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_prodall", self.tensor).to(float)

proc prodall_internal*(self: Tensor): float = 
  self.tensor.dynamicCppCall("_prodall").to(float)

proc th_prod_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_th_prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_prod_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_th_prod", dim, keepdim).to(ATensor).newTensor()

proc cumsum_internal*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
  ty.dynamicCppCall("_cumsum", self.tensor, dim).to(ATensor).newTensor()

proc cumsum_internal*(self: Tensor; dim: int64): Tensor = 
  self.tensor.dynamicCppCall("_cumsum", dim).to(ATensor).newTensor()

proc cumprod_internal*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
  ty.dynamicCppCall("_cumprod", self.tensor, dim).to(ATensor).newTensor()

proc cumprod_internal*(self: Tensor; dim: int64): Tensor = 
  self.tensor.dynamicCppCall("_cumprod", dim).to(ATensor).newTensor()

proc sign*(ty: TensorType; self: Tensor): Tensor

proc sign*(self: Tensor): Tensor

proc sign_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sign_", self.tensor).to(ATensor).newTensor()

proc sign_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("sign_").to(ATensor).newTensor()

proc trace*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("trace", self.tensor).to(float)

proc trace*(self: Tensor): float = 
  self.tensor.dynamicCppCall("trace").to(float)

proc fmod*(ty: TensorType; self: Tensor; other: float): Tensor

proc fmod*(self: Tensor; other: float): Tensor

proc fmod*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc fmod*(self: Tensor; other: Tensor): Tensor

proc fmod_inplace*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("fmod_", self.tensor, other).to(ATensor).newTensor()

proc fmod_inplace*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("fmod_", other).to(ATensor).newTensor()

proc fmod_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("fmod_", self.tensor, other.tensor).to(ATensor).newTensor()

proc fmod_inplace*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("fmod_", other.tensor).to(ATensor).newTensor()

proc remainder*(ty: TensorType; self: Tensor; other: float): Tensor

proc remainder*(self: Tensor; other: float): Tensor

proc remainder*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc remainder*(self: Tensor; other: Tensor): Tensor

proc remainder_inplace*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("remainder_", self.tensor, other).to(ATensor).newTensor()

proc remainder_inplace*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("remainder_", other).to(ATensor).newTensor()

proc remainder_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("remainder_", self.tensor, other.tensor).to(ATensor).newTensor()

proc remainder_inplace*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("remainder_", other.tensor).to(ATensor).newTensor()

proc th_clamp_internal*(ty: TensorType; self: Tensor; min: float; max: float): Tensor = 
  ty.dynamicCppCall("_th_clamp", self.tensor, min, max).to(ATensor).newTensor()

proc th_clamp_internal*(self: Tensor; min: float; max: float): Tensor = 
  self.tensor.dynamicCppCall("_th_clamp", min, max).to(ATensor).newTensor()

proc th_clamp_min_internal*(ty: TensorType; self: Tensor; min: float): Tensor = 
  ty.dynamicCppCall("_th_clamp_min", self.tensor, min).to(ATensor).newTensor()

proc th_clamp_min_internal*(self: Tensor; min: float): Tensor = 
  self.tensor.dynamicCppCall("_th_clamp_min", min).to(ATensor).newTensor()

proc th_clamp_max_internal*(ty: TensorType; self: Tensor; max: float): Tensor = 
  ty.dynamicCppCall("_th_clamp_max", self.tensor, max).to(ATensor).newTensor()

proc th_clamp_max_internal*(self: Tensor; max: float): Tensor = 
  self.tensor.dynamicCppCall("_th_clamp_max", max).to(ATensor).newTensor()

proc dot_internal*(ty: TensorType; self: Tensor; tensor: Tensor): float = 
  ty.dynamicCppCall("_dot", self.tensor, tensor.tensor).to(float)

proc dot_internal*(self: Tensor; tensor: Tensor): float = 
  self.tensor.dynamicCppCall("_dot", tensor.tensor).to(float)

proc tril*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor

proc tril*(self: Tensor; diagonal: int64 = 0): Tensor

proc tril_inplace*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor = 
  ty.dynamicCppCall("tril_", self.tensor, diagonal).to(ATensor).newTensor()

proc tril_inplace*(self: Tensor; diagonal: int64 = 0): Tensor = 
  self.tensor.dynamicCppCall("tril_", diagonal).to(ATensor).newTensor()

proc triu*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor

proc triu*(self: Tensor; diagonal: int64 = 0): Tensor

proc triu_inplace*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor = 
  ty.dynamicCppCall("triu_", self.tensor, diagonal).to(ATensor).newTensor()

proc triu_inplace*(self: Tensor; diagonal: int64 = 0): Tensor = 
  self.tensor.dynamicCppCall("triu_", diagonal).to(ATensor).newTensor()

proc cross*(ty: TensorType; self: Tensor; other: Tensor; dim: int64 = -1): Tensor

proc cross*(self: Tensor; other: Tensor; dim: int64 = -1): Tensor

proc diag*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor = 
  ty.dynamicCppCall("diag", self.tensor, diagonal).to(ATensor).newTensor()

proc diag*(self: Tensor; diagonal: int64 = 0): Tensor = 
  self.tensor.dynamicCppCall("diag", diagonal).to(ATensor).newTensor()

proc th_addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc th_addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc th_addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc th_addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  dynamicCCall("at::th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_internal*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc addmv_internal*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc addmv_internal_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("_addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_internal_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("_addmv_", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_internal*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc addr_internal*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc addr_internal_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("_addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_internal_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("_addr_", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc ger_internal*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor = 
  ty.dynamicCppCall("_ger", self.tensor, vec2.tensor).to(ATensor).newTensor()

proc ger_internal*(self: Tensor; vec2: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_ger", vec2.tensor).to(ATensor).newTensor()

proc mv_internal*(ty: TensorType; self: Tensor; vec: Tensor): Tensor = 
  ty.dynamicCppCall("_mv", self.tensor, vec.tensor).to(ATensor).newTensor()

proc mv_internal*(self: Tensor; vec: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_mv", vec.tensor).to(ATensor).newTensor()

proc mm_internal*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor

proc mm_internal*(self: Tensor; mat2: Tensor): Tensor

proc bmm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor

proc bmm*(self: Tensor; mat2: Tensor): Tensor

proc addbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc addbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc addbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc addbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc baddbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc baddbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc baddbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("baddbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc baddbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("baddbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor).newTensor()

proc addcmul*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor

proc addcmul*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor

proc addcmul_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
  ty.dynamicCppCall("addcmul_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc addcmul_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addcmul_", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc addcdiv*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor

proc addcdiv*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor

proc addcdiv_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
  ty.dynamicCppCall("addcdiv_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc addcdiv_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addcdiv_", tensor1.tensor, tensor2.tensor, value).to(ATensor).newTensor()

proc gesv_single_internal*(ty: TensorType; self: Tensor; A: Tensor): tuple[solution: Tensor, lu: Tensor] = 
  ty.dynamicCppCall("_gesv_single", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_single_internal*(self: Tensor; A: Tensor): tuple[solution: Tensor, lu: Tensor] = 
  self.tensor.dynamicCppCall("_gesv_single", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gels*(ty: TensorType; self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("gels", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gels*(self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  self.tensor.dynamicCppCall("gels", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs*(ty: TensorType; self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("trtrs", self.tensor, A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs*(self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  self.tensor.dynamicCppCall("trtrs", A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc symeig*(ty: TensorType; self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("symeig", self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc symeig*(self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] = 
  self.tensor.dynamicCppCall("symeig", eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc eig*(ty: TensorType; self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("eig", self.tensor, eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc eig*(self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] = 
  self.tensor.dynamicCppCall("eig", eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc svd*(ty: TensorType; self: Tensor; some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] = 
  ty.dynamicCppCall("svd", self.tensor, some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc svd*(self: Tensor; some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] = 
  self.tensor.dynamicCppCall("svd", some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc getri_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_getri", self.tensor).to(ATensor).newTensor()

proc getri_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_getri").to(ATensor).newTensor()

proc potrf*(ty: TensorType; self: Tensor; upper: bool = true): Tensor = 
  ty.dynamicCppCall("potrf", self.tensor, upper).to(ATensor).newTensor()

proc potrf*(self: Tensor; upper: bool = true): Tensor = 
  self.tensor.dynamicCppCall("potrf", upper).to(ATensor).newTensor()

proc potrs*(ty: TensorType; self: Tensor; input2: Tensor; upper: bool = true): Tensor = 
  ty.dynamicCppCall("potrs", self.tensor, input2.tensor, upper).to(ATensor).newTensor()

proc potrs*(self: Tensor; input2: Tensor; upper: bool = true): Tensor = 
  self.tensor.dynamicCppCall("potrs", input2.tensor, upper).to(ATensor).newTensor()

proc potri*(ty: TensorType; self: Tensor; upper: bool = true): Tensor = 
  ty.dynamicCppCall("potri", self.tensor, upper).to(ATensor).newTensor()

proc potri*(self: Tensor; upper: bool = true): Tensor = 
  self.tensor.dynamicCppCall("potri", upper).to(ATensor).newTensor()

proc pstrf*(ty: TensorType; self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("pstrf", self.tensor, upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc pstrf*(self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] = 
  self.tensor.dynamicCppCall("pstrf", upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("qr", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr*(self: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  self.tensor.dynamicCppCall("qr").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  ty.dynamicCppCall("geqrf", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf*(self: Tensor): tuple[res1: Tensor, res2: Tensor] = 
  self.tensor.dynamicCppCall("geqrf").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc orgqr*(ty: TensorType; self: Tensor; input2: Tensor): Tensor = 
  ty.dynamicCppCall("orgqr", self.tensor, input2.tensor).to(ATensor).newTensor()

proc orgqr*(self: Tensor; input2: Tensor): Tensor = 
  self.tensor.dynamicCppCall("orgqr", input2.tensor).to(ATensor).newTensor()

proc ormqr*(ty: TensorType; self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor = 
  ty.dynamicCppCall("ormqr", self.tensor, input2.tensor, input3.tensor, left, transpose).to(ATensor).newTensor()

proc ormqr*(self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor = 
  self.tensor.dynamicCppCall("ormqr", input2.tensor, input3.tensor, left, transpose).to(ATensor).newTensor()

proc btrifact*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor] = 
  ty.dynamicCppCall("btrifact", self.tensor, pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact*(self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor] = 
  self.tensor.dynamicCppCall("btrifact", pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor, info: Tensor] = 
  ty.dynamicCppCall("btrifact_with_info", self.tensor, pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info*(self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor, info: Tensor] = 
  self.tensor.dynamicCppCall("btrifact_with_info", pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrisolve*(ty: TensorType; self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor = 
  ty.dynamicCppCall("btrisolve", self.tensor, LU_data.tensor, LU_pivots.tensor).to(ATensor).newTensor()

proc btrisolve*(self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor = 
  self.tensor.dynamicCppCall("btrisolve", LU_data.tensor, LU_pivots.tensor).to(ATensor).newTensor()

proc random_inplace*(ty: TensorType; self: Tensor; from_name: int64; to_name: int64; generator: pointer = nil): Tensor

proc random_inplace*(self: Tensor; from_name: int64; to_name: int64; generator: pointer = nil): Tensor

proc random_inplace*(ty: TensorType; self: Tensor; to_name: int64; generator: pointer = nil): Tensor

proc random_inplace*(self: Tensor; to_name: int64; generator: pointer = nil): Tensor

proc random_inplace*(ty: TensorType; self: Tensor; generator: pointer = nil): Tensor

proc random_inplace*(self: Tensor; generator: pointer = nil): Tensor

proc multinomial*(ty: TensorType; self: Tensor; num_samples: int64; replacement: bool = false; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("multinomial", self.tensor, num_samples, replacement, generator).to(ATensor).newTensor()

proc multinomial*(self: Tensor; num_samples: int64; replacement: bool = false; generator: pointer = nil): Tensor = 
  self.tensor.dynamicCppCall("multinomial", num_samples, replacement, generator).to(ATensor).newTensor()

proc uniform_inplace*(ty: TensorType; self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: pointer = nil): Tensor

proc uniform_inplace*(self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: pointer = nil): Tensor

proc normal*(ty: TensorType; mean: Tensor; std: float64 = 1; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("normal", mean.tensor, std, generator).to(ATensor).newTensor()

proc normal*(mean: Tensor; std: float64 = 1; generator: pointer = nil): Tensor = 
  dynamicCCall("at::normal", mean.tensor, std, generator).to(ATensor).newTensor()

proc normal*(ty: TensorType; mean: float64; std: Tensor; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("normal", mean, std.tensor, generator).to(ATensor).newTensor()

proc normal*(mean: float64; std: Tensor; generator: pointer = nil): Tensor = 
  dynamicCCall("at::normal", mean, std.tensor, generator).to(ATensor).newTensor()

proc normal*(ty: TensorType; mean: Tensor; std: Tensor; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("normal", mean.tensor, std.tensor, generator).to(ATensor).newTensor()

proc normal*(mean: Tensor; std: Tensor; generator: pointer = nil): Tensor = 
  dynamicCCall("at::normal", mean.tensor, std.tensor, generator).to(ATensor).newTensor()

proc normal_inplace*(ty: TensorType; self: Tensor; mean: float64 = 0; std: float64 = 1; generator: pointer = nil): Tensor

proc normal_inplace*(self: Tensor; mean: float64 = 0; std: float64 = 1; generator: pointer = nil): Tensor

proc cauchy_inplace*(ty: TensorType; self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: pointer = nil): Tensor

proc cauchy_inplace*(self: Tensor; median: float64 = 0; sigma: float64 = 1; generator: pointer = nil): Tensor

proc log_normal_inplace*(ty: TensorType; self: Tensor; mean: float64 = 1; std: float64 = 2; generator: pointer = nil): Tensor

proc log_normal_inplace*(self: Tensor; mean: float64 = 1; std: float64 = 2; generator: pointer = nil): Tensor

proc exponential_inplace*(ty: TensorType; self: Tensor; lambd: float64 = 1; generator: pointer = nil): Tensor

proc exponential_inplace*(self: Tensor; lambd: float64 = 1; generator: pointer = nil): Tensor

proc geometric_inplace*(ty: TensorType; self: Tensor; p: float64; generator: pointer = nil): Tensor

proc geometric_inplace*(self: Tensor; p: float64; generator: pointer = nil): Tensor

proc bernoulli_internal_inplace*(ty: TensorType; self: Tensor; p: float64; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("_bernoulli_", self.tensor, p, generator).to(ATensor).newTensor()

proc bernoulli_internal_inplace*(self: Tensor; p: float64; generator: pointer = nil): Tensor = 
  self.tensor.dynamicCppCall("_bernoulli_", p, generator).to(ATensor).newTensor()

proc th_bernoulli_internal*(ty: TensorType; self: Tensor; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("_th_bernoulli", self.tensor, generator).to(ATensor).newTensor()

proc th_bernoulli_internal*(self: Tensor; generator: pointer = nil): Tensor = 
  self.tensor.dynamicCppCall("_th_bernoulli", generator).to(ATensor).newTensor()

proc dirichlet_grad_internal*(ty: TensorType; x: Tensor; alpha: Tensor; total: Tensor): Tensor = 
  ty.dynamicCppCall("_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor).newTensor()

proc dirichlet_grad_internal*(x: Tensor; alpha: Tensor; total: Tensor): Tensor = 
  dynamicCCall("at::_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor).newTensor()

proc th_tensor*(ty: TensorType; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("th_tensor", size.toAIntList).to(ATensor).newTensor()

proc th_tensor*(ty: TensorType; ): Tensor = 
  ty.dynamicCppCall("th_tensor").to(ATensor).newTensor()

proc tensor*(ty: TensorType; storage: AStorage; storageOffset: int64; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("tensor", storage, storageOffset, size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc tensor*(ty: TensorType; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("tensor", size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc alias*(ty: TensorType; self: Tensor): Tensor

proc alias*(self: Tensor): Tensor

proc copy_ignoring_overlaps_internal_inplace*(ty: TensorType; self: Tensor; src: Tensor): Tensor = 
  ty.dynamicCppCall("_copy_ignoring_overlaps_", self.tensor, src.tensor).to(ATensor).newTensor()

proc copy_ignoring_overlaps_internal_inplace*(self: Tensor; src: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_copy_ignoring_overlaps_", src.tensor).to(ATensor).newTensor()

proc cat_internal*(ty: TensorType; tensors: TensorList; dim: int64 = 0): Tensor = 
  ty.dynamicCppCall("_cat", tensors, dim).to(ATensor).newTensor()

proc cat_internal*(tensors: TensorList; dim: int64 = 0): Tensor = 
  dynamicCCall("at::_cat", tensors, dim).to(ATensor).newTensor()

proc binary_cross_entropy*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor

proc binary_cross_entropy*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor

proc binary_cross_entropy_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()

proc binary_cross_entropy_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()

proc kl_div*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div*(self: Tensor; target: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor

proc l1_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor

proc l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc mse_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor

proc mse_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor

proc mse_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc mse_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc multi_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor

proc multi_margin_loss*(self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor

proc multi_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()

proc multi_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()

proc multilabel_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): tuple[output: Tensor, is_target: Tensor]

proc multilabel_margin_loss*(self: Tensor; target: Tensor; reduction: int64): tuple[output: Tensor, is_target: Tensor]

proc multilabel_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64; is_target: Tensor): Tensor = 
  ty.dynamicCppCall("multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor).newTensor()

proc multilabel_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64; is_target: Tensor): Tensor = 
  dynamicCCall("at::multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor).newTensor()

proc nll_loss*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor]

proc nll_loss*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor]

proc nll_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor

proc nll_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor

proc nll_loss2d*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor]

proc nll_loss2d*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor]

proc nll_loss2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor

proc nll_loss2d_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor

proc smooth_l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor

proc smooth_l1_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor

proc smooth_l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc smooth_l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc soft_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor

proc soft_margin_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor

proc soft_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  ty.dynamicCppCall("soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc soft_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor = 
  dynamicCCall("at::soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc elu*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor

proc elu*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor

proc elu_backward*(ty: TensorType; grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor = 
  ty.dynamicCppCall("elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor).newTensor()

proc elu_backward*(grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor = 
  dynamicCCall("at::elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor).newTensor()

proc elu_inplace*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor = 
  ty.dynamicCppCall("elu_forward_", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()

proc elu_inplace*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor = 
  dynamicCCall("at::elu_forward_", self.tensor, alpha, scale, input_scale).to(ATensor).newTensor()

proc glu*(ty: TensorType; self: Tensor; dim: int64): Tensor

proc glu*(self: Tensor; dim: int64): Tensor

proc glu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; dim: int64): Tensor = 
  ty.dynamicCppCall("glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor).newTensor()

proc glu_backward*(grad_output: Tensor; self: Tensor; dim: int64): Tensor = 
  dynamicCCall("at::glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor).newTensor()

proc hardtanh*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor

proc hardtanh*(self: Tensor; min_val: float; max_val: float): Tensor

proc hardtanh_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor

proc hardtanh_backward*(grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor

proc hardtanh_inplace*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor

proc hardtanh_inplace*(self: Tensor; min_val: float; max_val: float): Tensor

proc leaky_relu*(ty: TensorType; self: Tensor; negative_slope: float): Tensor

proc leaky_relu*(self: Tensor; negative_slope: float): Tensor

proc leaky_relu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; negative_slope: float): Tensor

proc leaky_relu_backward*(grad_output: Tensor; self: Tensor; negative_slope: float): Tensor

proc leaky_relu_inplace*(ty: TensorType; self: Tensor; negative_slope: float): Tensor

proc leaky_relu_inplace*(self: Tensor; negative_slope: float): Tensor

proc log_sigmoid*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor]

proc log_sigmoid*(self: Tensor): tuple[output: Tensor, buffer: Tensor]

proc log_sigmoid_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor = 
  ty.dynamicCppCall("log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor).newTensor()

proc log_sigmoid_backward*(grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor = 
  dynamicCCall("at::log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor).newTensor()

proc prelu*(ty: TensorType; self: Tensor; weight: Tensor): Tensor

proc prelu*(self: Tensor; weight: Tensor): Tensor

proc prelu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  ty.dynamicCppCall("prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc prelu_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  dynamicCCall("at::prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rrelu_with_noise*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor

proc rrelu_with_noise*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor

proc rrelu_with_noise_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor

proc rrelu_with_noise_backward*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor

proc rrelu_with_noise_inplace*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor

proc rrelu_with_noise_inplace*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: pointer): Tensor

proc softplus*(ty: TensorType; self: Tensor; beta: float; threshold: float): Tensor

proc softplus*(self: Tensor; beta: float; threshold: float): Tensor

proc softplus_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor = 
  ty.dynamicCppCall("softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor).newTensor()

proc softplus_backward*(grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor = 
  dynamicCCall("at::softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor).newTensor()

proc softshrink*(ty: TensorType; self: Tensor; lambd: float): Tensor

proc softshrink*(self: Tensor; lambd: float): Tensor

proc softshrink_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; lambd: float): Tensor

proc softshrink_backward*(grad_output: Tensor; self: Tensor; lambd: float): Tensor

proc threshold*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor

proc threshold*(self: Tensor; threshold: float; value: float): Tensor

proc threshold_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor

proc threshold_backward*(grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor

proc threshold_inplace*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor

proc threshold_inplace*(self: Tensor; threshold: float; value: float): Tensor

proc adaptive_avg_pool2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc adaptive_avg_pool2d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc adaptive_avg_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor

proc adaptive_avg_pool2d_backward*(grad_output: Tensor; self: Tensor): Tensor

proc adaptive_avg_pool3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc adaptive_avg_pool3d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc adaptive_avg_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor

proc adaptive_avg_pool3d_backward*(grad_output: Tensor; self: Tensor): Tensor

proc adaptive_max_pool2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor]

proc adaptive_max_pool2d*(self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor]

proc adaptive_max_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor = 
  ty.dynamicCppCall("adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor = 
  dynamicCCall("at::adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor]

proc adaptive_max_pool3d*(self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor]

proc adaptive_max_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor = 
  ty.dynamicCppCall("adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor = 
  dynamicCCall("at::adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc avg_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc avg_pool2d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc avg_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc avg_pool2d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc avg_pool3d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc avg_pool3d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc avg_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc avg_pool3d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor

proc fractional_max_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor]

proc fractional_max_pool2d*(self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor]

proc fractional_max_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; indices: Tensor): Tensor = 
  ty.dynamicCppCall("fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList, output_size.toAIntList, indices.tensor).to(ATensor).newTensor()

proc fractional_max_pool2d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; indices: Tensor): Tensor = 
  dynamicCCall("at::fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList, output_size.toAIntList, indices.tensor).to(ATensor).newTensor()

proc max_pool2d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor]

proc max_pool2d_with_indices*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor]

proc max_pool2d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor = 
  ty.dynamicCppCall("max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool2d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor = 
  dynamicCCall("at::max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool3d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor]

proc max_pool3d_with_indices*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor]

proc max_pool3d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor = 
  ty.dynamicCppCall("max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool3d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor = 
  dynamicCCall("at::max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_unpool2d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor

proc max_unpool2d*(self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor

proc max_unpool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor

proc max_unpool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor

proc max_unpool3d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor

proc max_unpool3d*(self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor

proc max_unpool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size.toAIntList, stride.toAIntList, padding.toAIntList).to(ATensor).newTensor()

proc max_unpool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor = 
  dynamicCCall("at::max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size.toAIntList, stride.toAIntList, padding.toAIntList).to(ATensor).newTensor()

proc reflection_pad1d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc reflection_pad1d*(self: Tensor; padding: openarray[SomeInteger]): Tensor

proc reflection_pad1d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc reflection_pad1d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc reflection_pad2d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc reflection_pad2d*(self: Tensor; padding: openarray[SomeInteger]): Tensor

proc reflection_pad2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc reflection_pad2d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad1d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad1d*(self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad1d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad1d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad2d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad2d*(self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad2d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad3d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad3d*(self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc replication_pad3d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor

proc upsample_linear1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_linear1d*(self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_linear1d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_linear1d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_bilinear2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_bilinear2d*(self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_bilinear2d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_bilinear2d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_trilinear3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_trilinear3d*(self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_trilinear3d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_trilinear3d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor

proc upsample_nearest1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc upsample_nearest1d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc upsample_nearest1d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor

proc upsample_nearest1d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor

proc upsample_nearest2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc upsample_nearest2d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc upsample_nearest2d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor

proc upsample_nearest2d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor

proc upsample_nearest3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc upsample_nearest3d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor

proc upsample_nearest3d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor

proc upsample_nearest3d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor

proc sigmoid_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_sigmoid_forward", self.tensor).to(ATensor).newTensor()

proc sigmoid_internal*(self: Tensor): Tensor = 
  dynamicCCall("at::_sigmoid_forward", self.tensor).to(ATensor).newTensor()

proc sigmoid_backward_internal*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor

proc sigmoid_backward_internal*(grad_output: Tensor; output: Tensor): Tensor

proc tanh_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_tanh_forward", self.tensor).to(ATensor).newTensor()

proc tanh_internal*(self: Tensor): Tensor = 
  dynamicCCall("at::_tanh_forward", self.tensor).to(ATensor).newTensor()

proc tanh_backward_internal*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor

proc tanh_backward_internal*(grad_output: Tensor; output: Tensor): Tensor

proc thnn_batch_norm*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor]

proc thnn_batch_norm*(self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor]

proc thnn_batch_norm_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; eps: float64; save_mean: Tensor; save_std: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_batch_norm_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; eps: float64; save_mean: Tensor; save_std: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor]

proc thnn_conv_transpose2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor]

proc thnn_conv_transpose2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, dilation.toAIntList, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, dilation.toAIntList, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]

proc thnn_conv_transpose3d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]

proc thnn_conv_transpose3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, dilation.toAIntList, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, dilation.toAIntList, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]

proc thnn_conv2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]

proc thnn_conv2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): Tensor

proc thnn_conv_depthwise2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): Tensor

proc thnn_conv_depthwise2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  ty.dynamicCppCall("thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] = 
  dynamicCCall("at::thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]

proc thnn_conv3d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor]

proc thnn_conv3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor]

proc thnn_conv_dilated2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor]

proc thnn_conv_dilated2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor]

proc thnn_conv_dilated3d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor]

proc thnn_conv_dilated3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  ty.dynamicCppCall("thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] = 
  dynamicCCall("at::thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cast_Byte_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Byte", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Byte_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Byte", non_blocking).to(ATensor).newTensor()

proc cast_Char_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Char", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Char_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Char", non_blocking).to(ATensor).newTensor()

proc cast_Double_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Double", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Double_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Double", non_blocking).to(ATensor).newTensor()

proc cast_Float_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Float", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Float_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Float", non_blocking).to(ATensor).newTensor()

proc cast_Int_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Int", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Int_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Int", non_blocking).to(ATensor).newTensor()

proc cast_Long_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Long", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Long_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Long", non_blocking).to(ATensor).newTensor()

proc cast_Short_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Short", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Short_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Short", non_blocking).to(ATensor).newTensor()

proc cast_Half_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor = 
  ty.dynamicCppCall("_cast_Half", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Half_internal*(self: Tensor; non_blocking: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_cast_Half", non_blocking).to(ATensor).newTensor()

proc cudnn_ctc_loss_internal*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64; deterministic: bool): tuple[result0: Tensor, result1: Tensor]

proc cudnn_ctc_loss_internal*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64; deterministic: bool): tuple[result0: Tensor, result1: Tensor]

proc cudnn_rnn_flatten_weight_internal*(ty: TensorType; weight_arr: TensorList; weight_stride0: int64; input_size: int64; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; bidirectional: bool): Tensor = 
  ty.dynamicCppCall("_cudnn_rnn_flatten_weight", weight_arr, weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_flatten_weight_internal*(weight_arr: TensorList; weight_stride0: int64; input_size: int64; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; bidirectional: bool): Tensor = 
  dynamicCCall("at::_cudnn_rnn_flatten_weight", weight_arr, weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_internal*(ty: TensorType; input: Tensor; weight: TensorList; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  ty.dynamicCppCall("_cudnn_rnn", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList, dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_rnn_internal*(input: Tensor; weight: TensorList; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  dynamicCCall("at::_cudnn_rnn", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList, dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_rnn_backward_internal*(ty: TensorType; input: Tensor; weight: TensorList; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] = 
  ty.dynamicCppCall("_cudnn_rnn_backward", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList, dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, TensorList]).toNimTuple().newTensors()

proc cudnn_rnn_backward_internal*(input: Tensor; weight: TensorList; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] = 
  dynamicCCall("at::_cudnn_rnn_backward", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList, dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, TensorList]).toNimTuple().newTensors()

proc cudnn_init_dropout_state_internal*(ty: TensorType; self_ty: TensorType; dropout: float64; train: bool; dropout_seed: int64): Tensor = 
  ty.dynamicCppCall("_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor).newTensor()

proc cudnn_init_dropout_state_internal*(self_ty: TensorType; dropout: float64; train: bool; dropout_seed: int64): Tensor = 
  dynamicCCall("at::_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor).newTensor()

proc fused_dropout_internal*(ty: TensorType; self: Tensor; p: float64; generator: pointer = nil): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("_fused_dropout", self.tensor, p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc fused_dropout_internal*(self: Tensor; p: float64; generator: pointer = nil): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("_fused_dropout", p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc masked_scale_internal*(ty: TensorType; self: Tensor; mask: Tensor; scale: float64): Tensor = 
  ty.dynamicCppCall("_masked_scale", self.tensor, mask.tensor, scale).to(ATensor).newTensor()

proc masked_scale_internal*(self: Tensor; mask: Tensor; scale: float64): Tensor = 
  self.tensor.dynamicCppCall("_masked_scale", mask.tensor, scale).to(ATensor).newTensor()

proc dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("dropout", input.tensor, p, train).to(ATensor).newTensor()

proc dropout*(input: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::dropout", input.tensor, p, train).to(ATensor).newTensor()

proc dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("feature_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout*(input: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::feature_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("feature_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::feature_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout*(input: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("feature_alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout*(input: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::feature_alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor = 
  ty.dynamicCppCall("feature_alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor = 
  dynamicCCall("at::feature_alpha_dropout_", self.tensor, p, train).to(ATensor).newTensor()

proc abs*(ty: TensorType; self: Tensor): Tensor

proc abs*(self: Tensor): Tensor

proc abs_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("abs_", self.tensor).to(ATensor).newTensor()

proc abs_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("abs_").to(ATensor).newTensor()

proc acos*(ty: TensorType; self: Tensor): Tensor

proc acos*(self: Tensor): Tensor

proc acos_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("acos_", self.tensor).to(ATensor).newTensor()

proc acos_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("acos_").to(ATensor).newTensor()

proc avg_pool1d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor = 
  ty.dynamicCppCall("avg_pool1d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, ceil_mode, count_include_pad).to(ATensor).newTensor()

proc avg_pool1d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor = 
  dynamicCCall("at::avg_pool1d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, ceil_mode, count_include_pad).to(ATensor).newTensor()

proc adaptive_avg_pool1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("adaptive_avg_pool1d", self.tensor, output_size.toAIntList).to(ATensor).newTensor()

proc adaptive_avg_pool1d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor = 
  dynamicCCall("at::adaptive_avg_pool1d", self.tensor, output_size.toAIntList).to(ATensor).newTensor()

proc adaptive_max_pool1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("adaptive_max_pool1d", self.tensor, output_size.toAIntList).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc adaptive_max_pool1d*(self: Tensor; output_size: openarray[SomeInteger]): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::adaptive_max_pool1d", self.tensor, output_size.toAIntList).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc add*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor

proc add*(self: Tensor; other: Tensor; alpha: float = 1): Tensor

proc add_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("add_", self.tensor, other.tensor, alpha).to(ATensor).newTensor()

proc add_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("add_", other.tensor, alpha).to(ATensor).newTensor()

proc add*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor

proc add*(self: Tensor; other: float; alpha: float = 1): Tensor

proc add_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("add_", self.tensor, other, alpha).to(ATensor).newTensor()

proc add_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("add_", other, alpha).to(ATensor).newTensor()

proc addmv*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addmv_", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addr*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addr_", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc all*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("all", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc all*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("all", dim, keepdim).to(ATensor).newTensor()

proc allclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool = 
  ty.dynamicCppCall("allclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(bool)

proc allclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool = 
  self.tensor.dynamicCppCall("allclose", other.tensor, rtol, atol, equal_nan).to(bool)

proc any*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("any", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc any*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("any", dim, keepdim).to(ATensor).newTensor()

proc arange*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("arange", start, end_name, options).to(ATensor).newTensor()

proc arange*(start: float; end_name: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::arange", start, end_name, options).to(ATensor).newTensor()

proc arange*(ty: TensorType; start: float; end_name: float; step: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("arange", start, end_name, step, options).to(ATensor).newTensor()

proc arange*(start: float; end_name: float; step: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::arange", start, end_name, step, options).to(ATensor).newTensor()

proc arange*(ty: TensorType; end_name: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("arange", end_name, options).to(ATensor).newTensor()

proc arange*(end_name: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::arange", end_name, options).to(ATensor).newTensor()

proc dim_arange_internal*(ty: TensorType; like: Tensor; dim: int64): Tensor = 
  ty.dynamicCppCall("_dim_arange", like.tensor, dim).to(ATensor).newTensor()

proc dim_arange_internal*(like: Tensor; dim: int64): Tensor = 
  dynamicCCall("at::_dim_arange", like.tensor, dim).to(ATensor).newTensor()

proc argmax*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("argmax", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmax*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("argmax", dim, keepdim).to(ATensor).newTensor()

proc argmax*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("argmax", self.tensor).to(ATensor).newTensor()

proc argmax*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("argmax").to(ATensor).newTensor()

proc argmax_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_argmax", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmax_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_argmax", dim, keepdim).to(ATensor).newTensor()

proc argmin*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("argmin", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmin*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("argmin", dim, keepdim).to(ATensor).newTensor()

proc argmin*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("argmin", self.tensor).to(ATensor).newTensor()

proc argmin*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("argmin").to(ATensor).newTensor()

proc argmin_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_argmin", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmin_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_argmin", dim, keepdim).to(ATensor).newTensor()

proc as_strided*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("as_strided", self.tensor, size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc as_strided*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("as_strided", size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc as_strided_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("as_strided_", self.tensor, size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc as_strided_inplace*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("as_strided_", size.toAIntList, stride.toAIntList).to(ATensor).newTensor()

proc as_strided*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor = 
  ty.dynamicCppCall("as_strided", self.tensor, size.toAIntList, stride.toAIntList, storage_offset).to(ATensor).newTensor()

proc as_strided*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor = 
  self.tensor.dynamicCppCall("as_strided", size.toAIntList, stride.toAIntList, storage_offset).to(ATensor).newTensor()

proc as_strided_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor = 
  ty.dynamicCppCall("as_strided_", self.tensor, size.toAIntList, stride.toAIntList, storage_offset).to(ATensor).newTensor()

proc as_strided_inplace*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor = 
  self.tensor.dynamicCppCall("as_strided_", size.toAIntList, stride.toAIntList, storage_offset).to(ATensor).newTensor()

proc asin*(ty: TensorType; self: Tensor): Tensor

proc asin*(self: Tensor): Tensor

proc asin_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("asin_", self.tensor).to(ATensor).newTensor()

proc asin_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("asin_").to(ATensor).newTensor()

proc atan*(ty: TensorType; self: Tensor): Tensor

proc atan*(self: Tensor): Tensor

proc atan_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("atan_", self.tensor).to(ATensor).newTensor()

proc atan_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("atan_").to(ATensor).newTensor()

proc bartlett_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window*(window_length: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc bartlett_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  dynamicCCall("at::bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor = 
  ty.dynamicCppCall("batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor = 
  dynamicCCall("at::batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc bernoulli*(ty: TensorType; self: Tensor; p: Tensor; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("bernoulli", self.tensor, p.tensor, generator).to(ATensor).newTensor()

proc bernoulli*(self: Tensor; p: Tensor; generator: pointer = nil): Tensor = 
  self.tensor.dynamicCppCall("bernoulli", p.tensor, generator).to(ATensor).newTensor()

proc bernoulli*(ty: TensorType; self: Tensor; p: float64; generator: pointer = nil): Tensor

proc bernoulli*(self: Tensor; p: float64; generator: pointer = nil): Tensor

proc bernoulli*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("bernoulli", self.tensor).to(ATensor).newTensor()

proc bernoulli*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("bernoulli").to(ATensor).newTensor()

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: Tensor; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("bernoulli_", self.tensor, p.tensor, generator).to(ATensor).newTensor()

proc bernoulli_inplace*(self: Tensor; p: Tensor; generator: pointer = nil): Tensor = 
  self.tensor.dynamicCppCall("bernoulli_", p.tensor, generator).to(ATensor).newTensor()

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: float64; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("bernoulli_", self.tensor, p, generator).to(ATensor).newTensor()

proc bernoulli_inplace*(self: Tensor; p: float64; generator: pointer = nil): Tensor = 
  self.tensor.dynamicCppCall("bernoulli_", p, generator).to(ATensor).newTensor()

proc bernoulli_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("bernoulli_", self.tensor).to(ATensor).newTensor()

proc bernoulli_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("bernoulli_").to(ATensor).newTensor()

proc bilinear*(ty: TensorType; input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor = 
  ty.dynamicCppCall("bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor).newTensor()

proc bilinear*(input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor = 
  dynamicCCall("at::bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor).newTensor()

proc bincount*(ty: TensorType; self: Tensor; weights: Tensor; minlength: int64 = 0): Tensor = 
  ty.dynamicCppCall("bincount", self.tensor, weights.tensor, minlength).to(ATensor).newTensor()

proc bincount*(self: Tensor; weights: Tensor; minlength: int64 = 0): Tensor = 
  self.tensor.dynamicCppCall("bincount", weights.tensor, minlength).to(ATensor).newTensor()

proc blackman_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window*(window_length: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc blackman_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  dynamicCCall("at::blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc broadcast_tensors*(ty: TensorType; tensors: TensorList): TensorList = 
  ty.dynamicCppCall("broadcast_tensors", tensors).to(TensorList)

proc broadcast_tensors*(tensors: TensorList): TensorList = 
  dynamicCCall("at::broadcast_tensors", tensors).to(TensorList)

proc cat*(ty: TensorType; tensors: TensorList; dim: int64 = 0): Tensor = 
  ty.dynamicCppCall("cat", tensors, dim).to(ATensor).newTensor()

proc cat*(tensors: TensorList; dim: int64 = 0): Tensor = 
  dynamicCCall("at::cat", tensors, dim).to(ATensor).newTensor()

proc ceil*(ty: TensorType; self: Tensor): Tensor

proc ceil*(self: Tensor): Tensor

proc ceil_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("ceil_", self.tensor).to(ATensor).newTensor()

proc ceil_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("ceil_").to(ATensor).newTensor()

proc chunk*(ty: TensorType; self: Tensor; chunks: int64; dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("chunk", self.tensor, chunks, dim).to(TensorList)

proc chunk*(self: Tensor; chunks: int64; dim: int64 = 0): TensorList = 
  self.tensor.dynamicCppCall("chunk", chunks, dim).to(TensorList)

proc clamp*(ty: TensorType; self: Tensor; min: float; max: float): Tensor = 
  ty.dynamicCppCall("clamp", self.tensor, min, max).to(ATensor).newTensor()

proc clamp*(self: Tensor; min: float; max: float): Tensor = 
  self.tensor.dynamicCppCall("clamp", min, max).to(ATensor).newTensor()

proc clamp_inplace*(ty: TensorType; self: Tensor; min: float; max: float): Tensor = 
  ty.dynamicCppCall("clamp_", self.tensor, min, max).to(ATensor).newTensor()

proc clamp_inplace*(self: Tensor; min: float; max: float): Tensor = 
  self.tensor.dynamicCppCall("clamp_", min, max).to(ATensor).newTensor()

proc clamp_max*(ty: TensorType; self: Tensor; max: float): Tensor

proc clamp_max*(self: Tensor; max: float): Tensor

proc clamp_max_inplace*(ty: TensorType; self: Tensor; max: float): Tensor = 
  ty.dynamicCppCall("clamp_max_", self.tensor, max).to(ATensor).newTensor()

proc clamp_max_inplace*(self: Tensor; max: float): Tensor = 
  self.tensor.dynamicCppCall("clamp_max_", max).to(ATensor).newTensor()

proc clamp_min*(ty: TensorType; self: Tensor; min: float): Tensor

proc clamp_min*(self: Tensor; min: float): Tensor

proc clamp_min_inplace*(ty: TensorType; self: Tensor; min: float): Tensor = 
  ty.dynamicCppCall("clamp_min_", self.tensor, min).to(ATensor).newTensor()

proc clamp_min_inplace*(self: Tensor; min: float): Tensor = 
  self.tensor.dynamicCppCall("clamp_min_", min).to(ATensor).newTensor()

proc cudnn_is_acceptable*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("cudnn_is_acceptable", self.tensor).to(bool)

proc cudnn_is_acceptable*(self: Tensor): bool = 
  dynamicCCall("at::cudnn_is_acceptable", self.tensor).to(bool)

proc convolution*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64): Tensor = 
  ty.dynamicCppCall("convolution", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList, groups).to(ATensor).newTensor()

proc convolution*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64): Tensor = 
  dynamicCCall("at::convolution", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList, groups).to(ATensor).newTensor()

proc convolution_internal*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; cudnn_enabled: bool): Tensor = 
  ty.dynamicCppCall("_convolution", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList, groups, benchmark, deterministic, cudnn_enabled).to(ATensor).newTensor()

proc convolution_internal*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; cudnn_enabled: bool): Tensor = 
  dynamicCCall("at::_convolution", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList, groups, benchmark, deterministic, cudnn_enabled).to(ATensor).newTensor()

proc convolution_nogroup_internal*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList).to(ATensor).newTensor()

proc convolution_nogroup_internal*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]): Tensor = 
  dynamicCCall("at::_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList).to(ATensor).newTensor()

proc convolution_double_backward_internal*(ty: TensorType; ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList, groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc convolution_double_backward_internal*(ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, transposed, output_padding.toAIntList, groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv1d*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; groups: int64 = 1): Tensor = 
  ty.dynamicCppCall("conv1d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, groups).to(ATensor).newTensor()

proc conv1d*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; groups: int64 = 1): Tensor = 
  dynamicCCall("at::conv1d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, groups).to(ATensor).newTensor()

proc conv2d*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; groups: int64 = 1): Tensor = 
  ty.dynamicCppCall("conv2d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, groups).to(ATensor).newTensor()

proc conv2d*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; groups: int64 = 1): Tensor = 
  dynamicCCall("at::conv2d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, groups).to(ATensor).newTensor()

proc conv3d*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; groups: int64 = 1): Tensor = 
  ty.dynamicCppCall("conv3d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, groups).to(ATensor).newTensor()

proc conv3d*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; groups: int64 = 1): Tensor = 
  dynamicCCall("at::conv3d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, dilation.toAIntList, groups).to(ATensor).newTensor()

proc conv_tbc*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; pad: int64): Tensor

proc conv_tbc*(self: Tensor; weight: Tensor; bias: Tensor; pad: int64): Tensor

proc conv_tbc_backward*(ty: TensorType; self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_tbc_backward*(self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_transpose1d*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; output_padding: openarray[SomeInteger] = @[0]; groups: int64 = 1; dilation: openarray[SomeInteger] = @[1]): Tensor = 
  ty.dynamicCppCall("conv_transpose1d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, groups, dilation.toAIntList).to(ATensor).newTensor()

proc conv_transpose1d*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; output_padding: openarray[SomeInteger] = @[0]; groups: int64 = 1; dilation: openarray[SomeInteger] = @[1]): Tensor = 
  dynamicCCall("at::conv_transpose1d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, groups, dilation.toAIntList).to(ATensor).newTensor()

proc conv_transpose2d*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; output_padding: openarray[SomeInteger] = @[0]; groups: int64 = 1; dilation: openarray[SomeInteger] = @[1]): Tensor = 
  ty.dynamicCppCall("conv_transpose2d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, groups, dilation.toAIntList).to(ATensor).newTensor()

proc conv_transpose2d*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; output_padding: openarray[SomeInteger] = @[0]; groups: int64 = 1; dilation: openarray[SomeInteger] = @[1]): Tensor = 
  dynamicCCall("at::conv_transpose2d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, groups, dilation.toAIntList).to(ATensor).newTensor()

proc conv_transpose3d*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; output_padding: openarray[SomeInteger] = @[0]; groups: int64 = 1; dilation: openarray[SomeInteger] = @[1]): Tensor = 
  ty.dynamicCppCall("conv_transpose3d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, groups, dilation.toAIntList).to(ATensor).newTensor()

proc conv_transpose3d*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger] = @[1]; padding: openarray[SomeInteger] = @[0]; output_padding: openarray[SomeInteger] = @[0]; groups: int64 = 1; dilation: openarray[SomeInteger] = @[1]): Tensor = 
  dynamicCCall("at::conv_transpose3d", input.tensor, weight.tensor, bias.tensor, stride.toAIntList, padding.toAIntList, output_padding.toAIntList, groups, dilation.toAIntList).to(ATensor).newTensor()

proc cos*(ty: TensorType; self: Tensor): Tensor

proc cos*(self: Tensor): Tensor

proc cos_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("cos_", self.tensor).to(ATensor).newTensor()

proc cos_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("cos_").to(ATensor).newTensor()

proc cosh*(ty: TensorType; self: Tensor): Tensor

proc cosh*(self: Tensor): Tensor

proc cosh_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("cosh_", self.tensor).to(ATensor).newTensor()

proc cosh_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("cosh_").to(ATensor).newTensor()

proc cosine_embedding_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor = 
  ty.dynamicCppCall("cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc cosine_embedding_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor = 
  dynamicCCall("at::cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc cudnn_affine_grid_generator*(ty: TensorType; theta: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor

proc cudnn_affine_grid_generator*(theta: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor

proc cudnn_affine_grid_generator_backward*(ty: TensorType; grad: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor = 
  ty.dynamicCppCall("cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor).newTensor()

proc cudnn_affine_grid_generator_backward*(grad: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor = 
  dynamicCCall("at::cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor).newTensor()

proc cudnn_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor]

proc cudnn_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor]

proc cudnn_batch_norm_backward*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_batch_norm_backward*(input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor

proc cudnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor

proc cudnn_convolution_backward_input*(ty: TensorType; self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_backward_input", self_size.toAIntList, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_input*(self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_backward_input", self_size.toAIntList, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_backward_bias*(grad_output: Tensor): Tensor = 
  dynamicCCall("at::cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight*(ty: TensorType; weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_backward_weight", weight_size.toAIntList, grad_output.tensor, self.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight*(weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_backward_weight", weight_size.toAIntList, grad_output.tensor, self.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor

proc cudnn_convolution_transpose*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor

proc cudnn_convolution_transpose_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList, output_padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList, output_padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_bias*(grad_output: Tensor): Tensor = 
  dynamicCCall("at::cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input*(ty: TensorType; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input*(grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight*(ty: TensorType; weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  ty.dynamicCppCall("cudnn_convolution_transpose_backward_weight", weight_size.toAIntList, grad_output.tensor, self.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight*(weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor = 
  dynamicCCall("at::cudnn_convolution_transpose_backward_weight", weight_size.toAIntList, grad_output.tensor, self.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_grid_sampler*(ty: TensorType; self: Tensor; grid: Tensor): Tensor

proc cudnn_grid_sampler*(self: Tensor; grid: Tensor): Tensor

proc cudnn_grid_sampler_backward*(ty: TensorType; self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] = 
  ty.dynamicCppCall("cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_grid_sampler_backward*(self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] = 
  dynamicCCall("at::cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cumsum*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("cumsum", self.tensor, dim, dtype).to(ATensor).newTensor()

proc cumsum*(self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("cumsum", dim, dtype).to(ATensor).newTensor()

proc cumsum*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
  ty.dynamicCppCall("cumsum", self.tensor, dim).to(ATensor).newTensor()

proc cumsum*(self: Tensor; dim: int64): Tensor = 
  self.tensor.dynamicCppCall("cumsum", dim).to(ATensor).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("cumprod", self.tensor, dim, dtype).to(ATensor).newTensor()

proc cumprod*(self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("cumprod", dim, dtype).to(ATensor).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int64): Tensor = 
  ty.dynamicCppCall("cumprod", self.tensor, dim).to(ATensor).newTensor()

proc cumprod*(self: Tensor; dim: int64): Tensor = 
  self.tensor.dynamicCppCall("cumprod", dim).to(ATensor).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0; reduction: int64): Tensor = 
  ty.dynamicCppCall("ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList, target_lengths.toAIntList, blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0; reduction: int64): Tensor = 
  dynamicCCall("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList, target_lengths.toAIntList, blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int64 = 0; reduction: int64): Tensor = 
  ty.dynamicCppCall("ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int64 = 0; reduction: int64): Tensor = 
  dynamicCCall("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor).newTensor()

proc ctc_loss_internal*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0): tuple[result0: Tensor, result1: Tensor]

proc ctc_loss_internal*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0): tuple[result0: Tensor, result1: Tensor]

proc ctc_loss_backward_internal*(ty: TensorType; grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int64): Tensor = 
  ty.dynamicCppCall("_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths.toAIntList, target_lengths.toAIntList, neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor).newTensor()

proc ctc_loss_backward_internal*(grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int64): Tensor = 
  dynamicCCall("at::_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths.toAIntList, target_lengths.toAIntList, neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor).newTensor()

proc det*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("det", self.tensor).to(ATensor).newTensor()

proc det*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("det").to(ATensor).newTensor()

proc diagflat*(ty: TensorType; self: Tensor; offset: int64 = 0): Tensor = 
  ty.dynamicCppCall("diagflat", self.tensor, offset).to(ATensor).newTensor()

proc diagflat*(self: Tensor; offset: int64 = 0): Tensor = 
  self.tensor.dynamicCppCall("diagflat", offset).to(ATensor).newTensor()

proc diagonal*(ty: TensorType; self: Tensor; offset: int64 = 0; dim1: int64 = 0; dim2: int64 = 1): Tensor = 
  ty.dynamicCppCall("diagonal", self.tensor, offset, dim1, dim2).to(ATensor).newTensor()

proc diagonal*(self: Tensor; offset: int64 = 0; dim1: int64 = 0; dim2: int64 = 1): Tensor = 
  self.tensor.dynamicCppCall("diagonal", offset, dim1, dim2).to(ATensor).newTensor()

proc div_name*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc div_name*(self: Tensor; other: Tensor): Tensor

proc div_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("div_", self.tensor, other.tensor).to(ATensor).newTensor()

proc div_inplace*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("div_", other.tensor).to(ATensor).newTensor()

proc div_name*(ty: TensorType; self: Tensor; other: float): Tensor

proc div_name*(self: Tensor; other: float): Tensor

proc div_inplace*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("div_", self.tensor, other).to(ATensor).newTensor()

proc div_inplace*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("div_", other).to(ATensor).newTensor()

proc dot*(ty: TensorType; self: Tensor; tensor: Tensor): Tensor

proc dot*(self: Tensor; tensor: Tensor): Tensor

proc einsum*(ty: TensorType; equation: StdString; tensors: TensorList): Tensor = 
  ty.dynamicCppCall("einsum", equation, tensors).to(ATensor).newTensor()

proc einsum*(equation: StdString; tensors: TensorList): Tensor = 
  dynamicCCall("at::einsum", equation, tensors).to(ATensor).newTensor()

proc embedding*(ty: TensorType; weight: Tensor; indices: Tensor; padding_idx: int64 = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor

proc embedding*(weight: Tensor; indices: Tensor; padding_idx: int64 = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor

proc embedding_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool; sparse: bool): Tensor = 
  ty.dynamicCppCall("embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_backward*(grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool; sparse: bool): Tensor = 
  dynamicCCall("at::embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_dense_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor = 
  ty.dynamicCppCall("embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_dense_backward*(grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor = 
  dynamicCCall("at::embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_renorm_inplace*(ty: TensorType; self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor = 
  ty.dynamicCppCall("embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(ATensor).newTensor()

proc embedding_renorm_inplace*(self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor = 
  dynamicCCall("at::embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(ATensor).newTensor()

proc embedding_sparse_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor = 
  ty.dynamicCppCall("embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_sparse_backward*(grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor = 
  dynamicCCall("at::embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_bag*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] = 
  ty.dynamicCppCall("embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] = 
  dynamicCCall("at::embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag_internal*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]

proc embedding_bag_internal*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor]

proc embedding_bag_backward_internal*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64; sparse: bool): Tensor = 
  ty.dynamicCppCall("_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_backward_internal*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64; sparse: bool): Tensor = 
  dynamicCCall("at::_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_internal*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor = 
  ty.dynamicCppCall("_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_internal*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor = 
  dynamicCCall("at::_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_internal*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor = 
  ty.dynamicCppCall("_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_internal*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor = 
  dynamicCCall("at::_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc empty*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("empty", size.toAIntList, options).to(ATensor).newTensor()

proc empty*(size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  dynamicCCall("at::empty", size.toAIntList, options).to(ATensor).newTensor()

proc empty_like*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("empty_like", self.tensor).to(ATensor).newTensor()

proc empty_like*(self: Tensor): Tensor = 
  dynamicCCall("at::empty_like", self.tensor).to(ATensor).newTensor()

proc empty_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("empty_like", self.tensor, options).to(ATensor).newTensor()

proc empty_like*(self: Tensor; options: TensorOptions): Tensor = 
  dynamicCCall("at::empty_like", self.tensor, options).to(ATensor).newTensor()

proc erf*(ty: TensorType; self: Tensor): Tensor

proc erf*(self: Tensor): Tensor

proc erf_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("erf_", self.tensor).to(ATensor).newTensor()

proc erf_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("erf_").to(ATensor).newTensor()

proc erfc*(ty: TensorType; self: Tensor): Tensor

proc erfc*(self: Tensor): Tensor

proc erfc_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("erfc_", self.tensor).to(ATensor).newTensor()

proc erfc_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("erfc_").to(ATensor).newTensor()

proc exp*(ty: TensorType; self: Tensor): Tensor

proc exp*(self: Tensor): Tensor

proc exp_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("exp_", self.tensor).to(ATensor).newTensor()

proc exp_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("exp_").to(ATensor).newTensor()

proc expm1*(ty: TensorType; self: Tensor): Tensor

proc expm1*(self: Tensor): Tensor

proc expm1_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("expm1_", self.tensor).to(ATensor).newTensor()

proc expm1_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("expm1_").to(ATensor).newTensor()

proc expand*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; implicit: bool = false): Tensor = 
  ty.dynamicCppCall("expand", self.tensor, size.toAIntList, implicit).to(ATensor).newTensor()

proc expand*(self: Tensor; size: openarray[SomeInteger]; implicit: bool = false): Tensor = 
  self.tensor.dynamicCppCall("expand", size.toAIntList, implicit).to(ATensor).newTensor()

proc expand_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("expand_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc expand_as*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("expand_as", other.tensor).to(ATensor).newTensor()

proc eye*(ty: TensorType; n: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("eye", n, options).to(ATensor).newTensor()

proc eye*(n: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::eye", n, options).to(ATensor).newTensor()

proc eye*(ty: TensorType; n: int64; m: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("eye", n, m, options).to(ATensor).newTensor()

proc eye*(n: int64; m: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::eye", n, m, options).to(ATensor).newTensor()

proc flatten*(ty: TensorType; self: Tensor; start_dim: int64 = 0; end_dim: int64 = -1): Tensor = 
  ty.dynamicCppCall("flatten", self.tensor, start_dim, end_dim).to(ATensor).newTensor()

proc flatten*(self: Tensor; start_dim: int64 = 0; end_dim: int64 = -1): Tensor = 
  self.tensor.dynamicCppCall("flatten", start_dim, end_dim).to(ATensor).newTensor()

proc fill_inplace*(ty: TensorType; self: Tensor; value: float): Tensor

proc fill_inplace*(self: Tensor; value: float): Tensor

proc fill_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor

proc fill_inplace*(self: Tensor; value: Tensor): Tensor

proc floor*(ty: TensorType; self: Tensor): Tensor

proc floor*(self: Tensor): Tensor

proc floor_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("floor_", self.tensor).to(ATensor).newTensor()

proc floor_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("floor_").to(ATensor).newTensor()

proc full*(ty: TensorType; size: openarray[SomeInteger]; fill_value: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("full", size.toAIntList, fill_value, options).to(ATensor).newTensor()

proc full*(size: openarray[SomeInteger]; fill_value: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::full", size.toAIntList, fill_value, options).to(ATensor).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float): Tensor = 
  ty.dynamicCppCall("full_like", self.tensor, fill_value).to(ATensor).newTensor()

proc full_like*(self: Tensor; fill_value: float): Tensor = 
  dynamicCCall("at::full_like", self.tensor, fill_value).to(ATensor).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("full_like", self.tensor, fill_value, options).to(ATensor).newTensor()

proc full_like*(self: Tensor; fill_value: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::full_like", self.tensor, fill_value, options).to(ATensor).newTensor()

proc grid_sampler*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor = 
  ty.dynamicCppCall("grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor = 
  dynamicCCall("at::grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler_2d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor

proc grid_sampler_2d*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor

proc grid_sampler_2d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_2d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor

proc grid_sampler_3d*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor

proc grid_sampler_3d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc hann_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window*(window_length: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hann_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  dynamicCCall("at::hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; periodic: bool; alpha: float64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; periodic: bool; alpha: float64; options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; periodic: bool; alpha: float64; beta: float64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; periodic: bool; alpha: float64; beta: float64; options: TensorOptions): Tensor = 
  dynamicCCall("at::hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hinge_embedding_loss*(ty: TensorType; self: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor = 
  ty.dynamicCppCall("hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc hinge_embedding_loss*(self: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor = 
  dynamicCCall("at::hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc ger*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor

proc ger*(self: Tensor; vec2: Tensor): Tensor

proc gesv*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("gesv", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("gesv", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_internal*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("_gesv_helper", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_internal*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("_gesv_helper", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc group_norm*(ty: TensorType; input: Tensor; num_groups: int64; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor = 
  ty.dynamicCppCall("group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor).newTensor()

proc group_norm*(input: Tensor; num_groups: int64; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor = 
  dynamicCCall("at::group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor).newTensor()

proc fft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor = 
  ty.dynamicCppCall("fft", self.tensor, signal_ndim, normalized).to(ATensor).newTensor()

proc fft*(self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor = 
  self.tensor.dynamicCppCall("fft", signal_ndim, normalized).to(ATensor).newTensor()

proc ifft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor = 
  ty.dynamicCppCall("ifft", self.tensor, signal_ndim, normalized).to(ATensor).newTensor()

proc ifft*(self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor = 
  self.tensor.dynamicCppCall("ifft", signal_ndim, normalized).to(ATensor).newTensor()

proc rfft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true): Tensor = 
  ty.dynamicCppCall("rfft", self.tensor, signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc rfft*(self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true): Tensor = 
  self.tensor.dynamicCppCall("rfft", signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc irfft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("irfft", self.tensor, signal_ndim, normalized, onesided, signal_sizes.toAIntList).to(ATensor).newTensor()

proc irfft*(self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("irfft", signal_ndim, normalized, onesided, signal_sizes.toAIntList).to(ATensor).newTensor()

proc fft_with_size_internal*(ty: TensorType; self: Tensor; signal_ndim: int64; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[SomeInteger]; normalized: bool; onesided: bool; output_sizes: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("_fft_with_size", self.tensor, signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList, normalized, onesided, output_sizes.toAIntList).to(ATensor).newTensor()

proc fft_with_size_internal*(self: Tensor; signal_ndim: int64; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[SomeInteger]; normalized: bool; onesided: bool; output_sizes: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("_fft_with_size", signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList, normalized, onesided, output_sizes.toAIntList).to(ATensor).newTensor()

proc cufft_get_plan_cache_size_internal*(ty: TensorType; ): int64 = 
  ty.dynamicCppCall("_cufft_get_plan_cache_size").to(int64)

proc cufft_get_plan_cache_size_internal*(): int64 = 
  dynamicCCall("at::_cufft_get_plan_cache_size").to(int64)

proc cufft_get_plan_cache_max_size_internal*(ty: TensorType; ): int64 = 
  ty.dynamicCppCall("_cufft_get_plan_cache_max_size").to(int64)

proc cufft_get_plan_cache_max_size_internal*(): int64 = 
  dynamicCCall("at::_cufft_get_plan_cache_max_size").to(int64)

proc cufft_set_plan_cache_max_size_internal*(ty: TensorType; max_size: int64): void = 
  ty.dynamicCppCall("_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_set_plan_cache_max_size_internal*(max_size: int64): void = 
  dynamicCCall("at::_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_clear_plan_cache_internal*(ty: TensorType; ): void = 
  ty.dynamicCppCall("_cufft_clear_plan_cache").to(void)

proc cufft_clear_plan_cache_internal*(): void = 
  dynamicCCall("at::_cufft_clear_plan_cache").to(void)

proc index*(ty: TensorType; self: Tensor; indices: TensorList): Tensor = 
  ty.dynamicCppCall("index", self.tensor, indices).to(ATensor).newTensor()

proc index*(self: Tensor; indices: TensorList): Tensor = 
  self.tensor.dynamicCppCall("index", indices).to(ATensor).newTensor()

proc index_copy_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor

proc index_copy_inplace*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor

proc index_put*(ty: TensorType; self: Tensor; indices: TensorList; values: Tensor): Tensor = 
  ty.dynamicCppCall("index_put", self.tensor, indices, values.tensor).to(ATensor).newTensor()

proc index_put*(self: Tensor; indices: TensorList; values: Tensor): Tensor = 
  self.tensor.dynamicCppCall("index_put", indices, values.tensor).to(ATensor).newTensor()

proc index_put_inplace*(ty: TensorType; self: Tensor; indices: TensorList; values: Tensor): Tensor = 
  ty.dynamicCppCall("index_put_", self.tensor, indices, values.tensor).to(ATensor).newTensor()

proc index_put_inplace*(self: Tensor; indices: TensorList; values: Tensor): Tensor = 
  self.tensor.dynamicCppCall("index_put_", indices, values.tensor).to(ATensor).newTensor()

proc inverse*(ty: TensorType; self: Tensor): Tensor

proc inverse*(self: Tensor): Tensor

proc isclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor = 
  ty.dynamicCppCall("isclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(ATensor).newTensor()

proc isclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor = 
  self.tensor.dynamicCppCall("isclose", other.tensor, rtol, atol, equal_nan).to(ATensor).newTensor()

proc is_cuda*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_cuda", self.tensor).to(bool)

proc is_cuda*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_cuda").to(bool)

proc is_distributed*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_distributed", self.tensor).to(bool)

proc is_distributed*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_distributed").to(bool)

proc is_floating_point*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_floating_point", self.tensor).to(bool)

proc is_floating_point*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_floating_point").to(bool)

proc is_nonzero*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_nonzero", self.tensor).to(bool)

proc is_nonzero*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_nonzero").to(bool)

proc is_same_size*(ty: TensorType; self: Tensor; other: Tensor): bool = 
  ty.dynamicCppCall("is_same_size", self.tensor, other.tensor).to(bool)

proc is_same_size*(self: Tensor; other: Tensor): bool = 
  self.tensor.dynamicCppCall("is_same_size", other.tensor).to(bool)

proc is_signed*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_signed", self.tensor).to(bool)

proc is_signed*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_signed").to(bool)

proc is_sparse*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_sparse", self.tensor).to(bool)

proc is_sparse*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_sparse").to(bool)

proc kthvalue*(ty: TensorType; self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc kthvalue*(self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc layer_norm*(ty: TensorType; input: Tensor; normalized_shape: openarray[SomeInteger]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor = 
  ty.dynamicCppCall("layer_norm", input.tensor, normalized_shape.toAIntList, weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor).newTensor()

proc layer_norm*(input: Tensor; normalized_shape: openarray[SomeInteger]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor = 
  dynamicCCall("at::layer_norm", input.tensor, normalized_shape.toAIntList, weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor).newTensor()

proc linspace*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("linspace", start, end_name, options).to(ATensor).newTensor()

proc linspace*(start: float; end_name: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::linspace", start, end_name, options).to(ATensor).newTensor()

proc linspace*(ty: TensorType; start: float; end_name: float; steps: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("linspace", start, end_name, steps, options).to(ATensor).newTensor()

proc linspace*(start: float; end_name: float; steps: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::linspace", start, end_name, steps, options).to(ATensor).newTensor()

proc log*(ty: TensorType; self: Tensor): Tensor

proc log*(self: Tensor): Tensor

proc log_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log_", self.tensor).to(ATensor).newTensor()

proc log_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("log_").to(ATensor).newTensor()

proc log10*(ty: TensorType; self: Tensor): Tensor

proc log10*(self: Tensor): Tensor

proc log10_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log10_", self.tensor).to(ATensor).newTensor()

proc log10_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("log10_").to(ATensor).newTensor()

proc log1p*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log1p", self.tensor).to(ATensor).newTensor()

proc log1p*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("log1p").to(ATensor).newTensor()

proc log1p_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log1p_", self.tensor).to(ATensor).newTensor()

proc log1p_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("log1p_").to(ATensor).newTensor()

proc log2*(ty: TensorType; self: Tensor): Tensor

proc log2*(self: Tensor): Tensor

proc log2_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("log2_", self.tensor).to(ATensor).newTensor()

proc log2_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("log2_").to(ATensor).newTensor()

proc logdet*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("logdet", self.tensor).to(ATensor).newTensor()

proc logdet*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("logdet").to(ATensor).newTensor()

proc logspace*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("logspace", start, end_name, options).to(ATensor).newTensor()

proc logspace*(start: float; end_name: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::logspace", start, end_name, options).to(ATensor).newTensor()

proc logspace*(ty: TensorType; start: float; end_name: float; steps: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("logspace", start, end_name, steps, options).to(ATensor).newTensor()

proc logspace*(start: float; end_name: float; steps: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::logspace", start, end_name, steps, options).to(ATensor).newTensor()

proc log_softmax*(ty: TensorType; self: Tensor; dim: int64): Tensor

proc log_softmax*(self: Tensor; dim: int64): Tensor

proc log_softmax_backward_data*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor = 
  ty.dynamicCppCall("log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc log_softmax_backward_data*(grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor = 
  dynamicCCall("at::log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc logsumexp*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("logsumexp", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc logsumexp*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("logsumexp", dim, keepdim).to(ATensor).newTensor()

proc margin_ranking_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor = 
  ty.dynamicCppCall("margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc margin_ranking_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor = 
  dynamicCCall("at::margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc matmul*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("matmul", self.tensor, other.tensor).to(ATensor).newTensor()

proc matmul*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("matmul", other.tensor).to(ATensor).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; tol: float64; symmetric: bool = false): Tensor = 
  ty.dynamicCppCall("matrix_rank", self.tensor, tol, symmetric).to(ATensor).newTensor()

proc matrix_rank*(self: Tensor; tol: float64; symmetric: bool = false): Tensor = 
  dynamicCCall("at::matrix_rank", self.tensor, tol, symmetric).to(ATensor).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; symmetric: bool = false): Tensor = 
  ty.dynamicCppCall("matrix_rank", self.tensor, symmetric).to(ATensor).newTensor()

proc matrix_rank*(self: Tensor; symmetric: bool = false): Tensor = 
  dynamicCCall("at::matrix_rank", self.tensor, symmetric).to(ATensor).newTensor()

proc max*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max*(self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_values*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("max_values", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc max_values*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("max_values", dim, keepdim).to(ATensor).newTensor()

proc max_pool1d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("max_pool1d_with_indices", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_pool1d_with_indices*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::max_pool1d_with_indices", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_pool1d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor = 
  ty.dynamicCppCall("max_pool1d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(ATensor).newTensor()

proc max_pool1d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor = 
  dynamicCCall("at::max_pool1d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(ATensor).newTensor()

proc max_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor = 
  ty.dynamicCppCall("max_pool2d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(ATensor).newTensor()

proc max_pool2d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor = 
  dynamicCCall("at::max_pool2d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(ATensor).newTensor()

proc max_pool3d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor = 
  ty.dynamicCppCall("max_pool3d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(ATensor).newTensor()

proc max_pool3d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor = 
  dynamicCCall("at::max_pool3d", self.tensor, kernel_size.toAIntList, stride.toAIntList, padding.toAIntList, dilation.toAIntList, ceil_mode).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("mean", dtype).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor): Tensor

proc mean*(self: Tensor): Tensor

proc mean*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dim, keepdim, dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("mean", dim, keepdim, dtype).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("mean", dim, keepdim).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("mean", self.tensor, dim, dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("mean", dim, dtype).to(ATensor).newTensor()

proc median*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc median*(self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min*(self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min_values*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("min_values", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc min_values*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("min_values", dim, keepdim).to(ATensor).newTensor()

proc mkldnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64): Tensor

proc mkldnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64): Tensor

proc mkldnn_convolution_backward_input*(ty: TensorType; self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): Tensor = 
  ty.dynamicCppCall("mkldnn_convolution_backward_input", self_size.toAIntList, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_input*(self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): Tensor = 
  dynamicCCall("at::mkldnn_convolution_backward_input", self_size.toAIntList, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_weights*(ty: TensorType; weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("mkldnn_convolution_backward_weights", weight_size.toAIntList, grad_output.tensor, self.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward_weights*(weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::mkldnn_convolution_backward_weights", weight_size.toAIntList, grad_output.tensor, self.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList, stride.toAIntList, dilation.toAIntList, groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc mm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor = 
  ty.dynamicCppCall("mm", self.tensor, mat2.tensor).to(ATensor).newTensor()

proc mm*(self: Tensor; mat2: Tensor): Tensor = 
  self.tensor.dynamicCppCall("mm", mat2.tensor).to(ATensor).newTensor()

proc mode*(ty: TensorType; self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mode*(self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mul*(ty: TensorType; self: Tensor; other: Tensor): Tensor

proc mul*(self: Tensor; other: Tensor): Tensor

proc mul_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("mul_", self.tensor, other.tensor).to(ATensor).newTensor()

proc mul_inplace*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("mul_", other.tensor).to(ATensor).newTensor()

proc mul*(ty: TensorType; self: Tensor; other: float): Tensor

proc mul*(self: Tensor; other: float): Tensor

proc mul_inplace*(ty: TensorType; self: Tensor; other: float): Tensor = 
  ty.dynamicCppCall("mul_", self.tensor, other).to(ATensor).newTensor()

proc mul_inplace*(self: Tensor; other: float): Tensor = 
  self.tensor.dynamicCppCall("mul_", other).to(ATensor).newTensor()

proc mv*(ty: TensorType; self: Tensor; vec: Tensor): Tensor

proc mv*(self: Tensor; vec: Tensor): Tensor

proc mvlgamma*(ty: TensorType; self: Tensor; p: int64): Tensor = 
  ty.dynamicCppCall("mvlgamma", self.tensor, p).to(ATensor).newTensor()

proc mvlgamma*(self: Tensor; p: int64): Tensor = 
  self.tensor.dynamicCppCall("mvlgamma", p).to(ATensor).newTensor()

proc mvlgamma_inplace*(ty: TensorType; self: Tensor; p: int64): Tensor = 
  ty.dynamicCppCall("mvlgamma_", self.tensor, p).to(ATensor).newTensor()

proc mvlgamma_inplace*(self: Tensor; p: int64): Tensor = 
  self.tensor.dynamicCppCall("mvlgamma_", p).to(ATensor).newTensor()

proc narrow*(ty: TensorType; self: Tensor; dim: int64; start: int64; length: int64): Tensor = 
  ty.dynamicCppCall("narrow", self.tensor, dim, start, length).to(ATensor).newTensor()

proc narrow*(self: Tensor; dim: int64; start: int64; length: int64): Tensor = 
  self.tensor.dynamicCppCall("narrow", dim, start, length).to(ATensor).newTensor()

proc ones*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("ones", size.toAIntList, options).to(ATensor).newTensor()

proc ones*(size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  dynamicCCall("at::ones", size.toAIntList, options).to(ATensor).newTensor()

proc ones_like*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("ones_like", self.tensor).to(ATensor).newTensor()

proc ones_like*(self: Tensor): Tensor = 
  dynamicCCall("at::ones_like", self.tensor).to(ATensor).newTensor()

proc ones_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("ones_like", self.tensor, options).to(ATensor).newTensor()

proc ones_like*(self: Tensor; options: TensorOptions): Tensor = 
  dynamicCCall("at::ones_like", self.tensor, options).to(ATensor).newTensor()

proc pairwise_distance*(ty: TensorType; x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor).newTensor()

proc pairwise_distance*(x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor = 
  dynamicCCall("at::pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor).newTensor()

proc permute*(ty: TensorType; self: Tensor; dims: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("permute", self.tensor, dims.toAIntList).to(ATensor).newTensor()

proc permute*(self: Tensor; dims: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("permute", dims.toAIntList).to(ATensor).newTensor()

proc pin_memory*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("pin_memory", self.tensor).to(ATensor).newTensor()

proc pin_memory*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("pin_memory").to(ATensor).newTensor()

proc pinverse*(ty: TensorType; self: Tensor; rcond: float64): Tensor = 
  ty.dynamicCppCall("pinverse", self.tensor, rcond).to(ATensor).newTensor()

proc pinverse*(self: Tensor; rcond: float64): Tensor = 
  self.tensor.dynamicCppCall("pinverse", rcond).to(ATensor).newTensor()

proc rand*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("rand", size.toAIntList, options).to(ATensor).newTensor()

proc rand*(size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  dynamicCCall("at::rand", size.toAIntList, options).to(ATensor).newTensor()

proc rand*(ty: TensorType; size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("rand", size.toAIntList, generator, options).to(ATensor).newTensor()

proc rand*(size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  dynamicCCall("at::rand", size.toAIntList, generator, options).to(ATensor).newTensor()

proc rand_like*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("rand_like", self.tensor).to(ATensor).newTensor()

proc rand_like*(self: Tensor): Tensor = 
  dynamicCCall("at::rand_like", self.tensor).to(ATensor).newTensor()

proc rand_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("rand_like", self.tensor, options).to(ATensor).newTensor()

proc rand_like*(self: Tensor; options: TensorOptions): Tensor = 
  dynamicCCall("at::rand_like", self.tensor, options).to(ATensor).newTensor()

proc randint*(ty: TensorType; high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", high, size.toAIntList, options).to(ATensor).newTensor()

proc randint*(high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", high, size.toAIntList, options).to(ATensor).newTensor()

proc randint*(ty: TensorType; high: int64; size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", high, size.toAIntList, generator, options).to(ATensor).newTensor()

proc randint*(high: int64; size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", high, size.toAIntList, generator, options).to(ATensor).newTensor()

proc randint*(ty: TensorType; low: int64; high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", low, high, size.toAIntList, options).to(ATensor).newTensor()

proc randint*(low: int64; high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", low, high, size.toAIntList, options).to(ATensor).newTensor()

proc randint*(ty: TensorType; low: int64; high: int64; size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint", low, high, size.toAIntList, generator, options).to(ATensor).newTensor()

proc randint*(low: int64; high: int64; size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  dynamicCCall("at::randint", low, high, size.toAIntList, generator, options).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int64): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, high).to(ATensor).newTensor()

proc randint_like*(self: Tensor; high: int64): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, high).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int64; high: int64): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, low, high).to(ATensor).newTensor()

proc randint_like*(self: Tensor; low: int64; high: int64): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, low, high).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, high, options).to(ATensor).newTensor()

proc randint_like*(self: Tensor; high: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, high, options).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int64; high: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randint_like", self.tensor, low, high, options).to(ATensor).newTensor()

proc randint_like*(self: Tensor; low: int64; high: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::randint_like", self.tensor, low, high, options).to(ATensor).newTensor()

proc randn*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randn", size.toAIntList, options).to(ATensor).newTensor()

proc randn*(size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  dynamicCCall("at::randn", size.toAIntList, options).to(ATensor).newTensor()

proc randn*(ty: TensorType; size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randn", size.toAIntList, generator, options).to(ATensor).newTensor()

proc randn*(size: openarray[SomeInteger]; generator: pointer; options: TensorOptions): Tensor = 
  dynamicCCall("at::randn", size.toAIntList, generator, options).to(ATensor).newTensor()

proc randn_like*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("randn_like", self.tensor).to(ATensor).newTensor()

proc randn_like*(self: Tensor): Tensor = 
  dynamicCCall("at::randn_like", self.tensor).to(ATensor).newTensor()

proc randn_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randn_like", self.tensor, options).to(ATensor).newTensor()

proc randn_like*(self: Tensor; options: TensorOptions): Tensor = 
  dynamicCCall("at::randn_like", self.tensor, options).to(ATensor).newTensor()

proc randperm*(ty: TensorType; n: int64; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randperm", n, options).to(ATensor).newTensor()

proc randperm*(n: int64; options: TensorOptions): Tensor = 
  dynamicCCall("at::randperm", n, options).to(ATensor).newTensor()

proc randperm*(ty: TensorType; n: int64; generator: pointer; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("randperm", n, generator, options).to(ATensor).newTensor()

proc randperm*(n: int64; generator: pointer; options: TensorOptions): Tensor = 
  dynamicCCall("at::randperm", n, generator, options).to(ATensor).newTensor()

proc range*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("range", start, end_name, options).to(ATensor).newTensor()

proc range*(start: float; end_name: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::range", start, end_name, options).to(ATensor).newTensor()

proc range*(ty: TensorType; start: float; end_name: float; step: float; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("range", start, end_name, step, options).to(ATensor).newTensor()

proc range*(start: float; end_name: float; step: float; options: TensorOptions): Tensor = 
  dynamicCCall("at::range", start, end_name, step, options).to(ATensor).newTensor()

proc repeat*(ty: TensorType; self: Tensor; repeats: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("repeat", self.tensor, repeats.toAIntList).to(ATensor).newTensor()

proc repeat*(self: Tensor; repeats: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("repeat", repeats.toAIntList).to(ATensor).newTensor()

proc reshape*(ty: TensorType; self: Tensor; shape: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("reshape", self.tensor, shape.toAIntList).to(ATensor).newTensor()

proc reshape*(self: Tensor; shape: openarray[SomeInteger]): Tensor = 
  self.tensor.dynamicCppCall("reshape", shape.toAIntList).to(ATensor).newTensor()

proc reshape_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("reshape_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc reshape_as*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("reshape_as", other.tensor).to(ATensor).newTensor()

proc RoiPooling2d_forward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64): tuple[result0: Tensor, result1: Tensor]

proc RoiPooling2d_forward*(input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64): tuple[result0: Tensor, result1: Tensor]

proc RoiPooling2d_backward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor = 
  ty.dynamicCppCall("RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor).newTensor()

proc RoiPooling2d_backward*(input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor = 
  dynamicCCall("at::RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor).newTensor()

proc round*(ty: TensorType; self: Tensor): Tensor

proc round*(self: Tensor): Tensor

proc round_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("round_", self.tensor).to(ATensor).newTensor()

proc round_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("round_").to(ATensor).newTensor()

proc rrelu*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("rrelu", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu*(self: Tensor; lower: float; upper: float; training: bool = false; generator: pointer = nil): Tensor = 
  dynamicCCall("at::rrelu", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu_inplace*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: pointer = nil): Tensor = 
  ty.dynamicCppCall("rrelu_", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu_inplace*(self: Tensor; lower: float; upper: float; training: bool = false; generator: pointer = nil): Tensor = 
  dynamicCCall("at::rrelu_", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc relu*(ty: TensorType; self: Tensor): Tensor

proc relu*(self: Tensor): Tensor

proc relu_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("relu_", self.tensor).to(ATensor).newTensor()

proc relu_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("relu_").to(ATensor).newTensor()

proc hardshrink*(ty: TensorType; self: Tensor; lambd: float): Tensor

proc hardshrink*(self: Tensor; lambd: float): Tensor

proc hardshrink_backward*(ty: TensorType; grad_out: Tensor; self: Tensor; lambd: float): Tensor

proc hardshrink_backward*(grad_out: Tensor; self: Tensor; lambd: float): Tensor

proc rsqrt*(ty: TensorType; self: Tensor): Tensor

proc rsqrt*(self: Tensor): Tensor

proc rsqrt_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("rsqrt_", self.tensor).to(ATensor).newTensor()

proc rsqrt_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("rsqrt_").to(ATensor).newTensor()

proc select*(ty: TensorType; self: Tensor; dim: int64; index: int64): Tensor = 
  ty.dynamicCppCall("select", self.tensor, dim, index).to(ATensor).newTensor()

proc select*(self: Tensor; dim: int64; index: int64): Tensor = 
  self.tensor.dynamicCppCall("select", dim, index).to(ATensor).newTensor()

proc selu*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("selu", self.tensor).to(ATensor).newTensor()

proc selu*(self: Tensor): Tensor = 
  dynamicCCall("at::selu", self.tensor).to(ATensor).newTensor()

proc selu_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("selu_", self.tensor).to(ATensor).newTensor()

proc selu_inplace*(self: Tensor): Tensor = 
  dynamicCCall("at::selu_", self.tensor).to(ATensor).newTensor()

proc celu*(ty: TensorType; self: Tensor; alpha: float): Tensor = 
  ty.dynamicCppCall("celu", self.tensor, alpha).to(ATensor).newTensor()

proc celu*(self: Tensor; alpha: float): Tensor = 
  dynamicCCall("at::celu", self.tensor, alpha).to(ATensor).newTensor()

proc celu_inplace*(ty: TensorType; self: Tensor; alpha: float): Tensor = 
  ty.dynamicCppCall("celu_", self.tensor, alpha).to(ATensor).newTensor()

proc celu_inplace*(self: Tensor; alpha: float): Tensor = 
  dynamicCCall("at::celu_", self.tensor, alpha).to(ATensor).newTensor()

proc sigmoid*(ty: TensorType; self: Tensor): Tensor

proc sigmoid*(self: Tensor): Tensor

proc sigmoid_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sigmoid_", self.tensor).to(ATensor).newTensor()

proc sigmoid_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("sigmoid_").to(ATensor).newTensor()

proc sin*(ty: TensorType; self: Tensor): Tensor

proc sin*(self: Tensor): Tensor

proc sin_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sin_", self.tensor).to(ATensor).newTensor()

proc sin_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("sin_").to(ATensor).newTensor()

proc sinh*(ty: TensorType; self: Tensor): Tensor

proc sinh*(self: Tensor): Tensor

proc sinh_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sinh_", self.tensor).to(ATensor).newTensor()

proc sinh_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("sinh_").to(ATensor).newTensor()

proc size*(ty: TensorType; self: Tensor; dim: int64): int64 = 
  ty.dynamicCppCall("size", self.tensor, dim).to(int64)

proc size*(self: Tensor; dim: int64): int64 = 
  self.tensor.dynamicCppCall("size", dim).to(int64)

proc slice*(ty: TensorType; self: Tensor; dim: int64 = 0; start: int64 = 0; end_name: int64 = 9223372036854775807; step: int64 = 1): Tensor = 
  ty.dynamicCppCall("slice", self.tensor, dim, start, end_name, step).to(ATensor).newTensor()

proc slice*(self: Tensor; dim: int64 = 0; start: int64 = 0; end_name: int64 = 9223372036854775807; step: int64 = 1): Tensor = 
  self.tensor.dynamicCppCall("slice", dim, start, end_name, step).to(ATensor).newTensor()

proc slogdet*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("slogdet", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc slogdet*(self: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("slogdet").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc smm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor = 
  ty.dynamicCppCall("smm", self.tensor, mat2.tensor).to(ATensor).newTensor()

proc smm*(self: Tensor; mat2: Tensor): Tensor = 
  self.tensor.dynamicCppCall("smm", mat2.tensor).to(ATensor).newTensor()

proc softmax*(ty: TensorType; self: Tensor; dim: int64): Tensor

proc softmax*(self: Tensor; dim: int64): Tensor

proc softmax_backward_data*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor = 
  ty.dynamicCppCall("softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc softmax_backward_data*(grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor = 
  dynamicCCall("at::softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc split*(ty: TensorType; self: Tensor; split_size: int64; dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("split", self.tensor, split_size, dim).to(TensorList)

proc split*(self: Tensor; split_size: int64; dim: int64 = 0): TensorList = 
  self.tensor.dynamicCppCall("split", split_size, dim).to(TensorList)

proc split_with_sizes*(ty: TensorType; self: Tensor; split_sizes: openarray[SomeInteger]; dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("split_with_sizes", self.tensor, split_sizes.toAIntList, dim).to(TensorList)

proc split_with_sizes*(self: Tensor; split_sizes: openarray[SomeInteger]; dim: int64 = 0): TensorList = 
  self.tensor.dynamicCppCall("split_with_sizes", split_sizes.toAIntList, dim).to(TensorList)

proc squeeze*(ty: TensorType; self: Tensor): Tensor

proc squeeze*(self: Tensor): Tensor

proc squeeze*(ty: TensorType; self: Tensor; dim: int64): Tensor

proc squeeze*(self: Tensor; dim: int64): Tensor

proc squeeze_inplace*(ty: TensorType; self: Tensor): Tensor

proc squeeze_inplace*(self: Tensor): Tensor

proc squeeze_inplace*(ty: TensorType; self: Tensor; dim: int64): Tensor

proc squeeze_inplace*(self: Tensor; dim: int64): Tensor

proc sspaddmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("sspaddmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc sspaddmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("sspaddmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc stack*(ty: TensorType; tensors: TensorList; dim: int64 = 0): Tensor

proc stack*(tensors: TensorList; dim: int64 = 0): Tensor

proc stft*(ty: TensorType; self: Tensor; n_fft: int64; hop_length: int64; win_length: int64; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor = 
  ty.dynamicCppCall("stft", self.tensor, n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor).newTensor()

proc stft*(self: Tensor; n_fft: int64; hop_length: int64; win_length: int64; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor = 
  self.tensor.dynamicCppCall("stft", n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor).newTensor()

proc stride*(ty: TensorType; self: Tensor; dim: int64): int64 = 
  ty.dynamicCppCall("stride", self.tensor, dim).to(int64)

proc stride*(self: Tensor; dim: int64): int64 = 
  self.tensor.dynamicCppCall("stride", dim).to(int64)

proc sum*(ty: TensorType; self: Tensor; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("sum", dtype).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sum", self.tensor).to(ATensor).newTensor()

proc sum*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("sum").to(ATensor).newTensor()

proc sum_internal*(ty: TensorType; self: Tensor): Tensor

proc sum_internal*(self: Tensor): Tensor

proc sum*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; keepdim: bool; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dim.toAIntList, keepdim, dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[SomeInteger]; keepdim: bool; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("sum", dim.toAIntList, keepdim, dtype).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dim.toAIntList, keepdim).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("sum", dim.toAIntList, keepdim).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("sum", self.tensor, dim.toAIntList, dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[SomeInteger]; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("sum", dim.toAIntList, dtype).to(ATensor).newTensor()

proc sum_internal*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor

proc sum_internal*(self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor

proc sqrt*(ty: TensorType; self: Tensor): Tensor

proc sqrt*(self: Tensor): Tensor

proc sqrt_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("sqrt_", self.tensor).to(ATensor).newTensor()

proc sqrt_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("sqrt_").to(ATensor).newTensor()

proc std*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor = 
  ty.dynamicCppCall("std", self.tensor, unbiased).to(ATensor).newTensor()

proc std*(self: Tensor; unbiased: bool = true): Tensor = 
  self.tensor.dynamicCppCall("std", unbiased).to(ATensor).newTensor()

proc std*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("std", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc std*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("std", dim, unbiased, keepdim).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("prod", dtype).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("prod", self.tensor).to(ATensor).newTensor()

proc prod*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("prod").to(ATensor).newTensor()

proc prod_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_prod", self.tensor).to(ATensor).newTensor()

proc prod_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_prod").to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dim, keepdim, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("prod", dim, keepdim, dtype).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("prod", dim, keepdim).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  ty.dynamicCppCall("prod", self.tensor, dim, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int64; dtype: AScalarType): Tensor = 
  self.tensor.dynamicCppCall("prod", dim, dtype).to(ATensor).newTensor()

proc prod_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("_prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc prod_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("_prod", dim, keepdim).to(ATensor).newTensor()

proc t*(ty: TensorType; self: Tensor): Tensor

proc t*(self: Tensor): Tensor

proc t_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("t_", self.tensor).to(ATensor).newTensor()

proc t_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("t_").to(ATensor).newTensor()

proc tan*(ty: TensorType; self: Tensor): Tensor

proc tan*(self: Tensor): Tensor

proc tan_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("tan_", self.tensor).to(ATensor).newTensor()

proc tan_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("tan_").to(ATensor).newTensor()

proc tanh*(ty: TensorType; self: Tensor): Tensor

proc tanh*(self: Tensor): Tensor

proc tanh_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("tanh_", self.tensor).to(ATensor).newTensor()

proc tanh_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("tanh_").to(ATensor).newTensor()

proc transpose*(ty: TensorType; self: Tensor; dim0: int64; dim1: int64): Tensor

proc transpose*(self: Tensor; dim0: int64; dim1: int64): Tensor

proc transpose_inplace*(ty: TensorType; self: Tensor; dim0: int64; dim1: int64): Tensor

proc transpose_inplace*(self: Tensor; dim0: int64; dim1: int64): Tensor

proc flip*(ty: TensorType; self: Tensor; dims: openarray[SomeInteger]): Tensor

proc flip*(self: Tensor; dims: openarray[SomeInteger]): Tensor

proc rot90*(ty: TensorType; self: Tensor; k: int64 = 1; dims: openarray[SomeInteger]): Tensor

proc rot90*(self: Tensor; k: int64 = 1; dims: openarray[SomeInteger]): Tensor

proc trilinear_internal*(ty: TensorType; i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[SomeInteger]; expand2: openarray[SomeInteger]; expand3: openarray[SomeInteger]; sumdim: openarray[SomeInteger]; unroll_dim: int64 = 1): Tensor = 
  ty.dynamicCppCall("_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1.toAIntList, expand2.toAIntList, expand3.toAIntList, sumdim.toAIntList, unroll_dim).to(ATensor).newTensor()

proc trilinear_internal*(i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[SomeInteger]; expand2: openarray[SomeInteger]; expand3: openarray[SomeInteger]; sumdim: openarray[SomeInteger]; unroll_dim: int64 = 1): Tensor = 
  dynamicCCall("at::_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1.toAIntList, expand2.toAIntList, expand3.toAIntList, sumdim.toAIntList, unroll_dim).to(ATensor).newTensor()

proc triplet_margin_loss*(ty: TensorType; anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int64): Tensor = 
  ty.dynamicCppCall("triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc triplet_margin_loss*(anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int64): Tensor = 
  dynamicCCall("at::triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc trunc*(ty: TensorType; self: Tensor): Tensor

proc trunc*(self: Tensor): Tensor

proc trunc_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("trunc_", self.tensor).to(ATensor).newTensor()

proc trunc_inplace*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("trunc_").to(ATensor).newTensor()

proc type_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("type_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc type_as*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("type_as", other.tensor).to(ATensor).newTensor()

proc unique_internal*(ty: TensorType; self: Tensor; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("_unique", self.tensor, sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unique_internal*(self: Tensor; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] = 
  self.tensor.dynamicCppCall("_unique", sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unsafe_view_internal*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]): Tensor

proc unsafe_view_internal*(self: Tensor; size: openarray[SomeInteger]): Tensor

proc unsqueeze*(ty: TensorType; self: Tensor; dim: int64): Tensor

proc unsqueeze*(self: Tensor; dim: int64): Tensor

proc unsqueeze_inplace*(ty: TensorType; self: Tensor; dim: int64): Tensor

proc unsqueeze_inplace*(self: Tensor; dim: int64): Tensor

proc var_name*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor = 
  ty.dynamicCppCall("var", self.tensor, unbiased).to(ATensor).newTensor()

proc var_name*(self: Tensor; unbiased: bool = true): Tensor = 
  self.tensor.dynamicCppCall("var", unbiased).to(ATensor).newTensor()

proc var_name*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("var", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc var_name*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("var", dim, unbiased, keepdim).to(ATensor).newTensor()

proc view_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("view_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc view_as*(self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("view_as", other.tensor).to(ATensor).newTensor()

proc where*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor = 
  ty.dynamicCppCall("where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()

proc where*(condition: Tensor; self: Tensor; other: Tensor): Tensor = 
  self.tensor.dynamicCppCall("where", condition.tensor, other.tensor).to(ATensor).newTensor()

proc s_where_internal*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor

proc s_where_internal*(condition: Tensor; self: Tensor; other: Tensor): Tensor

proc zeros*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("zeros", size.toAIntList, options).to(ATensor).newTensor()

proc zeros*(size: openarray[SomeInteger]; options: TensorOptions): Tensor = 
  dynamicCCall("at::zeros", size.toAIntList, options).to(ATensor).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("zeros_like", self.tensor).to(ATensor).newTensor()

proc zeros_like*(self: Tensor): Tensor = 
  dynamicCCall("at::zeros_like", self.tensor).to(ATensor).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor = 
  ty.dynamicCppCall("zeros_like", self.tensor, options).to(ATensor).newTensor()

proc zeros_like*(self: Tensor; options: TensorOptions): Tensor = 
  dynamicCCall("at::zeros_like", self.tensor, options).to(ATensor).newTensor()

proc standard_gamma_grad_internal*(ty: TensorType; self: Tensor; output: Tensor): Tensor = 
  ty.dynamicCppCall("_standard_gamma_grad", self.tensor, output.tensor).to(ATensor).newTensor()

proc standard_gamma_grad_internal*(self: Tensor; output: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_standard_gamma_grad", output.tensor).to(ATensor).newTensor()

proc standard_gamma_internal*(ty: TensorType; self: Tensor; generator: pointer = nil): Tensor

proc standard_gamma_internal*(self: Tensor; generator: pointer = nil): Tensor

proc poisson*(ty: TensorType; self: Tensor; generator: pointer = nil): Tensor

proc poisson*(self: Tensor; generator: pointer = nil): Tensor

proc native_norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor = 
  ty.dynamicCppCall("native_norm", self.tensor, p).to(ATensor).newTensor()

proc native_norm*(self: Tensor; p: float = 2): Tensor = 
  dynamicCCall("at::native_norm", self.tensor, p).to(ATensor).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor = 
  ty.dynamicCppCall("norm", self.tensor, p).to(ATensor).newTensor()

proc norm*(self: Tensor; p: float = 2): Tensor = 
  self.tensor.dynamicCppCall("norm", p).to(ATensor).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor = 
  ty.dynamicCppCall("norm", self.tensor, p, dim, keepdim).to(ATensor).newTensor()

proc norm*(self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor = 
  self.tensor.dynamicCppCall("norm", p, dim, keepdim).to(ATensor).newTensor()

proc native_clone*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("native_clone", self.tensor).to(ATensor).newTensor()

proc native_clone*(self: Tensor): Tensor = 
  dynamicCCall("at::native_clone", self.tensor).to(ATensor).newTensor()

proc clone*(ty: TensorType; self: Tensor): Tensor

proc clone*(self: Tensor): Tensor

proc native_resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor = 
  ty.dynamicCppCall("native_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc native_resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor = 
  dynamicCCall("at::native_resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor = 
  ty.dynamicCppCall("resize_as_", self.tensor, the_template.tensor).to(ATensor).newTensor()

proc resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor = 
  self.tensor.dynamicCppCall("resize_as_", the_template.tensor).to(ATensor).newTensor()

proc native_pow*(ty: TensorType; self: Tensor; exponent: float): Tensor = 
  ty.dynamicCppCall("native_pow", self.tensor, exponent).to(ATensor).newTensor()

proc native_pow*(self: Tensor; exponent: float): Tensor = 
  dynamicCCall("at::native_pow", self.tensor, exponent).to(ATensor).newTensor()

proc pow*(ty: TensorType; self: Tensor; exponent: float): Tensor

proc pow*(self: Tensor; exponent: float): Tensor

proc native_zero_inplace*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("native_zero_", self.tensor).to(ATensor).newTensor()

proc native_zero_inplace*(self: Tensor): Tensor = 
  dynamicCCall("at::native_zero_", self.tensor).to(ATensor).newTensor()

proc zero_inplace*(ty: TensorType; self: Tensor): Tensor

proc zero_inplace*(self: Tensor): Tensor

proc sub*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor

proc sub*(self: Tensor; other: Tensor; alpha: float = 1): Tensor

proc sub_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("sub_", self.tensor, other.tensor, alpha).to(ATensor).newTensor()

proc sub_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("sub_", other.tensor, alpha).to(ATensor).newTensor()

proc sub*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor

proc sub*(self: Tensor; other: float; alpha: float = 1): Tensor

proc sub_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("sub_", self.tensor, other, alpha).to(ATensor).newTensor()

proc sub_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("sub_", other, alpha).to(ATensor).newTensor()

proc s_native_addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc s_native_addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor

proc s_native_addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc s_native_addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  dynamicCCall("at::s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  ty.dynamicCppCall("addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor = 
  self.tensor.dynamicCppCall("addmm_", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc native_tensor*(ty: TensorType; self_ty: TensorType): Tensor = 
  ty.dynamicCppCall("native_tensor", self_ty).to(ATensor).newTensor()

proc native_tensor*(self_ty: TensorType): Tensor = 
  dynamicCCall("at::native_tensor", self_ty).to(ATensor).newTensor()

proc native_tensor*(ty: TensorType; self_ty: TensorType; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("native_tensor", self_ty, size.toAIntList).to(ATensor).newTensor()

proc native_tensor*(self_ty: TensorType; size: openarray[SomeInteger]): Tensor = 
  dynamicCCall("at::native_tensor", self_ty, size.toAIntList).to(ATensor).newTensor()

proc tensor*(ty: TensorType; dtype: TensorType): Tensor = 
  ty.dynamicCppCall("tensor", dtype).to(ATensor).newTensor()

proc tensor*(ty: TensorType; dtype: TensorType; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("tensor", dtype, size.toAIntList).to(ATensor).newTensor()

proc native_sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor): Tensor = 
  ty.dynamicCppCall("native_sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor).newTensor()

proc native_sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("native_sparse_coo_tensor", indices.tensor, values.tensor, size.toAIntList).to(ATensor).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor): Tensor = 
  ty.dynamicCppCall("sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("sparse_coo_tensor", indices.tensor, values.tensor, size.toAIntList).to(ATensor).newTensor()

proc native_sparse_coo_tensor_unsafe_internal*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("_native_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size.toAIntList).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_internal*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor = 
  ty.dynamicCppCall("_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size.toAIntList).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_internal*(indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor = 
  dynamicCCall("at::_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size.toAIntList).to(ATensor).newTensor()

proc sparse_raw_resize_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; sparseDims: int64; denseDims: int64): Tensor = 
  ty.dynamicCppCall("sparse_raw_resize_", self.tensor, size.toAIntList, sparseDims, denseDims).to(ATensor).newTensor()

proc sparse_raw_resize_inplace*(self: Tensor; size: openarray[SomeInteger]; sparseDims: int64; denseDims: int64): Tensor = 
  self.tensor.dynamicCppCall("sparse_raw_resize_", size.toAIntList, sparseDims, denseDims).to(ATensor).newTensor()

proc sparse_mask_internal*(ty: TensorType; self: Tensor; mask: ASparseTensorRef): Tensor = 
  ty.dynamicCppCall("_sparse_mask", self.tensor, mask).to(ATensor).newTensor()

proc sparse_mask_internal*(self: Tensor; mask: ASparseTensorRef): Tensor = 
  self.tensor.dynamicCppCall("_sparse_mask", mask).to(ATensor).newTensor()

proc to_dense*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("to_dense", self.tensor).to(ATensor).newTensor()

proc to_dense*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("to_dense").to(ATensor).newTensor()

proc sparseDims_internal*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_sparseDims", self.tensor).to(int64)

proc sparseDims_internal*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("_sparseDims").to(int64)

proc dimI_internal*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_dimI", self.tensor).to(int64)

proc dimI_internal*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("_dimI").to(int64)

proc denseDims_internal*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_denseDims", self.tensor).to(int64)

proc denseDims_internal*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("_denseDims").to(int64)

proc dimV_internal*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_dimV", self.tensor).to(int64)

proc dimV_internal*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("_dimV").to(int64)

proc nnz_internal*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("_nnz", self.tensor).to(int64)

proc nnz_internal*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("_nnz").to(int64)

proc coalesce*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("coalesce", self.tensor).to(ATensor).newTensor()

proc coalesce*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("coalesce").to(ATensor).newTensor()

proc is_coalesced*(ty: TensorType; self: Tensor): bool = 
  ty.dynamicCppCall("is_coalesced", self.tensor).to(bool)

proc is_coalesced*(self: Tensor): bool = 
  self.tensor.dynamicCppCall("is_coalesced").to(bool)

proc indices_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_indices", self.tensor).to(ATensor).newTensor()

proc indices_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_indices").to(ATensor).newTensor()

proc values_internal*(ty: TensorType; self: Tensor): Tensor = 
  ty.dynamicCppCall("_values", self.tensor).to(ATensor).newTensor()

proc values_internal*(self: Tensor): Tensor = 
  self.tensor.dynamicCppCall("_values").to(ATensor).newTensor()

proc hspmm*(ty: TensorType; mat1: Tensor; mat2: Tensor): Tensor = 
  ty.dynamicCppCall("hspmm", mat1.tensor, mat2.tensor).to(ATensor).newTensor()

proc hspmm*(mat1: Tensor; mat2: Tensor): Tensor = 
  dynamicCCall("at::hspmm", mat1.tensor, mat2.tensor).to(ATensor).newTensor()

proc raw_copy_sparse_inplace*(ty: TensorType; self: Tensor; src: Tensor): Tensor = 
  ty.dynamicCppCall("raw_copy_sparse_", self.tensor, src.tensor).to(ATensor).newTensor()

proc raw_copy_sparse_inplace*(self: Tensor; src: Tensor): Tensor = 
  dynamicCCall("at::raw_copy_sparse_", self.tensor, src.tensor).to(ATensor).newTensor()

proc numel*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("numel", self.tensor).to(int64)

proc numel*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("numel").to(int64)

proc unbind*(ty: TensorType; self: Tensor; dim: int64 = 0): TensorList = 
  ty.dynamicCppCall("unbind", self.tensor, dim).to(TensorList)

proc unbind*(self: Tensor; dim: int64 = 0): TensorList = 
  self.tensor.dynamicCppCall("unbind", dim).to(TensorList)

proc native_get_device*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("native_get_device", self.tensor).to(int64)

proc native_get_device*(self: Tensor): int64 = 
  dynamicCCall("at::native_get_device", self.tensor).to(int64)

proc get_device*(ty: TensorType; self: Tensor): int64 = 
  ty.dynamicCppCall("get_device", self.tensor).to(int64)

proc get_device*(self: Tensor): int64 = 
  self.tensor.dynamicCppCall("get_device").to(int64)

proc meshgrid*(ty: TensorType; tensors: TensorList): TensorList = 
  ty.dynamicCppCall("meshgrid", tensors).to(TensorList)

proc meshgrid*(tensors: TensorList): TensorList = 
  dynamicCCall("at::meshgrid", tensors).to(TensorList)

proc local_scalar_internal*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_local_scalar", self.tensor).to(float)

proc local_scalar_internal*(self: Tensor): float = 
  self.tensor.dynamicCppCall("_local_scalar").to(float)

proc local_scalar_dense_internal*(ty: TensorType; self: Tensor): float = 
  ty.dynamicCppCall("_local_scalar_dense", self.tensor).to(float)

proc local_scalar_dense_internal*(self: Tensor): float = 
  dynamicCCall("at::_local_scalar_dense", self.tensor).to(float)

proc thnn_fused_lstm_cell_internal*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_internal*(input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_backward_internal*(ty: TensorType; grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  ty.dynamicCppCall("_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_backward_internal*(grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  dynamicCCall("at::_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_internal*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor]

proc thnn_fused_gru_cell_internal*(input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor]

proc thnn_fused_gru_cell_backward_internal*(ty: TensorType; grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  ty.dynamicCppCall("_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_backward_internal*(grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] = 
  dynamicCCall("at::_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(ty: TensorType; input: Tensor; hx: TensorList; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("lstm", input.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(input: Tensor; hx: TensorList; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::lstm", input.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: TensorList; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  ty.dynamicCppCall("lstm", data.tensor, batch_sizes.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(data: Tensor; batch_sizes: Tensor; hx: TensorList; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] = 
  dynamicCCall("at::lstm", data.tensor, batch_sizes.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(ty: TensorType; input: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("gru", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(input: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::gru", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("gru", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::gru", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; input: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_tanh", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(input: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_tanh", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; input: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_relu", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(input: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_relu", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: TensorList; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell*(ty: TensorType; input: Tensor; hx: TensorList; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  ty.dynamicCppCall("lstm_cell", input.tensor, hx, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell*(input: Tensor; hx: TensorList; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] = 
  dynamicCCall("at::lstm_cell", input.tensor, hx, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor = 
  ty.dynamicCppCall("gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc gru_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor = 
  dynamicCCall("at::gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_tanh_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor = 
  ty.dynamicCppCall("rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_tanh_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor = 
  dynamicCCall("at::rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_relu_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor = 
  ty.dynamicCppCall("rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_relu_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor = 
  dynamicCCall("at::rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

