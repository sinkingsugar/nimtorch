# Automatically generated, to update run again the generator from the torch root path
# nim c -r torch/generator.nim

template atenMethod*(obj: CppObject, field: untyped, args: varargs[CppProxy, CppFromAst]): CppProxy = obj.dynamicCppCall(field, args)
template atenFunction*(field: untyped, args: varargs[CppProxy, CppFromAst]): CppProxy = dynamicCCall(field, args)

proc storage_offset*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("storage_offset", self.tensor).to(int64)

proc storage_offset*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("storage_offset").to(int64)

proc resize_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]): Tensor {.inline, discardable.} = 
  ty.atenMethod("resize_", self.tensor, size.toAIntList()).to(void); self

proc resize_inplace*(self: Tensor; size: openarray[SomeInteger]): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("resize_", size.toAIntList()).to(void); self

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  ty.atenMethod("set_", self.tensor, source).to(void); self

proc set_inplace*(self: Tensor; source: AStorage): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("set_", source).to(void); self

proc set_inplace*(ty: TensorType; self: Tensor; source: AStorage; storage_offset: int64; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline, discardable.} = 
  ty.atenMethod("set_", self.tensor, source, storage_offset, size.toAIntList(), stride.toAIntList()).to(void); self

proc set_inplace*(self: Tensor; source: AStorage; storage_offset: int64; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("set_", source, storage_offset, size.toAIntList(), stride.toAIntList()).to(void); self

proc set_inplace*(ty: TensorType; self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("set_", self.tensor, source.tensor).to(void); self

proc set_inplace*(self: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("set_", source.tensor).to(void); self

proc set_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("set_", self.tensor).to(void); self

proc set_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("set_").to(void); self

proc fill_internal_inplace*(ty: TensorType; self: Tensor; value: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("_fill_", self.tensor, value).to(void); self

proc fill_internal_inplace*(self: Tensor; value: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("_fill_", value).to(void); self

proc fill_internal_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("_fill_", self.tensor, value.tensor).to(void); self

proc fill_internal_inplace*(self: Tensor; value: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("_fill_", value.tensor).to(void); self

proc is_contiguous*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_contiguous", self.tensor).to(bool)

proc is_contiguous*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_contiguous").to(bool)

proc is_set_to*(ty: TensorType; self: Tensor; tensor: Tensor): bool {.inline.} = 
  ty.atenMethod("is_set_to", self.tensor, tensor.tensor).to(bool)

proc is_set_to*(self: Tensor; tensor: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_set_to", tensor.tensor).to(bool)

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.}

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: float): Tensor {.inline, discardable.}

proc masked_fill_inplace*(ty: TensorType; self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc masked_fill_inplace*(self: Tensor; mask: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc masked_scatter_inplace*(ty: TensorType; self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("masked_scatter_", self.tensor, mask.tensor, source.tensor).to(void); self

proc masked_scatter_inplace*(self: Tensor; mask: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("masked_scatter_", mask.tensor, source.tensor).to(void); self

proc masked_select*(ty: TensorType; self: Tensor; mask: Tensor): Tensor {.inline.}

proc masked_select*(self: Tensor; mask: Tensor): Tensor {.inline.}

proc nonzero*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("nonzero", self.tensor).to(ATensor).newTensor()

proc nonzero*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("nonzero").to(ATensor).newTensor()

proc th_clone*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("th_clone", self.tensor).to(ATensor).newTensor()

proc th_clone*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::th_clone", self.tensor).to(ATensor).newTensor()

proc view*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]): Tensor {.inline.}

proc view*(self: Tensor; size: openarray[SomeInteger]): Tensor {.inline.}

proc th_resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("th_resize_as_", self.tensor, the_template.tensor).to(void); self

proc th_resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  atenFunction("at::th_resize_as_", self.tensor, the_template.tensor).to(void); self

proc index_select*(ty: TensorType; self: Tensor; dim: int64; index: Tensor): Tensor {.inline.}

proc index_select*(self: Tensor; dim: int64; index: Tensor): Tensor {.inline.}

proc indexCopy_internal_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("_indexCopy_", self.tensor, dim, index.tensor, source.tensor).to(void); self

proc indexCopy_internal_inplace*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("_indexCopy_", dim, index.tensor, source.tensor).to(void); self

proc take*(ty: TensorType; self: Tensor; index: Tensor): Tensor {.inline.}

proc take*(self: Tensor; index: Tensor): Tensor {.inline.}

proc put_inplace*(ty: TensorType; self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc put_inplace*(self: Tensor; index: Tensor; source: Tensor; accumulate: bool = false): Tensor {.inline, discardable.}

proc index_add_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_add_inplace*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_fill_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: float): Tensor {.inline, discardable.}

proc index_fill_inplace*(self: Tensor; dim: int64; index: Tensor; value: float): Tensor {.inline, discardable.}

proc index_fill_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc index_fill_inplace*(self: Tensor; dim: int64; index: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc unfold*(ty: TensorType; self: Tensor; dimension: int64; size: int64; step: int64): Tensor {.inline.} = 
  ty.atenMethod("unfold", self.tensor, dimension, size, step).to(ATensor).newTensor()

proc unfold*(self: Tensor; dimension: int64; size: int64; step: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("unfold", dimension, size, step).to(ATensor).newTensor()

proc range_internal*(ty: TensorType; start: float; end_name: float; step: float = 1): Tensor {.inline.} = 
  ty.atenMethod("_range", start, end_name, step).to(ATensor).newTensor()

proc arange_internal*(ty: TensorType; start: float; end_name: float; step: float = 1): Tensor {.inline.} = 
  ty.atenMethod("_arange", start, end_name, step).to(ATensor).newTensor()

proc arange_internal*(ty: TensorType; end_name: float): Tensor {.inline.} = 
  ty.atenMethod("_arange", end_name).to(ATensor).newTensor()

proc scatter_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc scatter_inplace*(self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc scatter_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; value: float): Tensor {.inline, discardable.}

proc scatter_inplace*(self: Tensor; dim: int64; index: Tensor; value: float): Tensor {.inline, discardable.}

proc scatter_add_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc scatter_add_inplace*(self: Tensor; dim: int64; index: Tensor; src: Tensor): Tensor {.inline, discardable.}

proc gather*(ty: TensorType; self: Tensor; dim: int64; index: Tensor): Tensor {.inline.}

proc gather*(self: Tensor; dim: int64; index: Tensor): Tensor {.inline.}

proc data_ptr*(ty: TensorType; self: Tensor): pointer {.inline.} = 
  ty.atenMethod("data_ptr", self.tensor).to(pointer)

proc data_ptr*(self: Tensor): pointer {.inline.} = 
  self.tensor.atenMethod("data_ptr").to(pointer)

proc equal*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  ty.atenMethod("equal", self.tensor, other.tensor).to(bool)

proc equal*(self: Tensor; other: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("equal", other.tensor).to(bool)

proc and_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("__and__", self.tensor, other).to(ATensor).newTensor()

proc and_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("__and__", other).to(ATensor).newTensor()

proc and_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("__and__", self.tensor, other.tensor).to(ATensor).newTensor()

proc and_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("__and__", other.tensor).to(ATensor).newTensor()

proc iand_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("__iand__", self.tensor, other).to(void); self

proc iand_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__iand__", other).to(void); self

proc iand_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("__iand__", self.tensor, other.tensor).to(void); self

proc iand_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__iand__", other.tensor).to(void); self

proc or_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("__or__", self.tensor, other).to(ATensor).newTensor()

proc or_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("__or__", other).to(ATensor).newTensor()

proc or_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("__or__", self.tensor, other.tensor).to(ATensor).newTensor()

proc or_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("__or__", other.tensor).to(ATensor).newTensor()

proc ior_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("__ior__", self.tensor, other).to(void); self

proc ior_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__ior__", other).to(void); self

proc ior_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("__ior__", self.tensor, other.tensor).to(void); self

proc ior_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__ior__", other.tensor).to(void); self

proc xor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("__xor__", self.tensor, other).to(ATensor).newTensor()

proc xor_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("__xor__", other).to(ATensor).newTensor()

proc xor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("__xor__", self.tensor, other.tensor).to(ATensor).newTensor()

proc xor_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("__xor__", other.tensor).to(ATensor).newTensor()

proc ixor_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("__ixor__", self.tensor, other).to(void); self

proc ixor_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__ixor__", other).to(void); self

proc ixor_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("__ixor__", self.tensor, other.tensor).to(void); self

proc ixor_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__ixor__", other.tensor).to(void); self

proc lshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("__lshift__", self.tensor, other).to(ATensor).newTensor()

proc lshift_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("__lshift__", other).to(ATensor).newTensor()

proc lshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("__lshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc lshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("__lshift__", other.tensor).to(ATensor).newTensor()

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("__ilshift__", self.tensor, other).to(void); self

proc ilshift_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__ilshift__", other).to(void); self

proc ilshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("__ilshift__", self.tensor, other.tensor).to(void); self

proc ilshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__ilshift__", other.tensor).to(void); self

proc rshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("__rshift__", self.tensor, other).to(ATensor).newTensor()

proc rshift_builtin*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("__rshift__", other).to(ATensor).newTensor()

proc rshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("__rshift__", self.tensor, other.tensor).to(ATensor).newTensor()

proc rshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("__rshift__", other.tensor).to(ATensor).newTensor()

proc irshift_builtin*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("__irshift__", self.tensor, other).to(void); self

proc irshift_builtin*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__irshift__", other).to(void); self

proc irshift_builtin*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("__irshift__", self.tensor, other.tensor).to(void); self

proc irshift_builtin*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("__irshift__", other.tensor).to(void); self

proc lt*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("lt", self.tensor, other).to(ATensor).newTensor()

proc lt*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("lt", other).to(ATensor).newTensor()

proc lt*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("lt", self.tensor, other.tensor).to(ATensor).newTensor()

proc lt*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("lt", other.tensor).to(ATensor).newTensor()

proc lt_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc lt_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc lt_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc lt_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc gt*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("gt", self.tensor, other).to(ATensor).newTensor()

proc gt*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("gt", other).to(ATensor).newTensor()

proc gt*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("gt", self.tensor, other.tensor).to(ATensor).newTensor()

proc gt*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("gt", other.tensor).to(ATensor).newTensor()

proc gt_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc gt_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc gt_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc gt_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc le*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("le", self.tensor, other).to(ATensor).newTensor()

proc le*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("le", other).to(ATensor).newTensor()

proc le*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("le", self.tensor, other.tensor).to(ATensor).newTensor()

proc le*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("le", other.tensor).to(ATensor).newTensor()

proc le_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc le_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc le_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc le_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ge*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("ge", self.tensor, other).to(ATensor).newTensor()

proc ge*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("ge", other).to(ATensor).newTensor()

proc ge*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("ge", self.tensor, other.tensor).to(ATensor).newTensor()

proc ge*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("ge", other.tensor).to(ATensor).newTensor()

proc ge_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc ge_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc ge_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ge_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc eq*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("eq", self.tensor, other).to(ATensor).newTensor()

proc eq*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("eq", other).to(ATensor).newTensor()

proc eq*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("eq", self.tensor, other.tensor).to(ATensor).newTensor()

proc eq*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("eq", other.tensor).to(ATensor).newTensor()

proc eq_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc eq_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc eq_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc eq_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ne*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.} = 
  ty.atenMethod("ne", self.tensor, other).to(ATensor).newTensor()

proc ne*(self: Tensor; other: float): Tensor {.inline.} = 
  self.tensor.atenMethod("ne", other).to(ATensor).newTensor()

proc ne*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("ne", self.tensor, other.tensor).to(ATensor).newTensor()

proc ne*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("ne", other.tensor).to(ATensor).newTensor()

proc ne_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.}

proc ne_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.}

proc ne_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc ne_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.}

proc min*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc min*(self: Tensor; other: Tensor): Tensor {.inline.}

proc min*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("min", self.tensor).to(float)

proc min*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("min").to(float)

proc th_min_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline.} = 
  ty.atenMethod("_th_min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_min_internal*(self: Tensor; dim: int64; keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline.} = 
  self.tensor.atenMethod("_th_min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc max*(self: Tensor; other: Tensor): Tensor {.inline.}

proc max*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("max", self.tensor).to(float)

proc max*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("max").to(float)

proc th_max_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline.} = 
  ty.atenMethod("_th_max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_max_internal*(self: Tensor; dim: int64; keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline.} = 
  self.tensor.atenMethod("_th_max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_internal*(ty: TensorType; self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty.atenMethod("_th_kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_kthvalue_internal*(self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  self.tensor.atenMethod("_th_kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_internal*(ty: TensorType; self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty.atenMethod("_th_mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_mode_internal*(self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  self.tensor.atenMethod("_th_mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc median*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("median", self.tensor).to(float)

proc median*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("median").to(float)

proc th_median_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty.atenMethod("_th_median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc th_median_internal*(self: Tensor; dim: int64; keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  self.tensor.atenMethod("_th_median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc sort*(ty: TensorType; self: Tensor; dim: int64 = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty.atenMethod("sort", self.tensor, dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc sort*(self: Tensor; dim: int64 = -1; descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  self.tensor.atenMethod("sort", dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk*(ty: TensorType; self: Tensor; k: int64; dim: int64 = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  ty.atenMethod("topk", self.tensor, k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc topk*(self: Tensor; k: int64; dim: int64 = -1; largest: bool = true; sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline.} = 
  self.tensor.atenMethod("topk", k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc all*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("all", self.tensor).to(float)

proc all*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("all").to(float)

proc th_all_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_th_all", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_all_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_all", dim, keepdim).to(ATensor).newTensor()

proc any*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("any", self.tensor).to(float)

proc any*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("any").to(float)

proc th_any_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_th_any", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_any_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_any", dim, keepdim).to(ATensor).newTensor()

proc th_get_device_internal*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("_th_get_device", self.tensor).to(int64)

proc th_get_device_internal*(self: Tensor): int64 {.inline.} = 
  atenFunction("at::_th_get_device", self.tensor).to(int64)

proc abs_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_abs", self.tensor).to(ATensor).newTensor()

proc abs_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_abs").to(ATensor).newTensor()

proc th_sigmoid_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_th_sigmoid", self.tensor).to(ATensor).newTensor()

proc th_sigmoid_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_sigmoid").to(ATensor).newTensor()

proc log_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_log", self.tensor).to(ATensor).newTensor()

proc log_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_log").to(ATensor).newTensor()

proc log10_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_log10", self.tensor).to(ATensor).newTensor()

proc log10_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_log10").to(ATensor).newTensor()

proc log1p_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_log1p", self.tensor).to(ATensor).newTensor()

proc log1p_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_log1p").to(ATensor).newTensor()

proc log2_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_log2", self.tensor).to(ATensor).newTensor()

proc log2_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_log2").to(ATensor).newTensor()

proc lgamma*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc lgamma*(self: Tensor): Tensor {.inline.}

proc lgamma_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("lgamma_", self.tensor).to(void); self

proc lgamma_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("lgamma_").to(void); self

proc digamma*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc digamma*(self: Tensor): Tensor {.inline.}

proc digamma_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("digamma_", self.tensor).to(void); self

proc digamma_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("digamma_").to(void); self

proc polygamma*(ty: TensorType; n: int64; self: Tensor): Tensor {.inline.}

proc polygamma*(n: int64; self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("polygamma", n).to(ATensor).newTensor()

proc polygamma_inplace*(ty: TensorType; self: Tensor; n: int64): Tensor {.inline, discardable.} = 
  ty.atenMethod("polygamma_", self.tensor, n).to(void); self

proc polygamma_inplace*(self: Tensor; n: int64): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("polygamma_", n).to(void); self

proc exp_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_exp", self.tensor).to(ATensor).newTensor()

proc exp_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_exp").to(ATensor).newTensor()

proc expm1_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_expm1", self.tensor).to(ATensor).newTensor()

proc expm1_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_expm1").to(ATensor).newTensor()

proc cos_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_cos", self.tensor).to(ATensor).newTensor()

proc cos_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_cos").to(ATensor).newTensor()

proc acos_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_acos", self.tensor).to(ATensor).newTensor()

proc acos_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_acos").to(ATensor).newTensor()

proc cosh_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_cosh", self.tensor).to(ATensor).newTensor()

proc cosh_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_cosh").to(ATensor).newTensor()

proc sin_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_sin", self.tensor).to(ATensor).newTensor()

proc sin_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_sin").to(ATensor).newTensor()

proc asin_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_asin", self.tensor).to(ATensor).newTensor()

proc asin_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_asin").to(ATensor).newTensor()

proc sinh_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_sinh", self.tensor).to(ATensor).newTensor()

proc sinh_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_sinh").to(ATensor).newTensor()

proc tan_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_tan", self.tensor).to(ATensor).newTensor()

proc tan_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_tan").to(ATensor).newTensor()

proc atan_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_atan", self.tensor).to(ATensor).newTensor()

proc atan_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_atan").to(ATensor).newTensor()

proc th_tanh_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_th_tanh", self.tensor).to(ATensor).newTensor()

proc th_tanh_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_tanh").to(ATensor).newTensor()

proc erf_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_erf", self.tensor).to(ATensor).newTensor()

proc erf_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_erf").to(ATensor).newTensor()

proc erfc_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_erfc", self.tensor).to(ATensor).newTensor()

proc erfc_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_erfc").to(ATensor).newTensor()

proc erfinv_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("erfinv_", self.tensor).to(void); self

proc erfinv_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("erfinv_").to(void); self

proc erfinv*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erfinv*(self: Tensor): Tensor {.inline.}

proc sqrt_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_sqrt", self.tensor).to(ATensor).newTensor()

proc sqrt_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_sqrt").to(ATensor).newTensor()

proc rsqrt_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_rsqrt", self.tensor).to(ATensor).newTensor()

proc rsqrt_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_rsqrt").to(ATensor).newTensor()

proc ceil_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_ceil", self.tensor).to(ATensor).newTensor()

proc ceil_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_ceil").to(ATensor).newTensor()

proc floor_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_floor", self.tensor).to(ATensor).newTensor()

proc floor_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_floor").to(ATensor).newTensor()

proc round_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_round", self.tensor).to(ATensor).newTensor()

proc round_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_round").to(ATensor).newTensor()

proc trunc_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_trunc", self.tensor).to(ATensor).newTensor()

proc trunc_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_trunc").to(ATensor).newTensor()

proc frac_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("frac_", self.tensor).to(void); self

proc frac_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("frac_").to(void); self

proc frac*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc frac*(self: Tensor): Tensor {.inline.}

proc th_var_internal*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_th_var", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_internal*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_var", dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_var_internal*(ty: TensorType; self: Tensor; unbiased: bool = true): float {.inline.} = 
  ty.atenMethod("_th_var", self.tensor, unbiased).to(float)

proc th_var_internal*(self: Tensor; unbiased: bool = true): float {.inline.} = 
  self.tensor.atenMethod("_th_var", unbiased).to(float)

proc th_std_internal*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_th_std", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_internal*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_std", dim, unbiased, keepdim).to(ATensor).newTensor()

proc th_std_internal*(ty: TensorType; self: Tensor; unbiased: bool = true): float {.inline.} = 
  ty.atenMethod("_th_std", self.tensor, unbiased).to(float)

proc th_std_internal*(self: Tensor; unbiased: bool = true): float {.inline.} = 
  self.tensor.atenMethod("_th_std", unbiased).to(float)

proc th_norm*(ty: TensorType; self: Tensor; p: float = 2): float {.inline.} = 
  ty.atenMethod("th_norm", self.tensor, p).to(float)

proc th_norm*(self: Tensor; p: float = 2): float {.inline.} = 
  atenFunction("at::th_norm", self.tensor, p).to(float)

proc th_norm_internal*(ty: TensorType; self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_th_norm", self.tensor, p, dim, keepdim).to(ATensor).newTensor()

proc th_norm_internal*(self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_norm", p, dim, keepdim).to(ATensor).newTensor()

proc renorm*(ty: TensorType; self: Tensor; p: float; dim: int64; maxnorm: float): Tensor {.inline.} = 
  ty.atenMethod("renorm", self.tensor, p, dim, maxnorm).to(ATensor).newTensor()

proc renorm*(self: Tensor; p: float; dim: int64; maxnorm: float): Tensor {.inline.} = 
  self.tensor.atenMethod("renorm", p, dim, maxnorm).to(ATensor).newTensor()

proc renorm_inplace*(ty: TensorType; self: Tensor; p: float; dim: int64; maxnorm: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("renorm_", self.tensor, p, dim, maxnorm).to(void); self

proc renorm_inplace*(self: Tensor; p: float; dim: int64; maxnorm: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("renorm_", p, dim, maxnorm).to(void); self

proc dist*(ty: TensorType; self: Tensor; other: Tensor; p: float = 2): float {.inline.} = 
  ty.atenMethod("dist", self.tensor, other.tensor, p).to(float)

proc dist*(self: Tensor; other: Tensor; p: float = 2): float {.inline.} = 
  self.tensor.atenMethod("dist", other.tensor, p).to(float)

proc reciprocal*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc reciprocal*(self: Tensor): Tensor {.inline.}

proc reciprocal_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("reciprocal_", self.tensor).to(void); self

proc reciprocal_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("reciprocal_").to(void); self

proc neg*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc neg*(self: Tensor): Tensor {.inline.}

proc neg_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("neg_", self.tensor).to(void); self

proc neg_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("neg_").to(void); self

proc atan2*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc atan2*(self: Tensor; other: Tensor): Tensor {.inline.}

proc atan2_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("atan2_", self.tensor, other.tensor).to(void); self

proc atan2_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("atan2_", other.tensor).to(void); self

proc th_pow*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.} = 
  ty.atenMethod("th_pow", self.tensor, exponent).to(ATensor).newTensor()

proc th_pow*(self: Tensor; exponent: float): Tensor {.inline.} = 
  atenFunction("at::th_pow", self.tensor, exponent).to(ATensor).newTensor()

proc pow*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline.}

proc pow*(self: Tensor; exponent: Tensor): Tensor {.inline.}

proc pow*(ty: TensorType; base: float; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("pow", base, self.tensor).to(ATensor).newTensor()

proc pow*(base: float; self: Tensor): Tensor {.inline.} = 
  atenFunction("at::pow", base, self.tensor).to(ATensor).newTensor()

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("pow_", self.tensor, exponent).to(void); self

proc pow_inplace*(self: Tensor; exponent: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("pow_", exponent).to(void); self

proc pow_inplace*(ty: TensorType; self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("pow_", self.tensor, exponent.tensor).to(void); self

proc pow_inplace*(self: Tensor; exponent: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("pow_", exponent.tensor).to(void); self

proc lerp*(ty: TensorType; self: Tensor; end_name: Tensor; weight: float): Tensor {.inline.} = 
  ty.atenMethod("lerp", self.tensor, end_name.tensor, weight).to(ATensor).newTensor()

proc lerp*(self: Tensor; end_name: Tensor; weight: float): Tensor {.inline.} = 
  self.tensor.atenMethod("lerp", end_name.tensor, weight).to(ATensor).newTensor()

proc lerp_inplace*(ty: TensorType; self: Tensor; end_name: Tensor; weight: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("lerp_", self.tensor, end_name.tensor, weight).to(void); self

proc lerp_inplace*(self: Tensor; end_name: Tensor; weight: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("lerp_", end_name.tensor, weight).to(void); self

proc linspace_internal*(ty: TensorType; start: float; end_name: float; steps: int64 = 100): Tensor {.inline.} = 
  ty.atenMethod("_linspace", start, end_name, steps).to(ATensor).newTensor()

proc logspace_internal*(ty: TensorType; start: float; end_name: float; steps: int64 = 100): Tensor {.inline.} = 
  ty.atenMethod("_logspace", start, end_name, steps).to(ATensor).newTensor()

proc histc*(ty: TensorType; self: Tensor; bins: int64 = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  ty.atenMethod("histc", self.tensor, bins, min, max).to(ATensor).newTensor()

proc histc*(self: Tensor; bins: int64 = 100; min: float = 0; max: float = 0): Tensor {.inline.} = 
  self.tensor.atenMethod("histc", bins, min, max).to(ATensor).newTensor()

proc th_zero_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("th_zero_", self.tensor).to(void); self

proc th_zero_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction("at::th_zero_", self.tensor).to(void); self

proc sumall_internal*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("_sumall", self.tensor).to(float)

proc sumall_internal*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("_sumall").to(float)

proc th_sum_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_th_sum", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_sum_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_sum", dim, keepdim).to(ATensor).newTensor()

proc prodall_internal*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("_prodall", self.tensor).to(float)

proc prodall_internal*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("_prodall").to(float)

proc th_prod_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_th_prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc th_prod_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_prod", dim, keepdim).to(ATensor).newTensor()

proc cumsum_internal*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.} = 
  ty.atenMethod("_cumsum", self.tensor, dim).to(ATensor).newTensor()

proc cumsum_internal*(self: Tensor; dim: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("_cumsum", dim).to(ATensor).newTensor()

proc cumprod_internal*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.} = 
  ty.atenMethod("_cumprod", self.tensor, dim).to(ATensor).newTensor()

proc cumprod_internal*(self: Tensor; dim: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("_cumprod", dim).to(ATensor).newTensor()

proc sign*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sign*(self: Tensor): Tensor {.inline.}

proc sign_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("sign_", self.tensor).to(void); self

proc sign_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sign_").to(void); self

proc trace*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("trace", self.tensor).to(float)

proc trace*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("trace").to(float)

proc fmod*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc fmod*(self: Tensor; other: float): Tensor {.inline.}

proc fmod*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc fmod*(self: Tensor; other: Tensor): Tensor {.inline.}

proc fmod_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("fmod_", self.tensor, other).to(void); self

proc fmod_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("fmod_", other).to(void); self

proc fmod_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("fmod_", self.tensor, other.tensor).to(void); self

proc fmod_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("fmod_", other.tensor).to(void); self

proc remainder*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc remainder*(self: Tensor; other: float): Tensor {.inline.}

proc remainder*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc remainder*(self: Tensor; other: Tensor): Tensor {.inline.}

proc remainder_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("remainder_", self.tensor, other).to(void); self

proc remainder_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("remainder_", other).to(void); self

proc remainder_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("remainder_", self.tensor, other.tensor).to(void); self

proc remainder_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("remainder_", other.tensor).to(void); self

proc th_clamp_internal*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline.} = 
  ty.atenMethod("_th_clamp", self.tensor, min, max).to(ATensor).newTensor()

proc th_clamp_internal*(self: Tensor; min: float; max: float): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_clamp", min, max).to(ATensor).newTensor()

proc th_clamp_min_internal*(ty: TensorType; self: Tensor; min: float): Tensor {.inline.} = 
  ty.atenMethod("_th_clamp_min", self.tensor, min).to(ATensor).newTensor()

proc th_clamp_min_internal*(self: Tensor; min: float): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_clamp_min", min).to(ATensor).newTensor()

proc th_clamp_max_internal*(ty: TensorType; self: Tensor; max: float): Tensor {.inline.} = 
  ty.atenMethod("_th_clamp_max", self.tensor, max).to(ATensor).newTensor()

proc th_clamp_max_internal*(self: Tensor; max: float): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_clamp_max", max).to(ATensor).newTensor()

proc dot_internal*(ty: TensorType; self: Tensor; tensor: Tensor): float {.inline.} = 
  ty.atenMethod("_dot", self.tensor, tensor.tensor).to(float)

proc dot_internal*(self: Tensor; tensor: Tensor): float {.inline.} = 
  self.tensor.atenMethod("_dot", tensor.tensor).to(float)

proc tril*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor {.inline.}

proc tril*(self: Tensor; diagonal: int64 = 0): Tensor {.inline.}

proc tril_inplace*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor {.inline, discardable.} = 
  ty.atenMethod("tril_", self.tensor, diagonal).to(void); self

proc tril_inplace*(self: Tensor; diagonal: int64 = 0): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("tril_", diagonal).to(void); self

proc triu*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor {.inline.}

proc triu*(self: Tensor; diagonal: int64 = 0): Tensor {.inline.}

proc triu_inplace*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor {.inline, discardable.} = 
  ty.atenMethod("triu_", self.tensor, diagonal).to(void); self

proc triu_inplace*(self: Tensor; diagonal: int64 = 0): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("triu_", diagonal).to(void); self

proc cross*(ty: TensorType; self: Tensor; other: Tensor; dim: int64 = -1): Tensor {.inline.}

proc cross*(self: Tensor; other: Tensor; dim: int64 = -1): Tensor {.inline.}

proc diag*(ty: TensorType; self: Tensor; diagonal: int64 = 0): Tensor {.inline.} = 
  ty.atenMethod("diag", self.tensor, diagonal).to(ATensor).newTensor()

proc diag*(self: Tensor; diagonal: int64 = 0): Tensor {.inline.} = 
  self.tensor.atenMethod("diag", diagonal).to(ATensor).newTensor()

proc th_addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc th_addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc th_addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(void); self

proc th_addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction("at::th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(void); self

proc addmv_internal*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmv_internal*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addmv_internal_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("_addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(void); self

proc addmv_internal_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("_addmv_", mat.tensor, vec.tensor, beta, alpha).to(void); self

proc addr_internal*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addr_internal*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addr_internal_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("_addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(void); self

proc addr_internal_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("_addr_", vec1.tensor, vec2.tensor, beta, alpha).to(void); self

proc ger_internal*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_ger", self.tensor, vec2.tensor).to(ATensor).newTensor()

proc ger_internal*(self: Tensor; vec2: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_ger", vec2.tensor).to(ATensor).newTensor()

proc mv_internal*(ty: TensorType; self: Tensor; vec: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_mv", self.tensor, vec.tensor).to(ATensor).newTensor()

proc mv_internal*(self: Tensor; vec: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_mv", vec.tensor).to(ATensor).newTensor()

proc mm_internal*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.}

proc mm_internal*(self: Tensor; mat2: Tensor): Tensor {.inline.}

proc bmm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.}

proc bmm*(self: Tensor; mat2: Tensor): Tensor {.inline.}

proc addbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc addbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("addbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(void); self

proc addbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("addbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(void); self

proc baddbmm*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc baddbmm*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc baddbmm_inplace*(ty: TensorType; self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("baddbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(void); self

proc baddbmm_inplace*(self: Tensor; batch1: Tensor; batch2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("baddbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(void); self

proc addcmul*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcmul*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcmul_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("addcmul_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(void); self

proc addcmul_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("addcmul_", tensor1.tensor, tensor2.tensor, value).to(void); self

proc addcdiv*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcdiv*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline.}

proc addcdiv_inplace*(ty: TensorType; self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("addcdiv_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(void); self

proc addcdiv_inplace*(self: Tensor; tensor1: Tensor; tensor2: Tensor; value: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("addcdiv_", tensor1.tensor, tensor2.tensor, value).to(void); self

proc gesv_single_internal*(ty: TensorType; self: Tensor; A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline.} = 
  ty.atenMethod("_gesv_single", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_single_internal*(self: Tensor; A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline.} = 
  self.tensor.atenMethod("_gesv_single", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gels*(ty: TensorType; self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty.atenMethod("gels", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gels*(self: Tensor; A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  self.tensor.atenMethod("gels", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs*(ty: TensorType; self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty.atenMethod("trtrs", self.tensor, A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc trtrs*(self: Tensor; A: Tensor; upper: bool = true; transpose: bool = false; unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  self.tensor.atenMethod("trtrs", A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc symeig*(ty: TensorType; self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty.atenMethod("symeig", self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc symeig*(self: Tensor; eigenvectors: bool = false; upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  self.tensor.atenMethod("symeig", eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc eig*(ty: TensorType; self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty.atenMethod("eig", self.tensor, eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc eig*(self: Tensor; eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  self.tensor.atenMethod("eig", eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc svd*(ty: TensorType; self: Tensor; some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline.} = 
  ty.atenMethod("svd", self.tensor, some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc svd*(self: Tensor; some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline.} = 
  self.tensor.atenMethod("svd", some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc getri_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_getri", self.tensor).to(ATensor).newTensor()

proc getri_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_getri").to(ATensor).newTensor()

proc potrf*(ty: TensorType; self: Tensor; upper: bool = true): Tensor {.inline.} = 
  ty.atenMethod("potrf", self.tensor, upper).to(ATensor).newTensor()

proc potrf*(self: Tensor; upper: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod("potrf", upper).to(ATensor).newTensor()

proc potrs*(ty: TensorType; self: Tensor; input2: Tensor; upper: bool = true): Tensor {.inline.} = 
  ty.atenMethod("potrs", self.tensor, input2.tensor, upper).to(ATensor).newTensor()

proc potrs*(self: Tensor; input2: Tensor; upper: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod("potrs", input2.tensor, upper).to(ATensor).newTensor()

proc potri*(ty: TensorType; self: Tensor; upper: bool = true): Tensor {.inline.} = 
  ty.atenMethod("potri", self.tensor, upper).to(ATensor).newTensor()

proc potri*(self: Tensor; upper: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod("potri", upper).to(ATensor).newTensor()

proc pstrf*(ty: TensorType; self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty.atenMethod("pstrf", self.tensor, upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc pstrf*(self: Tensor; upper: bool = true; tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  self.tensor.atenMethod("pstrf", upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty.atenMethod("qr", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc qr*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  self.tensor.atenMethod("qr").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  ty.atenMethod("geqrf", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc geqrf*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline.} = 
  self.tensor.atenMethod("geqrf").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc orgqr*(ty: TensorType; self: Tensor; input2: Tensor): Tensor {.inline.} = 
  ty.atenMethod("orgqr", self.tensor, input2.tensor).to(ATensor).newTensor()

proc orgqr*(self: Tensor; input2: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("orgqr", input2.tensor).to(ATensor).newTensor()

proc ormqr*(ty: TensorType; self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  ty.atenMethod("ormqr", self.tensor, input2.tensor, input3.tensor, left, transpose).to(ATensor).newTensor()

proc ormqr*(self: Tensor; input2: Tensor; input3: Tensor; left: bool = true; transpose: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("ormqr", input2.tensor, input3.tensor, left, transpose).to(ATensor).newTensor()

proc btrifact*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor] {.inline.} = 
  ty.atenMethod("btrifact", self.tensor, pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact*(self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor] {.inline.} = 
  self.tensor.atenMethod("btrifact", pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info*(ty: TensorType; self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor, info: Tensor] {.inline.} = 
  ty.atenMethod("btrifact_with_info", self.tensor, pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrifact_with_info*(self: Tensor; pivot: bool = true): tuple[result_name: Tensor, pivots: Tensor, info: Tensor] {.inline.} = 
  self.tensor.atenMethod("btrifact_with_info", pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc btrisolve*(ty: TensorType; self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  ty.atenMethod("btrisolve", self.tensor, LU_data.tensor, LU_pivots.tensor).to(ATensor).newTensor()

proc btrisolve*(self: Tensor; LU_data: Tensor; LU_pivots: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("btrisolve", LU_data.tensor, LU_pivots.tensor).to(ATensor).newTensor()

proc random_inplace*(ty: TensorType; self: Tensor; from_name: int64; to_name: int64; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(self: Tensor; from_name: int64; to_name: int64; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(ty: TensorType; self: Tensor; to_name: int64; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(self: Tensor; to_name: int64; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc random_inplace*(self: Tensor; generator: Generator = nil): Tensor {.inline, discardable.}

proc multinomial*(ty: TensorType; self: Tensor; num_samples: int64; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  ty.atenMethod("multinomial", self.tensor, num_samples, replacement, generator).to(ATensor).newTensor()

proc multinomial*(self: Tensor; num_samples: int64; replacement: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  self.tensor.atenMethod("multinomial", num_samples, replacement, generator).to(ATensor).newTensor()

proc uniform_inplace*(ty: TensorType; self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc uniform_inplace*(self: Tensor; from_name: float64 = 0; to_name: float64 = 1; generator: Generator = nil): Tensor {.inline, discardable.}

proc normal*(ty: TensorType; mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.}

proc normal*(mean: Tensor; std: float64 = 1; generator: Generator = nil): Tensor {.inline.}

proc normal*(ty: TensorType; mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.}

proc normal*(mean: float64; std: Tensor; generator: Generator = nil): Tensor {.inline.}

proc normal*(ty: TensorType; mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.}

proc normal*(mean: Tensor; std: Tensor; generator: Generator = nil): Tensor {.inline.}

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

proc bernoulli_internal_inplace*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty.atenMethod("_bernoulli_", self.tensor, p, generator).to(void); self

proc bernoulli_internal_inplace*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("_bernoulli_", p, generator).to(void); self

proc th_bernoulli_internal*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  ty.atenMethod("_th_bernoulli", self.tensor, generator).to(ATensor).newTensor()

proc th_bernoulli_internal*(self: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  self.tensor.atenMethod("_th_bernoulli", generator).to(ATensor).newTensor()

proc dirichlet_grad_internal*(ty: TensorType; x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor).newTensor()

proc dirichlet_grad_internal*(x: Tensor; alpha: Tensor; total: Tensor): Tensor {.inline.} = 
  atenFunction("at::_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor).newTensor()

proc th_tensor*(ty: TensorType; size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("th_tensor", size.toAIntList()).to(ATensor).newTensor()

proc th_tensor*(ty: TensorType; ): Tensor {.inline.} = 
  ty.atenMethod("th_tensor").to(ATensor).newTensor()

proc tensor*(ty: TensorType; storage: AStorage; storageOffset: int64; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("tensor", storage, storageOffset, size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc tensor*(ty: TensorType; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("tensor", size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc alias*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc alias*(self: Tensor): Tensor {.inline.}

proc copy_ignoring_overlaps_internal_inplace*(ty: TensorType; self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("_copy_ignoring_overlaps_", self.tensor, src.tensor).to(void); self

proc copy_ignoring_overlaps_internal_inplace*(self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("_copy_ignoring_overlaps_", src.tensor).to(void); self

proc cat_internal*(ty: TensorType; tensors: openarray[Tensor]; dim: int64 = 0): Tensor {.inline.} = 
  ty.atenMethod("_cat", tensors.toATensors(), dim).to(ATensor).newTensor()

proc cat_internal*(tensors: openarray[Tensor]; dim: int64 = 0): Tensor {.inline.} = 
  atenFunction("at::_cat", tensors.toATensors(), dim).to(ATensor).newTensor()

proc binary_cross_entropy*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor {.inline.}

proc binary_cross_entropy*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor {.inline.}

proc binary_cross_entropy_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()

proc binary_cross_entropy_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor).newTensor()

proc kl_div*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div*(self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc kl_div_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc l1_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc mse_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc mse_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc mse_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc mse_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc multi_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor {.inline.}

proc multi_margin_loss*(self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor {.inline.}

proc multi_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()

proc multi_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; p: float; margin: float; weight: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor).newTensor()

proc multilabel_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): tuple[output: Tensor, is_target: Tensor] {.inline.}

proc multilabel_margin_loss*(self: Tensor; target: Tensor; reduction: int64): tuple[output: Tensor, is_target: Tensor] {.inline.}

proc multilabel_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64; is_target: Tensor): Tensor {.inline.} = 
  ty.atenMethod("multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor).newTensor()

proc multilabel_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64; is_target: Tensor): Tensor {.inline.} = 
  atenFunction("at::multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor).newTensor()

proc nll_loss*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor {.inline.}

proc nll_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor {.inline.}

proc nll_loss2d*(ty: TensorType; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss2d*(self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline.}

proc nll_loss2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor {.inline.}

proc nll_loss2d_backward*(grad_output: Tensor; self: Tensor; target: Tensor; weight: Tensor; reduction: int64; ignore_index: int64; total_weight: Tensor): Tensor {.inline.}

proc smooth_l1_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc smooth_l1_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc smooth_l1_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc smooth_l1_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc soft_margin_loss*(ty: TensorType; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc soft_margin_loss*(self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.}

proc soft_margin_loss_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc soft_margin_loss_backward*(grad_output: Tensor; self: Tensor; target: Tensor; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor).newTensor()

proc elu*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.}

proc elu*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline.}

proc elu_backward*(ty: TensorType; grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  ty.atenMethod("elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor).newTensor()

proc elu_backward*(grad_output: Tensor; alpha: float; scale: float; input_scale: float; output: Tensor): Tensor {.inline.} = 
  atenFunction("at::elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor).newTensor()

proc elu_inplace*(ty: TensorType; self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("elu_forward_", self.tensor, alpha, scale, input_scale).to(void); self

proc elu_inplace*(self: Tensor; alpha: float; scale: float; input_scale: float): Tensor {.inline, discardable.} = 
  atenFunction("at::elu_forward_", self.tensor, alpha, scale, input_scale).to(void); self

proc glu*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.}

proc glu*(self: Tensor; dim: int64): Tensor {.inline.}

proc glu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; dim: int64): Tensor {.inline.} = 
  ty.atenMethod("glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor).newTensor()

proc glu_backward*(grad_output: Tensor; self: Tensor; dim: int64): Tensor {.inline.} = 
  atenFunction("at::glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor).newTensor()

proc hardtanh*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline.}

proc hardtanh*(self: Tensor; min_val: float; max_val: float): Tensor {.inline.}

proc hardtanh_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.}

proc hardtanh_backward*(grad_output: Tensor; self: Tensor; min_val: float; max_val: float): Tensor {.inline.}

proc hardtanh_inplace*(ty: TensorType; self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.}

proc hardtanh_inplace*(self: Tensor; min_val: float; max_val: float): Tensor {.inline, discardable.}

proc leaky_relu*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu*(self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu_backward*(grad_output: Tensor; self: Tensor; negative_slope: float): Tensor {.inline.}

proc leaky_relu_inplace*(ty: TensorType; self: Tensor; negative_slope: float): Tensor {.inline, discardable.}

proc leaky_relu_inplace*(self: Tensor; negative_slope: float): Tensor {.inline, discardable.}

proc log_sigmoid*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.}

proc log_sigmoid*(self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline.}

proc log_sigmoid_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  ty.atenMethod("log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor).newTensor()

proc log_sigmoid_backward*(grad_output: Tensor; self: Tensor; buffer: Tensor): Tensor {.inline.} = 
  atenFunction("at::log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor).newTensor()

proc prelu*(ty: TensorType; self: Tensor; weight: Tensor): Tensor {.inline.}

proc prelu*(self: Tensor; weight: Tensor): Tensor {.inline.}

proc prelu_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  ty.atenMethod("prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc prelu_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  atenFunction("at::prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rrelu_with_noise*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.}

proc rrelu_with_noise*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline.}

proc rrelu_with_noise_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.}

proc rrelu_with_noise_backward*(grad_output: Tensor; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool): Tensor {.inline.}

proc rrelu_with_noise_inplace*(ty: TensorType; self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.}

proc rrelu_with_noise_inplace*(self: Tensor; noise: Tensor; lower: float; upper: float; training: bool; generator: Generator): Tensor {.inline, discardable.}

proc softplus*(ty: TensorType; self: Tensor; beta: float; threshold: float): Tensor {.inline.}

proc softplus*(self: Tensor; beta: float; threshold: float): Tensor {.inline.}

proc softplus_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  ty.atenMethod("softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor).newTensor()

proc softplus_backward*(grad_output: Tensor; self: Tensor; beta: float; threshold: float; output: Tensor): Tensor {.inline.} = 
  atenFunction("at::softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor).newTensor()

proc softshrink*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.}

proc softshrink*(self: Tensor; lambd: float): Tensor {.inline.}

proc softshrink_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc softshrink_backward*(grad_output: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc threshold*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor {.inline.}

proc threshold*(self: Tensor; threshold: float; value: float): Tensor {.inline.}

proc threshold_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor {.inline.}

proc threshold_backward*(grad_output: Tensor; self: Tensor; threshold: float; value: float): Tensor {.inline.}

proc threshold_inplace*(ty: TensorType; self: Tensor; threshold: float; value: float): Tensor {.inline, discardable.}

proc threshold_inplace*(self: Tensor; threshold: float; value: float): Tensor {.inline, discardable.}

proc adaptive_avg_pool2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc adaptive_avg_pool2d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc adaptive_avg_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_avg_pool2d_backward*(grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_avg_pool3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc adaptive_avg_pool3d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc adaptive_avg_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_avg_pool3d_backward*(grad_output: Tensor; self: Tensor): Tensor {.inline.}

proc adaptive_max_pool2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool2d*(self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  ty.atenMethod("adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  atenFunction("at::adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool3d*(self: Tensor; output_size: openarray[SomeInteger]): tuple[output: Tensor, indices: Tensor] {.inline.}

proc adaptive_max_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  ty.atenMethod("adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc adaptive_max_pool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor): Tensor {.inline.} = 
  atenFunction("at::adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor).newTensor()

proc avg_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool2d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool2d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool3d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool3d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc avg_pool3d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; ceil_mode: bool; count_include_pad: bool): Tensor {.inline.}

proc fractional_max_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.}

proc fractional_max_pool2d*(self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline.}

proc fractional_max_pool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; indices: Tensor): Tensor {.inline.} = 
  ty.atenMethod("fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), output_size.toAIntList(), indices.tensor).to(ATensor).newTensor()

proc fractional_max_pool2d_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; output_size: openarray[SomeInteger]; indices: Tensor): Tensor {.inline.} = 
  atenFunction("at::fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), output_size.toAIntList(), indices.tensor).to(ATensor).newTensor()

proc max_pool2d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool2d_with_indices*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool2d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  ty.atenMethod("max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool2d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  atenFunction("at::max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool3d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool3d_with_indices*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline.}

proc max_pool3d_with_indices_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  ty.atenMethod("max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_pool3d_with_indices_backward*(grad_output: Tensor; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; ceil_mode: bool; indices: Tensor): Tensor {.inline.} = 
  atenFunction("at::max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode, indices.tensor).to(ATensor).newTensor()

proc max_unpool2d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc max_unpool2d*(self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc max_unpool2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc max_unpool2d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc max_unpool3d*(ty: TensorType; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor {.inline.}

proc max_unpool3d*(self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor {.inline.}

proc max_unpool3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc max_unpool3d_backward*(grad_output: Tensor; self: Tensor; indices: Tensor; output_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): Tensor {.inline.} = 
  atenFunction("at::max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size.toAIntList(), stride.toAIntList(), padding.toAIntList()).to(ATensor).newTensor()

proc reflection_pad1d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc reflection_pad1d*(self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc reflection_pad1d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc reflection_pad1d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc reflection_pad2d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc reflection_pad2d*(self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc reflection_pad2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc reflection_pad2d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad1d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad1d*(self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad1d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad1d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad2d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad2d*(self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad2d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad3d*(ty: TensorType; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad3d*(self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc replication_pad3d_backward*(grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_linear1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_linear1d*(self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_linear1d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_linear1d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d*(self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_bilinear2d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d*(self: Tensor; output_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_trilinear3d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]; align_corners: bool): Tensor {.inline.}

proc upsample_nearest1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest1d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest1d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest1d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest2d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest2d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest2d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest2d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest3d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest3d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest3d_backward*(ty: TensorType; grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor {.inline.}

proc upsample_nearest3d_backward*(grad_output: Tensor; output_size: openarray[SomeInteger]; input_size: openarray[SomeInteger]): Tensor {.inline.}

proc sigmoid_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_sigmoid_forward", self.tensor).to(ATensor).newTensor()

proc sigmoid_internal*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::_sigmoid_forward", self.tensor).to(ATensor).newTensor()

proc sigmoid_backward_internal*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc sigmoid_backward_internal*(grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc tanh_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_tanh_forward", self.tensor).to(ATensor).newTensor()

proc tanh_internal*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::_tanh_forward", self.tensor).to(ATensor).newTensor()

proc tanh_backward_internal*(ty: TensorType; grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc tanh_backward_internal*(grad_output: Tensor; output: Tensor): Tensor {.inline.}

proc thnn_batch_norm*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline.}

proc thnn_batch_norm*(self: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline.}

proc thnn_batch_norm_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; eps: float64; save_mean: Tensor; save_std: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty.atenMethod("thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_batch_norm_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; eps: float64; save_mean: Tensor; save_std: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction("at::thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_transpose2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_transpose2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty.atenMethod("thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction("at::thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv_transpose3d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv_transpose3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty.atenMethod("thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_transpose3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction("at::thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), output_padding.toAIntList(), dilation.toAIntList(), finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty.atenMethod("thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction("at::thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): Tensor {.inline.}

proc thnn_conv_depthwise2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): Tensor {.inline.}

proc thnn_conv_depthwise2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  ty.atenMethod("thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_depthwise2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline.} = 
  atenFunction("at::thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv3d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline.}

proc thnn_conv3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty.atenMethod("thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; finput: Tensor; fgrad_input: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction("at::thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated2d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated2d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty.atenMethod("thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated2d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction("at::thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d*(ty: TensorType; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated3d*(self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline.}

proc thnn_conv_dilated3d_backward*(ty: TensorType; grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  ty.atenMethod("thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_conv_dilated3d_backward*(grad_output: Tensor; self: Tensor; weight: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; columns: Tensor; ones: Tensor; output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline.} = 
  atenFunction("at::thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cast_Byte_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Byte", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Byte_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Byte", non_blocking).to(ATensor).newTensor()

proc cast_Char_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Char", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Char_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Char", non_blocking).to(ATensor).newTensor()

proc cast_Double_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Double", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Double_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Double", non_blocking).to(ATensor).newTensor()

proc cast_Float_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Float", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Float_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Float", non_blocking).to(ATensor).newTensor()

proc cast_Int_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Int", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Int_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Int", non_blocking).to(ATensor).newTensor()

proc cast_Long_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Long", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Long_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Long", non_blocking).to(ATensor).newTensor()

proc cast_Short_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Short", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Short_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Short", non_blocking).to(ATensor).newTensor()

proc cast_Half_internal*(ty: TensorType; self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_cast_Half", self.tensor, non_blocking).to(ATensor).newTensor()

proc cast_Half_internal*(self: Tensor; non_blocking: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_cast_Half", non_blocking).to(ATensor).newTensor()

proc cudnn_ctc_loss_internal*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc cudnn_ctc_loss_internal*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64; deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc cudnn_rnn_flatten_weight_internal*(ty: TensorType; weight_arr: openarray[Tensor]; weight_stride0: int64; input_size: int64; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; bidirectional: bool): Tensor {.inline.} = 
  ty.atenMethod("_cudnn_rnn_flatten_weight", weight_arr.toATensors(), weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_flatten_weight_internal*(weight_arr: openarray[Tensor]; weight_stride0: int64; input_size: int64; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; bidirectional: bool): Tensor {.inline.} = 
  atenFunction("at::_cudnn_rnn_flatten_weight", weight_arr.toATensors(), weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor).newTensor()

proc cudnn_rnn_internal*(ty: TensorType; input: Tensor; weight: openarray[Tensor]; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.}

proc cudnn_rnn_internal*(input: Tensor; weight: openarray[Tensor]; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.}

proc cudnn_rnn_backward_internal*(ty: TensorType; input: Tensor; weight: openarray[Tensor]; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline.} = 
  ty.atenMethod("_cudnn_rnn_backward", input.tensor, weight.toATensors(), weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, ATensors]).toNimTuple().newTensors()

proc cudnn_rnn_backward_internal*(input: Tensor; weight: openarray[Tensor]; weight_stride0: int64; weight_buf: Tensor; hx: Tensor; cx: Tensor; output: Tensor; grad_output: Tensor; grad_hy: Tensor; grad_cy: Tensor; mode: int64; hidden_size: int64; num_layers: int64; batch_first: bool; dropout: float64; train: bool; bidirectional: bool; batch_sizes: openarray[SomeInteger]; dropout_state: Tensor; reserve: Tensor; output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline.} = 
  atenFunction("at::_cudnn_rnn_backward", input.tensor, weight.toATensors(), weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes.toAIntList(), dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, ATensors]).toNimTuple().newTensors()

proc cudnn_init_dropout_state_internal*(ty: TensorType; self_ty: TensorType; dropout: float64; train: bool; dropout_seed: int64): Tensor {.inline.} = 
  ty.atenMethod("_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor).newTensor()

proc cudnn_init_dropout_state_internal*(self_ty: TensorType; dropout: float64; train: bool; dropout_seed: int64): Tensor {.inline.} = 
  atenFunction("at::_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor).newTensor()

proc fused_dropout_internal*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("_fused_dropout", self.tensor, p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc fused_dropout_internal*(self: Tensor; p: float64; generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("_fused_dropout", p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc masked_scale_internal*(ty: TensorType; self: Tensor; mask: Tensor; scale: float64): Tensor {.inline.} = 
  ty.atenMethod("_masked_scale", self.tensor, mask.tensor, scale).to(ATensor).newTensor()

proc masked_scale_internal*(self: Tensor; mask: Tensor; scale: float64): Tensor {.inline.} = 
  self.tensor.atenMethod("_masked_scale", mask.tensor, scale).to(ATensor).newTensor()

proc dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  ty.atenMethod("dropout", input.tensor, p, train).to(ATensor).newTensor()

proc dropout*(input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  atenFunction("at::dropout", input.tensor, p, train).to(ATensor).newTensor()

proc dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  ty.atenMethod("dropout_", self.tensor, p, train).to(void); self

proc dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  atenFunction("at::dropout_", self.tensor, p, train).to(void); self

proc feature_dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  ty.atenMethod("feature_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout*(input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  atenFunction("at::feature_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  ty.atenMethod("feature_dropout_", self.tensor, p, train).to(void); self

proc feature_dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  atenFunction("at::feature_dropout_", self.tensor, p, train).to(void); self

proc alpha_dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  ty.atenMethod("alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout*(input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  atenFunction("at::alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc alpha_dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  ty.atenMethod("alpha_dropout_", self.tensor, p, train).to(void); self

proc alpha_dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  atenFunction("at::alpha_dropout_", self.tensor, p, train).to(void); self

proc feature_alpha_dropout*(ty: TensorType; input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  ty.atenMethod("feature_alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout*(input: Tensor; p: float64; train: bool): Tensor {.inline.} = 
  atenFunction("at::feature_alpha_dropout", input.tensor, p, train).to(ATensor).newTensor()

proc feature_alpha_dropout_inplace*(ty: TensorType; self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  ty.atenMethod("feature_alpha_dropout_", self.tensor, p, train).to(void); self

proc feature_alpha_dropout_inplace*(self: Tensor; p: float64; train: bool): Tensor {.inline, discardable.} = 
  atenFunction("at::feature_alpha_dropout_", self.tensor, p, train).to(void); self

proc abs*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc abs*(self: Tensor): Tensor {.inline.}

proc abs_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("abs_", self.tensor).to(void); self

proc abs_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("abs_").to(void); self

proc acos*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc acos*(self: Tensor): Tensor {.inline.}

proc acos_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("acos_", self.tensor).to(void); self

proc acos_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("acos_").to(void); self

proc avg_pool1d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor {.inline.} = 
  ty.atenMethod("avg_pool1d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc avg_pool1d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; ceil_mode: bool = false; count_include_pad: bool = true): Tensor {.inline.} = 
  atenFunction("at::avg_pool1d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), ceil_mode, count_include_pad).to(ATensor).newTensor()

proc adaptive_avg_pool1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("adaptive_avg_pool1d", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()

proc adaptive_avg_pool1d*(self: Tensor; output_size: openarray[SomeInteger]): Tensor {.inline.} = 
  atenFunction("at::adaptive_avg_pool1d", self.tensor, output_size.toAIntList()).to(ATensor).newTensor()

proc adaptive_max_pool1d*(ty: TensorType; self: Tensor; output_size: openarray[SomeInteger]): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("adaptive_max_pool1d", self.tensor, output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc adaptive_max_pool1d*(self: Tensor; output_size: openarray[SomeInteger]): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::adaptive_max_pool1d", self.tensor, output_size.toAIntList()).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc add*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc add*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc add_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("add_", self.tensor, other.tensor, alpha).to(void); self

proc add_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("add_", other.tensor, alpha).to(void); self

proc add*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc add*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc add_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("add_", self.tensor, other, alpha).to(void); self

proc add_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("add_", other, alpha).to(void); self

proc addmv*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty.atenMethod("addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  self.tensor.atenMethod("addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor).newTensor()

proc addmv_inplace*(ty: TensorType; self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(void); self

proc addmv_inplace*(self: Tensor; mat: Tensor; vec: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("addmv_", mat.tensor, vec.tensor, beta, alpha).to(void); self

proc addr*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty.atenMethod("addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  self.tensor.atenMethod("addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor).newTensor()

proc addr_inplace*(ty: TensorType; self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(void); self

proc addr_inplace*(self: Tensor; vec1: Tensor; vec2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("addr_", vec1.tensor, vec2.tensor, beta, alpha).to(void); self

proc all*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("all", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc all*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("all", dim, keepdim).to(ATensor).newTensor()

proc allclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool {.inline.} = 
  ty.atenMethod("allclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(bool)

proc allclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): bool {.inline.} = 
  self.tensor.atenMethod("allclose", other.tensor, rtol, atol, equal_nan).to(bool)

proc any*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("any", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc any*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("any", dim, keepdim).to(ATensor).newTensor()

proc arange*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("arange", start, end_name, options).to(ATensor).newTensor()

proc arange*(start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::arange", start, end_name, options).to(ATensor).newTensor()

proc arange*(ty: TensorType; start: float; end_name: float; step: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("arange", start, end_name, step, options).to(ATensor).newTensor()

proc arange*(start: float; end_name: float; step: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::arange", start, end_name, step, options).to(ATensor).newTensor()

proc arange*(ty: TensorType; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("arange", end_name, options).to(ATensor).newTensor()

proc arange*(end_name: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::arange", end_name, options).to(ATensor).newTensor()

proc dim_arange_internal*(ty: TensorType; like: Tensor; dim: int64): Tensor {.inline.} = 
  ty.atenMethod("_dim_arange", like.tensor, dim).to(ATensor).newTensor()

proc dim_arange_internal*(like: Tensor; dim: int64): Tensor {.inline.} = 
  atenFunction("at::_dim_arange", like.tensor, dim).to(ATensor).newTensor()

proc argmax*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("argmax", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmax*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("argmax", dim, keepdim).to(ATensor).newTensor()

proc argmax*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("argmax", self.tensor).to(ATensor).newTensor()

proc argmax*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("argmax").to(ATensor).newTensor()

proc argmax_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_argmax", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmax_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_argmax", dim, keepdim).to(ATensor).newTensor()

proc argmin*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("argmin", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmin*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("argmin", dim, keepdim).to(ATensor).newTensor()

proc argmin*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("argmin", self.tensor).to(ATensor).newTensor()

proc argmin*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("argmin").to(ATensor).newTensor()

proc argmin_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_argmin", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc argmin_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_argmin", dim, keepdim).to(ATensor).newTensor()

proc as_strided*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("as_strided", self.tensor, size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc as_strided*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline.} = 
  self.tensor.atenMethod("as_strided", size.toAIntList(), stride.toAIntList()).to(ATensor).newTensor()

proc as_strided_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline, discardable.} = 
  ty.atenMethod("as_strided_", self.tensor, size.toAIntList(), stride.toAIntList()).to(void); self

proc as_strided_inplace*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("as_strided_", size.toAIntList(), stride.toAIntList()).to(void); self

proc as_strided*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor {.inline.} = 
  ty.atenMethod("as_strided", self.tensor, size.toAIntList(), stride.toAIntList(), storage_offset).to(ATensor).newTensor()

proc as_strided*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("as_strided", size.toAIntList(), stride.toAIntList(), storage_offset).to(ATensor).newTensor()

proc as_strided_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor {.inline, discardable.} = 
  ty.atenMethod("as_strided_", self.tensor, size.toAIntList(), stride.toAIntList(), storage_offset).to(void); self

proc as_strided_inplace*(self: Tensor; size: openarray[SomeInteger]; stride: openarray[SomeInteger]; storage_offset: int64): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("as_strided_", size.toAIntList(), stride.toAIntList(), storage_offset).to(void); self

proc asin*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc asin*(self: Tensor): Tensor {.inline.}

proc asin_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("asin_", self.tensor).to(void); self

proc asin_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("asin_").to(void); self

proc atan*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc atan*(self: Tensor): Tensor {.inline.}

proc atan_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("atan_", self.tensor).to(void); self

proc atan_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("atan_").to(void); self

proc bartlett_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window*(window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::bartlett_window", window_length, options).to(ATensor).newTensor()

proc bartlett_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc bartlett_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::bartlett_window", window_length, periodic, options).to(ATensor).newTensor()

proc batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  ty.atenMethod("batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; momentum: float64; eps: float64; cudnn_enabled: bool): Tensor {.inline.} = 
  atenFunction("at::batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor).newTensor()

proc bernoulli*(ty: TensorType; self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  ty.atenMethod("bernoulli", self.tensor, p.tensor, generator).to(ATensor).newTensor()

proc bernoulli*(self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline.} = 
  self.tensor.atenMethod("bernoulli", p.tensor, generator).to(ATensor).newTensor()

proc bernoulli*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline.}

proc bernoulli*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline.}

proc bernoulli*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("bernoulli", self.tensor).to(ATensor).newTensor()

proc bernoulli*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("bernoulli").to(ATensor).newTensor()

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty.atenMethod("bernoulli_", self.tensor, p.tensor, generator).to(void); self

proc bernoulli_inplace*(self: Tensor; p: Tensor; generator: Generator = nil): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("bernoulli_", p.tensor, generator).to(void); self

proc bernoulli_inplace*(ty: TensorType; self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty.atenMethod("bernoulli_", self.tensor, p, generator).to(void); self

proc bernoulli_inplace*(self: Tensor; p: float64; generator: Generator = nil): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("bernoulli_", p, generator).to(void); self

proc bernoulli_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("bernoulli_", self.tensor).to(void); self

proc bernoulli_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("bernoulli_").to(void); self

proc bilinear*(ty: TensorType; input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  ty.atenMethod("bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor).newTensor()

proc bilinear*(input1: Tensor; input2: Tensor; weight: Tensor; bias: Tensor): Tensor {.inline.} = 
  atenFunction("at::bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor).newTensor()

proc bincount*(ty: TensorType; self: Tensor; weights: Tensor; minlength: int64 = 0): Tensor {.inline.} = 
  ty.atenMethod("bincount", self.tensor, weights.tensor, minlength).to(ATensor).newTensor()

proc bincount*(self: Tensor; weights: Tensor; minlength: int64 = 0): Tensor {.inline.} = 
  self.tensor.atenMethod("bincount", weights.tensor, minlength).to(ATensor).newTensor()

proc blackman_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window*(window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::blackman_window", window_length, options).to(ATensor).newTensor()

proc blackman_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc blackman_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::blackman_window", window_length, periodic, options).to(ATensor).newTensor()

proc broadcast_tensors*(ty: TensorType; tensors: openarray[Tensor]): TensorList {.inline.} = 
  ty.atenMethod("broadcast_tensors", tensors.toATensors()).to(ATensors).newTensors()

proc broadcast_tensors*(tensors: openarray[Tensor]): TensorList {.inline.} = 
  atenFunction("at::broadcast_tensors", tensors.toATensors()).to(ATensors).newTensors()

proc cat*(ty: TensorType; tensors: openarray[Tensor]; dim: int64 = 0): Tensor {.inline.}

proc cat*(tensors: openarray[Tensor]; dim: int64 = 0): Tensor {.inline.}

proc ceil*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc ceil*(self: Tensor): Tensor {.inline.}

proc ceil_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("ceil_", self.tensor).to(void); self

proc ceil_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("ceil_").to(void); self

proc clamp*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline.} = 
  ty.atenMethod("clamp", self.tensor, min, max).to(ATensor).newTensor()

proc clamp*(self: Tensor; min: float; max: float): Tensor {.inline.} = 
  self.tensor.atenMethod("clamp", min, max).to(ATensor).newTensor()

proc clamp_inplace*(ty: TensorType; self: Tensor; min: float; max: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("clamp_", self.tensor, min, max).to(void); self

proc clamp_inplace*(self: Tensor; min: float; max: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("clamp_", min, max).to(void); self

proc clamp_max*(ty: TensorType; self: Tensor; max: float): Tensor {.inline.}

proc clamp_max*(self: Tensor; max: float): Tensor {.inline.}

proc clamp_max_inplace*(ty: TensorType; self: Tensor; max: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("clamp_max_", self.tensor, max).to(void); self

proc clamp_max_inplace*(self: Tensor; max: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("clamp_max_", max).to(void); self

proc clamp_min*(ty: TensorType; self: Tensor; min: float): Tensor {.inline.}

proc clamp_min*(self: Tensor; min: float): Tensor {.inline.}

proc clamp_min_inplace*(ty: TensorType; self: Tensor; min: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("clamp_min_", self.tensor, min).to(void); self

proc clamp_min_inplace*(self: Tensor; min: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("clamp_min_", min).to(void); self

proc cudnn_is_acceptable*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("cudnn_is_acceptable", self.tensor).to(bool)

proc cudnn_is_acceptable*(self: Tensor): bool {.inline.} = 
  atenFunction("at::cudnn_is_acceptable", self.tensor).to(bool)

proc convolution_nogroup_internal*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList()).to(ATensor).newTensor()

proc convolution_nogroup_internal*(input: Tensor; weight: Tensor; bias: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]): Tensor {.inline.} = 
  atenFunction("at::_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList()).to(ATensor).newTensor()

proc convolution_double_backward_internal*(ty: TensorType; ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList(), groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc convolution_double_backward_internal*(ggI: Tensor; ggW: Tensor; ggb: Tensor; gO: Tensor; weight: Tensor; self: Tensor; stride: openarray[SomeInteger]; padding: openarray[SomeInteger]; dilation: openarray[SomeInteger]; transposed: bool; output_padding: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; cudnn_enabled: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), transposed, output_padding.toAIntList(), groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_tbc*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; pad: int64): Tensor {.inline.}

proc conv_tbc*(self: Tensor; weight: Tensor; bias: Tensor; pad: int64): Tensor {.inline.}

proc conv_tbc_backward*(ty: TensorType; self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc conv_tbc_backward*(self: Tensor; input: Tensor; weight: Tensor; bias: Tensor; pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cos*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc cos*(self: Tensor): Tensor {.inline.}

proc cos_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("cos_", self.tensor).to(void); self

proc cos_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("cos_").to(void); self

proc cosh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc cosh*(self: Tensor): Tensor {.inline.}

proc cosh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("cosh_", self.tensor).to(void); self

proc cosh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("cosh_").to(void); self

proc cosine_embedding_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc cosine_embedding_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc cudnn_affine_grid_generator*(ty: TensorType; theta: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor {.inline.}

proc cudnn_affine_grid_generator*(theta: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor {.inline.}

proc cudnn_affine_grid_generator_backward*(ty: TensorType; grad: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor {.inline.} = 
  ty.atenMethod("cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor).newTensor()

proc cudnn_affine_grid_generator_backward*(grad: Tensor; N: int64; C: int64; H: int64; W: int64): Tensor {.inline.} = 
  atenFunction("at::cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor).newTensor()

proc cudnn_batch_norm*(ty: TensorType; input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc cudnn_batch_norm*(input: Tensor; weight: Tensor; bias: Tensor; running_mean: Tensor; running_var: Tensor; training: bool; exponential_average_factor: float64; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc cudnn_batch_norm_backward*(ty: TensorType; input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_batch_norm_backward*(input: Tensor; grad_output: Tensor; weight: Tensor; running_mean: Tensor; running_var: Tensor; save_mean: Tensor; save_var: Tensor; epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_backward_input*(ty: TensorType; self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty.atenMethod("cudnn_convolution_backward_input", self_size.toAIntList(), grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_input*(self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction("at::cudnn_convolution_backward_input", self_size.toAIntList(), grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  ty.atenMethod("cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  atenFunction("at::cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight*(ty: TensorType; weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty.atenMethod("cudnn_convolution_backward_weight", weight_size.toAIntList(), grad_output.tensor, self.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_backward_weight*(weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction("at::cudnn_convolution_backward_weight", weight_size.toAIntList(), grad_output.tensor, self.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_transpose*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.}

proc cudnn_convolution_transpose_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; output_padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList(), output_padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_convolution_transpose_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline.} = 
  ty.atenMethod("cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_bias*(grad_output: Tensor): Tensor {.inline.} = 
  atenFunction("at::cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input*(ty: TensorType; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty.atenMethod("cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_input*(grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction("at::cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight*(ty: TensorType; weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  ty.atenMethod("cudnn_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.tensor, self.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_convolution_transpose_backward_weight*(weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; benchmark: bool; deterministic: bool): Tensor {.inline.} = 
  atenFunction("at::cudnn_convolution_transpose_backward_weight", weight_size.toAIntList(), grad_output.tensor, self.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, benchmark, deterministic).to(ATensor).newTensor()

proc cudnn_grid_sampler*(ty: TensorType; self: Tensor; grid: Tensor): Tensor {.inline.}

proc cudnn_grid_sampler*(self: Tensor; grid: Tensor): Tensor {.inline.}

proc cudnn_grid_sampler_backward*(ty: TensorType; self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline.} = 
  ty.atenMethod("cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cudnn_grid_sampler_backward*(self: Tensor; grid: Tensor; grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline.} = 
  atenFunction("at::cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc cumsum*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("cumsum", self.tensor, dim, dtype).to(ATensor).newTensor()

proc cumsum*(self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("cumsum", dim, dtype).to(ATensor).newTensor()

proc cumsum*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.} = 
  ty.atenMethod("cumsum", self.tensor, dim).to(ATensor).newTensor()

proc cumsum*(self: Tensor; dim: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("cumsum", dim).to(ATensor).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("cumprod", self.tensor, dim, dtype).to(ATensor).newTensor()

proc cumprod*(self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("cumprod", dim, dtype).to(ATensor).newTensor()

proc cumprod*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.} = 
  ty.atenMethod("cumprod", self.tensor, dim).to(ATensor).newTensor()

proc cumprod*(self: Tensor; dim: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("cumprod", dim).to(ATensor).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int64 = 0; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor).newTensor()

proc ctc_loss*(log_probs: Tensor; targets: Tensor; input_lengths: Tensor; target_lengths: Tensor; blank: int64 = 0; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor).newTensor()

proc ctc_loss_internal*(ty: TensorType; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc ctc_loss_internal*(log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; blank: int64 = 0): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc ctc_loss_backward_internal*(ty: TensorType; grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int64): Tensor {.inline.} = 
  ty.atenMethod("_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor).newTensor()

proc ctc_loss_backward_internal*(grad: Tensor; log_probs: Tensor; targets: Tensor; input_lengths: openarray[SomeInteger]; target_lengths: openarray[SomeInteger]; neg_log_likelihood: Tensor; log_alpha: Tensor; blank: int64): Tensor {.inline.} = 
  atenFunction("at::_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths.toAIntList(), target_lengths.toAIntList(), neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor).newTensor()

proc det*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("det", self.tensor).to(ATensor).newTensor()

proc det*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("det").to(ATensor).newTensor()

proc diagflat*(ty: TensorType; self: Tensor; offset: int64 = 0): Tensor {.inline.} = 
  ty.atenMethod("diagflat", self.tensor, offset).to(ATensor).newTensor()

proc diagflat*(self: Tensor; offset: int64 = 0): Tensor {.inline.} = 
  self.tensor.atenMethod("diagflat", offset).to(ATensor).newTensor()

proc diagonal*(ty: TensorType; self: Tensor; offset: int64 = 0; dim1: int64 = 0; dim2: int64 = 1): Tensor {.inline.} = 
  ty.atenMethod("diagonal", self.tensor, offset, dim1, dim2).to(ATensor).newTensor()

proc diagonal*(self: Tensor; offset: int64 = 0; dim1: int64 = 0; dim2: int64 = 1): Tensor {.inline.} = 
  self.tensor.atenMethod("diagonal", offset, dim1, dim2).to(ATensor).newTensor()

proc div_name*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc div_name*(self: Tensor; other: Tensor): Tensor {.inline.}

proc div_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("div_", self.tensor, other.tensor).to(void); self

proc div_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("div_", other.tensor).to(void); self

proc div_name*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc div_name*(self: Tensor; other: float): Tensor {.inline.}

proc div_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("div_", self.tensor, other).to(void); self

proc div_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("div_", other).to(void); self

proc dot*(ty: TensorType; self: Tensor; tensor: Tensor): Tensor {.inline.}

proc dot*(self: Tensor; tensor: Tensor): Tensor {.inline.}

proc einsum*(ty: TensorType; equation: StdString; tensors: openarray[Tensor]): Tensor {.inline.} = 
  ty.atenMethod("einsum", equation, tensors.toATensors()).to(ATensor).newTensor()

proc einsum*(equation: StdString; tensors: openarray[Tensor]): Tensor {.inline.} = 
  atenFunction("at::einsum", equation, tensors.toATensors()).to(ATensor).newTensor()

proc embedding*(ty: TensorType; weight: Tensor; indices: Tensor; padding_idx: int64 = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.}

proc embedding*(weight: Tensor; indices: Tensor; padding_idx: int64 = -1; scale_grad_by_freq: bool = false; sparse: bool = false): Tensor {.inline.}

proc embedding_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool; sparse: bool): Tensor {.inline.} = 
  ty.atenMethod("embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_backward*(grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool; sparse: bool): Tensor {.inline.} = 
  atenFunction("at::embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor).newTensor()

proc embedding_dense_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor {.inline.} = 
  ty.atenMethod("embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_dense_backward*(grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor {.inline.} = 
  atenFunction("at::embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_renorm_inplace*(ty: TensorType; self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor {.inline, discardable.} = 
  ty.atenMethod("embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(void); self

proc embedding_renorm_inplace*(self: Tensor; indices: Tensor; max_norm: float64; norm_type: float64): Tensor {.inline, discardable.} = 
  atenFunction("at::embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(void); self

proc embedding_sparse_backward*(ty: TensorType; grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor {.inline.} = 
  ty.atenMethod("embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_sparse_backward*(grad: Tensor; indices: Tensor; num_weights: int64; padding_idx: int64; scale_grad_by_freq: bool): Tensor {.inline.} = 
  atenFunction("at::embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor).newTensor()

proc embedding_bag*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
  ty.atenMethod("embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.} = 
  atenFunction("at::embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc embedding_bag_internal*(ty: TensorType; weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.}

proc embedding_bag_internal*(weight: Tensor; indices: Tensor; offsets: Tensor; scale_grad_by_freq: bool = false; mode: int64 = 0; sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline.}

proc embedding_bag_backward_internal*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64; sparse: bool): Tensor {.inline.} = 
  ty.atenMethod("_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_backward_internal*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64; sparse: bool): Tensor {.inline.} = 
  atenFunction("at::_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_internal*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor {.inline.} = 
  ty.atenMethod("_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_sparse_backward_internal*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor {.inline.} = 
  atenFunction("at::_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_internal*(ty: TensorType; grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor {.inline.} = 
  ty.atenMethod("_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc embedding_bag_dense_backward_internal*(grad: Tensor; indices: Tensor; offsets: Tensor; offset2bag: Tensor; bag_size: Tensor; maximum_indices: Tensor; num_weights: int64; scale_grad_by_freq: bool; mode: int64): Tensor {.inline.} = 
  atenFunction("at::_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor).newTensor()

proc empty*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("empty", size.toAIntList(), options).to(ATensor).newTensor()

proc empty*(size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::empty", size.toAIntList(), options).to(ATensor).newTensor()

proc empty_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("empty_like", self.tensor).to(ATensor).newTensor()

proc empty_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::empty_like", self.tensor).to(ATensor).newTensor()

proc empty_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("empty_like", self.tensor, options).to(ATensor).newTensor()

proc empty_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::empty_like", self.tensor, options).to(ATensor).newTensor()

proc erf*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erf*(self: Tensor): Tensor {.inline.}

proc erf_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("erf_", self.tensor).to(void); self

proc erf_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("erf_").to(void); self

proc erfc*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc erfc*(self: Tensor): Tensor {.inline.}

proc erfc_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("erfc_", self.tensor).to(void); self

proc erfc_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("erfc_").to(void); self

proc exp*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc exp*(self: Tensor): Tensor {.inline.}

proc exp_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("exp_", self.tensor).to(void); self

proc exp_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("exp_").to(void); self

proc expm1*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc expm1*(self: Tensor): Tensor {.inline.}

proc expm1_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("expm1_", self.tensor).to(void); self

proc expm1_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("expm1_").to(void); self

proc expand*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; implicit: bool = false): Tensor {.inline.}

proc expand*(self: Tensor; size: openarray[SomeInteger]; implicit: bool = false): Tensor {.inline.}

proc expand_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("expand_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc expand_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("expand_as", other.tensor).to(ATensor).newTensor()

proc eye*(ty: TensorType; n: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("eye", n, options).to(ATensor).newTensor()

proc eye*(n: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::eye", n, options).to(ATensor).newTensor()

proc eye*(ty: TensorType; n: int64; m: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("eye", n, m, options).to(ATensor).newTensor()

proc eye*(n: int64; m: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::eye", n, m, options).to(ATensor).newTensor()

proc flatten*(ty: TensorType; self: Tensor; start_dim: int64 = 0; end_dim: int64 = -1): Tensor {.inline.} = 
  ty.atenMethod("flatten", self.tensor, start_dim, end_dim).to(ATensor).newTensor()

proc flatten*(self: Tensor; start_dim: int64 = 0; end_dim: int64 = -1): Tensor {.inline.} = 
  self.tensor.atenMethod("flatten", start_dim, end_dim).to(ATensor).newTensor()

proc fill_inplace*(ty: TensorType; self: Tensor; value: float): Tensor {.inline, discardable.}

proc fill_inplace*(self: Tensor; value: float): Tensor {.inline, discardable.}

proc fill_inplace*(ty: TensorType; self: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc fill_inplace*(self: Tensor; value: Tensor): Tensor {.inline, discardable.}

proc floor*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc floor*(self: Tensor): Tensor {.inline.}

proc floor_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("floor_", self.tensor).to(void); self

proc floor_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("floor_").to(void); self

proc full*(ty: TensorType; size: openarray[SomeInteger]; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("full", size.toAIntList(), fill_value, options).to(ATensor).newTensor()

proc full*(size: openarray[SomeInteger]; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::full", size.toAIntList(), fill_value, options).to(ATensor).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float): Tensor {.inline.} = 
  ty.atenMethod("full_like", self.tensor, fill_value).to(ATensor).newTensor()

proc full_like*(self: Tensor; fill_value: float): Tensor {.inline.} = 
  atenFunction("at::full_like", self.tensor, fill_value).to(ATensor).newTensor()

proc full_like*(ty: TensorType; self: Tensor; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("full_like", self.tensor, fill_value, options).to(ATensor).newTensor()

proc full_like*(self: Tensor; fill_value: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::full_like", self.tensor, fill_value, options).to(ATensor).newTensor()

proc grid_sampler*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor {.inline.} = 
  ty.atenMethod("grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor {.inline.} = 
  atenFunction("at::grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor).newTensor()

proc grid_sampler_2d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor {.inline.}

proc grid_sampler_2d*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor {.inline.}

proc grid_sampler_2d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_2d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d*(ty: TensorType; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor {.inline.}

proc grid_sampler_3d*(input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): Tensor {.inline.}

proc grid_sampler_3d_backward*(ty: TensorType; grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc grid_sampler_3d_backward*(grad_output: Tensor; input: Tensor; grid: Tensor; interpolation_mode: int64; padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc hann_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window*(window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::hann_window", window_length, options).to(ATensor).newTensor()

proc hann_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hann_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::hann_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::hamming_window", window_length, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; periodic: bool; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::hamming_window", window_length, periodic, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; periodic: bool; alpha: float64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; periodic: bool; alpha: float64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::hamming_window", window_length, periodic, alpha, options).to(ATensor).newTensor()

proc hamming_window*(ty: TensorType; window_length: int64; periodic: bool; alpha: float64; beta: float64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hamming_window*(window_length: int64; periodic: bool; alpha: float64; beta: float64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::hamming_window", window_length, periodic, alpha, beta, options).to(ATensor).newTensor()

proc hinge_embedding_loss*(ty: TensorType; self: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc hinge_embedding_loss*(self: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc ger*(ty: TensorType; self: Tensor; vec2: Tensor): Tensor {.inline.}

proc ger*(self: Tensor; vec2: Tensor): Tensor {.inline.}

proc gesv*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("gesv", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("gesv", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_internal*(ty: TensorType; self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("_gesv_helper", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gesv_helper_internal*(self: Tensor; A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("_gesv_helper", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc group_norm*(ty: TensorType; input: Tensor; num_groups: int64; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor {.inline.} = 
  ty.atenMethod("group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor).newTensor()

proc group_norm*(input: Tensor; num_groups: int64; weight: Tensor; bias: Tensor; eps: float64; cudnn_enabled: bool = true): Tensor {.inline.} = 
  atenFunction("at::group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor).newTensor()

proc fft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor {.inline.} = 
  ty.atenMethod("fft", self.tensor, signal_ndim, normalized).to(ATensor).newTensor()

proc fft*(self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("fft", signal_ndim, normalized).to(ATensor).newTensor()

proc ifft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor {.inline.} = 
  ty.atenMethod("ifft", self.tensor, signal_ndim, normalized).to(ATensor).newTensor()

proc ifft*(self: Tensor; signal_ndim: int64; normalized: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("ifft", signal_ndim, normalized).to(ATensor).newTensor()

proc rfft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  ty.atenMethod("rfft", self.tensor, signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc rfft*(self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod("rfft", signal_ndim, normalized, onesided).to(ATensor).newTensor()

proc irfft*(ty: TensorType; self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("irfft", self.tensor, signal_ndim, normalized, onesided, signal_sizes.toAIntList()).to(ATensor).newTensor()

proc irfft*(self: Tensor; signal_ndim: int64; normalized: bool = false; onesided: bool = true; signal_sizes: openarray[SomeInteger]): Tensor {.inline.} = 
  self.tensor.atenMethod("irfft", signal_ndim, normalized, onesided, signal_sizes.toAIntList()).to(ATensor).newTensor()

proc fft_with_size_internal*(ty: TensorType; self: Tensor; signal_ndim: int64; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[SomeInteger]; normalized: bool; onesided: bool; output_sizes: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("_fft_with_size", self.tensor, signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList(), normalized, onesided, output_sizes.toAIntList()).to(ATensor).newTensor()

proc fft_with_size_internal*(self: Tensor; signal_ndim: int64; complex_input: bool; complex_output: bool; inverse: bool; checked_signal_sizes: openarray[SomeInteger]; normalized: bool; onesided: bool; output_sizes: openarray[SomeInteger]): Tensor {.inline.} = 
  self.tensor.atenMethod("_fft_with_size", signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes.toAIntList(), normalized, onesided, output_sizes.toAIntList()).to(ATensor).newTensor()

proc cufft_get_plan_cache_size_internal*(ty: TensorType; ): int64 {.inline.} = 
  ty.atenMethod("_cufft_get_plan_cache_size").to(int64)

proc cufft_get_plan_cache_size_internal*(): int64 {.inline.} = 
  atenFunction("at::_cufft_get_plan_cache_size").to(int64)

proc cufft_get_plan_cache_max_size_internal*(ty: TensorType; ): int64 {.inline.} = 
  ty.atenMethod("_cufft_get_plan_cache_max_size").to(int64)

proc cufft_get_plan_cache_max_size_internal*(): int64 {.inline.} = 
  atenFunction("at::_cufft_get_plan_cache_max_size").to(int64)

proc cufft_set_plan_cache_max_size_internal*(ty: TensorType; max_size: int64): void {.inline.} = 
  ty.atenMethod("_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_set_plan_cache_max_size_internal*(max_size: int64): void {.inline.} = 
  atenFunction("at::_cufft_set_plan_cache_max_size", max_size).to(void)

proc cufft_clear_plan_cache_internal*(ty: TensorType; ): void {.inline.} = 
  ty.atenMethod("_cufft_clear_plan_cache").to(void)

proc cufft_clear_plan_cache_internal*(): void {.inline.} = 
  atenFunction("at::_cufft_clear_plan_cache").to(void)

proc index*(ty: TensorType; self: Tensor; indices: openarray[Tensor]): Tensor {.inline.} = 
  ty.atenMethod("index", self.tensor, indices.toATensors()).to(ATensor).newTensor()

proc index*(self: Tensor; indices: openarray[Tensor]): Tensor {.inline.} = 
  self.tensor.atenMethod("index", indices.toATensors()).to(ATensor).newTensor()

proc index_copy_inplace*(ty: TensorType; self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_copy_inplace*(self: Tensor; dim: int64; index: Tensor; source: Tensor): Tensor {.inline, discardable.}

proc index_put*(ty: TensorType; self: Tensor; indices: openarray[Tensor]; values: Tensor): Tensor {.inline.} = 
  ty.atenMethod("index_put", self.tensor, indices.toATensors(), values.tensor).to(ATensor).newTensor()

proc index_put*(self: Tensor; indices: openarray[Tensor]; values: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("index_put", indices.toATensors(), values.tensor).to(ATensor).newTensor()

proc index_put_inplace*(ty: TensorType; self: Tensor; indices: openarray[Tensor]; values: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("index_put_", self.tensor, indices.toATensors(), values.tensor).to(void); self

proc index_put_inplace*(self: Tensor; indices: openarray[Tensor]; values: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("index_put_", indices.toATensors(), values.tensor).to(void); self

proc inverse*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc inverse*(self: Tensor): Tensor {.inline.}

proc isclose*(ty: TensorType; self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor {.inline.} = 
  ty.atenMethod("isclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(ATensor).newTensor()

proc isclose*(self: Tensor; other: Tensor; rtol: float64; atol: float64; equal_nan: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("isclose", other.tensor, rtol, atol, equal_nan).to(ATensor).newTensor()

proc is_cuda*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_cuda", self.tensor).to(bool)

proc is_cuda*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_cuda").to(bool)

proc is_distributed*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_distributed", self.tensor).to(bool)

proc is_distributed*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_distributed").to(bool)

proc is_floating_point*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_floating_point", self.tensor).to(bool)

proc is_floating_point*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_floating_point").to(bool)

proc is_nonzero*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_nonzero", self.tensor).to(bool)

proc is_nonzero*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_nonzero").to(bool)

proc is_same_size*(ty: TensorType; self: Tensor; other: Tensor): bool {.inline.} = 
  ty.atenMethod("is_same_size", self.tensor, other.tensor).to(bool)

proc is_same_size*(self: Tensor; other: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_same_size", other.tensor).to(bool)

proc is_signed*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_signed", self.tensor).to(bool)

proc is_signed*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_signed").to(bool)

proc is_sparse*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_sparse", self.tensor).to(bool)

proc is_sparse*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_sparse").to(bool)

proc kthvalue*(ty: TensorType; self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc kthvalue*(self: Tensor; k: int64; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc layer_norm*(ty: TensorType; input: Tensor; normalized_shape: openarray[SomeInteger]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor {.inline.} = 
  ty.atenMethod("layer_norm", input.tensor, normalized_shape.toAIntList(), weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor).newTensor()

proc layer_norm*(input: Tensor; normalized_shape: openarray[SomeInteger]; weight: Tensor; bias: Tensor; eps: float64; cudnn_enable: bool = true): Tensor {.inline.} = 
  atenFunction("at::layer_norm", input.tensor, normalized_shape.toAIntList(), weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor).newTensor()

proc linspace*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("linspace", start, end_name, options).to(ATensor).newTensor()

proc linspace*(start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::linspace", start, end_name, options).to(ATensor).newTensor()

proc linspace*(ty: TensorType; start: float; end_name: float; steps: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("linspace", start, end_name, steps, options).to(ATensor).newTensor()

proc linspace*(start: float; end_name: float; steps: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::linspace", start, end_name, steps, options).to(ATensor).newTensor()

proc log*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log*(self: Tensor): Tensor {.inline.}

proc log_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("log_", self.tensor).to(void); self

proc log_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("log_").to(void); self

proc log10*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log10*(self: Tensor): Tensor {.inline.}

proc log10_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("log10_", self.tensor).to(void); self

proc log10_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("log10_").to(void); self

proc log1p*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("log1p", self.tensor).to(ATensor).newTensor()

proc log1p*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("log1p").to(ATensor).newTensor()

proc log1p_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("log1p_", self.tensor).to(void); self

proc log1p_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("log1p_").to(void); self

proc log2*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc log2*(self: Tensor): Tensor {.inline.}

proc log2_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("log2_", self.tensor).to(void); self

proc log2_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("log2_").to(void); self

proc logdet*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("logdet", self.tensor).to(ATensor).newTensor()

proc logdet*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("logdet").to(ATensor).newTensor()

proc logspace*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("logspace", start, end_name, options).to(ATensor).newTensor()

proc logspace*(start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::logspace", start, end_name, options).to(ATensor).newTensor()

proc logspace*(ty: TensorType; start: float; end_name: float; steps: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("logspace", start, end_name, steps, options).to(ATensor).newTensor()

proc logspace*(start: float; end_name: float; steps: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::logspace", start, end_name, steps, options).to(ATensor).newTensor()

proc log_softmax*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.}

proc log_softmax*(self: Tensor; dim: int64): Tensor {.inline.}

proc log_softmax_backward_data*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc log_softmax_backward_data*(grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor {.inline.} = 
  atenFunction("at::log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc logsumexp*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("logsumexp", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc logsumexp*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("logsumexp", dim, keepdim).to(ATensor).newTensor()

proc margin_ranking_loss*(ty: TensorType; input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc margin_ranking_loss*(input1: Tensor; input2: Tensor; target: Tensor; margin: float64; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; tol: float64; symmetric: bool = false): Tensor {.inline.} = 
  ty.atenMethod("matrix_rank", self.tensor, tol, symmetric).to(ATensor).newTensor()

proc matrix_rank*(self: Tensor; tol: float64; symmetric: bool = false): Tensor {.inline.} = 
  atenFunction("at::matrix_rank", self.tensor, tol, symmetric).to(ATensor).newTensor()

proc matrix_rank*(ty: TensorType; self: Tensor; symmetric: bool = false): Tensor {.inline.} = 
  ty.atenMethod("matrix_rank", self.tensor, symmetric).to(ATensor).newTensor()

proc matrix_rank*(self: Tensor; symmetric: bool = false): Tensor {.inline.} = 
  atenFunction("at::matrix_rank", self.tensor, symmetric).to(ATensor).newTensor()

proc max*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max*(self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_values*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("max_values", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc max_values*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("max_values", dim, keepdim).to(ATensor).newTensor()

proc max_pool1d_with_indices*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("max_pool1d_with_indices", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_pool1d_with_indices*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::max_pool1d_with_indices", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc max_pool1d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor {.inline.} = 
  ty.atenMethod("max_pool1d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(ATensor).newTensor()

proc max_pool1d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor {.inline.} = 
  atenFunction("at::max_pool1d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(ATensor).newTensor()

proc max_pool2d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor {.inline.} = 
  ty.atenMethod("max_pool2d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(ATensor).newTensor()

proc max_pool2d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor {.inline.} = 
  atenFunction("at::max_pool2d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(ATensor).newTensor()

proc max_pool3d*(ty: TensorType; self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor {.inline.} = 
  ty.atenMethod("max_pool3d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(ATensor).newTensor()

proc max_pool3d*(self: Tensor; kernel_size: openarray[SomeInteger]; stride: openarray[SomeInteger]; padding: openarray[SomeInteger] = @[0]; dilation: openarray[SomeInteger] = @[1]; ceil_mode: bool = false): Tensor {.inline.} = 
  atenFunction("at::max_pool3d", self.tensor, kernel_size.toAIntList(), stride.toAIntList(), padding.toAIntList(), dilation.toAIntList(), ceil_mode).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("mean", self.tensor, dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("mean", dtype).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc mean*(self: Tensor): Tensor {.inline.}

proc mean*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("mean", self.tensor, dim, keepdim, dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("mean", dim, keepdim, dtype).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("mean", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("mean", dim, keepdim).to(ATensor).newTensor()

proc mean*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("mean", self.tensor, dim, dtype).to(ATensor).newTensor()

proc mean*(self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("mean", dim, dtype).to(ATensor).newTensor()

proc median*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc median*(self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min*(self: Tensor; dim: int64; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc min_values*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("min_values", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc min_values*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("min_values", dim, keepdim).to(ATensor).newTensor()

proc mkldnn_convolution*(ty: TensorType; self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64): Tensor {.inline.}

proc mkldnn_convolution*(self: Tensor; weight: Tensor; bias: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64): Tensor {.inline.}

proc mkldnn_convolution_backward_input*(ty: TensorType; self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): Tensor {.inline.} = 
  ty.atenMethod("mkldnn_convolution_backward_input", self_size.toAIntList(), grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_input*(self_size: openarray[SomeInteger]; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): Tensor {.inline.} = 
  atenFunction("at::mkldnn_convolution_backward_input", self_size.toAIntList(), grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(ATensor).newTensor()

proc mkldnn_convolution_backward_weights*(ty: TensorType; weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("mkldnn_convolution_backward_weights", weight_size.toAIntList(), grad_output.tensor, self.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward_weights*(weight_size: openarray[SomeInteger]; grad_output: Tensor; self: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::mkldnn_convolution_backward_weights", weight_size.toAIntList(), grad_output.tensor, self.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(ty: TensorType; self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc mkldnn_convolution_backward*(self: Tensor; grad_output: Tensor; weight: Tensor; padding: openarray[SomeInteger]; stride: openarray[SomeInteger]; dilation: openarray[SomeInteger]; groups: int64; output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding.toAIntList(), stride.toAIntList(), dilation.toAIntList(), groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc mode*(ty: TensorType; self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mode*(self: Tensor; dim: int64 = -1; keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc mul*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.}

proc mul*(self: Tensor; other: Tensor): Tensor {.inline.}

proc mul_inplace*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("mul_", self.tensor, other.tensor).to(void); self

proc mul_inplace*(self: Tensor; other: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("mul_", other.tensor).to(void); self

proc mul*(ty: TensorType; self: Tensor; other: float): Tensor {.inline.}

proc mul*(self: Tensor; other: float): Tensor {.inline.}

proc mul_inplace*(ty: TensorType; self: Tensor; other: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("mul_", self.tensor, other).to(void); self

proc mul_inplace*(self: Tensor; other: float): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("mul_", other).to(void); self

proc mv*(ty: TensorType; self: Tensor; vec: Tensor): Tensor {.inline.}

proc mv*(self: Tensor; vec: Tensor): Tensor {.inline.}

proc mvlgamma*(ty: TensorType; self: Tensor; p: int64): Tensor {.inline.} = 
  ty.atenMethod("mvlgamma", self.tensor, p).to(ATensor).newTensor()

proc mvlgamma*(self: Tensor; p: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("mvlgamma", p).to(ATensor).newTensor()

proc mvlgamma_inplace*(ty: TensorType; self: Tensor; p: int64): Tensor {.inline, discardable.} = 
  ty.atenMethod("mvlgamma_", self.tensor, p).to(void); self

proc mvlgamma_inplace*(self: Tensor; p: int64): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("mvlgamma_", p).to(void); self

proc narrow*(ty: TensorType; self: Tensor; dim: int64; start: int64; length: int64): Tensor {.inline.} = 
  ty.atenMethod("narrow", self.tensor, dim, start, length).to(ATensor).newTensor()

proc narrow*(self: Tensor; dim: int64; start: int64; length: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("narrow", dim, start, length).to(ATensor).newTensor()

proc ones*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("ones", size.toAIntList(), options).to(ATensor).newTensor()

proc ones*(size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::ones", size.toAIntList(), options).to(ATensor).newTensor()

proc ones_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("ones_like", self.tensor).to(ATensor).newTensor()

proc ones_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::ones_like", self.tensor).to(ATensor).newTensor()

proc ones_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("ones_like", self.tensor, options).to(ATensor).newTensor()

proc ones_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::ones_like", self.tensor, options).to(ATensor).newTensor()

proc pairwise_distance*(ty: TensorType; x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor).newTensor()

proc pairwise_distance*(x1: Tensor; x2: Tensor; p: float64 = 2; eps: float64; keepdim: bool = false): Tensor {.inline.} = 
  atenFunction("at::pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor).newTensor()

proc permute*(ty: TensorType; self: Tensor; dims: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("permute", self.tensor, dims.toAIntList()).to(ATensor).newTensor()

proc permute*(self: Tensor; dims: openarray[SomeInteger]): Tensor {.inline.} = 
  self.tensor.atenMethod("permute", dims.toAIntList()).to(ATensor).newTensor()

proc pin_memory*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("pin_memory", self.tensor).to(ATensor).newTensor()

proc pin_memory*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("pin_memory").to(ATensor).newTensor()

proc pinverse*(ty: TensorType; self: Tensor; rcond: float64): Tensor {.inline.} = 
  ty.atenMethod("pinverse", self.tensor, rcond).to(ATensor).newTensor()

proc pinverse*(self: Tensor; rcond: float64): Tensor {.inline.} = 
  self.tensor.atenMethod("pinverse", rcond).to(ATensor).newTensor()

proc rand*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("rand", size.toAIntList(), options).to(ATensor).newTensor()

proc rand*(size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::rand", size.toAIntList(), options).to(ATensor).newTensor()

proc rand*(ty: TensorType; size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("rand", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc rand*(size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::rand", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc rand_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("rand_like", self.tensor).to(ATensor).newTensor()

proc rand_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::rand_like", self.tensor).to(ATensor).newTensor()

proc rand_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("rand_like", self.tensor, options).to(ATensor).newTensor()

proc rand_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::rand_like", self.tensor, options).to(ATensor).newTensor()

proc randint*(ty: TensorType; high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randint", high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randint", high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(ty: TensorType; high: int64; size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randint", high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint*(high: int64; size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randint", high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint*(ty: TensorType; low: int64; high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randint", low, high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(low: int64; high: int64; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randint", low, high, size.toAIntList(), options).to(ATensor).newTensor()

proc randint*(ty: TensorType; low: int64; high: int64; size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randint", low, high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint*(low: int64; high: int64; size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randint", low, high, size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int64): Tensor {.inline.} = 
  ty.atenMethod("randint_like", self.tensor, high).to(ATensor).newTensor()

proc randint_like*(self: Tensor; high: int64): Tensor {.inline.} = 
  atenFunction("at::randint_like", self.tensor, high).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int64; high: int64): Tensor {.inline.} = 
  ty.atenMethod("randint_like", self.tensor, low, high).to(ATensor).newTensor()

proc randint_like*(self: Tensor; low: int64; high: int64): Tensor {.inline.} = 
  atenFunction("at::randint_like", self.tensor, low, high).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; high: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randint_like", self.tensor, high, options).to(ATensor).newTensor()

proc randint_like*(self: Tensor; high: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randint_like", self.tensor, high, options).to(ATensor).newTensor()

proc randint_like*(ty: TensorType; self: Tensor; low: int64; high: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randint_like", self.tensor, low, high, options).to(ATensor).newTensor()

proc randint_like*(self: Tensor; low: int64; high: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randint_like", self.tensor, low, high, options).to(ATensor).newTensor()

proc randn*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randn", size.toAIntList(), options).to(ATensor).newTensor()

proc randn*(size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randn", size.toAIntList(), options).to(ATensor).newTensor()

proc randn*(ty: TensorType; size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randn", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randn*(size: openarray[SomeInteger]; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randn", size.toAIntList(), generator, options).to(ATensor).newTensor()

proc randn_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("randn_like", self.tensor).to(ATensor).newTensor()

proc randn_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::randn_like", self.tensor).to(ATensor).newTensor()

proc randn_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randn_like", self.tensor, options).to(ATensor).newTensor()

proc randn_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randn_like", self.tensor, options).to(ATensor).newTensor()

proc randperm*(ty: TensorType; n: int64; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randperm", n, options).to(ATensor).newTensor()

proc randperm*(n: int64; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randperm", n, options).to(ATensor).newTensor()

proc randperm*(ty: TensorType; n: int64; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("randperm", n, generator, options).to(ATensor).newTensor()

proc randperm*(n: int64; generator: Generator; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::randperm", n, generator, options).to(ATensor).newTensor()

proc range*(ty: TensorType; start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("range", start, end_name, options).to(ATensor).newTensor()

proc range*(start: float; end_name: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::range", start, end_name, options).to(ATensor).newTensor()

proc range*(ty: TensorType; start: float; end_name: float; step: float; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("range", start, end_name, step, options).to(ATensor).newTensor()

proc range*(start: float; end_name: float; step: float; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::range", start, end_name, step, options).to(ATensor).newTensor()

proc repeat*(ty: TensorType; self: Tensor; repeats: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("repeat", self.tensor, repeats.toAIntList()).to(ATensor).newTensor()

proc repeat*(self: Tensor; repeats: openarray[SomeInteger]): Tensor {.inline.} = 
  self.tensor.atenMethod("repeat", repeats.toAIntList()).to(ATensor).newTensor()

proc reshape*(ty: TensorType; self: Tensor; shape: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("reshape", self.tensor, shape.toAIntList()).to(ATensor).newTensor()

proc reshape*(self: Tensor; shape: openarray[SomeInteger]): Tensor {.inline.} = 
  self.tensor.atenMethod("reshape", shape.toAIntList()).to(ATensor).newTensor()

proc reshape_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("reshape_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc reshape_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("reshape_as", other.tensor).to(ATensor).newTensor()

proc RoiPooling2d_forward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc RoiPooling2d_forward*(input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc RoiPooling2d_backward*(ty: TensorType; input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor {.inline.} = 
  ty.atenMethod("RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor).newTensor()

proc RoiPooling2d_backward*(input: Tensor; rois: Tensor; pooledHeight: int64; pooledWidth: int64; spatialScale: float64; gradOutput: Tensor; argmaxes: Tensor): Tensor {.inline.} = 
  atenFunction("at::RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor).newTensor()

proc round*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc round*(self: Tensor): Tensor {.inline.}

proc round_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("round_", self.tensor).to(void); self

proc round_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("round_").to(void); self

proc rrelu*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  ty.atenMethod("rrelu", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu*(self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline.} = 
  atenFunction("at::rrelu", self.tensor, lower, upper, training, generator).to(ATensor).newTensor()

proc rrelu_inplace*(ty: TensorType; self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.} = 
  ty.atenMethod("rrelu_", self.tensor, lower, upper, training, generator).to(void); self

proc rrelu_inplace*(self: Tensor; lower: float; upper: float; training: bool = false; generator: Generator = nil): Tensor {.inline, discardable.} = 
  atenFunction("at::rrelu_", self.tensor, lower, upper, training, generator).to(void); self

proc relu*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc relu*(self: Tensor): Tensor {.inline.}

proc relu_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("relu_", self.tensor).to(void); self

proc relu_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("relu_").to(void); self

proc hardshrink*(ty: TensorType; self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink*(self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink_backward*(ty: TensorType; grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc hardshrink_backward*(grad_out: Tensor; self: Tensor; lambd: float): Tensor {.inline.}

proc rsqrt*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc rsqrt*(self: Tensor): Tensor {.inline.}

proc rsqrt_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("rsqrt_", self.tensor).to(void); self

proc rsqrt_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("rsqrt_").to(void); self

proc select*(ty: TensorType; self: Tensor; dim: int64; index: int64): Tensor {.inline.} = 
  ty.atenMethod("select", self.tensor, dim, index).to(ATensor).newTensor()

proc select*(self: Tensor; dim: int64; index: int64): Tensor {.inline.} = 
  self.tensor.atenMethod("select", dim, index).to(ATensor).newTensor()

proc selu*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("selu", self.tensor).to(ATensor).newTensor()

proc selu*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::selu", self.tensor).to(ATensor).newTensor()

proc selu_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("selu_", self.tensor).to(void); self

proc selu_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction("at::selu_", self.tensor).to(void); self

proc celu*(ty: TensorType; self: Tensor; alpha: float): Tensor {.inline.} = 
  ty.atenMethod("celu", self.tensor, alpha).to(ATensor).newTensor()

proc celu*(self: Tensor; alpha: float): Tensor {.inline.} = 
  atenFunction("at::celu", self.tensor, alpha).to(ATensor).newTensor()

proc celu_inplace*(ty: TensorType; self: Tensor; alpha: float): Tensor {.inline, discardable.} = 
  ty.atenMethod("celu_", self.tensor, alpha).to(void); self

proc celu_inplace*(self: Tensor; alpha: float): Tensor {.inline, discardable.} = 
  atenFunction("at::celu_", self.tensor, alpha).to(void); self

proc sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sigmoid*(self: Tensor): Tensor {.inline.}

proc sigmoid_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("sigmoid_", self.tensor).to(void); self

proc sigmoid_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sigmoid_").to(void); self

proc sin*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sin*(self: Tensor): Tensor {.inline.}

proc sin_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("sin_", self.tensor).to(void); self

proc sin_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sin_").to(void); self

proc sinh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sinh*(self: Tensor): Tensor {.inline.}

proc sinh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("sinh_", self.tensor).to(void); self

proc sinh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sinh_").to(void); self

proc size*(ty: TensorType; self: Tensor; dim: int64): int64 {.inline.} = 
  ty.atenMethod("size", self.tensor, dim).to(int64)

proc size*(self: Tensor; dim: int64): int64 {.inline.} = 
  self.tensor.atenMethod("size", dim).to(int64)

proc slice*(ty: TensorType; self: Tensor; dim: int64 = 0; start: int64 = 0; end_name: int64 = 9223372036854775807; step: int64 = 1): Tensor {.inline.}

proc slice*(self: Tensor; dim: int64 = 0; start: int64 = 0; end_name: int64 = 9223372036854775807; step: int64 = 1): Tensor {.inline.}

proc slogdet*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("slogdet", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc slogdet*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("slogdet").to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc smm*(ty: TensorType; self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  ty.atenMethod("smm", self.tensor, mat2.tensor).to(ATensor).newTensor()

proc smm*(self: Tensor; mat2: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("smm", mat2.tensor).to(ATensor).newTensor()

proc softmax*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.}

proc softmax*(self: Tensor; dim: int64): Tensor {.inline.}

proc softmax_backward_data*(ty: TensorType; grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc softmax_backward_data*(grad_output: Tensor; output: Tensor; dim: int64; self: Tensor): Tensor {.inline.} = 
  atenFunction("at::softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor).newTensor()

proc split*(ty: TensorType; self: Tensor; split_size: int64; dim: int64 = 0): TensorList {.inline.}

proc split*(self: Tensor; split_size: int64; dim: int64 = 0): TensorList {.inline.}

proc split_with_sizes*(ty: TensorType; self: Tensor; split_sizes: openarray[SomeInteger]; dim: int64 = 0): TensorList {.inline.}

proc split_with_sizes*(self: Tensor; split_sizes: openarray[SomeInteger]; dim: int64 = 0): TensorList {.inline.}

proc squeeze*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc squeeze*(self: Tensor): Tensor {.inline.}

proc squeeze*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.}

proc squeeze*(self: Tensor; dim: int64): Tensor {.inline.}

proc squeeze_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.}

proc squeeze_inplace*(self: Tensor): Tensor {.inline, discardable.}

proc squeeze_inplace*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline, discardable.}

proc squeeze_inplace*(self: Tensor; dim: int64): Tensor {.inline, discardable.}

proc sspaddmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty.atenMethod("sspaddmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc sspaddmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  self.tensor.atenMethod("sspaddmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc stack*(ty: TensorType; tensors: openarray[Tensor]; dim: int64 = 0): Tensor {.inline.}

proc stack*(tensors: openarray[Tensor]; dim: int64 = 0): Tensor {.inline.}

proc stft*(ty: TensorType; self: Tensor; n_fft: int64; hop_length: int64; win_length: int64; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  ty.atenMethod("stft", self.tensor, n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor).newTensor()

proc stft*(self: Tensor; n_fft: int64; hop_length: int64; win_length: int64; window: Tensor; normalized: bool = false; onesided: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod("stft", n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor).newTensor()

proc stride*(ty: TensorType; self: Tensor; dim: int64): int64 {.inline.} = 
  ty.atenMethod("stride", self.tensor, dim).to(int64)

proc stride*(self: Tensor; dim: int64): int64 {.inline.} = 
  self.tensor.atenMethod("stride", dim).to(int64)

proc sum*(ty: TensorType; self: Tensor; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("sum", self.tensor, dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("sum", dtype).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("sum", self.tensor).to(ATensor).newTensor()

proc sum*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("sum").to(ATensor).newTensor()

proc sum_internal*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sum_internal*(self: Tensor): Tensor {.inline.}

proc sum*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; keepdim: bool; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("sum", self.tensor, dim.toAIntList(), keepdim, dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[SomeInteger]; keepdim: bool; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("sum", dim.toAIntList(), keepdim, dtype).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("sum", self.tensor, dim.toAIntList(), keepdim).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("sum", dim.toAIntList(), keepdim).to(ATensor).newTensor()

proc sum*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("sum", self.tensor, dim.toAIntList(), dtype).to(ATensor).newTensor()

proc sum*(self: Tensor; dim: openarray[SomeInteger]; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("sum", dim.toAIntList(), dtype).to(ATensor).newTensor()

proc sum_internal*(ty: TensorType; self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor {.inline.}

proc sum_internal*(self: Tensor; dim: openarray[SomeInteger]; keepdim: bool = false): Tensor {.inline.}

proc sqrt*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc sqrt*(self: Tensor): Tensor {.inline.}

proc sqrt_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("sqrt_", self.tensor).to(void); self

proc sqrt_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sqrt_").to(void); self

proc std*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  ty.atenMethod("std", self.tensor, unbiased).to(ATensor).newTensor()

proc std*(self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod("std", unbiased).to(ATensor).newTensor()

proc std*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("std", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc std*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("std", dim, unbiased, keepdim).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("prod", self.tensor, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("prod", dtype).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("prod", self.tensor).to(ATensor).newTensor()

proc prod*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("prod").to(ATensor).newTensor()

proc prod_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_prod", self.tensor).to(ATensor).newTensor()

proc prod_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_prod").to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("prod", self.tensor, dim, keepdim, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int64; keepdim: bool; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("prod", dim, keepdim, dtype).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("prod", dim, keepdim).to(ATensor).newTensor()

proc prod*(ty: TensorType; self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  ty.atenMethod("prod", self.tensor, dim, dtype).to(ATensor).newTensor()

proc prod*(self: Tensor; dim: int64; dtype: AScalarType): Tensor {.inline.} = 
  self.tensor.atenMethod("prod", dim, dtype).to(ATensor).newTensor()

proc prod_internal*(ty: TensorType; self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("_prod", self.tensor, dim, keepdim).to(ATensor).newTensor()

proc prod_internal*(self: Tensor; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("_prod", dim, keepdim).to(ATensor).newTensor()

proc t*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc t*(self: Tensor): Tensor {.inline.}

proc t_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("t_", self.tensor).to(void); self

proc t_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("t_").to(void); self

proc tan*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc tan*(self: Tensor): Tensor {.inline.}

proc tan_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("tan_", self.tensor).to(void); self

proc tan_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("tan_").to(void); self

proc tanh*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc tanh*(self: Tensor): Tensor {.inline.}

proc tanh_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("tanh_", self.tensor).to(void); self

proc tanh_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("tanh_").to(void); self

proc transpose*(ty: TensorType; self: Tensor; dim0: int64; dim1: int64): Tensor {.inline.}

proc transpose*(self: Tensor; dim0: int64; dim1: int64): Tensor {.inline.}

proc transpose_inplace*(ty: TensorType; self: Tensor; dim0: int64; dim1: int64): Tensor {.inline, discardable.}

proc transpose_inplace*(self: Tensor; dim0: int64; dim1: int64): Tensor {.inline, discardable.}

proc flip*(ty: TensorType; self: Tensor; dims: openarray[SomeInteger]): Tensor {.inline.}

proc flip*(self: Tensor; dims: openarray[SomeInteger]): Tensor {.inline.}

proc rot90*(ty: TensorType; self: Tensor; k: int64 = 1; dims: openarray[SomeInteger]): Tensor {.inline.}

proc rot90*(self: Tensor; k: int64 = 1; dims: openarray[SomeInteger]): Tensor {.inline.}

proc trilinear_internal*(ty: TensorType; i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[SomeInteger]; expand2: openarray[SomeInteger]; expand3: openarray[SomeInteger]; sumdim: openarray[SomeInteger]; unroll_dim: int64 = 1): Tensor {.inline.} = 
  ty.atenMethod("_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1.toAIntList(), expand2.toAIntList(), expand3.toAIntList(), sumdim.toAIntList(), unroll_dim).to(ATensor).newTensor()

proc trilinear_internal*(i1: Tensor; i2: Tensor; i3: Tensor; expand1: openarray[SomeInteger]; expand2: openarray[SomeInteger]; expand3: openarray[SomeInteger]; sumdim: openarray[SomeInteger]; unroll_dim: int64 = 1): Tensor {.inline.} = 
  atenFunction("at::_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1.toAIntList(), expand2.toAIntList(), expand3.toAIntList(), sumdim.toAIntList(), unroll_dim).to(ATensor).newTensor()

proc triplet_margin_loss*(ty: TensorType; anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int64): Tensor {.inline.} = 
  ty.atenMethod("triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc triplet_margin_loss*(anchor: Tensor; positive: Tensor; negative: Tensor; margin: float64; p: float64 = 2; eps: float64; swap: bool = false; reduction: int64): Tensor {.inline.} = 
  atenFunction("at::triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor).newTensor()

proc trunc*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc trunc*(self: Tensor): Tensor {.inline.}

proc trunc_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("trunc_", self.tensor).to(void); self

proc trunc_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("trunc_").to(void); self

proc type_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("type_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc type_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("type_as", other.tensor).to(ATensor).newTensor()

proc unique_internal*(ty: TensorType; self: Tensor; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("_unique", self.tensor, sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unique_internal*(self: Tensor; sorted: bool = false; return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  self.tensor.atenMethod("_unique", sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc unsafe_view_internal*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]): Tensor {.inline.}

proc unsafe_view_internal*(self: Tensor; size: openarray[SomeInteger]): Tensor {.inline.}

proc unsqueeze*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline.}

proc unsqueeze*(self: Tensor; dim: int64): Tensor {.inline.}

proc unsqueeze_inplace*(ty: TensorType; self: Tensor; dim: int64): Tensor {.inline, discardable.}

proc unsqueeze_inplace*(self: Tensor; dim: int64): Tensor {.inline, discardable.}

proc var_name*(ty: TensorType; self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  ty.atenMethod("var", self.tensor, unbiased).to(ATensor).newTensor()

proc var_name*(self: Tensor; unbiased: bool = true): Tensor {.inline.} = 
  self.tensor.atenMethod("var", unbiased).to(ATensor).newTensor()

proc var_name*(ty: TensorType; self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("var", self.tensor, dim, unbiased, keepdim).to(ATensor).newTensor()

proc var_name*(self: Tensor; dim: int64; unbiased: bool = true; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("var", dim, unbiased, keepdim).to(ATensor).newTensor()

proc view_as*(ty: TensorType; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("view_as", self.tensor, other.tensor).to(ATensor).newTensor()

proc view_as*(self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("view_as", other.tensor).to(ATensor).newTensor()

proc where*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
  ty.atenMethod("where", condition.tensor, self.tensor, other.tensor).to(ATensor).newTensor()

proc where*(condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("where", condition.tensor, other.tensor).to(ATensor).newTensor()

proc s_where_internal*(ty: TensorType; condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.}

proc s_where_internal*(condition: Tensor; self: Tensor; other: Tensor): Tensor {.inline.}

proc zeros*(ty: TensorType; size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("zeros", size.toAIntList(), options).to(ATensor).newTensor()

proc zeros*(size: openarray[SomeInteger]; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::zeros", size.toAIntList(), options).to(ATensor).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("zeros_like", self.tensor).to(ATensor).newTensor()

proc zeros_like*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::zeros_like", self.tensor).to(ATensor).newTensor()

proc zeros_like*(ty: TensorType; self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  ty.atenMethod("zeros_like", self.tensor, options).to(ATensor).newTensor()

proc zeros_like*(self: Tensor; options: TensorOptions): Tensor {.inline.} = 
  atenFunction("at::zeros_like", self.tensor, options).to(ATensor).newTensor()

proc standard_gamma_grad_internal*(ty: TensorType; self: Tensor; output: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_standard_gamma_grad", self.tensor, output.tensor).to(ATensor).newTensor()

proc standard_gamma_grad_internal*(self: Tensor; output: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_standard_gamma_grad", output.tensor).to(ATensor).newTensor()

proc standard_gamma_internal*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc standard_gamma_internal*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc poisson*(ty: TensorType; self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc poisson*(self: Tensor; generator: Generator = nil): Tensor {.inline.}

proc native_norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor {.inline.} = 
  ty.atenMethod("native_norm", self.tensor, p).to(ATensor).newTensor()

proc native_norm*(self: Tensor; p: float = 2): Tensor {.inline.} = 
  atenFunction("at::native_norm", self.tensor, p).to(ATensor).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float = 2): Tensor {.inline.} = 
  ty.atenMethod("norm", self.tensor, p).to(ATensor).newTensor()

proc norm*(self: Tensor; p: float = 2): Tensor {.inline.} = 
  self.tensor.atenMethod("norm", p).to(ATensor).newTensor()

proc norm*(ty: TensorType; self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  ty.atenMethod("norm", self.tensor, p, dim, keepdim).to(ATensor).newTensor()

proc norm*(self: Tensor; p: float; dim: int64; keepdim: bool = false): Tensor {.inline.} = 
  self.tensor.atenMethod("norm", p, dim, keepdim).to(ATensor).newTensor()

proc native_clone*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("native_clone", self.tensor).to(ATensor).newTensor()

proc native_clone*(self: Tensor): Tensor {.inline.} = 
  atenFunction("at::native_clone", self.tensor).to(ATensor).newTensor()

proc clone*(ty: TensorType; self: Tensor): Tensor {.inline.}

proc clone*(self: Tensor): Tensor {.inline.}

proc native_resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("native_resize_as_", self.tensor, the_template.tensor).to(void); self

proc native_resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  atenFunction("at::native_resize_as_", self.tensor, the_template.tensor).to(void); self

proc resize_as_inplace*(ty: TensorType; self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("resize_as_", self.tensor, the_template.tensor).to(void); self

proc resize_as_inplace*(self: Tensor; the_template: Tensor): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("resize_as_", the_template.tensor).to(void); self

proc native_pow*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.} = 
  ty.atenMethod("native_pow", self.tensor, exponent).to(ATensor).newTensor()

proc native_pow*(self: Tensor; exponent: float): Tensor {.inline.} = 
  atenFunction("at::native_pow", self.tensor, exponent).to(ATensor).newTensor()

proc pow*(ty: TensorType; self: Tensor; exponent: float): Tensor {.inline.}

proc pow*(self: Tensor; exponent: float): Tensor {.inline.}

proc native_zero_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("native_zero_", self.tensor).to(void); self

proc native_zero_inplace*(self: Tensor): Tensor {.inline, discardable.} = 
  atenFunction("at::native_zero_", self.tensor).to(void); self

proc zero_inplace*(ty: TensorType; self: Tensor): Tensor {.inline, discardable.}

proc zero_inplace*(self: Tensor): Tensor {.inline, discardable.}

proc sub*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc sub*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline.}

proc sub_inplace*(ty: TensorType; self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("sub_", self.tensor, other.tensor, alpha).to(void); self

proc sub_inplace*(self: Tensor; other: Tensor; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sub_", other.tensor, alpha).to(void); self

proc sub*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc sub*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline.}

proc sub_inplace*(ty: TensorType; self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("sub_", self.tensor, other, alpha).to(void); self

proc sub_inplace*(self: Tensor; other: float; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sub_", other, alpha).to(void); self

proc s_native_addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc s_native_addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.}

proc s_native_addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(void); self

proc s_native_addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  atenFunction("at::s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(void); self

proc addmm*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  ty.atenMethod("addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline.} = 
  self.tensor.atenMethod("addmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor).newTensor()

proc addmm_inplace*(ty: TensorType; self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  ty.atenMethod("addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(void); self

proc addmm_inplace*(self: Tensor; mat1: Tensor; mat2: Tensor; beta: float = 1; alpha: float = 1): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("addmm_", mat1.tensor, mat2.tensor, beta, alpha).to(void); self

proc native_tensor*(ty: TensorType; self_ty: TensorType): Tensor {.inline.} = 
  ty.atenMethod("native_tensor", self_ty).to(ATensor).newTensor()

proc native_tensor*(self_ty: TensorType): Tensor {.inline.} = 
  atenFunction("at::native_tensor", self_ty).to(ATensor).newTensor()

proc native_tensor*(ty: TensorType; self_ty: TensorType; size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("native_tensor", self_ty, size.toAIntList()).to(ATensor).newTensor()

proc native_tensor*(self_ty: TensorType; size: openarray[SomeInteger]): Tensor {.inline.} = 
  atenFunction("at::native_tensor", self_ty, size.toAIntList()).to(ATensor).newTensor()

proc tensor*(ty: TensorType; dtype: TensorType): Tensor {.inline.} = 
  ty.atenMethod("tensor", dtype).to(ATensor).newTensor()

proc tensor*(ty: TensorType; dtype: TensorType; size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("tensor", dtype, size.toAIntList()).to(ATensor).newTensor()

proc native_sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor): Tensor {.inline.} = 
  ty.atenMethod("native_sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor).newTensor()

proc native_sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("native_sparse_coo_tensor", indices.tensor, values.tensor, size.toAIntList()).to(ATensor).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor): Tensor {.inline.} = 
  ty.atenMethod("sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor).newTensor()

proc sparse_coo_tensor*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("sparse_coo_tensor", indices.tensor, values.tensor, size.toAIntList()).to(ATensor).newTensor()

proc native_sparse_coo_tensor_unsafe_internal*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("_native_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size.toAIntList()).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_internal*(ty: TensorType; indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor {.inline.} = 
  ty.atenMethod("_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size.toAIntList()).to(ATensor).newTensor()

proc sparse_coo_tensor_unsafe_internal*(indices: Tensor; values: Tensor; size: openarray[SomeInteger]): Tensor {.inline.} = 
  atenFunction("at::_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size.toAIntList()).to(ATensor).newTensor()

proc sparse_raw_resize_inplace*(ty: TensorType; self: Tensor; size: openarray[SomeInteger]; sparseDims: int64; denseDims: int64): Tensor {.inline, discardable.} = 
  ty.atenMethod("sparse_raw_resize_", self.tensor, size.toAIntList(), sparseDims, denseDims).to(void); self

proc sparse_raw_resize_inplace*(self: Tensor; size: openarray[SomeInteger]; sparseDims: int64; denseDims: int64): Tensor {.inline, discardable.} = 
  self.tensor.atenMethod("sparse_raw_resize_", size.toAIntList(), sparseDims, denseDims).to(void); self

proc sparse_mask_internal*(ty: TensorType; self: Tensor; mask: ASparseTensorRef): Tensor {.inline.} = 
  ty.atenMethod("_sparse_mask", self.tensor, mask).to(ATensor).newTensor()

proc sparse_mask_internal*(self: Tensor; mask: ASparseTensorRef): Tensor {.inline.} = 
  self.tensor.atenMethod("_sparse_mask", mask).to(ATensor).newTensor()

proc to_dense*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("to_dense", self.tensor).to(ATensor).newTensor()

proc to_dense*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("to_dense").to(ATensor).newTensor()

proc sparseDims_internal*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("_sparseDims", self.tensor).to(int64)

proc sparseDims_internal*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("_sparseDims").to(int64)

proc dimI_internal*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("_dimI", self.tensor).to(int64)

proc dimI_internal*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("_dimI").to(int64)

proc denseDims_internal*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("_denseDims", self.tensor).to(int64)

proc denseDims_internal*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("_denseDims").to(int64)

proc dimV_internal*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("_dimV", self.tensor).to(int64)

proc dimV_internal*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("_dimV").to(int64)

proc nnz_internal*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("_nnz", self.tensor).to(int64)

proc nnz_internal*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("_nnz").to(int64)

proc coalesce*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("coalesce", self.tensor).to(ATensor).newTensor()

proc coalesce*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("coalesce").to(ATensor).newTensor()

proc is_coalesced*(ty: TensorType; self: Tensor): bool {.inline.} = 
  ty.atenMethod("is_coalesced", self.tensor).to(bool)

proc is_coalesced*(self: Tensor): bool {.inline.} = 
  self.tensor.atenMethod("is_coalesced").to(bool)

proc indices_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_indices", self.tensor).to(ATensor).newTensor()

proc indices_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_indices").to(ATensor).newTensor()

proc values_internal*(ty: TensorType; self: Tensor): Tensor {.inline.} = 
  ty.atenMethod("_values", self.tensor).to(ATensor).newTensor()

proc values_internal*(self: Tensor): Tensor {.inline.} = 
  self.tensor.atenMethod("_values").to(ATensor).newTensor()

proc hspmm*(ty: TensorType; mat1: Tensor; mat2: Tensor): Tensor {.inline.} = 
  ty.atenMethod("hspmm", mat1.tensor, mat2.tensor).to(ATensor).newTensor()

proc hspmm*(mat1: Tensor; mat2: Tensor): Tensor {.inline.} = 
  atenFunction("at::hspmm", mat1.tensor, mat2.tensor).to(ATensor).newTensor()

proc raw_copy_sparse_inplace*(ty: TensorType; self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  ty.atenMethod("raw_copy_sparse_", self.tensor, src.tensor).to(void); self

proc raw_copy_sparse_inplace*(self: Tensor; src: Tensor): Tensor {.inline, discardable.} = 
  atenFunction("at::raw_copy_sparse_", self.tensor, src.tensor).to(void); self

proc numel*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("numel", self.tensor).to(int64)

proc numel*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("numel").to(int64)

proc unbind*(ty: TensorType; self: Tensor; dim: int64 = 0): TensorList {.inline.} = 
  ty.atenMethod("unbind", self.tensor, dim).to(ATensors).newTensors()

proc unbind*(self: Tensor; dim: int64 = 0): TensorList {.inline.} = 
  self.tensor.atenMethod("unbind", dim).to(ATensors).newTensors()

proc native_get_device*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("native_get_device", self.tensor).to(int64)

proc native_get_device*(self: Tensor): int64 {.inline.} = 
  atenFunction("at::native_get_device", self.tensor).to(int64)

proc get_device*(ty: TensorType; self: Tensor): int64 {.inline.} = 
  ty.atenMethod("get_device", self.tensor).to(int64)

proc get_device*(self: Tensor): int64 {.inline.} = 
  self.tensor.atenMethod("get_device").to(int64)

proc meshgrid*(ty: TensorType; tensors: openarray[Tensor]): TensorList {.inline.} = 
  ty.atenMethod("meshgrid", tensors.toATensors()).to(ATensors).newTensors()

proc meshgrid*(tensors: openarray[Tensor]): TensorList {.inline.} = 
  atenFunction("at::meshgrid", tensors.toATensors()).to(ATensors).newTensors()

proc local_scalar_internal*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("_local_scalar", self.tensor).to(float)

proc local_scalar_internal*(self: Tensor): float {.inline.} = 
  self.tensor.atenMethod("_local_scalar").to(float)

proc local_scalar_dense_internal*(ty: TensorType; self: Tensor): float {.inline.} = 
  ty.atenMethod("_local_scalar_dense", self.tensor).to(float)

proc local_scalar_dense_internal*(self: Tensor): float {.inline.} = 
  atenFunction("at::_local_scalar_dense", self.tensor).to(float)

proc thnn_fused_lstm_cell_internal*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc thnn_fused_lstm_cell_internal*(input_gates: Tensor; hidden_gates: Tensor; cx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.}

proc thnn_fused_lstm_cell_backward_internal*(ty: TensorType; grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  ty.atenMethod("_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_lstm_cell_backward_internal*(grad_hy: Tensor; grad_cy: Tensor; cx: Tensor; cy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  atenFunction("at::_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_internal*(ty: TensorType; input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc thnn_fused_gru_cell_internal*(input_gates: Tensor; hidden_gates: Tensor; hx: Tensor; input_bias: Tensor; hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.}

proc thnn_fused_gru_cell_backward_internal*(ty: TensorType; grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  ty.atenMethod("_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc thnn_fused_gru_cell_backward_internal*(grad_hy: Tensor; workspace: Tensor; has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline.} = 
  atenFunction("at::_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("lstm", input.tensor, hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(input: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::lstm", input.tensor, hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  ty.atenMethod("lstm", data.tensor, batch_sizes.tensor, hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc lstm*(data: Tensor; batch_sizes: Tensor; hx: openarray[Tensor]; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline.} = 
  atenFunction("at::lstm", data.tensor, batch_sizes.tensor, hx.toATensors(), params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("gru", input.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::gru", input.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("gru", data.tensor, batch_sizes.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::gru", data.tensor, batch_sizes.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("rnn_tanh", input.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::rnn_tanh", input.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_tanh*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("rnn_relu", input.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(input: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool; batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::rnn_relu", input.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(ty: TensorType; data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc rnn_relu*(data: Tensor; batch_sizes: Tensor; hx: Tensor; params: openarray[Tensor]; has_biases: bool; num_layers: int64; dropout: float64; train: bool; bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params.toATensors(), has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell*(ty: TensorType; input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  ty.atenMethod("lstm_cell", input.tensor, hx.toATensors(), w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc lstm_cell*(input: Tensor; hx: openarray[Tensor]; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline.} = 
  atenFunction("at::lstm_cell", input.tensor, hx.toATensors(), w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple().newTensors()

proc gru_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  ty.atenMethod("gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc gru_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  atenFunction("at::gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_tanh_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  ty.atenMethod("rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_tanh_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  atenFunction("at::rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_relu_cell*(ty: TensorType; input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  ty.atenMethod("rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

proc rnn_relu_cell*(input: Tensor; hx: Tensor; w_ih: Tensor; w_hh: Tensor; b_ih: Tensor; b_hh: Tensor): Tensor {.inline.} = 
  atenFunction("at::rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor).newTensor()

