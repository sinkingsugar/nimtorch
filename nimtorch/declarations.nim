# Automatically generated, to update run again the generator from the torch root path
# nim c -r nimtorch/generator.nim

proc storage_offset*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("storage_offset").to(int64)
proc storage_offset*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("storage_offset", self.tensor).to(int64)
proc resize_u*(self: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("resize_", size).to(ATensor)
proc resize_u*(ty: TensorType; self: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("resize_", self.tensor, size).to(ATensor)
proc set_u*(self: Tensor, source: AStorage): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("set_", source).to(ATensor)
proc set_u*(ty: TensorType; self: Tensor, source: AStorage): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("set_", self.tensor, source).to(ATensor)
proc set_u*(self: Tensor, source: AStorage, storage_offset: int64, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("set_", source, storage_offset, size, stride).to(ATensor)
proc set_u*(ty: TensorType; self: Tensor, source: AStorage, storage_offset: int64, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("set_", self.tensor, source, storage_offset, size, stride).to(ATensor)
proc set_u*(self: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("set_", source.tensor).to(ATensor)
proc set_u*(ty: TensorType; self: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("set_", self.tensor, source.tensor).to(ATensor)
proc set_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("set_").to(ATensor)
proc set_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("set_", self.tensor).to(ATensor)
proc u_fill_u*(self: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_fill_", value).to(ATensor)
proc u_fill_u*(ty: TensorType; self: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_fill_", self.tensor, value).to(ATensor)
proc u_fill_u*(self: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_fill_", value.tensor).to(ATensor)
proc u_fill_u*(ty: TensorType; self: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_fill_", self.tensor, value.tensor).to(ATensor)
proc is_contiguous*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_contiguous").to(bool)
proc is_contiguous*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_contiguous", self.tensor).to(bool)
proc is_set_to*(self: Tensor, tensor: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_set_to", tensor.tensor).to(bool)
proc is_set_to*(ty: TensorType; self: Tensor, tensor: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_set_to", self.tensor, tensor.tensor).to(bool)
proc masked_fill_u*(self: Tensor, mask: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("masked_fill_", mask.tensor, value).to(ATensor)
proc masked_fill_u*(ty: TensorType; self: Tensor, mask: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value).to(ATensor)
proc masked_fill_u*(self: Tensor, mask: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("masked_fill_", mask.tensor, value.tensor).to(ATensor)
proc masked_fill_u*(ty: TensorType; self: Tensor, mask: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("masked_fill_", self.tensor, mask.tensor, value.tensor).to(ATensor)
proc masked_scatter_u*(self: Tensor, mask: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("masked_scatter_", mask.tensor, source.tensor).to(ATensor)
proc masked_scatter_u*(ty: TensorType; self: Tensor, mask: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("masked_scatter_", self.tensor, mask.tensor, source.tensor).to(ATensor)
proc masked_select_out*(ty: TensorType; aresult: Tensor, self: Tensor, mask: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("masked_select_out", aresult.tensor, self.tensor, mask.tensor).to(ATensor)
proc masked_select_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mask: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::masked_select_out", aresult.tensor, self.tensor, mask.tensor).to(ATensor)
proc masked_select*(self: Tensor, mask: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("masked_select", mask.tensor).to(ATensor)
proc masked_select*(ty: TensorType; self: Tensor, mask: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("masked_select", self.tensor, mask.tensor).to(ATensor)
proc masked_select*(_: typedesc[torch]; self: Tensor, mask: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::masked_select", self.tensor, mask.tensor).to(ATensor)
proc nonzero_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nonzero_out", aresult.tensor, self.tensor).to(ATensor)
proc nonzero_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nonzero_out", aresult.tensor, self.tensor).to(ATensor)
proc nonzero*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("nonzero").to(ATensor)
proc nonzero*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nonzero", self.tensor).to(ATensor)
proc nonzero*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nonzero", self.tensor).to(ATensor)
proc contiguous*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("contiguous").to(ATensor)
proc contiguous*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("contiguous", self.tensor).to(ATensor)
proc th_clone*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_clone", self.tensor).to(ATensor)
proc th_clone*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_clone", self.tensor).to(ATensor)
proc view*(self: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("view", size).to(ATensor)
proc view*(ty: TensorType; self: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("view", self.tensor, size).to(ATensor)
proc th_resize_as_u*(ty: TensorType; self: Tensor, the_template: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_resize_as_", self.tensor, the_template.tensor).to(ATensor)
proc th_resize_as_u*(_: typedesc[torch]; self: Tensor, the_template: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_resize_as_", self.tensor, the_template.tensor).to(ATensor)
proc index_select_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_select_out", aresult.tensor, self.tensor, dim, index.tensor).to(ATensor)
proc index_select_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::index_select_out", aresult.tensor, self.tensor, dim, index.tensor).to(ATensor)
proc index_select*(self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index_select", dim, index.tensor).to(ATensor)
proc index_select*(ty: TensorType; self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_select", self.tensor, dim, index.tensor).to(ATensor)
proc index_select*(_: typedesc[torch]; self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::index_select", self.tensor, dim, index.tensor).to(ATensor)
proc u_indexCopy_u*(self: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_indexCopy_", dim, index.tensor, source.tensor).to(ATensor)
proc u_indexCopy_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_indexCopy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor)
proc take_out*(ty: TensorType; aresult: Tensor, self: Tensor, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("take_out", aresult.tensor, self.tensor, index.tensor).to(ATensor)
proc take_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::take_out", aresult.tensor, self.tensor, index.tensor).to(ATensor)
proc take*(self: Tensor, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("take", index.tensor).to(ATensor)
proc take*(ty: TensorType; self: Tensor, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("take", self.tensor, index.tensor).to(ATensor)
proc take*(_: typedesc[torch]; self: Tensor, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::take", self.tensor, index.tensor).to(ATensor)
proc put_u*(self: Tensor, index: Tensor, source: Tensor, accumulate: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("put_", index.tensor, source.tensor, accumulate).to(ATensor)
proc put_u*(ty: TensorType; self: Tensor, index: Tensor, source: Tensor, accumulate: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("put_", self.tensor, index.tensor, source.tensor, accumulate).to(ATensor)
proc index_add_u*(self: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index_add_", dim, index.tensor, source.tensor).to(ATensor)
proc index_add_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_add_", self.tensor, dim, index.tensor, source.tensor).to(ATensor)
proc index_fill_u*(self: Tensor, dim: int64, index: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index_fill_", dim, index.tensor, value).to(ATensor)
proc index_fill_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value).to(ATensor)
proc index_fill_u*(self: Tensor, dim: int64, index: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index_fill_", dim, index.tensor, value.tensor).to(ATensor)
proc index_fill_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_fill_", self.tensor, dim, index.tensor, value.tensor).to(ATensor)
proc unfold*(self: Tensor, dimension: int64, size: int64, step: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("unfold", dimension, size, step).to(ATensor)
proc unfold*(ty: TensorType; self: Tensor, dimension: int64, size: int64, step: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("unfold", self.tensor, dimension, size, step).to(ATensor)
proc u_range_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, step: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_range_out", aresult.tensor, start, aend, step).to(ATensor)
proc u_range_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, step: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_range_out", aresult.tensor, start, aend, step).to(ATensor)
proc u_range*(ty: TensorType; start: float, aend: float, step: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_range", start, aend, step).to(ATensor)
proc u_arange_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, step: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_arange_out", aresult.tensor, start, aend, step).to(ATensor)
proc u_arange_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, step: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_arange_out", aresult.tensor, start, aend, step).to(ATensor)
proc u_arange*(ty: TensorType; start: float, aend: float, step: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_arange", start, aend, step).to(ATensor)
proc u_arange_out*(ty: TensorType; aresult: Tensor, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_arange_out", aresult.tensor, aend).to(ATensor)
proc u_arange_out*(_: typedesc[torch]; aresult: Tensor, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_arange_out", aresult.tensor, aend).to(ATensor)
proc u_arange*(ty: TensorType; aend: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_arange", aend).to(ATensor)
proc scatter_u*(self: Tensor, dim: int64, index: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("scatter_", dim, index.tensor, src.tensor).to(ATensor)
proc scatter_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, src.tensor).to(ATensor)
proc scatter_u*(self: Tensor, dim: int64, index: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("scatter_", dim, index.tensor, value).to(ATensor)
proc scatter_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("scatter_", self.tensor, dim, index.tensor, value).to(ATensor)
proc scatter_add_u*(self: Tensor, dim: int64, index: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("scatter_add_", dim, index.tensor, src.tensor).to(ATensor)
proc scatter_add_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("scatter_add_", self.tensor, dim, index.tensor, src.tensor).to(ATensor)
proc gather_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gather_out", aresult.tensor, self.tensor, dim, index.tensor).to(ATensor)
proc gather_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::gather_out", aresult.tensor, self.tensor, dim, index.tensor).to(ATensor)
proc gather*(self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("gather", dim, index.tensor).to(ATensor)
proc gather*(ty: TensorType; self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gather", self.tensor, dim, index.tensor).to(ATensor)
proc gather*(_: typedesc[torch]; self: Tensor, dim: int64, index: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::gather", self.tensor, dim, index.tensor).to(ATensor)
proc data_ptr*(self: Tensor): pointer {.inline, noinit.} = self.tensor.dynamicCppCall("data_ptr").to(pointer)
proc data_ptr*(ty: TensorType; self: Tensor): pointer {.inline, noinit.} = ty.dynamicCppCall("data_ptr", self.tensor).to(pointer)
proc equal*(self: Tensor, other: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("equal", other.tensor).to(bool)
proc equal*(ty: TensorType; self: Tensor, other: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("equal", self.tensor, other.tensor).to(bool)
proc equal*(_: typedesc[torch]; self: Tensor, other: Tensor): bool {.inline, noinit.} = dynamicCCall("at::equal", self.tensor, other.tensor).to(bool)
proc u_u_uand_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__and___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_uand_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__and___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_uand_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__and__", other).to(ATensor)
proc u_u_uand_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__and__", self.tensor, other).to(ATensor)
proc u_u_uand_u_uu*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__and__", self.tensor, other).to(ATensor)
proc u_u_uand_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__and___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_uand_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__and___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_uand_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__and__", other.tensor).to(ATensor)
proc u_u_uand_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__and__", self.tensor, other.tensor).to(ATensor)
proc u_u_uand_u_uu*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__and__", self.tensor, other.tensor).to(ATensor)
proc u_u_uiand_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__iand__", other).to(ATensor)
proc u_u_uiand_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__iand__", self.tensor, other).to(ATensor)
proc u_u_uiand_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__iand__", other.tensor).to(ATensor)
proc u_u_uiand_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__iand__", self.tensor, other.tensor).to(ATensor)
proc u_u_uor_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__or___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_uor_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__or___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_uor_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__or__", other).to(ATensor)
proc u_u_uor_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__or__", self.tensor, other).to(ATensor)
proc u_u_uor_u_uu*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__or__", self.tensor, other).to(ATensor)
proc u_u_uor_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__or___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_uor_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__or___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_uor_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__or__", other.tensor).to(ATensor)
proc u_u_uor_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__or__", self.tensor, other.tensor).to(ATensor)
proc u_u_uor_u_uu*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__or__", self.tensor, other.tensor).to(ATensor)
proc u_u_uior_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__ior__", other).to(ATensor)
proc u_u_uior_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__ior__", self.tensor, other).to(ATensor)
proc u_u_uior_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__ior__", other.tensor).to(ATensor)
proc u_u_uior_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__ior__", self.tensor, other.tensor).to(ATensor)
proc u_u_uxor_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__xor___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_uxor_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__xor___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_uxor_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__xor__", other).to(ATensor)
proc u_u_uxor_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__xor__", self.tensor, other).to(ATensor)
proc u_u_uxor_u_uu*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__xor__", self.tensor, other).to(ATensor)
proc u_u_uxor_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__xor___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_uxor_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__xor___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_uxor_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__xor__", other.tensor).to(ATensor)
proc u_u_uxor_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__xor__", self.tensor, other.tensor).to(ATensor)
proc u_u_uxor_u_uu*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__xor__", self.tensor, other.tensor).to(ATensor)
proc u_u_uixor_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__ixor__", other).to(ATensor)
proc u_u_uixor_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__ixor__", self.tensor, other).to(ATensor)
proc u_u_uixor_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__ixor__", other.tensor).to(ATensor)
proc u_u_uixor_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__ixor__", self.tensor, other.tensor).to(ATensor)
proc u_u_ulshift_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__lshift___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_ulshift_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__lshift___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_ulshift_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__lshift__", other).to(ATensor)
proc u_u_ulshift_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__lshift__", self.tensor, other).to(ATensor)
proc u_u_ulshift_u_uu*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__lshift__", self.tensor, other).to(ATensor)
proc u_u_ulshift_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__lshift___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_ulshift_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__lshift___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_ulshift_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__lshift__", other.tensor).to(ATensor)
proc u_u_ulshift_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__lshift__", self.tensor, other.tensor).to(ATensor)
proc u_u_ulshift_u_uu*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__lshift__", self.tensor, other.tensor).to(ATensor)
proc u_u_uilshift_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__ilshift__", other).to(ATensor)
proc u_u_uilshift_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__ilshift__", self.tensor, other).to(ATensor)
proc u_u_uilshift_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__ilshift__", other.tensor).to(ATensor)
proc u_u_uilshift_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__ilshift__", self.tensor, other.tensor).to(ATensor)
proc u_u_urshift_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__rshift___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_urshift_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__rshift___out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_u_urshift_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__rshift__", other).to(ATensor)
proc u_u_urshift_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__rshift__", self.tensor, other).to(ATensor)
proc u_u_urshift_u_uu*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__rshift__", self.tensor, other).to(ATensor)
proc u_u_urshift_u_u_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__rshift___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_urshift_u_u_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__rshift___out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_u_urshift_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__rshift__", other.tensor).to(ATensor)
proc u_u_urshift_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__rshift__", self.tensor, other.tensor).to(ATensor)
proc u_u_urshift_u_uu*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::__rshift__", self.tensor, other.tensor).to(ATensor)
proc u_u_uirshift_u_uu*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__irshift__", other).to(ATensor)
proc u_u_uirshift_u_uu*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__irshift__", self.tensor, other).to(ATensor)
proc u_u_uirshift_u_uu*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("__irshift__", other.tensor).to(ATensor)
proc u_u_uirshift_u_uu*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("__irshift__", self.tensor, other.tensor).to(ATensor)
proc lt_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lt_out", aresult.tensor, self.tensor, other).to(ATensor)
proc lt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lt_out", aresult.tensor, self.tensor, other).to(ATensor)
proc lt*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lt", other).to(ATensor)
proc lt*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lt", self.tensor, other).to(ATensor)
proc lt*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lt", self.tensor, other).to(ATensor)
proc lt_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lt_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc lt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lt_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc lt*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lt", other.tensor).to(ATensor)
proc lt*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lt", self.tensor, other.tensor).to(ATensor)
proc lt*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lt", self.tensor, other.tensor).to(ATensor)
proc lt_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lt_", other).to(ATensor)
proc lt_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lt_", self.tensor, other).to(ATensor)
proc lt_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lt_", other.tensor).to(ATensor)
proc lt_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lt_", self.tensor, other.tensor).to(ATensor)
proc gt_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gt_out", aresult.tensor, self.tensor, other).to(ATensor)
proc gt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::gt_out", aresult.tensor, self.tensor, other).to(ATensor)
proc gt*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("gt", other).to(ATensor)
proc gt*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gt", self.tensor, other).to(ATensor)
proc gt*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::gt", self.tensor, other).to(ATensor)
proc gt_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gt_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc gt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::gt_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc gt*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("gt", other.tensor).to(ATensor)
proc gt*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gt", self.tensor, other.tensor).to(ATensor)
proc gt*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::gt", self.tensor, other.tensor).to(ATensor)
proc gt_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("gt_", other).to(ATensor)
proc gt_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gt_", self.tensor, other).to(ATensor)
proc gt_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("gt_", other.tensor).to(ATensor)
proc gt_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gt_", self.tensor, other.tensor).to(ATensor)
proc le_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("le_out", aresult.tensor, self.tensor, other).to(ATensor)
proc le_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::le_out", aresult.tensor, self.tensor, other).to(ATensor)
proc le*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("le", other).to(ATensor)
proc le*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("le", self.tensor, other).to(ATensor)
proc le*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::le", self.tensor, other).to(ATensor)
proc le_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("le_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc le_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::le_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc le*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("le", other.tensor).to(ATensor)
proc le*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("le", self.tensor, other.tensor).to(ATensor)
proc le*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::le", self.tensor, other.tensor).to(ATensor)
proc le_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("le_", other).to(ATensor)
proc le_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("le_", self.tensor, other).to(ATensor)
proc le_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("le_", other.tensor).to(ATensor)
proc le_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("le_", self.tensor, other.tensor).to(ATensor)
proc ge_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ge_out", aresult.tensor, self.tensor, other).to(ATensor)
proc ge_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ge_out", aresult.tensor, self.tensor, other).to(ATensor)
proc ge*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ge", other).to(ATensor)
proc ge*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ge", self.tensor, other).to(ATensor)
proc ge*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ge", self.tensor, other).to(ATensor)
proc ge_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ge_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc ge_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ge_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc ge*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ge", other.tensor).to(ATensor)
proc ge*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ge", self.tensor, other.tensor).to(ATensor)
proc ge*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ge", self.tensor, other.tensor).to(ATensor)
proc ge_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ge_", other).to(ATensor)
proc ge_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ge_", self.tensor, other).to(ATensor)
proc ge_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ge_", other.tensor).to(ATensor)
proc ge_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ge_", self.tensor, other.tensor).to(ATensor)
proc eq_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eq_out", aresult.tensor, self.tensor, other).to(ATensor)
proc eq_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eq_out", aresult.tensor, self.tensor, other).to(ATensor)
proc eq*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("eq", other).to(ATensor)
proc eq*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eq", self.tensor, other).to(ATensor)
proc eq*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eq", self.tensor, other).to(ATensor)
proc eq_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eq_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc eq_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eq_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc eq*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("eq", other.tensor).to(ATensor)
proc eq*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eq", self.tensor, other.tensor).to(ATensor)
proc eq*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eq", self.tensor, other.tensor).to(ATensor)
proc eq_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("eq_", other).to(ATensor)
proc eq_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eq_", self.tensor, other).to(ATensor)
proc eq_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("eq_", other.tensor).to(ATensor)
proc eq_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eq_", self.tensor, other.tensor).to(ATensor)
proc ne_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ne_out", aresult.tensor, self.tensor, other).to(ATensor)
proc ne_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ne_out", aresult.tensor, self.tensor, other).to(ATensor)
proc ne*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ne", other).to(ATensor)
proc ne*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ne", self.tensor, other).to(ATensor)
proc ne*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ne", self.tensor, other).to(ATensor)
proc ne_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ne_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc ne_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ne_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc ne*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ne", other.tensor).to(ATensor)
proc ne*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ne", self.tensor, other.tensor).to(ATensor)
proc ne*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ne", self.tensor, other.tensor).to(ATensor)
proc ne_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ne_", other).to(ATensor)
proc ne_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ne_", self.tensor, other).to(ATensor)
proc ne_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ne_", other.tensor).to(ATensor)
proc ne_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ne_", self.tensor, other.tensor).to(ATensor)
proc min_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("min_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc min_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::min_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc min*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("min", other.tensor).to(ATensor)
proc min*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("min", self.tensor, other.tensor).to(ATensor)
proc min*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::min", self.tensor, other.tensor).to(ATensor)
proc min*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("min").to(float)
proc min*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("min", self.tensor).to(float)
proc min*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::min", self.tensor).to(float)
proc u_th_min_out*(ty: TensorType; min: Tensor, min_indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_min_out", min.tensor, min_indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.min = newTensor tupleRes[0]
  result.min_indices = newTensor tupleRes[1]
proc u_th_min_out*(_: typedesc[torch]; min: Tensor, min_indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_min_out", min.tensor, min_indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.min = newTensor tupleRes[0]
  result.min_indices = newTensor tupleRes[1]
proc u_th_min*(self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_th_min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.min = newTensor tupleRes[0]
  result.min_indices = newTensor tupleRes[1]
proc u_th_min*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.min = newTensor tupleRes[0]
  result.min_indices = newTensor tupleRes[1]
proc u_th_min*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.min = newTensor tupleRes[0]
  result.min_indices = newTensor tupleRes[1]
proc max_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc max_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc max*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("max", other.tensor).to(ATensor)
proc max*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max", self.tensor, other.tensor).to(ATensor)
proc max*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max", self.tensor, other.tensor).to(ATensor)
proc max*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("max").to(float)
proc max*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("max", self.tensor).to(float)
proc max*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::max", self.tensor).to(float)
proc u_th_max_out*(ty: TensorType; max: Tensor, max_indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_max_out", max.tensor, max_indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.max = newTensor tupleRes[0]
  result.max_indices = newTensor tupleRes[1]
proc u_th_max_out*(_: typedesc[torch]; max: Tensor, max_indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_max_out", max.tensor, max_indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.max = newTensor tupleRes[0]
  result.max_indices = newTensor tupleRes[1]
proc u_th_max*(self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_th_max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.max = newTensor tupleRes[0]
  result.max_indices = newTensor tupleRes[1]
proc u_th_max*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.max = newTensor tupleRes[0]
  result.max_indices = newTensor tupleRes[1]
proc u_th_max*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.max = newTensor tupleRes[0]
  result.max_indices = newTensor tupleRes[1]
proc u_th_kthvalue_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_kthvalue_out", values.tensor, indices.tensor, self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_kthvalue_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_kthvalue_out", values.tensor, indices.tensor, self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_kthvalue*(self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_th_kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_kthvalue*(ty: TensorType; self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_kthvalue*(_: typedesc[torch]; self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_mode_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_mode_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_mode_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_mode_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_mode*(self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_th_mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_mode*(ty: TensorType; self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_mode*(_: typedesc[torch]; self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc median*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("median").to(float)
proc median*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("median", self.tensor).to(float)
proc median*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::median", self.tensor).to(float)
proc u_th_median_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_median_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_median_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_median_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_median*(self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_th_median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_median*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_th_median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc u_th_median*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_th_median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc sort_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, dim: int64 = -1, descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("sort_out", values.tensor, indices.tensor, self.tensor, dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc sort_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, dim: int64 = -1, descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::sort_out", values.tensor, indices.tensor, self.tensor, dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc sort*(self: Tensor, dim: int64 = -1, descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("sort", dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc sort*(ty: TensorType; self: Tensor, dim: int64 = -1, descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("sort", self.tensor, dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc sort*(_: typedesc[torch]; self: Tensor, dim: int64 = -1, descending: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::sort", self.tensor, dim, descending).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc topk_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, k: int64, dim: int64 = -1, largest: bool = true, sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("topk_out", values.tensor, indices.tensor, self.tensor, k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc topk_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, k: int64, dim: int64 = -1, largest: bool = true, sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::topk_out", values.tensor, indices.tensor, self.tensor, k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc topk*(self: Tensor, k: int64, dim: int64 = -1, largest: bool = true, sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("topk", k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc topk*(ty: TensorType; self: Tensor, k: int64, dim: int64 = -1, largest: bool = true, sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("topk", self.tensor, k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc topk*(_: typedesc[torch]; self: Tensor, k: int64, dim: int64 = -1, largest: bool = true, sorted: bool = true): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::topk", self.tensor, k, dim, largest, sorted).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc all*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("all").to(float)
proc all*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("all", self.tensor).to(float)
proc all*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::all", self.tensor).to(float)
proc u_th_all_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_all_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_all_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_all_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_all*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_all", dim, keepdim).to(ATensor)
proc u_th_all*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_all", self.tensor, dim, keepdim).to(ATensor)
proc u_th_all*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_all", self.tensor, dim, keepdim).to(ATensor)
proc any*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("any").to(float)
proc any*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("any", self.tensor).to(float)
proc any*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::any", self.tensor).to(float)
proc u_th_any_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_any_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_any_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_any_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_any*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_any", dim, keepdim).to(ATensor)
proc u_th_any*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_any", self.tensor, dim, keepdim).to(ATensor)
proc u_th_any*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_any", self.tensor, dim, keepdim).to(ATensor)
proc u_th_get_device*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("_th_get_device", self.tensor).to(int64)
proc u_th_get_device*(_: typedesc[torch]; self: Tensor): int64 {.inline, noinit.} = dynamicCCall("at::_th_get_device", self.tensor).to(int64)
proc u_abs_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_abs_out", aresult.tensor, self.tensor).to(ATensor)
proc u_abs_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_abs_out", aresult.tensor, self.tensor).to(ATensor)
proc u_abs*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_abs").to(ATensor)
proc u_abs*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_abs", self.tensor).to(ATensor)
proc u_abs*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_abs", self.tensor).to(ATensor)
proc u_th_sigmoid_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_sigmoid_out", aresult.tensor, self.tensor).to(ATensor)
proc u_th_sigmoid_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_sigmoid_out", aresult.tensor, self.tensor).to(ATensor)
proc u_th_sigmoid*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_sigmoid").to(ATensor)
proc u_th_sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_sigmoid", self.tensor).to(ATensor)
proc u_th_sigmoid*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_sigmoid", self.tensor).to(ATensor)
proc u_log_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_log").to(ATensor)
proc u_log*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log", self.tensor).to(ATensor)
proc u_log*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log", self.tensor).to(ATensor)
proc u_log10_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log10_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log10_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log10_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log10*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_log10").to(ATensor)
proc u_log10*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log10", self.tensor).to(ATensor)
proc u_log10*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log10", self.tensor).to(ATensor)
proc u_log1p_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log1p_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log1p_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log1p_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log1p*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_log1p").to(ATensor)
proc u_log1p*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log1p", self.tensor).to(ATensor)
proc u_log1p*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log1p", self.tensor).to(ATensor)
proc u_log2_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log2_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log2_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log2_out", aresult.tensor, self.tensor).to(ATensor)
proc u_log2*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_log2").to(ATensor)
proc u_log2*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_log2", self.tensor).to(ATensor)
proc u_log2*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_log2", self.tensor).to(ATensor)
proc lgamma_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lgamma_out", aresult.tensor, self.tensor).to(ATensor)
proc lgamma_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lgamma_out", aresult.tensor, self.tensor).to(ATensor)
proc lgamma*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lgamma").to(ATensor)
proc lgamma*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lgamma", self.tensor).to(ATensor)
proc lgamma*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lgamma", self.tensor).to(ATensor)
proc lgamma_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lgamma_").to(ATensor)
proc lgamma_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lgamma_", self.tensor).to(ATensor)
proc digamma_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("digamma_out", aresult.tensor, self.tensor).to(ATensor)
proc digamma_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::digamma_out", aresult.tensor, self.tensor).to(ATensor)
proc digamma*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("digamma").to(ATensor)
proc digamma*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("digamma", self.tensor).to(ATensor)
proc digamma*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::digamma", self.tensor).to(ATensor)
proc digamma_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("digamma_").to(ATensor)
proc digamma_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("digamma_", self.tensor).to(ATensor)
proc polygamma_out*(ty: TensorType; aresult: Tensor, n: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("polygamma_out", aresult.tensor, n, self.tensor).to(ATensor)
proc polygamma_out*(_: typedesc[torch]; aresult: Tensor, n: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::polygamma_out", aresult.tensor, n, self.tensor).to(ATensor)
proc polygamma*(self: Tensor, n: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("polygamma", n).to(ATensor)
proc polygamma*(ty: TensorType; n: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("polygamma", n, self.tensor).to(ATensor)
proc polygamma*(_: typedesc[torch]; n: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::polygamma", n, self.tensor).to(ATensor)
proc polygamma_u*(self: Tensor, n: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("polygamma_", n).to(ATensor)
proc polygamma_u*(ty: TensorType; self: Tensor, n: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("polygamma_", self.tensor, n).to(ATensor)
proc u_exp_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_exp_out", aresult.tensor, self.tensor).to(ATensor)
proc u_exp_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_exp_out", aresult.tensor, self.tensor).to(ATensor)
proc u_exp*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_exp").to(ATensor)
proc u_exp*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_exp", self.tensor).to(ATensor)
proc u_exp*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_exp", self.tensor).to(ATensor)
proc u_expm1_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_expm1_out", aresult.tensor, self.tensor).to(ATensor)
proc u_expm1_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_expm1_out", aresult.tensor, self.tensor).to(ATensor)
proc u_expm1*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_expm1").to(ATensor)
proc u_expm1*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_expm1", self.tensor).to(ATensor)
proc u_expm1*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_expm1", self.tensor).to(ATensor)
proc u_cos_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cos_out", aresult.tensor, self.tensor).to(ATensor)
proc u_cos_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cos_out", aresult.tensor, self.tensor).to(ATensor)
proc u_cos*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cos").to(ATensor)
proc u_cos*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cos", self.tensor).to(ATensor)
proc u_cos*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cos", self.tensor).to(ATensor)
proc u_acos_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_acos_out", aresult.tensor, self.tensor).to(ATensor)
proc u_acos_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_acos_out", aresult.tensor, self.tensor).to(ATensor)
proc u_acos*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_acos").to(ATensor)
proc u_acos*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_acos", self.tensor).to(ATensor)
proc u_acos*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_acos", self.tensor).to(ATensor)
proc u_cosh_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cosh_out", aresult.tensor, self.tensor).to(ATensor)
proc u_cosh_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cosh_out", aresult.tensor, self.tensor).to(ATensor)
proc u_cosh*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cosh").to(ATensor)
proc u_cosh*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cosh", self.tensor).to(ATensor)
proc u_cosh*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cosh", self.tensor).to(ATensor)
proc u_sin_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sin_out", aresult.tensor, self.tensor).to(ATensor)
proc u_sin_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sin_out", aresult.tensor, self.tensor).to(ATensor)
proc u_sin*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_sin").to(ATensor)
proc u_sin*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sin", self.tensor).to(ATensor)
proc u_sin*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sin", self.tensor).to(ATensor)
proc u_asin_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_asin_out", aresult.tensor, self.tensor).to(ATensor)
proc u_asin_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_asin_out", aresult.tensor, self.tensor).to(ATensor)
proc u_asin*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_asin").to(ATensor)
proc u_asin*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_asin", self.tensor).to(ATensor)
proc u_asin*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_asin", self.tensor).to(ATensor)
proc u_sinh_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sinh_out", aresult.tensor, self.tensor).to(ATensor)
proc u_sinh_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sinh_out", aresult.tensor, self.tensor).to(ATensor)
proc u_sinh*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_sinh").to(ATensor)
proc u_sinh*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sinh", self.tensor).to(ATensor)
proc u_sinh*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sinh", self.tensor).to(ATensor)
proc u_tan_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tan_out", aresult.tensor, self.tensor).to(ATensor)
proc u_tan_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tan_out", aresult.tensor, self.tensor).to(ATensor)
proc u_tan*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_tan").to(ATensor)
proc u_tan*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tan", self.tensor).to(ATensor)
proc u_tan*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tan", self.tensor).to(ATensor)
proc u_atan_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_atan_out", aresult.tensor, self.tensor).to(ATensor)
proc u_atan_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_atan_out", aresult.tensor, self.tensor).to(ATensor)
proc u_atan*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_atan").to(ATensor)
proc u_atan*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_atan", self.tensor).to(ATensor)
proc u_atan*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_atan", self.tensor).to(ATensor)
proc u_th_tanh_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_tanh_out", aresult.tensor, self.tensor).to(ATensor)
proc u_th_tanh_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_tanh_out", aresult.tensor, self.tensor).to(ATensor)
proc u_th_tanh*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_tanh").to(ATensor)
proc u_th_tanh*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_tanh", self.tensor).to(ATensor)
proc u_th_tanh*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_tanh", self.tensor).to(ATensor)
proc u_erf_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_erf_out", aresult.tensor, self.tensor).to(ATensor)
proc u_erf_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_erf_out", aresult.tensor, self.tensor).to(ATensor)
proc u_erf*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_erf").to(ATensor)
proc u_erf*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_erf", self.tensor).to(ATensor)
proc u_erf*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_erf", self.tensor).to(ATensor)
proc u_erfc_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_erfc_out", aresult.tensor, self.tensor).to(ATensor)
proc u_erfc_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_erfc_out", aresult.tensor, self.tensor).to(ATensor)
proc u_erfc*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_erfc").to(ATensor)
proc u_erfc*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_erfc", self.tensor).to(ATensor)
proc u_erfc*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_erfc", self.tensor).to(ATensor)
proc erfinv_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("erfinv_").to(ATensor)
proc erfinv_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erfinv_", self.tensor).to(ATensor)
proc erfinv_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erfinv_out", aresult.tensor, self.tensor).to(ATensor)
proc erfinv_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erfinv_out", aresult.tensor, self.tensor).to(ATensor)
proc erfinv*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("erfinv").to(ATensor)
proc erfinv*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erfinv", self.tensor).to(ATensor)
proc erfinv*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erfinv", self.tensor).to(ATensor)
proc u_sqrt_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc u_sqrt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc u_sqrt*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_sqrt").to(ATensor)
proc u_sqrt*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sqrt", self.tensor).to(ATensor)
proc u_sqrt*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sqrt", self.tensor).to(ATensor)
proc u_rsqrt_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_rsqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc u_rsqrt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_rsqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc u_rsqrt*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_rsqrt").to(ATensor)
proc u_rsqrt*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_rsqrt", self.tensor).to(ATensor)
proc u_rsqrt*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_rsqrt", self.tensor).to(ATensor)
proc u_ceil_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_ceil_out", aresult.tensor, self.tensor).to(ATensor)
proc u_ceil_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_ceil_out", aresult.tensor, self.tensor).to(ATensor)
proc u_ceil*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_ceil").to(ATensor)
proc u_ceil*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_ceil", self.tensor).to(ATensor)
proc u_ceil*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_ceil", self.tensor).to(ATensor)
proc u_floor_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_floor_out", aresult.tensor, self.tensor).to(ATensor)
proc u_floor_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_floor_out", aresult.tensor, self.tensor).to(ATensor)
proc u_floor*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_floor").to(ATensor)
proc u_floor*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_floor", self.tensor).to(ATensor)
proc u_floor*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_floor", self.tensor).to(ATensor)
proc u_round_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_round_out", aresult.tensor, self.tensor).to(ATensor)
proc u_round_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_round_out", aresult.tensor, self.tensor).to(ATensor)
proc u_round*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_round").to(ATensor)
proc u_round*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_round", self.tensor).to(ATensor)
proc u_round*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_round", self.tensor).to(ATensor)
proc u_trunc_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_trunc_out", aresult.tensor, self.tensor).to(ATensor)
proc u_trunc_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_trunc_out", aresult.tensor, self.tensor).to(ATensor)
proc u_trunc*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_trunc").to(ATensor)
proc u_trunc*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_trunc", self.tensor).to(ATensor)
proc u_trunc*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_trunc", self.tensor).to(ATensor)
proc frac_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("frac_").to(ATensor)
proc frac_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("frac_", self.tensor).to(ATensor)
proc frac_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("frac_out", aresult.tensor, self.tensor).to(ATensor)
proc frac_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::frac_out", aresult.tensor, self.tensor).to(ATensor)
proc frac*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("frac").to(ATensor)
proc frac*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("frac", self.tensor).to(ATensor)
proc frac*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::frac", self.tensor).to(ATensor)
proc u_th_var_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_var_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_var_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_var_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_var*(self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_var", dim, unbiased, keepdim).to(ATensor)
proc u_th_var*(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_var", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_var*(_: typedesc[torch]; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_var", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_var*(self: Tensor, unbiased: bool = true): float {.inline, noinit.} = self.tensor.dynamicCppCall("_th_var", unbiased).to(float)
proc u_th_var*(ty: TensorType; self: Tensor, unbiased: bool = true): float {.inline, noinit.} = ty.dynamicCppCall("_th_var", self.tensor, unbiased).to(float)
proc u_th_var*(_: typedesc[torch]; self: Tensor, unbiased: bool = true): float {.inline, noinit.} = dynamicCCall("at::_th_var", self.tensor, unbiased).to(float)
proc u_th_std_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_std_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_std_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_std_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_std*(self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_std", dim, unbiased, keepdim).to(ATensor)
proc u_th_std*(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_std", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_std*(_: typedesc[torch]; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_std", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc u_th_std*(self: Tensor, unbiased: bool = true): float {.inline, noinit.} = self.tensor.dynamicCppCall("_th_std", unbiased).to(float)
proc u_th_std*(ty: TensorType; self: Tensor, unbiased: bool = true): float {.inline, noinit.} = ty.dynamicCppCall("_th_std", self.tensor, unbiased).to(float)
proc u_th_std*(_: typedesc[torch]; self: Tensor, unbiased: bool = true): float {.inline, noinit.} = dynamicCCall("at::_th_std", self.tensor, unbiased).to(float)
proc th_norm*(ty: TensorType; self: Tensor, p: float = 2): float {.inline, noinit.} = ty.dynamicCppCall("th_norm", self.tensor, p).to(float)
proc th_norm*(_: typedesc[torch]; self: Tensor, p: float = 2): float {.inline, noinit.} = dynamicCCall("at::th_norm", self.tensor, p).to(float)
proc u_th_norm_out*(ty: TensorType; aresult: Tensor, self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_norm_out", aresult.tensor, self.tensor, p, dim, keepdim).to(ATensor)
proc u_th_norm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_norm_out", aresult.tensor, self.tensor, p, dim, keepdim).to(ATensor)
proc u_th_norm*(self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_norm", p, dim, keepdim).to(ATensor)
proc u_th_norm*(ty: TensorType; self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_norm", self.tensor, p, dim, keepdim).to(ATensor)
proc u_th_norm*(_: typedesc[torch]; self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_norm", self.tensor, p, dim, keepdim).to(ATensor)
proc renorm_out*(ty: TensorType; aresult: Tensor, self: Tensor, p: float, dim: int64, maxnorm: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("renorm_out", aresult.tensor, self.tensor, p, dim, maxnorm).to(ATensor)
proc renorm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, p: float, dim: int64, maxnorm: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::renorm_out", aresult.tensor, self.tensor, p, dim, maxnorm).to(ATensor)
proc renorm*(self: Tensor, p: float, dim: int64, maxnorm: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("renorm", p, dim, maxnorm).to(ATensor)
proc renorm*(ty: TensorType; self: Tensor, p: float, dim: int64, maxnorm: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("renorm", self.tensor, p, dim, maxnorm).to(ATensor)
proc renorm*(_: typedesc[torch]; self: Tensor, p: float, dim: int64, maxnorm: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::renorm", self.tensor, p, dim, maxnorm).to(ATensor)
proc renorm_u*(self: Tensor, p: float, dim: int64, maxnorm: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("renorm_", p, dim, maxnorm).to(ATensor)
proc renorm_u*(ty: TensorType; self: Tensor, p: float, dim: int64, maxnorm: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("renorm_", self.tensor, p, dim, maxnorm).to(ATensor)
proc dist*(self: Tensor, other: Tensor, p: float = 2): float {.inline, noinit.} = self.tensor.dynamicCppCall("dist", other.tensor, p).to(float)
proc dist*(ty: TensorType; self: Tensor, other: Tensor, p: float = 2): float {.inline, noinit.} = ty.dynamicCppCall("dist", self.tensor, other.tensor, p).to(float)
proc dist*(_: typedesc[torch]; self: Tensor, other: Tensor, p: float = 2): float {.inline, noinit.} = dynamicCCall("at::dist", self.tensor, other.tensor, p).to(float)
proc reciprocal_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reciprocal_out", aresult.tensor, self.tensor).to(ATensor)
proc reciprocal_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reciprocal_out", aresult.tensor, self.tensor).to(ATensor)
proc reciprocal*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("reciprocal").to(ATensor)
proc reciprocal*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reciprocal", self.tensor).to(ATensor)
proc reciprocal*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reciprocal", self.tensor).to(ATensor)
proc reciprocal_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("reciprocal_").to(ATensor)
proc reciprocal_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reciprocal_", self.tensor).to(ATensor)
proc neg_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("neg_out", aresult.tensor, self.tensor).to(ATensor)
proc neg_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::neg_out", aresult.tensor, self.tensor).to(ATensor)
proc neg*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("neg").to(ATensor)
proc neg*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("neg", self.tensor).to(ATensor)
proc neg*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::neg", self.tensor).to(ATensor)
proc neg_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("neg_").to(ATensor)
proc neg_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("neg_", self.tensor).to(ATensor)
proc atan2_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("atan2_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc atan2_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::atan2_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc atan2*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("atan2", other.tensor).to(ATensor)
proc atan2*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("atan2", self.tensor, other.tensor).to(ATensor)
proc atan2*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::atan2", self.tensor, other.tensor).to(ATensor)
proc atan2_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("atan2_", other.tensor).to(ATensor)
proc atan2_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("atan2_", self.tensor, other.tensor).to(ATensor)
proc th_pow_out*(ty: TensorType; aresult: Tensor, self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_pow_out", aresult.tensor, self.tensor, exponent).to(ATensor)
proc th_pow_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_pow_out", aresult.tensor, self.tensor, exponent).to(ATensor)
proc th_pow*(ty: TensorType; self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_pow", self.tensor, exponent).to(ATensor)
proc th_pow*(_: typedesc[torch]; self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_pow", self.tensor, exponent).to(ATensor)
proc pow_out*(ty: TensorType; aresult: Tensor, self: Tensor, exponent: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow_out", aresult.tensor, self.tensor, exponent.tensor).to(ATensor)
proc pow_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, exponent: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pow_out", aresult.tensor, self.tensor, exponent.tensor).to(ATensor)
proc pow*(self: Tensor, exponent: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("pow", exponent.tensor).to(ATensor)
proc pow*(ty: TensorType; self: Tensor, exponent: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow", self.tensor, exponent.tensor).to(ATensor)
proc pow*(_: typedesc[torch]; self: Tensor, exponent: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pow", self.tensor, exponent.tensor).to(ATensor)
proc pow_out*(ty: TensorType; aresult: Tensor, base: float, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow_out", aresult.tensor, base, self.tensor).to(ATensor)
proc pow_out*(_: typedesc[torch]; aresult: Tensor, base: float, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pow_out", aresult.tensor, base, self.tensor).to(ATensor)
proc pow*(ty: TensorType; base: float, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow", base, self.tensor).to(ATensor)
proc pow*(_: typedesc[torch]; base: float, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pow", base, self.tensor).to(ATensor)
proc pow_u*(self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("pow_", exponent).to(ATensor)
proc pow_u*(ty: TensorType; self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow_", self.tensor, exponent).to(ATensor)
proc pow_u*(self: Tensor, exponent: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("pow_", exponent.tensor).to(ATensor)
proc pow_u*(ty: TensorType; self: Tensor, exponent: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow_", self.tensor, exponent.tensor).to(ATensor)
proc lerp_out*(ty: TensorType; aresult: Tensor, self: Tensor, aend: Tensor, weight: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lerp_out", aresult.tensor, self.tensor, aend.tensor, weight).to(ATensor)
proc lerp_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, aend: Tensor, weight: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lerp_out", aresult.tensor, self.tensor, aend.tensor, weight).to(ATensor)
proc lerp*(self: Tensor, aend: Tensor, weight: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lerp", aend.tensor, weight).to(ATensor)
proc lerp*(ty: TensorType; self: Tensor, aend: Tensor, weight: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lerp", self.tensor, aend.tensor, weight).to(ATensor)
proc lerp*(_: typedesc[torch]; self: Tensor, aend: Tensor, weight: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::lerp", self.tensor, aend.tensor, weight).to(ATensor)
proc lerp_u*(self: Tensor, aend: Tensor, weight: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("lerp_", aend.tensor, weight).to(ATensor)
proc lerp_u*(ty: TensorType; self: Tensor, aend: Tensor, weight: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("lerp_", self.tensor, aend.tensor, weight).to(ATensor)
proc u_linspace_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, steps: int64 = 100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_linspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc u_linspace_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, steps: int64 = 100): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_linspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc u_linspace*(ty: TensorType; start: float, aend: float, steps: int64 = 100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_linspace", start, aend, steps).to(ATensor)
proc u_logspace_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, steps: int64 = 100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_logspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc u_logspace_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, steps: int64 = 100): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_logspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc u_logspace*(ty: TensorType; start: float, aend: float, steps: int64 = 100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_logspace", start, aend, steps).to(ATensor)
proc histc_out*(ty: TensorType; aresult: Tensor, self: Tensor, bins: int64 = 100, min: float = 0, max: float = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("histc_out", aresult.tensor, self.tensor, bins, min, max).to(ATensor)
proc histc_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, bins: int64 = 100, min: float = 0, max: float = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::histc_out", aresult.tensor, self.tensor, bins, min, max).to(ATensor)
proc histc*(self: Tensor, bins: int64 = 100, min: float = 0, max: float = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("histc", bins, min, max).to(ATensor)
proc histc*(ty: TensorType; self: Tensor, bins: int64 = 100, min: float = 0, max: float = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("histc", self.tensor, bins, min, max).to(ATensor)
proc histc*(_: typedesc[torch]; self: Tensor, bins: int64 = 100, min: float = 0, max: float = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::histc", self.tensor, bins, min, max).to(ATensor)
proc th_zero_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_zero_", self.tensor).to(ATensor)
proc th_zero_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_zero_", self.tensor).to(ATensor)
proc u_sumall*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("_sumall").to(float)
proc u_sumall*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("_sumall", self.tensor).to(float)
proc u_sumall*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::_sumall", self.tensor).to(float)
proc u_th_sum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_sum_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_sum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_sum_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_sum*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_sum", dim, keepdim).to(ATensor)
proc u_th_sum*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_sum", self.tensor, dim, keepdim).to(ATensor)
proc u_th_sum*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_sum", self.tensor, dim, keepdim).to(ATensor)
proc u_prodall*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("_prodall").to(float)
proc u_prodall*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("_prodall", self.tensor).to(float)
proc u_prodall*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::_prodall", self.tensor).to(float)
proc u_th_prod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_prod_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_prod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_prod_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_th_prod*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_prod", dim, keepdim).to(ATensor)
proc u_th_prod*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_prod", self.tensor, dim, keepdim).to(ATensor)
proc u_th_prod*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_prod", self.tensor, dim, keepdim).to(ATensor)
proc u_cumsum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cumsum_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc u_cumsum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cumsum_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc u_cumsum*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cumsum", dim).to(ATensor)
proc u_cumsum*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cumsum", self.tensor, dim).to(ATensor)
proc u_cumsum*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cumsum", self.tensor, dim).to(ATensor)
proc u_cumprod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cumprod_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc u_cumprod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cumprod_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc u_cumprod*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cumprod", dim).to(ATensor)
proc u_cumprod*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cumprod", self.tensor, dim).to(ATensor)
proc u_cumprod*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cumprod", self.tensor, dim).to(ATensor)
proc sign_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sign_out", aresult.tensor, self.tensor).to(ATensor)
proc sign_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sign_out", aresult.tensor, self.tensor).to(ATensor)
proc sign*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sign").to(ATensor)
proc sign*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sign", self.tensor).to(ATensor)
proc sign*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sign", self.tensor).to(ATensor)
proc sign_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sign_").to(ATensor)
proc sign_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sign_", self.tensor).to(ATensor)
proc trace*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("trace").to(float)
proc trace*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("trace", self.tensor).to(float)
proc trace*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::trace", self.tensor).to(float)
proc fmod_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fmod_out", aresult.tensor, self.tensor, other).to(ATensor)
proc fmod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fmod_out", aresult.tensor, self.tensor, other).to(ATensor)
proc fmod*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("fmod", other).to(ATensor)
proc fmod*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fmod", self.tensor, other).to(ATensor)
proc fmod*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fmod", self.tensor, other).to(ATensor)
proc fmod_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fmod_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc fmod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fmod_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc fmod*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("fmod", other.tensor).to(ATensor)
proc fmod*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fmod", self.tensor, other.tensor).to(ATensor)
proc fmod*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fmod", self.tensor, other.tensor).to(ATensor)
proc fmod_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("fmod_", other).to(ATensor)
proc fmod_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fmod_", self.tensor, other).to(ATensor)
proc fmod_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("fmod_", other.tensor).to(ATensor)
proc fmod_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fmod_", self.tensor, other.tensor).to(ATensor)
proc remainder_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("remainder_out", aresult.tensor, self.tensor, other).to(ATensor)
proc remainder_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::remainder_out", aresult.tensor, self.tensor, other).to(ATensor)
proc remainder*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("remainder", other).to(ATensor)
proc remainder*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("remainder", self.tensor, other).to(ATensor)
proc remainder*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::remainder", self.tensor, other).to(ATensor)
proc remainder_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("remainder_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc remainder_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::remainder_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc remainder*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("remainder", other.tensor).to(ATensor)
proc remainder*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("remainder", self.tensor, other.tensor).to(ATensor)
proc remainder*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::remainder", self.tensor, other.tensor).to(ATensor)
proc remainder_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("remainder_", other).to(ATensor)
proc remainder_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("remainder_", self.tensor, other).to(ATensor)
proc remainder_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("remainder_", other.tensor).to(ATensor)
proc remainder_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("remainder_", self.tensor, other.tensor).to(ATensor)
proc u_th_clamp_out*(ty: TensorType; aresult: Tensor, self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_clamp_out", aresult.tensor, self.tensor, min, max).to(ATensor)
proc u_th_clamp_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_clamp_out", aresult.tensor, self.tensor, min, max).to(ATensor)
proc u_th_clamp*(self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_clamp", min, max).to(ATensor)
proc u_th_clamp*(ty: TensorType; self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_clamp", self.tensor, min, max).to(ATensor)
proc u_th_clamp*(_: typedesc[torch]; self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_clamp", self.tensor, min, max).to(ATensor)
proc u_th_clamp_min_out*(ty: TensorType; aresult: Tensor, self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_clamp_min_out", aresult.tensor, self.tensor, min).to(ATensor)
proc u_th_clamp_min_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_clamp_min_out", aresult.tensor, self.tensor, min).to(ATensor)
proc u_th_clamp_min*(self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_clamp_min", min).to(ATensor)
proc u_th_clamp_min*(ty: TensorType; self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_clamp_min", self.tensor, min).to(ATensor)
proc u_th_clamp_min*(_: typedesc[torch]; self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_clamp_min", self.tensor, min).to(ATensor)
proc u_th_clamp_max_out*(ty: TensorType; aresult: Tensor, self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_clamp_max_out", aresult.tensor, self.tensor, max).to(ATensor)
proc u_th_clamp_max_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_clamp_max_out", aresult.tensor, self.tensor, max).to(ATensor)
proc u_th_clamp_max*(self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_clamp_max", max).to(ATensor)
proc u_th_clamp_max*(ty: TensorType; self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_clamp_max", self.tensor, max).to(ATensor)
proc u_th_clamp_max*(_: typedesc[torch]; self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_clamp_max", self.tensor, max).to(ATensor)
proc u_dot*(self: Tensor, tensor: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("_dot", tensor.tensor).to(float)
proc u_dot*(ty: TensorType; self: Tensor, tensor: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("_dot", self.tensor, tensor.tensor).to(float)
proc u_dot*(_: typedesc[torch]; self: Tensor, tensor: Tensor): float {.inline, noinit.} = dynamicCCall("at::_dot", self.tensor, tensor.tensor).to(float)
proc tril_out*(ty: TensorType; aresult: Tensor, self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tril_out", aresult.tensor, self.tensor, diagonal).to(ATensor)
proc tril_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tril_out", aresult.tensor, self.tensor, diagonal).to(ATensor)
proc tril*(self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("tril", diagonal).to(ATensor)
proc tril*(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tril", self.tensor, diagonal).to(ATensor)
proc tril*(_: typedesc[torch]; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tril", self.tensor, diagonal).to(ATensor)
proc tril_u*(self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("tril_", diagonal).to(ATensor)
proc tril_u*(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tril_", self.tensor, diagonal).to(ATensor)
proc triu_out*(ty: TensorType; aresult: Tensor, self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("triu_out", aresult.tensor, self.tensor, diagonal).to(ATensor)
proc triu_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::triu_out", aresult.tensor, self.tensor, diagonal).to(ATensor)
proc triu*(self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("triu", diagonal).to(ATensor)
proc triu*(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("triu", self.tensor, diagonal).to(ATensor)
proc triu*(_: typedesc[torch]; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::triu", self.tensor, diagonal).to(ATensor)
proc triu_u*(self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("triu_", diagonal).to(ATensor)
proc triu_u*(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("triu_", self.tensor, diagonal).to(ATensor)
proc cross_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cross_out", aresult.tensor, self.tensor, other.tensor, dim).to(ATensor)
proc cross_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cross_out", aresult.tensor, self.tensor, other.tensor, dim).to(ATensor)
proc cross*(self: Tensor, other: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cross", other.tensor, dim).to(ATensor)
proc cross*(ty: TensorType; self: Tensor, other: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cross", self.tensor, other.tensor, dim).to(ATensor)
proc cross*(_: typedesc[torch]; self: Tensor, other: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cross", self.tensor, other.tensor, dim).to(ATensor)
proc diag_out*(ty: TensorType; aresult: Tensor, self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("diag_out", aresult.tensor, self.tensor, diagonal).to(ATensor)
proc diag_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::diag_out", aresult.tensor, self.tensor, diagonal).to(ATensor)
proc diag*(self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("diag", diagonal).to(ATensor)
proc diag*(ty: TensorType; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("diag", self.tensor, diagonal).to(ATensor)
proc diag*(_: typedesc[torch]; self: Tensor, diagonal: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::diag", self.tensor, diagonal).to(ATensor)
proc th_addmm_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_addmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc th_addmm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_addmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc th_addmm*(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc th_addmm*(_: typedesc[torch]; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc th_addmm_u*(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc th_addmm_u*(_: typedesc[torch]; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::th_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc u_addmv_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_addmv_out", aresult.tensor, self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc u_addmv_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_addmv_out", aresult.tensor, self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc u_addmv*(self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc u_addmv*(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc u_addmv*(_: typedesc[torch]; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc u_addmv_u*(self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_addmv_", mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc u_addmv_u*(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc u_addr_out*(ty: TensorType; aresult: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_addr_out", aresult.tensor, self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc u_addr_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_addr_out", aresult.tensor, self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc u_addr*(self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc u_addr*(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc u_addr*(_: typedesc[torch]; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc u_addr_u*(self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_addr_", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc u_addr_u*(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc u_ger_out*(ty: TensorType; aresult: Tensor, self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_ger_out", aresult.tensor, self.tensor, vec2.tensor).to(ATensor)
proc u_ger_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_ger_out", aresult.tensor, self.tensor, vec2.tensor).to(ATensor)
proc u_ger*(self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_ger", vec2.tensor).to(ATensor)
proc u_ger*(ty: TensorType; self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_ger", self.tensor, vec2.tensor).to(ATensor)
proc u_ger*(_: typedesc[torch]; self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_ger", self.tensor, vec2.tensor).to(ATensor)
proc u_mv_out*(ty: TensorType; aresult: Tensor, self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_mv_out", aresult.tensor, self.tensor, vec.tensor).to(ATensor)
proc u_mv_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_mv_out", aresult.tensor, self.tensor, vec.tensor).to(ATensor)
proc u_mv*(self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_mv", vec.tensor).to(ATensor)
proc u_mv*(ty: TensorType; self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_mv", self.tensor, vec.tensor).to(ATensor)
proc u_mv*(_: typedesc[torch]; self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_mv", self.tensor, vec.tensor).to(ATensor)
proc u_mm_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_mm_out", aresult.tensor, self.tensor, mat2.tensor).to(ATensor)
proc u_mm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_mm_out", aresult.tensor, self.tensor, mat2.tensor).to(ATensor)
proc u_mm*(self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_mm", mat2.tensor).to(ATensor)
proc u_mm*(ty: TensorType; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_mm", self.tensor, mat2.tensor).to(ATensor)
proc u_mm*(_: typedesc[torch]; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_mm", self.tensor, mat2.tensor).to(ATensor)
proc bmm_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bmm_out", aresult.tensor, self.tensor, mat2.tensor).to(ATensor)
proc bmm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bmm_out", aresult.tensor, self.tensor, mat2.tensor).to(ATensor)
proc bmm*(self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bmm", mat2.tensor).to(ATensor)
proc bmm*(ty: TensorType; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bmm", self.tensor, mat2.tensor).to(ATensor)
proc bmm*(_: typedesc[torch]; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bmm", self.tensor, mat2.tensor).to(ATensor)
proc addbmm_out*(ty: TensorType; aresult: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addbmm_out", aresult.tensor, self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc addbmm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addbmm_out", aresult.tensor, self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc addbmm*(self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc addbmm*(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc addbmm*(_: typedesc[torch]; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc addbmm_u*(self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc addbmm_u*(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc baddbmm_out*(ty: TensorType; aresult: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("baddbmm_out", aresult.tensor, self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc baddbmm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::baddbmm_out", aresult.tensor, self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc baddbmm*(self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("baddbmm", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc baddbmm*(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("baddbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc baddbmm*(_: typedesc[torch]; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::baddbmm", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc baddbmm_u*(self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("baddbmm_", batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc baddbmm_u*(ty: TensorType; self: Tensor, batch1: Tensor, batch2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("baddbmm_", self.tensor, batch1.tensor, batch2.tensor, beta, alpha).to(ATensor)
proc addcmul_out*(ty: TensorType; aresult: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addcmul_out", aresult.tensor, self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcmul_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addcmul_out", aresult.tensor, self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcmul*(self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addcmul", tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcmul*(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addcmul", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcmul*(_: typedesc[torch]; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addcmul", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcmul_u*(self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addcmul_", tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcmul_u*(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addcmul_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcdiv_out*(ty: TensorType; aresult: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addcdiv_out", aresult.tensor, self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcdiv_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addcdiv_out", aresult.tensor, self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcdiv*(self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addcdiv", tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcdiv*(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addcdiv", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcdiv*(_: typedesc[torch]; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addcdiv", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcdiv_u*(self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addcdiv_", tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc addcdiv_u*(ty: TensorType; self: Tensor, tensor1: Tensor, tensor2: Tensor, value: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addcdiv_", self.tensor, tensor1.tensor, tensor2.tensor, value).to(ATensor)
proc u_gesv_single_out*(ty: TensorType; solution: Tensor, lu: Tensor, self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_gesv_single_out", solution.tensor, lu.tensor, self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.solution = newTensor tupleRes[0]
  result.lu = newTensor tupleRes[1]
proc u_gesv_single_out*(_: typedesc[torch]; solution: Tensor, lu: Tensor, self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_gesv_single_out", solution.tensor, lu.tensor, self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.solution = newTensor tupleRes[0]
  result.lu = newTensor tupleRes[1]
proc u_gesv_single*(self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_gesv_single", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.solution = newTensor tupleRes[0]
  result.lu = newTensor tupleRes[1]
proc u_gesv_single*(ty: TensorType; self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_gesv_single", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.solution = newTensor tupleRes[0]
  result.lu = newTensor tupleRes[1]
proc u_gesv_single*(_: typedesc[torch]; self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_gesv_single", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.solution = newTensor tupleRes[0]
  result.lu = newTensor tupleRes[1]
proc gels_out*(ty: TensorType; res1: Tensor, res2: Tensor, self: Tensor, A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("gels_out", res1.tensor, res2.tensor, self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc gels_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, self: Tensor, A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::gels_out", res1.tensor, res2.tensor, self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc gels*(self: Tensor, A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("gels", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc gels*(ty: TensorType; self: Tensor, A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("gels", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc gels*(_: typedesc[torch]; self: Tensor, A: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::gels", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc trtrs_out*(ty: TensorType; res1: Tensor, res2: Tensor, self: Tensor, A: Tensor, upper: bool = true, transpose: bool = false, unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("trtrs_out", res1.tensor, res2.tensor, self.tensor, A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc trtrs_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, self: Tensor, A: Tensor, upper: bool = true, transpose: bool = false, unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::trtrs_out", res1.tensor, res2.tensor, self.tensor, A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc trtrs*(self: Tensor, A: Tensor, upper: bool = true, transpose: bool = false, unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("trtrs", A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc trtrs*(ty: TensorType; self: Tensor, A: Tensor, upper: bool = true, transpose: bool = false, unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("trtrs", self.tensor, A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc trtrs*(_: typedesc[torch]; self: Tensor, A: Tensor, upper: bool = true, transpose: bool = false, unitriangular: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::trtrs", self.tensor, A.tensor, upper, transpose, unitriangular).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc symeig_out*(ty: TensorType; res1: Tensor, res2: Tensor, self: Tensor, eigenvectors: bool = false, upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("symeig_out", res1.tensor, res2.tensor, self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc symeig_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, self: Tensor, eigenvectors: bool = false, upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::symeig_out", res1.tensor, res2.tensor, self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc symeig*(self: Tensor, eigenvectors: bool = false, upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("symeig", eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc symeig*(ty: TensorType; self: Tensor, eigenvectors: bool = false, upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("symeig", self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc symeig*(_: typedesc[torch]; self: Tensor, eigenvectors: bool = false, upper: bool = true): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::symeig", self.tensor, eigenvectors, upper).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc eig_out*(ty: TensorType; res1: Tensor, res2: Tensor, self: Tensor, eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("eig_out", res1.tensor, res2.tensor, self.tensor, eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc eig_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, self: Tensor, eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::eig_out", res1.tensor, res2.tensor, self.tensor, eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc eig*(self: Tensor, eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("eig", eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc eig*(ty: TensorType; self: Tensor, eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("eig", self.tensor, eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc eig*(_: typedesc[torch]; self: Tensor, eigenvectors: bool = false): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::eig", self.tensor, eigenvectors).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc svd_out*(ty: TensorType; res1: Tensor, res2: Tensor, res3: Tensor, self: Tensor, some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("svd_out", res1.tensor, res2.tensor, res3.tensor, self.tensor, some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
  result.res3 = newTensor tupleRes[2]
proc svd_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, res3: Tensor, self: Tensor, some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::svd_out", res1.tensor, res2.tensor, res3.tensor, self.tensor, some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
  result.res3 = newTensor tupleRes[2]
proc svd*(self: Tensor, some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("svd", some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
  result.res3 = newTensor tupleRes[2]
proc svd*(ty: TensorType; self: Tensor, some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("svd", self.tensor, some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
  result.res3 = newTensor tupleRes[2]
proc svd*(_: typedesc[torch]; self: Tensor, some: bool = true): tuple[res1: Tensor, res2: Tensor, res3: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::svd", self.tensor, some).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
  result.res3 = newTensor tupleRes[2]
proc u_getri_out*(ty: TensorType; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_getri_out", output.tensor, self.tensor).to(ATensor)
proc u_getri_out*(_: typedesc[torch]; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_getri_out", output.tensor, self.tensor).to(ATensor)
proc u_getri*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_getri").to(ATensor)
proc u_getri*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_getri", self.tensor).to(ATensor)
proc u_getri*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_getri", self.tensor).to(ATensor)
proc potrf_out*(ty: TensorType; output: Tensor, self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("potrf_out", output.tensor, self.tensor, upper).to(ATensor)
proc potrf_out*(_: typedesc[torch]; output: Tensor, self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::potrf_out", output.tensor, self.tensor, upper).to(ATensor)
proc potrf*(self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("potrf", upper).to(ATensor)
proc potrf*(ty: TensorType; self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("potrf", self.tensor, upper).to(ATensor)
proc potrf*(_: typedesc[torch]; self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::potrf", self.tensor, upper).to(ATensor)
proc potrs_out*(ty: TensorType; aresult: Tensor, self: Tensor, input2: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("potrs_out", aresult.tensor, self.tensor, input2.tensor, upper).to(ATensor)
proc potrs_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, input2: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::potrs_out", aresult.tensor, self.tensor, input2.tensor, upper).to(ATensor)
proc potrs*(self: Tensor, input2: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("potrs", input2.tensor, upper).to(ATensor)
proc potrs*(ty: TensorType; self: Tensor, input2: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("potrs", self.tensor, input2.tensor, upper).to(ATensor)
proc potrs*(_: typedesc[torch]; self: Tensor, input2: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::potrs", self.tensor, input2.tensor, upper).to(ATensor)
proc potri_out*(ty: TensorType; output: Tensor, self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("potri_out", output.tensor, self.tensor, upper).to(ATensor)
proc potri_out*(_: typedesc[torch]; output: Tensor, self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::potri_out", output.tensor, self.tensor, upper).to(ATensor)
proc potri*(self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("potri", upper).to(ATensor)
proc potri*(ty: TensorType; self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("potri", self.tensor, upper).to(ATensor)
proc potri*(_: typedesc[torch]; self: Tensor, upper: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::potri", self.tensor, upper).to(ATensor)
proc pstrf_out*(ty: TensorType; res1: Tensor, res2: Tensor, self: Tensor, upper: bool = true, tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("pstrf_out", res1.tensor, res2.tensor, self.tensor, upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc pstrf_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, self: Tensor, upper: bool = true, tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::pstrf_out", res1.tensor, res2.tensor, self.tensor, upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc pstrf*(self: Tensor, upper: bool = true, tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("pstrf", upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc pstrf*(ty: TensorType; self: Tensor, upper: bool = true, tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("pstrf", self.tensor, upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc pstrf*(_: typedesc[torch]; self: Tensor, upper: bool = true, tol: float = -1): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::pstrf", self.tensor, upper, tol).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc qr_out*(ty: TensorType; res1: Tensor, res2: Tensor, self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("qr_out", res1.tensor, res2.tensor, self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc qr_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::qr_out", res1.tensor, res2.tensor, self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc qr*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("qr").to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc qr*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("qr", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc qr*(_: typedesc[torch]; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::qr", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc geqrf_out*(ty: TensorType; res1: Tensor, res2: Tensor, self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("geqrf_out", res1.tensor, res2.tensor, self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc geqrf_out*(_: typedesc[torch]; res1: Tensor, res2: Tensor, self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::geqrf_out", res1.tensor, res2.tensor, self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc geqrf*(self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("geqrf").to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc geqrf*(ty: TensorType; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("geqrf", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc geqrf*(_: typedesc[torch]; self: Tensor): tuple[res1: Tensor, res2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::geqrf", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.res1 = newTensor tupleRes[0]
  result.res2 = newTensor tupleRes[1]
proc orgqr_out*(ty: TensorType; aresult: Tensor, self: Tensor, input2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("orgqr_out", aresult.tensor, self.tensor, input2.tensor).to(ATensor)
proc orgqr_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, input2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::orgqr_out", aresult.tensor, self.tensor, input2.tensor).to(ATensor)
proc orgqr*(self: Tensor, input2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("orgqr", input2.tensor).to(ATensor)
proc orgqr*(ty: TensorType; self: Tensor, input2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("orgqr", self.tensor, input2.tensor).to(ATensor)
proc orgqr*(_: typedesc[torch]; self: Tensor, input2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::orgqr", self.tensor, input2.tensor).to(ATensor)
proc ormqr_out*(ty: TensorType; aresult: Tensor, self: Tensor, input2: Tensor, input3: Tensor, left: bool = true, transpose: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ormqr_out", aresult.tensor, self.tensor, input2.tensor, input3.tensor, left, transpose).to(ATensor)
proc ormqr_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, input2: Tensor, input3: Tensor, left: bool = true, transpose: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ormqr_out", aresult.tensor, self.tensor, input2.tensor, input3.tensor, left, transpose).to(ATensor)
proc ormqr*(self: Tensor, input2: Tensor, input3: Tensor, left: bool = true, transpose: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ormqr", input2.tensor, input3.tensor, left, transpose).to(ATensor)
proc ormqr*(ty: TensorType; self: Tensor, input2: Tensor, input3: Tensor, left: bool = true, transpose: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ormqr", self.tensor, input2.tensor, input3.tensor, left, transpose).to(ATensor)
proc ormqr*(_: typedesc[torch]; self: Tensor, input2: Tensor, input3: Tensor, left: bool = true, transpose: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ormqr", self.tensor, input2.tensor, input3.tensor, left, transpose).to(ATensor)
proc btrifact_out*(ty: TensorType; aresult: Tensor, pivots: Tensor, self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("btrifact_out", aresult.tensor, pivots.tensor, self.tensor, pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
proc btrifact_out*(_: typedesc[torch]; aresult: Tensor, pivots: Tensor, self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::btrifact_out", aresult.tensor, pivots.tensor, self.tensor, pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
proc btrifact*(self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("btrifact", pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
proc btrifact*(ty: TensorType; self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("btrifact", self.tensor, pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
proc btrifact*(_: typedesc[torch]; self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::btrifact", self.tensor, pivot).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
proc btrifact_with_info_out*(ty: TensorType; aresult: Tensor, pivots: Tensor, info: Tensor, self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor, info: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("btrifact_with_info_out", aresult.tensor, pivots.tensor, info.tensor, self.tensor, pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
  result.info = newTensor tupleRes[2]
proc btrifact_with_info_out*(_: typedesc[torch]; aresult: Tensor, pivots: Tensor, info: Tensor, self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor, info: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::btrifact_with_info_out", aresult.tensor, pivots.tensor, info.tensor, self.tensor, pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
  result.info = newTensor tupleRes[2]
proc btrifact_with_info*(self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor, info: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("btrifact_with_info", pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
  result.info = newTensor tupleRes[2]
proc btrifact_with_info*(ty: TensorType; self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor, info: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("btrifact_with_info", self.tensor, pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
  result.info = newTensor tupleRes[2]
proc btrifact_with_info*(_: typedesc[torch]; self: Tensor, pivot: bool = true): tuple[aresult: Tensor, pivots: Tensor, info: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::btrifact_with_info", self.tensor, pivot).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.aresult = newTensor tupleRes[0]
  result.pivots = newTensor tupleRes[1]
  result.info = newTensor tupleRes[2]
proc btrisolve_out*(ty: TensorType; aresult: Tensor, self: Tensor, LU_data: Tensor, LU_pivots: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("btrisolve_out", aresult.tensor, self.tensor, LU_data.tensor, LU_pivots.tensor).to(ATensor)
proc btrisolve_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, LU_data: Tensor, LU_pivots: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::btrisolve_out", aresult.tensor, self.tensor, LU_data.tensor, LU_pivots.tensor).to(ATensor)
proc btrisolve*(self: Tensor, LU_data: Tensor, LU_pivots: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("btrisolve", LU_data.tensor, LU_pivots.tensor).to(ATensor)
proc btrisolve*(ty: TensorType; self: Tensor, LU_data: Tensor, LU_pivots: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("btrisolve", self.tensor, LU_data.tensor, LU_pivots.tensor).to(ATensor)
proc btrisolve*(_: typedesc[torch]; self: Tensor, LU_data: Tensor, LU_pivots: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::btrisolve", self.tensor, LU_data.tensor, LU_pivots.tensor).to(ATensor)
proc random_u*(self: Tensor, afrom: int64, ato: int64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("random_", afrom, ato, generator).to(ATensor)
proc random_u*(ty: TensorType; self: Tensor, afrom: int64, ato: int64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("random_", self.tensor, afrom, ato, generator).to(ATensor)
proc random_u*(self: Tensor, ato: int64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("random_", ato, generator).to(ATensor)
proc random_u*(ty: TensorType; self: Tensor, ato: int64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("random_", self.tensor, ato, generator).to(ATensor)
proc random_u*(self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("random_", generator).to(ATensor)
proc random_u*(ty: TensorType; self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("random_", self.tensor, generator).to(ATensor)
proc multinomial_out*(ty: TensorType; aresult: Tensor, self: Tensor, num_samples: int64, replacement: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multinomial_out", aresult.tensor, self.tensor, num_samples, replacement, generator).to(ATensor)
proc multinomial_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, num_samples: int64, replacement: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multinomial_out", aresult.tensor, self.tensor, num_samples, replacement, generator).to(ATensor)
proc multinomial*(self: Tensor, num_samples: int64, replacement: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("multinomial", num_samples, replacement, generator).to(ATensor)
proc multinomial*(ty: TensorType; self: Tensor, num_samples: int64, replacement: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multinomial", self.tensor, num_samples, replacement, generator).to(ATensor)
proc multinomial*(_: typedesc[torch]; self: Tensor, num_samples: int64, replacement: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multinomial", self.tensor, num_samples, replacement, generator).to(ATensor)
proc uniform_u*(self: Tensor, afrom: float64 = 0, ato: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("uniform_", afrom, ato, generator).to(ATensor)
proc uniform_u*(ty: TensorType; self: Tensor, afrom: float64 = 0, ato: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("uniform_", self.tensor, afrom, ato, generator).to(ATensor)
proc normal_out*(ty: TensorType; output: Tensor, mean: Tensor, std: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("normal_out", output.tensor, mean.tensor, std, generator).to(ATensor)
proc normal_out*(_: typedesc[torch]; output: Tensor, mean: Tensor, std: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::normal_out", output.tensor, mean.tensor, std, generator).to(ATensor)
proc normal*(ty: TensorType; mean: Tensor, std: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("normal", mean.tensor, std, generator).to(ATensor)
proc normal*(_: typedesc[torch]; mean: Tensor, std: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::normal", mean.tensor, std, generator).to(ATensor)
proc normal_out*(ty: TensorType; output: Tensor, mean: float64, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("normal_out", output.tensor, mean, std.tensor, generator).to(ATensor)
proc normal_out*(_: typedesc[torch]; output: Tensor, mean: float64, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::normal_out", output.tensor, mean, std.tensor, generator).to(ATensor)
proc normal*(ty: TensorType; mean: float64, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("normal", mean, std.tensor, generator).to(ATensor)
proc normal*(_: typedesc[torch]; mean: float64, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::normal", mean, std.tensor, generator).to(ATensor)
proc normal_out*(ty: TensorType; output: Tensor, mean: Tensor, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("normal_out", output.tensor, mean.tensor, std.tensor, generator).to(ATensor)
proc normal_out*(_: typedesc[torch]; output: Tensor, mean: Tensor, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::normal_out", output.tensor, mean.tensor, std.tensor, generator).to(ATensor)
proc normal*(ty: TensorType; mean: Tensor, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("normal", mean.tensor, std.tensor, generator).to(ATensor)
proc normal*(_: typedesc[torch]; mean: Tensor, std: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::normal", mean.tensor, std.tensor, generator).to(ATensor)
proc normal_u*(self: Tensor, mean: float64 = 0, std: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("normal_", mean, std, generator).to(ATensor)
proc normal_u*(ty: TensorType; self: Tensor, mean: float64 = 0, std: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("normal_", self.tensor, mean, std, generator).to(ATensor)
proc cauchy_u*(self: Tensor, median: float64 = 0, sigma: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cauchy_", median, sigma, generator).to(ATensor)
proc cauchy_u*(ty: TensorType; self: Tensor, median: float64 = 0, sigma: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cauchy_", self.tensor, median, sigma, generator).to(ATensor)
proc log_normal_u*(self: Tensor, mean: float64 = 1, std: float64 = 2, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log_normal_", mean, std, generator).to(ATensor)
proc log_normal_u*(ty: TensorType; self: Tensor, mean: float64 = 1, std: float64 = 2, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_normal_", self.tensor, mean, std, generator).to(ATensor)
proc exponential_u*(self: Tensor, lambd: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("exponential_", lambd, generator).to(ATensor)
proc exponential_u*(ty: TensorType; self: Tensor, lambd: float64 = 1, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("exponential_", self.tensor, lambd, generator).to(ATensor)
proc geometric_u*(self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("geometric_", p, generator).to(ATensor)
proc geometric_u*(ty: TensorType; self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("geometric_", self.tensor, p, generator).to(ATensor)
proc u_bernoulli_u*(self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_bernoulli_", p, generator).to(ATensor)
proc u_bernoulli_u*(ty: TensorType; self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_bernoulli_", self.tensor, p, generator).to(ATensor)
proc u_th_bernoulli_out*(ty: TensorType; output: Tensor, self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_bernoulli_out", output.tensor, self.tensor, generator).to(ATensor)
proc u_th_bernoulli_out*(_: typedesc[torch]; output: Tensor, self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_bernoulli_out", output.tensor, self.tensor, generator).to(ATensor)
proc u_th_bernoulli*(self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_th_bernoulli", generator).to(ATensor)
proc u_th_bernoulli*(ty: TensorType; self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_th_bernoulli", self.tensor, generator).to(ATensor)
proc u_th_bernoulli*(_: typedesc[torch]; self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_th_bernoulli", self.tensor, generator).to(ATensor)
proc u_dirichlet_grad_out*(ty: TensorType; output: Tensor, x: Tensor, alpha: Tensor, total: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_dirichlet_grad_out", output.tensor, x.tensor, alpha.tensor, total.tensor).to(ATensor)
proc u_dirichlet_grad_out*(_: typedesc[torch]; output: Tensor, x: Tensor, alpha: Tensor, total: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_dirichlet_grad_out", output.tensor, x.tensor, alpha.tensor, total.tensor).to(ATensor)
proc u_dirichlet_grad*(ty: TensorType; x: Tensor, alpha: Tensor, total: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor)
proc u_dirichlet_grad*(_: typedesc[torch]; x: Tensor, alpha: Tensor, total: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_dirichlet_grad", x.tensor, alpha.tensor, total.tensor).to(ATensor)
proc th_tensor*(ty: TensorType; size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_tensor", size).to(ATensor)
proc th_tensor*(ty: TensorType; ): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("th_tensor").to(ATensor)
proc tensor*(ty: TensorType; storage: AStorage, storageOffset: int64, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tensor", storage, storageOffset, size, stride).to(ATensor)
proc tensor*(ty: TensorType; size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tensor", size, stride).to(ATensor)
proc alias*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("alias", self.tensor).to(ATensor)
proc alias*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::alias", self.tensor).to(ATensor)
proc u_copy_ignoring_overlaps_u*(self: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_copy_ignoring_overlaps_", src.tensor).to(ATensor)
proc u_copy_ignoring_overlaps_u*(ty: TensorType; self: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_copy_ignoring_overlaps_", self.tensor, src.tensor).to(ATensor)
proc u_cat_out*(ty: TensorType; self: Tensor, tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cat_out", self.tensor, tensors, dim).to(ATensor)
proc u_cat_out*(_: typedesc[torch]; self: Tensor, tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cat_out", self.tensor, tensors, dim).to(ATensor)
proc u_cat*(ty: TensorType; tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cat", tensors, dim).to(ATensor)
proc u_cat*(_: typedesc[torch]; tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cat", tensors, dim).to(ATensor)
proc binary_cross_entropy_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("binary_cross_entropy_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::binary_cross_entropy_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy*(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("binary_cross_entropy", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy*(_: typedesc[torch]; self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::binary_cross_entropy", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_forward_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("binary_cross_entropy_forward_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::binary_cross_entropy_forward_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_forward*(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::binary_cross_entropy_forward", self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("binary_cross_entropy_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::binary_cross_entropy_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc binary_cross_entropy_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::binary_cross_entropy_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction).to(ATensor)
proc kl_div_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("kl_div_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::kl_div_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("kl_div", self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::kl_div", self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_forward_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("kl_div_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::kl_div_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_forward*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::kl_div_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("kl_div_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::kl_div_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc kl_div_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::kl_div_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("l1_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::l1_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("l1_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::l1_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_forward_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("l1_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::l1_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_forward*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("l1_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::l1_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc l1_loss_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mse_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mse_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mse_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mse_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_forward_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mse_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mse_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_forward*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mse_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mse_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mse_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc mse_loss_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mse_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc multi_margin_loss_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, p: float = 1, margin: float = 1, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multi_margin_loss_out", output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, p: float = 1, margin: float = 1, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multi_margin_loss_out", output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss*(ty: TensorType; self: Tensor, target: Tensor, p: float = 1, margin: float = 1, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multi_margin_loss", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, p: float = 1, margin: float = 1, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multi_margin_loss", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_forward_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multi_margin_loss_forward_out", output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multi_margin_loss_forward_out", output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_forward*(ty: TensorType; self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multi_margin_loss_forward", self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multi_margin_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multi_margin_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multi_margin_loss_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, p: float, margin: float, weight: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multi_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, p, margin, weight.tensor, reduction).to(ATensor)
proc multilabel_margin_loss_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multilabel_margin_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc multilabel_margin_loss_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multilabel_margin_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc multilabel_margin_loss*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multilabel_margin_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc multilabel_margin_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multilabel_margin_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc multilabel_margin_loss_forward_out*(ty: TensorType; output: Tensor, is_target: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[output: Tensor, is_target: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("multilabel_margin_loss_forward_out", output.tensor, is_target.tensor, self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.is_target = newTensor tupleRes[1]
proc multilabel_margin_loss_forward_out*(_: typedesc[torch]; output: Tensor, is_target: Tensor, self: Tensor, target: Tensor, reduction: int64): tuple[output: Tensor, is_target: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::multilabel_margin_loss_forward_out", output.tensor, is_target.tensor, self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.is_target = newTensor tupleRes[1]
proc multilabel_margin_loss_forward*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): tuple[output: Tensor, is_target: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.is_target = newTensor tupleRes[1]
proc multilabel_margin_loss_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): tuple[output: Tensor, is_target: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::multilabel_margin_loss_forward", self.tensor, target.tensor, reduction).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.is_target = newTensor tupleRes[1]
proc multilabel_margin_loss_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64, is_target: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multilabel_margin_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor)
proc multilabel_margin_loss_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64, is_target: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multilabel_margin_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor)
proc multilabel_margin_loss_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64, is_target: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor)
proc multilabel_margin_loss_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64, is_target: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::multilabel_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction, is_target.tensor).to(ATensor)
proc nll_loss_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss*(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss_forward_out*(ty: TensorType; output: Tensor, total_weight: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("nll_loss_forward_out", output.tensor, total_weight.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss_forward_out*(_: typedesc[torch]; output: Tensor, total_weight: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::nll_loss_forward_out", output.tensor, total_weight.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss_forward*(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::nll_loss_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc nll_loss_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc nll_loss_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc nll_loss_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc nll_loss2d_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss2d_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss2d_out", output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss2d*(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss2d", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss2d*(_: typedesc[torch]; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64 = -100): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss2d", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(ATensor)
proc nll_loss2d_forward_out*(ty: TensorType; output: Tensor, total_weight: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("nll_loss2d_forward_out", output.tensor, total_weight.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss2d_forward_out*(_: typedesc[torch]; output: Tensor, total_weight: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::nll_loss2d_forward_out", output.tensor, total_weight.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss2d_forward*(ty: TensorType; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss2d_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64): tuple[output: Tensor, total_weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::nll_loss2d_forward", self.tensor, target.tensor, weight.tensor, reduction, ignore_index).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.total_weight = newTensor tupleRes[1]
proc nll_loss2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc nll_loss2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc nll_loss2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc nll_loss2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, weight: Tensor, reduction: int64, ignore_index: int64, total_weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::nll_loss2d_backward", grad_output.tensor, self.tensor, target.tensor, weight.tensor, reduction, ignore_index, total_weight.tensor).to(ATensor)
proc smooth_l1_loss_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("smooth_l1_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::smooth_l1_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("smooth_l1_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::smooth_l1_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_forward_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("smooth_l1_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::smooth_l1_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_forward*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::smooth_l1_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("smooth_l1_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::smooth_l1_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc smooth_l1_loss_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::smooth_l1_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("soft_margin_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::soft_margin_loss_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("soft_margin_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::soft_margin_loss", self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_forward_out*(ty: TensorType; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("soft_margin_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::soft_margin_loss_forward_out", output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_forward*(ty: TensorType; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_forward*(_: typedesc[torch]; self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::soft_margin_loss_forward", self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("soft_margin_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::soft_margin_loss_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc soft_margin_loss_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, target: Tensor, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::soft_margin_loss_backward", grad_output.tensor, self.tensor, target.tensor, reduction).to(ATensor)
proc elu_out*(ty: TensorType; output: Tensor, self: Tensor, alpha: float = 1, scale: float = 1, input_scale: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu_out", output.tensor, self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_out*(_: typedesc[torch]; output: Tensor, self: Tensor, alpha: float = 1, scale: float = 1, input_scale: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu_out", output.tensor, self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu*(ty: TensorType; self: Tensor, alpha: float = 1, scale: float = 1, input_scale: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu", self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu*(_: typedesc[torch]; self: Tensor, alpha: float = 1, scale: float = 1, input_scale: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu", self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_forward_out*(ty: TensorType; output: Tensor, self: Tensor, alpha: float, scale: float, input_scale: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu_forward_out", output.tensor, self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, alpha: float, scale: float, input_scale: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu_forward_out", output.tensor, self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_forward*(ty: TensorType; self: Tensor, alpha: float, scale: float, input_scale: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_forward*(_: typedesc[torch]; self: Tensor, alpha: float, scale: float, input_scale: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu_forward", self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, alpha: float, scale: float, input_scale: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu_backward_out", grad_input.tensor, grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor)
proc elu_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, alpha: float, scale: float, input_scale: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu_backward_out", grad_input.tensor, grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor)
proc elu_backward*(ty: TensorType; grad_output: Tensor, alpha: float, scale: float, input_scale: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor)
proc elu_backward*(_: typedesc[torch]; grad_output: Tensor, alpha: float, scale: float, input_scale: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu_backward", grad_output.tensor, alpha, scale, input_scale, output.tensor).to(ATensor)
proc elu_u*(ty: TensorType; self: Tensor, alpha: float = 1, scale: float = 1, input_scale: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu_", self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_u*(_: typedesc[torch]; self: Tensor, alpha: float = 1, scale: float = 1, input_scale: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu_", self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_forward_u*(ty: TensorType; self: Tensor, alpha: float, scale: float, input_scale: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("elu_forward_", self.tensor, alpha, scale, input_scale).to(ATensor)
proc elu_forward_u*(_: typedesc[torch]; self: Tensor, alpha: float, scale: float, input_scale: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::elu_forward_", self.tensor, alpha, scale, input_scale).to(ATensor)
proc glu_out*(ty: TensorType; output: Tensor, self: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("glu_out", output.tensor, self.tensor, dim).to(ATensor)
proc glu_out*(_: typedesc[torch]; output: Tensor, self: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::glu_out", output.tensor, self.tensor, dim).to(ATensor)
proc glu*(ty: TensorType; self: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("glu", self.tensor, dim).to(ATensor)
proc glu*(_: typedesc[torch]; self: Tensor, dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::glu", self.tensor, dim).to(ATensor)
proc glu_forward_out*(ty: TensorType; output: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("glu_forward_out", output.tensor, self.tensor, dim).to(ATensor)
proc glu_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::glu_forward_out", output.tensor, self.tensor, dim).to(ATensor)
proc glu_forward*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("glu_forward", self.tensor, dim).to(ATensor)
proc glu_forward*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::glu_forward", self.tensor, dim).to(ATensor)
proc glu_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("glu_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, dim).to(ATensor)
proc glu_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::glu_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, dim).to(ATensor)
proc glu_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor)
proc glu_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::glu_backward", grad_output.tensor, self.tensor, dim).to(ATensor)
proc hardtanh_out*(ty: TensorType; output: Tensor, self: Tensor, min_val: float = -1, max_val: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh_out", output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_out*(_: typedesc[torch]; output: Tensor, self: Tensor, min_val: float = -1, max_val: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh_out", output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh*(ty: TensorType; self: Tensor, min_val: float = -1, max_val: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh", self.tensor, min_val, max_val).to(ATensor)
proc hardtanh*(_: typedesc[torch]; self: Tensor, min_val: float = -1, max_val: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh", self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_forward_out*(ty: TensorType; output: Tensor, self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh_forward_out", output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh_forward_out", output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_forward*(ty: TensorType; self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh_forward", self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_forward*(_: typedesc[torch]; self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh_forward", self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh_backward", grad_output.tensor, self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_u*(ty: TensorType; self: Tensor, min_val: float = -1, max_val: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh_", self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_u*(_: typedesc[torch]; self: Tensor, min_val: float = -1, max_val: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh_", self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_forward_u*(ty: TensorType; self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor)
proc hardtanh_forward_u*(_: typedesc[torch]; self: Tensor, min_val: float, max_val: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardtanh_forward_", self.tensor, min_val, max_val).to(ATensor)
proc leaky_relu_out*(ty: TensorType; output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu_out", output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu_out*(_: typedesc[torch]; output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu_out", output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu*(ty: TensorType; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu", self.tensor, negative_slope).to(ATensor)
proc leaky_relu*(_: typedesc[torch]; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu", self.tensor, negative_slope).to(ATensor)
proc leaky_relu_forward_out*(ty: TensorType; output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu_forward_out", output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu_forward_out", output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu_forward*(ty: TensorType; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu_forward", self.tensor, negative_slope).to(ATensor)
proc leaky_relu_forward*(_: typedesc[torch]; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu_forward", self.tensor, negative_slope).to(ATensor)
proc leaky_relu_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu_backward", grad_output.tensor, self.tensor, negative_slope).to(ATensor)
proc leaky_relu_u*(ty: TensorType; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu_", self.tensor, negative_slope).to(ATensor)
proc leaky_relu_u*(_: typedesc[torch]; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu_", self.tensor, negative_slope).to(ATensor)
proc leaky_relu_forward_u*(ty: TensorType; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("leaky_relu_forward_", self.tensor, negative_slope).to(ATensor)
proc leaky_relu_forward_u*(_: typedesc[torch]; self: Tensor, negative_slope: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::leaky_relu_forward_", self.tensor, negative_slope).to(ATensor)
proc log_sigmoid_out*(ty: TensorType; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_sigmoid_out", output.tensor, self.tensor).to(ATensor)
proc log_sigmoid_out*(_: typedesc[torch]; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_sigmoid_out", output.tensor, self.tensor).to(ATensor)
proc log_sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_sigmoid", self.tensor).to(ATensor)
proc log_sigmoid*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_sigmoid", self.tensor).to(ATensor)
proc log_sigmoid_forward_out*(ty: TensorType; output: Tensor, buffer: Tensor, self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("log_sigmoid_forward_out", output.tensor, buffer.tensor, self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.buffer = newTensor tupleRes[1]
proc log_sigmoid_forward_out*(_: typedesc[torch]; output: Tensor, buffer: Tensor, self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::log_sigmoid_forward_out", output.tensor, buffer.tensor, self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.buffer = newTensor tupleRes[1]
proc log_sigmoid_forward*(ty: TensorType; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.buffer = newTensor tupleRes[1]
proc log_sigmoid_forward*(_: typedesc[torch]; self: Tensor): tuple[output: Tensor, buffer: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::log_sigmoid_forward", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.buffer = newTensor tupleRes[1]
proc log_sigmoid_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, buffer: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_sigmoid_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, buffer.tensor).to(ATensor)
proc log_sigmoid_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, buffer: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_sigmoid_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, buffer.tensor).to(ATensor)
proc log_sigmoid_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, buffer: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor)
proc log_sigmoid_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, buffer: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_sigmoid_backward", grad_output.tensor, self.tensor, buffer.tensor).to(ATensor)
proc prelu_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prelu_out", output.tensor, self.tensor, weight.tensor).to(ATensor)
proc prelu_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prelu_out", output.tensor, self.tensor, weight.tensor).to(ATensor)
proc prelu*(ty: TensorType; self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prelu", self.tensor, weight.tensor).to(ATensor)
proc prelu*(_: typedesc[torch]; self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prelu", self.tensor, weight.tensor).to(ATensor)
proc prelu_forward_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prelu_forward_out", output.tensor, self.tensor, weight.tensor).to(ATensor)
proc prelu_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prelu_forward_out", output.tensor, self.tensor, weight.tensor).to(ATensor)
proc prelu_forward*(ty: TensorType; self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prelu_forward", self.tensor, weight.tensor).to(ATensor)
proc prelu_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prelu_forward", self.tensor, weight.tensor).to(ATensor)
proc prelu_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("prelu_backward_out", grad_input.tensor, grad_weight.tensor, grad_output.tensor, self.tensor, weight.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc prelu_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::prelu_backward_out", grad_input.tensor, grad_weight.tensor, grad_output.tensor, self.tensor, weight.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc prelu_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc prelu_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::prelu_backward", grad_output.tensor, self.tensor, weight.tensor, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc rrelu_with_noise_out*(ty: TensorType; output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise_out", output.tensor, self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_out*(_: typedesc[torch]; output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise_out", output.tensor, self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise*(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise*(_: typedesc[torch]; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_forward_out*(ty: TensorType; output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise_forward_out", output.tensor, self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise_forward_out", output.tensor, self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_forward*(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_forward*(_: typedesc[torch]; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise_forward", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor)
proc rrelu_with_noise_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor)
proc rrelu_with_noise_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor)
proc rrelu_with_noise_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, noise: Tensor, lower: float, upper: float, training: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise_backward", grad_output.tensor, self.tensor, noise.tensor, lower, upper, training).to(ATensor)
proc rrelu_with_noise_u*(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_u*(_: typedesc[torch]; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_forward_u*(ty: TensorType; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_with_noise_forward_u*(_: typedesc[torch]; self: Tensor, noise: Tensor, lower: float, upper: float, training: bool, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_with_noise_forward_", self.tensor, noise.tensor, lower, upper, training, generator).to(ATensor)
proc softplus_out*(ty: TensorType; output: Tensor, self: Tensor, beta: float = 1, threshold: float = 20): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softplus_out", output.tensor, self.tensor, beta, threshold).to(ATensor)
proc softplus_out*(_: typedesc[torch]; output: Tensor, self: Tensor, beta: float = 1, threshold: float = 20): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softplus_out", output.tensor, self.tensor, beta, threshold).to(ATensor)
proc softplus*(ty: TensorType; self: Tensor, beta: float = 1, threshold: float = 20): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softplus", self.tensor, beta, threshold).to(ATensor)
proc softplus*(_: typedesc[torch]; self: Tensor, beta: float = 1, threshold: float = 20): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softplus", self.tensor, beta, threshold).to(ATensor)
proc softplus_forward_out*(ty: TensorType; output: Tensor, self: Tensor, beta: float, threshold: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softplus_forward_out", output.tensor, self.tensor, beta, threshold).to(ATensor)
proc softplus_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, beta: float, threshold: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softplus_forward_out", output.tensor, self.tensor, beta, threshold).to(ATensor)
proc softplus_forward*(ty: TensorType; self: Tensor, beta: float, threshold: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softplus_forward", self.tensor, beta, threshold).to(ATensor)
proc softplus_forward*(_: typedesc[torch]; self: Tensor, beta: float, threshold: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softplus_forward", self.tensor, beta, threshold).to(ATensor)
proc softplus_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, beta: float, threshold: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softplus_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor)
proc softplus_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, beta: float, threshold: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softplus_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor)
proc softplus_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, beta: float, threshold: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor)
proc softplus_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, beta: float, threshold: float, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softplus_backward", grad_output.tensor, self.tensor, beta, threshold, output.tensor).to(ATensor)
proc softshrink_out*(ty: TensorType; output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softshrink_out", output.tensor, self.tensor, lambd).to(ATensor)
proc softshrink_out*(_: typedesc[torch]; output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softshrink_out", output.tensor, self.tensor, lambd).to(ATensor)
proc softshrink*(ty: TensorType; self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softshrink", self.tensor, lambd).to(ATensor)
proc softshrink*(_: typedesc[torch]; self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softshrink", self.tensor, lambd).to(ATensor)
proc softshrink_forward_out*(ty: TensorType; output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softshrink_forward_out", output.tensor, self.tensor, lambd).to(ATensor)
proc softshrink_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softshrink_forward_out", output.tensor, self.tensor, lambd).to(ATensor)
proc softshrink_forward*(ty: TensorType; self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softshrink_forward", self.tensor, lambd).to(ATensor)
proc softshrink_forward*(_: typedesc[torch]; self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softshrink_forward", self.tensor, lambd).to(ATensor)
proc softshrink_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softshrink_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, lambd).to(ATensor)
proc softshrink_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softshrink_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, lambd).to(ATensor)
proc softshrink_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor)
proc softshrink_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softshrink_backward", grad_output.tensor, self.tensor, lambd).to(ATensor)
proc threshold_out*(ty: TensorType; output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold_out", output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold_out*(_: typedesc[torch]; output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold_out", output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold*(ty: TensorType; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold", self.tensor, threshold, value).to(ATensor)
proc threshold*(_: typedesc[torch]; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold", self.tensor, threshold, value).to(ATensor)
proc threshold_forward_out*(ty: TensorType; output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold_forward_out", output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold_forward_out", output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold_forward*(ty: TensorType; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold_forward", self.tensor, threshold, value).to(ATensor)
proc threshold_forward*(_: typedesc[torch]; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold_forward", self.tensor, threshold, value).to(ATensor)
proc threshold_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold_backward", grad_output.tensor, self.tensor, threshold, value).to(ATensor)
proc threshold_u*(ty: TensorType; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold_", self.tensor, threshold, value).to(ATensor)
proc threshold_u*(_: typedesc[torch]; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold_", self.tensor, threshold, value).to(ATensor)
proc threshold_forward_u*(ty: TensorType; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("threshold_forward_", self.tensor, threshold, value).to(ATensor)
proc threshold_forward_u*(_: typedesc[torch]; self: Tensor, threshold: float, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::threshold_forward_", self.tensor, threshold, value).to(ATensor)
proc adaptive_avg_pool2d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool2d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool2d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool2d", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool2d", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool2d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool2d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d_forward*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool2d_forward", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_avg_pool2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_avg_pool2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_avg_pool2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool2d_backward", grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_avg_pool3d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool3d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool3d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool3d", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool3d", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool3d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool3d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d_forward*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool3d_forward", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_avg_pool3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_avg_pool3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_avg_pool3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool3d_backward", grad_output.tensor, self.tensor).to(ATensor)
proc adaptive_max_pool2d_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool2d_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool2d_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d*(ty: TensorType; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool2d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d*(_: typedesc[torch]; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool2d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d_forward_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool2d_forward_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d_forward_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool2d_forward_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d_forward*(ty: TensorType; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool2d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_max_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc adaptive_max_pool2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_max_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc adaptive_max_pool2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc adaptive_max_pool2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_max_pool2d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc adaptive_max_pool3d_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool3d_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool3d_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d*(ty: TensorType; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool3d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d*(_: typedesc[torch]; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool3d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d_forward_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool3d_forward_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d_forward_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool3d_forward_out", output.tensor, indices.tensor, self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d_forward*(ty: TensorType; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool3d_forward", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc adaptive_max_pool3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_max_pool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc adaptive_max_pool3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_max_pool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc adaptive_max_pool3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc adaptive_max_pool3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_max_pool3d_backward", grad_output.tensor, self.tensor, indices.tensor).to(ATensor)
proc avg_pool2d_out*(ty: TensorType; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool2d_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool2d_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool2d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool2d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool2d_forward_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool2d_forward_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_forward*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_forward*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool2d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_out*(ty: TensorType; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool3d_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool3d_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool3d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool3d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool3d_forward_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool3d_forward_out", output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_forward*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_forward*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool3d_forward", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, ceil_mode: bool, count_include_pad: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool3d_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc fractional_max_pool2d_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("fractional_max_pool2d_out", output.tensor, indices.tensor, self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::fractional_max_pool2d_out", output.tensor, indices.tensor, self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d*(ty: TensorType; self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("fractional_max_pool2d", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::fractional_max_pool2d", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d_forward_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("fractional_max_pool2d_forward_out", output.tensor, indices.tensor, self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d_forward_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::fractional_max_pool2d_forward_out", output.tensor, indices.tensor, self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d_forward*(ty: TensorType; self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d_forward*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, output_size: IntList, random_samples: Tensor): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::fractional_max_pool2d_forward", self.tensor, kernel_size, output_size, random_samples.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc fractional_max_pool2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fractional_max_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, output_size, indices.tensor).to(ATensor)
proc fractional_max_pool2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fractional_max_pool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, output_size, indices.tensor).to(ATensor)
proc fractional_max_pool2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, output_size, indices.tensor).to(ATensor)
proc fractional_max_pool2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, kernel_size: IntList, output_size: IntList, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fractional_max_pool2d_backward", grad_output.tensor, self.tensor, kernel_size, output_size, indices.tensor).to(ATensor)
proc max_pool2d_with_indices_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool2d_with_indices_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool2d_with_indices_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool2d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool2d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices_forward_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool2d_with_indices_forward_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices_forward_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool2d_with_indices_forward_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices_forward*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices_forward*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool2d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool2d_with_indices_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_pool2d_with_indices_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_pool2d_with_indices_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_pool2d_with_indices_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_pool2d_with_indices_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_pool2d_with_indices_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_pool2d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_pool3d_with_indices_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool3d_with_indices_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool3d_with_indices_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool3d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool = false): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool3d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices_forward_out*(ty: TensorType; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool3d_with_indices_forward_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices_forward_out*(_: typedesc[torch]; output: Tensor, indices: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool3d_with_indices_forward_out", output.tensor, indices.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices_forward*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices_forward*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool): tuple[output: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool3d_with_indices_forward", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc max_pool3d_with_indices_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_pool3d_with_indices_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_pool3d_with_indices_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_pool3d_with_indices_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_pool3d_with_indices_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_pool3d_with_indices_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, ceil_mode: bool, indices: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_pool3d_with_indices_backward", grad_output.tensor, self.tensor, kernel_size, stride, padding, dilation, ceil_mode, indices.tensor).to(ATensor)
proc max_unpool2d_out*(ty: TensorType; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool2d_out", output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool2d_out", output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d*(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool2d", self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d*(_: typedesc[torch]; self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool2d", self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool2d_forward_out", output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool2d_forward_out", output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_forward*(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_forward*(_: typedesc[torch]; self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool2d_forward", self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool2d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size).to(ATensor)
proc max_unpool3d_out*(ty: TensorType; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool3d_out", output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool3d_out", output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d*(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool3d", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d*(_: typedesc[torch]; self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool3d", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool3d_forward_out", output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool3d_forward_out", output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_forward*(ty: TensorType; self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_forward*(_: typedesc[torch]; self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool3d_forward", self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc max_unpool3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, indices: Tensor, output_size: IntList, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_unpool3d_backward", grad_output.tensor, self.tensor, indices.tensor, output_size, stride, padding).to(ATensor)
proc reflection_pad1d_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad1d_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad1d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad1d_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad1d*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad1d", self.tensor, padding).to(ATensor)
proc reflection_pad1d*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad1d", self.tensor, padding).to(ATensor)
proc reflection_pad1d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad1d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad1d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad1d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad1d_forward*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad1d_forward", self.tensor, padding).to(ATensor)
proc reflection_pad1d_forward*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad1d_forward", self.tensor, padding).to(ATensor)
proc reflection_pad1d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad1d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad1d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad1d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad1d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad1d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad2d_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad2d_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad2d", self.tensor, padding).to(ATensor)
proc reflection_pad2d*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad2d", self.tensor, padding).to(ATensor)
proc reflection_pad2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad2d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad2d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d_forward*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad2d_forward", self.tensor, padding).to(ATensor)
proc reflection_pad2d_forward*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad2d_forward", self.tensor, padding).to(ATensor)
proc reflection_pad2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc reflection_pad2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reflection_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad1d_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad1d_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad1d", self.tensor, padding).to(ATensor)
proc replication_pad1d*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad1d", self.tensor, padding).to(ATensor)
proc replication_pad1d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad1d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad1d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d_forward*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad1d_forward", self.tensor, padding).to(ATensor)
proc replication_pad1d_forward*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad1d_forward", self.tensor, padding).to(ATensor)
proc replication_pad1d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad1d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad1d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad1d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad1d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad2d_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad2d_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad2d", self.tensor, padding).to(ATensor)
proc replication_pad2d*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad2d", self.tensor, padding).to(ATensor)
proc replication_pad2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad2d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad2d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d_forward*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad2d_forward", self.tensor, padding).to(ATensor)
proc replication_pad2d_forward*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad2d_forward", self.tensor, padding).to(ATensor)
proc replication_pad2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad2d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad2d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad3d_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad3d_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad3d", self.tensor, padding).to(ATensor)
proc replication_pad3d*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad3d", self.tensor, padding).to(ATensor)
proc replication_pad3d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad3d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad3d_forward_out", output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d_forward*(ty: TensorType; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad3d_forward", self.tensor, padding).to(ATensor)
proc replication_pad3d_forward*(_: typedesc[torch]; self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad3d_forward", self.tensor, padding).to(ATensor)
proc replication_pad3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad3d_backward_out", grad_input.tensor, grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc replication_pad3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::replication_pad3d_backward", grad_output.tensor, self.tensor, padding).to(ATensor)
proc upsample_linear1d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_linear1d_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_linear1d_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d*(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_linear1d", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d*(_: typedesc[torch]; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_linear1d", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_linear1d_forward_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_linear1d_forward_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d_forward*(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_linear1d_forward", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_linear1d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_linear1d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_linear1d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_linear1d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_linear1d_backward*(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_linear1d_backward*(_: typedesc[torch]; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_linear1d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_bilinear2d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_bilinear2d_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_bilinear2d_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d*(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_bilinear2d", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d*(_: typedesc[torch]; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_bilinear2d", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_bilinear2d_forward_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_bilinear2d_forward_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d_forward*(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_bilinear2d_forward", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_bilinear2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_bilinear2d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_bilinear2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_bilinear2d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_bilinear2d_backward*(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_bilinear2d_backward*(_: typedesc[torch]; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_bilinear2d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_trilinear3d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_trilinear3d_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_trilinear3d_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d*(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_trilinear3d", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d*(_: typedesc[torch]; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_trilinear3d", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_trilinear3d_forward_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_trilinear3d_forward_out", output.tensor, self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d_forward*(ty: TensorType; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_trilinear3d_forward", self.tensor, output_size, align_corners).to(ATensor)
proc upsample_trilinear3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_trilinear3d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_trilinear3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_trilinear3d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_trilinear3d_backward*(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_trilinear3d_backward*(_: typedesc[torch]; grad_output: Tensor, output_size: IntList, input_size: IntList, align_corners: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_trilinear3d_backward", grad_output.tensor, output_size, input_size, align_corners).to(ATensor)
proc upsample_nearest1d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest1d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest1d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest1d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest1d*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest1d", self.tensor, output_size).to(ATensor)
proc upsample_nearest1d*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest1d", self.tensor, output_size).to(ATensor)
proc upsample_nearest1d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest1d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest1d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest1d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest1d_forward*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest1d_forward", self.tensor, output_size).to(ATensor)
proc upsample_nearest1d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest1d_forward", self.tensor, output_size).to(ATensor)
proc upsample_nearest1d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest1d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest1d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest1d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest1d_backward*(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest1d_backward*(_: typedesc[torch]; grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest1d_backward", grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest2d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest2d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest2d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest2d*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest2d", self.tensor, output_size).to(ATensor)
proc upsample_nearest2d*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest2d", self.tensor, output_size).to(ATensor)
proc upsample_nearest2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest2d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest2d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest2d_forward*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest2d_forward", self.tensor, output_size).to(ATensor)
proc upsample_nearest2d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest2d_forward", self.tensor, output_size).to(ATensor)
proc upsample_nearest2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest2d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest2d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest2d_backward*(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest2d_backward*(_: typedesc[torch]; grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest2d_backward", grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest3d_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest3d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest3d_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest3d*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest3d", self.tensor, output_size).to(ATensor)
proc upsample_nearest3d*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest3d", self.tensor, output_size).to(ATensor)
proc upsample_nearest3d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest3d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest3d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest3d_forward_out", output.tensor, self.tensor, output_size).to(ATensor)
proc upsample_nearest3d_forward*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest3d_forward", self.tensor, output_size).to(ATensor)
proc upsample_nearest3d_forward*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest3d_forward", self.tensor, output_size).to(ATensor)
proc upsample_nearest3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest3d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest3d_backward_out", grad_input.tensor, grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest3d_backward*(ty: TensorType; grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor)
proc upsample_nearest3d_backward*(_: typedesc[torch]; grad_output: Tensor, output_size: IntList, input_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::upsample_nearest3d_backward", grad_output.tensor, output_size, input_size).to(ATensor)
proc u_sigmoid_out*(ty: TensorType; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sigmoid_out", output.tensor, self.tensor).to(ATensor)
proc u_sigmoid_out*(_: typedesc[torch]; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sigmoid_out", output.tensor, self.tensor).to(ATensor)
proc u_sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sigmoid", self.tensor).to(ATensor)
proc u_sigmoid*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sigmoid", self.tensor).to(ATensor)
proc u_sigmoid_forward_out*(ty: TensorType; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sigmoid_forward_out", output.tensor, self.tensor).to(ATensor)
proc u_sigmoid_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sigmoid_forward_out", output.tensor, self.tensor).to(ATensor)
proc u_sigmoid_forward*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sigmoid_forward", self.tensor).to(ATensor)
proc u_sigmoid_forward*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sigmoid_forward", self.tensor).to(ATensor)
proc u_sigmoid_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sigmoid_backward_out", grad_input.tensor, grad_output.tensor, output.tensor).to(ATensor)
proc u_sigmoid_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sigmoid_backward_out", grad_input.tensor, grad_output.tensor, output.tensor).to(ATensor)
proc u_sigmoid_backward*(ty: TensorType; grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor)
proc u_sigmoid_backward*(_: typedesc[torch]; grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sigmoid_backward", grad_output.tensor, output.tensor).to(ATensor)
proc u_tanh_out*(ty: TensorType; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tanh_out", output.tensor, self.tensor).to(ATensor)
proc u_tanh_out*(_: typedesc[torch]; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tanh_out", output.tensor, self.tensor).to(ATensor)
proc u_tanh*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tanh", self.tensor).to(ATensor)
proc u_tanh*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tanh", self.tensor).to(ATensor)
proc u_tanh_forward_out*(ty: TensorType; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tanh_forward_out", output.tensor, self.tensor).to(ATensor)
proc u_tanh_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tanh_forward_out", output.tensor, self.tensor).to(ATensor)
proc u_tanh_forward*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tanh_forward", self.tensor).to(ATensor)
proc u_tanh_forward*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tanh_forward", self.tensor).to(ATensor)
proc u_tanh_backward_out*(ty: TensorType; grad_input: Tensor, grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tanh_backward_out", grad_input.tensor, grad_output.tensor, output.tensor).to(ATensor)
proc u_tanh_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tanh_backward_out", grad_input.tensor, grad_output.tensor, output.tensor).to(ATensor)
proc u_tanh_backward*(ty: TensorType; grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_tanh_backward", grad_output.tensor, output.tensor).to(ATensor)
proc u_tanh_backward*(_: typedesc[torch]; grad_output: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_tanh_backward", grad_output.tensor, output.tensor).to(ATensor)
proc thnn_batch_norm_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_batch_norm_out", output.tensor, self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(ATensor)
proc thnn_batch_norm_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_batch_norm_out", output.tensor, self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(ATensor)
proc thnn_batch_norm*(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_batch_norm", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(ATensor)
proc thnn_batch_norm*(_: typedesc[torch]; self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_batch_norm", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(ATensor)
proc thnn_batch_norm_forward_out*(ty: TensorType; output: Tensor, save_mean: Tensor, save_std: Tensor, self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_batch_norm_forward_out", output.tensor, save_mean.tensor, save_std.tensor, self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.save_mean = newTensor tupleRes[1]
  result.save_std = newTensor tupleRes[2]
proc thnn_batch_norm_forward_out*(_: typedesc[torch]; output: Tensor, save_mean: Tensor, save_std: Tensor, self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_batch_norm_forward_out", output.tensor, save_mean.tensor, save_std.tensor, self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.save_mean = newTensor tupleRes[1]
  result.save_std = newTensor tupleRes[2]
proc thnn_batch_norm_forward*(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.save_mean = newTensor tupleRes[1]
  result.save_std = newTensor tupleRes[2]
proc thnn_batch_norm_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64): tuple[output: Tensor, save_mean: Tensor, save_std: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_batch_norm_forward", self.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.save_mean = newTensor tupleRes[1]
  result.save_std = newTensor tupleRes[2]
proc thnn_batch_norm_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, eps: float64, save_mean: Tensor, save_std: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_batch_norm_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_batch_norm_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, eps: float64, save_mean: Tensor, save_std: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_batch_norm_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_batch_norm_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, eps: float64, save_mean: Tensor, save_std: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_batch_norm_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, eps: float64, save_mean: Tensor, save_std: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_batch_norm_backward", grad_output.tensor, self.tensor, weight.tensor, running_mean.tensor, running_var.tensor, training, eps, save_mean.tensor, save_std.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose2d_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_transpose2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_transpose2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose2d*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_transpose2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose2d*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_transpose2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose2d_forward_out*(ty: TensorType; output: Tensor, columns: Tensor, ones: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose2d_forward_out", output.tensor, columns.tensor, ones.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_transpose2d_forward_out*(_: typedesc[torch]; output: Tensor, columns: Tensor, ones: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose2d_forward_out", output.tensor, columns.tensor, ones.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_transpose2d_forward*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_transpose2d_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_transpose2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, columns.tensor, ones.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, columns.tensor, ones.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose3d_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_transpose3d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_transpose3d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose3d*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_transpose3d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose3d*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_transpose3d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(ATensor)
proc thnn_conv_transpose3d_forward_out*(ty: TensorType; output: Tensor, finput: Tensor, fgrad_input: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose3d_forward_out", output.tensor, finput.tensor, fgrad_input.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv_transpose3d_forward_out*(_: typedesc[torch]; output: Tensor, finput: Tensor, fgrad_input: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose3d_forward_out", output.tensor, finput.tensor, fgrad_input.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv_transpose3d_forward*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv_transpose3d_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, output_padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv_transpose3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, finput: Tensor, fgrad_input: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose3d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, finput.tensor, fgrad_input.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, finput: Tensor, fgrad_input: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose3d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, finput.tensor, fgrad_input.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_transpose3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, output_padding: IntList, dilation: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_transpose3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, output_padding, dilation, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv2d_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv2d*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv2d*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv2d_forward_out*(ty: TensorType; output: Tensor, finput: Tensor, fgrad_input: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv2d_forward_out", output.tensor, finput.tensor, fgrad_input.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv2d_forward_out*(_: typedesc[torch]; output: Tensor, finput: Tensor, fgrad_input: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv2d_forward_out", output.tensor, finput.tensor, fgrad_input.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv2d_forward*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv2d_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_depthwise2d_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_depthwise2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_depthwise2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_depthwise2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_depthwise2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d_forward_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_depthwise2d_forward_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d_forward_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_depthwise2d_forward_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d_forward*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_depthwise2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_depthwise2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_depthwise2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc thnn_conv_depthwise2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_depthwise2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc thnn_conv_depthwise2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc thnn_conv_depthwise2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, output_mask: StdArray[bool, 2]): tuple[self: Tensor, weight: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_depthwise2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, output_mask).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
proc thnn_conv3d_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv3d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv3d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv3d*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv3d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv3d*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv3d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(ATensor)
proc thnn_conv3d_forward_out*(ty: TensorType; output: Tensor, finput: Tensor, fgrad_input: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv3d_forward_out", output.tensor, finput.tensor, fgrad_input.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv3d_forward_out*(_: typedesc[torch]; output: Tensor, finput: Tensor, fgrad_input: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv3d_forward_out", output.tensor, finput.tensor, fgrad_input.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv3d_forward*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv3d_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList): tuple[output: Tensor, finput: Tensor, fgrad_input: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.finput = newTensor tupleRes[1]
  result.fgrad_input = newTensor tupleRes[2]
proc thnn_conv3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv3d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv3d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, finput: Tensor, fgrad_input: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, finput.tensor, fgrad_input.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated2d_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_dilated2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated2d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_dilated2d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated2d*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_dilated2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated2d*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_dilated2d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated2d_forward_out*(ty: TensorType; output: Tensor, columns: Tensor, ones: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated2d_forward_out", output.tensor, columns.tensor, ones.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated2d_forward_out*(_: typedesc[torch]; output: Tensor, columns: Tensor, ones: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated2d_forward_out", output.tensor, columns.tensor, ones.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated2d_forward*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated2d_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated2d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated2d_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated2d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated2d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated2d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated2d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated2d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated3d_out*(ty: TensorType; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_dilated3d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated3d_out*(_: typedesc[torch]; output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_dilated3d_out", output.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated3d*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("thnn_conv_dilated3d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated3d*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::thnn_conv_dilated3d", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(ATensor)
proc thnn_conv_dilated3d_forward_out*(ty: TensorType; output: Tensor, columns: Tensor, ones: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated3d_forward_out", output.tensor, columns.tensor, ones.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated3d_forward_out*(_: typedesc[torch]; output: Tensor, columns: Tensor, ones: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated3d_forward_out", output.tensor, columns.tensor, ones.tensor, self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated3d_forward*(ty: TensorType; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated3d_forward*(_: typedesc[torch]; self: Tensor, weight: Tensor, kernel_size: IntList, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList): tuple[output: Tensor, columns: Tensor, ones: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated3d_forward", self.tensor, weight.tensor, kernel_size, bias.tensor, stride, padding, dilation).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.output = newTensor tupleRes[0]
  result.columns = newTensor tupleRes[1]
  result.ones = newTensor tupleRes[2]
proc thnn_conv_dilated3d_backward_out*(ty: TensorType; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated3d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated3d_backward_out*(_: typedesc[torch]; grad_input: Tensor, grad_weight: Tensor, grad_bias: Tensor, grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated3d_backward_out", grad_input.tensor, grad_weight.tensor, grad_bias.tensor, grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated3d_backward*(ty: TensorType; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc thnn_conv_dilated3d_backward*(_: typedesc[torch]; grad_output: Tensor, self: Tensor, weight: Tensor, kernel_size: IntList, stride: IntList, padding: IntList, dilation: IntList, columns: Tensor, ones: Tensor, output_mask: StdArray[bool, 3]): tuple[self: Tensor, weight: Tensor, bias: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::thnn_conv_dilated3d_backward", grad_output.tensor, self.tensor, weight.tensor, kernel_size, stride, padding, dilation, columns.tensor, ones.tensor, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.weight = newTensor tupleRes[1]
  result.bias = newTensor tupleRes[2]
proc u_cast_Byte*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Byte", non_blocking).to(ATensor)
proc u_cast_Byte*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Byte", self.tensor, non_blocking).to(ATensor)
proc u_cast_Byte*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Byte", self.tensor, non_blocking).to(ATensor)
proc u_cast_Char*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Char", non_blocking).to(ATensor)
proc u_cast_Char*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Char", self.tensor, non_blocking).to(ATensor)
proc u_cast_Char*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Char", self.tensor, non_blocking).to(ATensor)
proc u_cast_Double*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Double", non_blocking).to(ATensor)
proc u_cast_Double*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Double", self.tensor, non_blocking).to(ATensor)
proc u_cast_Double*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Double", self.tensor, non_blocking).to(ATensor)
proc u_cast_Float*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Float", non_blocking).to(ATensor)
proc u_cast_Float*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Float", self.tensor, non_blocking).to(ATensor)
proc u_cast_Float*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Float", self.tensor, non_blocking).to(ATensor)
proc u_cast_Int*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Int", non_blocking).to(ATensor)
proc u_cast_Int*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Int", self.tensor, non_blocking).to(ATensor)
proc u_cast_Int*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Int", self.tensor, non_blocking).to(ATensor)
proc u_cast_Long*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Long", non_blocking).to(ATensor)
proc u_cast_Long*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Long", self.tensor, non_blocking).to(ATensor)
proc u_cast_Long*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Long", self.tensor, non_blocking).to(ATensor)
proc u_cast_Short*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Short", non_blocking).to(ATensor)
proc u_cast_Short*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Short", self.tensor, non_blocking).to(ATensor)
proc u_cast_Short*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Short", self.tensor, non_blocking).to(ATensor)
proc u_cast_Half*(self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_cast_Half", non_blocking).to(ATensor)
proc u_cast_Half*(ty: TensorType; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cast_Half", self.tensor, non_blocking).to(ATensor)
proc u_cast_Half*(_: typedesc[torch]; self: Tensor, non_blocking: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cast_Half", self.tensor, non_blocking).to(ATensor)
proc u_cudnn_ctc_loss*(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_cudnn_ctc_loss*(_: typedesc[torch]; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64, deterministic: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_cudnn_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, deterministic).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_cudnn_rnn_flatten_weight*(ty: TensorType; weight_arr: TensorList, weight_stride0: int64, input_size: int64, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, bidirectional: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cudnn_rnn_flatten_weight", weight_arr, weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor)
proc u_cudnn_rnn_flatten_weight*(_: typedesc[torch]; weight_arr: TensorList, weight_stride0: int64, input_size: int64, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, bidirectional: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cudnn_rnn_flatten_weight", weight_arr, weight_stride0, input_size, mode, hidden_size, num_layers, batch_first, bidirectional).to(ATensor)
proc u_cudnn_rnn*(ty: TensorType; input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_cudnn_rnn", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
  result.result4 = newTensor tupleRes[4]
proc u_cudnn_rnn*(_: typedesc[torch]; input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_cudnn_rnn", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
  result.result4 = newTensor tupleRes[4]
proc u_cudnn_rnn_backward*(ty: TensorType; input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, output: Tensor, grad_output: Tensor, grad_hy: Tensor, grad_cy: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor, reserve: Tensor, output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_cudnn_rnn_backward", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, TensorList]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = tupleRes[3]
proc u_cudnn_rnn_backward*(_: typedesc[torch]; input: Tensor, weight: TensorList, weight_stride0: int64, weight_buf: Tensor, hx: Tensor, cx: Tensor, output: Tensor, grad_output: Tensor, grad_hy: Tensor, grad_cy: Tensor, mode: int64, hidden_size: int64, num_layers: int64, batch_first: bool, dropout: float64, train: bool, bidirectional: bool, batch_sizes: IntList, dropout_state: Tensor, reserve: Tensor, output_mask: StdArray[bool, 4]): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: TensorList] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_cudnn_rnn_backward", input.tensor, weight, weight_stride0, weight_buf.tensor, hx.tensor, cx.tensor, output.tensor, grad_output.tensor, grad_hy.tensor, grad_cy.tensor, mode, hidden_size, num_layers, batch_first, dropout, train, bidirectional, batch_sizes, dropout_state.tensor, reserve.tensor, output_mask).to(StdTuple4[ATensor, ATensor, ATensor, TensorList]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = tupleRes[3]
proc u_cudnn_init_dropout_state*(ty: TensorType; self_ty: TensorType, dropout: float64, train: bool, dropout_seed: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor)
proc u_cudnn_init_dropout_state*(_: typedesc[torch]; self_ty: TensorType, dropout: float64, train: bool, dropout_seed: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_cudnn_init_dropout_state", self_ty, dropout, train, dropout_seed).to(ATensor)
proc u_fused_dropout*(self: Tensor, p: float64, generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_fused_dropout", p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_fused_dropout*(ty: TensorType; self: Tensor, p: float64, generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_fused_dropout", self.tensor, p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_fused_dropout*(_: typedesc[torch]; self: Tensor, p: float64, generator: Generator = nil): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_fused_dropout", self.tensor, p, generator).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_masked_scale*(self: Tensor, mask: Tensor, scale: float64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_masked_scale", mask.tensor, scale).to(ATensor)
proc u_masked_scale*(ty: TensorType; self: Tensor, mask: Tensor, scale: float64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_masked_scale", self.tensor, mask.tensor, scale).to(ATensor)
proc u_masked_scale*(_: typedesc[torch]; self: Tensor, mask: Tensor, scale: float64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_masked_scale", self.tensor, mask.tensor, scale).to(ATensor)
proc dropout*(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("dropout", input.tensor, p, train).to(ATensor)
proc dropout*(_: typedesc[torch]; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::dropout", input.tensor, p, train).to(ATensor)
proc dropout_u*(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("dropout_", self.tensor, p, train).to(ATensor)
proc dropout_u*(_: typedesc[torch]; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::dropout_", self.tensor, p, train).to(ATensor)
proc feature_dropout*(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("feature_dropout", input.tensor, p, train).to(ATensor)
proc feature_dropout*(_: typedesc[torch]; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::feature_dropout", input.tensor, p, train).to(ATensor)
proc feature_dropout_u*(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("feature_dropout_", self.tensor, p, train).to(ATensor)
proc feature_dropout_u*(_: typedesc[torch]; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::feature_dropout_", self.tensor, p, train).to(ATensor)
proc alpha_dropout*(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("alpha_dropout", input.tensor, p, train).to(ATensor)
proc alpha_dropout*(_: typedesc[torch]; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::alpha_dropout", input.tensor, p, train).to(ATensor)
proc alpha_dropout_u*(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("alpha_dropout_", self.tensor, p, train).to(ATensor)
proc alpha_dropout_u*(_: typedesc[torch]; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::alpha_dropout_", self.tensor, p, train).to(ATensor)
proc feature_alpha_dropout*(ty: TensorType; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("feature_alpha_dropout", input.tensor, p, train).to(ATensor)
proc feature_alpha_dropout*(_: typedesc[torch]; input: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::feature_alpha_dropout", input.tensor, p, train).to(ATensor)
proc feature_alpha_dropout_u*(ty: TensorType; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("feature_alpha_dropout_", self.tensor, p, train).to(ATensor)
proc feature_alpha_dropout_u*(_: typedesc[torch]; self: Tensor, p: float64, train: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::feature_alpha_dropout_", self.tensor, p, train).to(ATensor)
proc abs*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("abs").to(ATensor)
proc abs*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("abs", self.tensor).to(ATensor)
proc abs*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::abs", self.tensor).to(ATensor)
proc abs_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("abs_").to(ATensor)
proc abs_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("abs_", self.tensor).to(ATensor)
proc abs_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::abs_", self.tensor).to(ATensor)
proc abs_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("abs_out", aresult.tensor, self.tensor).to(ATensor)
proc abs_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::abs_out", aresult.tensor, self.tensor).to(ATensor)
proc acos*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("acos").to(ATensor)
proc acos*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("acos", self.tensor).to(ATensor)
proc acos*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::acos", self.tensor).to(ATensor)
proc acos_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("acos_").to(ATensor)
proc acos_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("acos_", self.tensor).to(ATensor)
proc acos_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::acos_", self.tensor).to(ATensor)
proc acos_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("acos_out", aresult.tensor, self.tensor).to(ATensor)
proc acos_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::acos_out", aresult.tensor, self.tensor).to(ATensor)
proc avg_pool1d*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("avg_pool1d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc avg_pool1d*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], ceil_mode: bool = false, count_include_pad: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::avg_pool1d", self.tensor, kernel_size, stride, padding, ceil_mode, count_include_pad).to(ATensor)
proc adaptive_avg_pool1d*(ty: TensorType; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("adaptive_avg_pool1d", self.tensor, output_size).to(ATensor)
proc adaptive_avg_pool1d*(_: typedesc[torch]; self: Tensor, output_size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::adaptive_avg_pool1d", self.tensor, output_size).to(ATensor)
proc adaptive_max_pool1d*(ty: TensorType; self: Tensor, output_size: IntList): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("adaptive_max_pool1d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc adaptive_max_pool1d*(_: typedesc[torch]; self: Tensor, output_size: IntList): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::adaptive_max_pool1d", self.tensor, output_size).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc add*(self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("add", other.tensor, alpha).to(ATensor)
proc add*(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("add", self.tensor, other.tensor, alpha).to(ATensor)
proc add*(_: typedesc[torch]; self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::add", self.tensor, other.tensor, alpha).to(ATensor)
proc add_u*(self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("add_", other.tensor, alpha).to(ATensor)
proc add_u*(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("add_", self.tensor, other.tensor, alpha).to(ATensor)
proc add_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("add_out", aresult.tensor, self.tensor, other.tensor, alpha).to(ATensor)
proc add_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::add_out", aresult.tensor, self.tensor, other.tensor, alpha).to(ATensor)
proc add*(self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("add", other, alpha).to(ATensor)
proc add*(ty: TensorType; self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("add", self.tensor, other, alpha).to(ATensor)
proc add*(_: typedesc[torch]; self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::add", self.tensor, other, alpha).to(ATensor)
proc add_u*(self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("add_", other, alpha).to(ATensor)
proc add_u*(ty: TensorType; self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("add_", self.tensor, other, alpha).to(ATensor)
proc addmv*(self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addmv", mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addmv*(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addmv*(_: typedesc[torch]; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addmv", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addmv_u*(self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addmv_", mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addmv_u*(ty: TensorType; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addmv_u*(_: typedesc[torch]; self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addmv_", self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addmv_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addmv_out", aresult.tensor, self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addmv_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat: Tensor, vec: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addmv_out", aresult.tensor, self.tensor, mat.tensor, vec.tensor, beta, alpha).to(ATensor)
proc addr*(self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addr", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc addr*(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc addr*(_: typedesc[torch]; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addr", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc addr_u*(self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addr_", vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc addr_u*(ty: TensorType; self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addr_", self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc addr_out*(ty: TensorType; aresult: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addr_out", aresult.tensor, self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc addr_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, vec1: Tensor, vec2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addr_out", aresult.tensor, self.tensor, vec1.tensor, vec2.tensor, beta, alpha).to(ATensor)
proc all*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("all", dim, keepdim).to(ATensor)
proc all*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("all", self.tensor, dim, keepdim).to(ATensor)
proc all*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::all", self.tensor, dim, keepdim).to(ATensor)
proc all_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("all_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc all_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::all_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc allclose*(self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): bool {.inline, noinit.} = self.tensor.dynamicCppCall("allclose", other.tensor, rtol, atol, equal_nan).to(bool)
proc allclose*(ty: TensorType; self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): bool {.inline, noinit.} = ty.dynamicCppCall("allclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(bool)
proc allclose*(_: typedesc[torch]; self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): bool {.inline, noinit.} = dynamicCCall("at::allclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(bool)
proc any*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("any", dim, keepdim).to(ATensor)
proc any*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("any", self.tensor, dim, keepdim).to(ATensor)
proc any*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::any", self.tensor, dim, keepdim).to(ATensor)
proc any_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("any_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc any_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::any_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc arange*(ty: TensorType; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange", start, aend, options).to(ATensor)
proc arange*(_: typedesc[torch]; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange", start, aend, options).to(ATensor)
proc arange*(ty: TensorType; start: float, aend: float, step: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange", start, aend, step, options).to(ATensor)
proc arange*(_: typedesc[torch]; start: float, aend: float, step: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange", start, aend, step, options).to(ATensor)
proc arange_out*(ty: TensorType; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange_out", aresult.tensor, start, aend).to(ATensor)
proc arange_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange_out", aresult.tensor, start, aend).to(ATensor)
proc arange_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, step: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange_out", aresult.tensor, start, aend, step).to(ATensor)
proc arange_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, step: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange_out", aresult.tensor, start, aend, step).to(ATensor)
proc arange*(ty: TensorType; aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange", aend, options).to(ATensor)
proc arange*(_: typedesc[torch]; aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange", aend, options).to(ATensor)
proc arange_out*(ty: TensorType; aresult: Tensor, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange_out", aresult.tensor, aend).to(ATensor)
proc arange_out*(_: typedesc[torch]; aresult: Tensor, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange_out", aresult.tensor, aend).to(ATensor)
proc arange*(ty: TensorType; dtype: TensorType, start: float, aend: float, step: float = 1): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange", dtype, start, aend, step).to(ATensor)
proc arange*(_: typedesc[torch]; dtype: TensorType, start: float, aend: float, step: float = 1): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange", dtype, start, aend, step).to(ATensor)
proc arange*(ty: TensorType; dtype: TensorType, aend: float): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("arange", dtype, aend).to(ATensor)
proc arange*(_: typedesc[torch]; dtype: TensorType, aend: float): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::arange", dtype, aend).to(ATensor)
proc u_dim_arange*(ty: TensorType; like: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_dim_arange", like.tensor, dim).to(ATensor)
proc u_dim_arange*(_: typedesc[torch]; like: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_dim_arange", like.tensor, dim).to(ATensor)
proc argmax*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("argmax", dim, keepdim).to(ATensor)
proc argmax*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("argmax", self.tensor, dim, keepdim).to(ATensor)
proc argmax*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::argmax", self.tensor, dim, keepdim).to(ATensor)
proc argmax*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("argmax").to(ATensor)
proc argmax*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("argmax", self.tensor).to(ATensor)
proc argmax*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::argmax", self.tensor).to(ATensor)
proc u_argmax*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_argmax", dim, keepdim).to(ATensor)
proc u_argmax*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_argmax", self.tensor, dim, keepdim).to(ATensor)
proc u_argmax*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_argmax", self.tensor, dim, keepdim).to(ATensor)
proc argmin*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("argmin", dim, keepdim).to(ATensor)
proc argmin*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("argmin", self.tensor, dim, keepdim).to(ATensor)
proc argmin*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::argmin", self.tensor, dim, keepdim).to(ATensor)
proc argmin*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("argmin").to(ATensor)
proc argmin*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("argmin", self.tensor).to(ATensor)
proc argmin*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::argmin", self.tensor).to(ATensor)
proc u_argmin*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_argmin", dim, keepdim).to(ATensor)
proc u_argmin*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_argmin", self.tensor, dim, keepdim).to(ATensor)
proc u_argmin*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_argmin", self.tensor, dim, keepdim).to(ATensor)
proc as_strided*(self: Tensor, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("as_strided", size, stride).to(ATensor)
proc as_strided*(ty: TensorType; self: Tensor, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("as_strided", self.tensor, size, stride).to(ATensor)
proc as_strided*(_: typedesc[torch]; self: Tensor, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::as_strided", self.tensor, size, stride).to(ATensor)
proc as_strided_u*(self: Tensor, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("as_strided_", size, stride).to(ATensor)
proc as_strided_u*(ty: TensorType; self: Tensor, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("as_strided_", self.tensor, size, stride).to(ATensor)
proc as_strided_u*(_: typedesc[torch]; self: Tensor, size: IntList, stride: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::as_strided_", self.tensor, size, stride).to(ATensor)
proc as_strided*(self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("as_strided", size, stride, storage_offset).to(ATensor)
proc as_strided*(ty: TensorType; self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("as_strided", self.tensor, size, stride, storage_offset).to(ATensor)
proc as_strided*(_: typedesc[torch]; self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::as_strided", self.tensor, size, stride, storage_offset).to(ATensor)
proc as_strided_u*(self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("as_strided_", size, stride, storage_offset).to(ATensor)
proc as_strided_u*(ty: TensorType; self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("as_strided_", self.tensor, size, stride, storage_offset).to(ATensor)
proc as_strided_u*(_: typedesc[torch]; self: Tensor, size: IntList, stride: IntList, storage_offset: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::as_strided_", self.tensor, size, stride, storage_offset).to(ATensor)
proc asin*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("asin").to(ATensor)
proc asin*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("asin", self.tensor).to(ATensor)
proc asin*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::asin", self.tensor).to(ATensor)
proc asin_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("asin_").to(ATensor)
proc asin_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("asin_", self.tensor).to(ATensor)
proc asin_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::asin_", self.tensor).to(ATensor)
proc asin_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("asin_out", aresult.tensor, self.tensor).to(ATensor)
proc asin_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::asin_out", aresult.tensor, self.tensor).to(ATensor)
proc atan*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("atan").to(ATensor)
proc atan*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("atan", self.tensor).to(ATensor)
proc atan*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::atan", self.tensor).to(ATensor)
proc atan_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("atan_").to(ATensor)
proc atan_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("atan_", self.tensor).to(ATensor)
proc atan_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::atan_", self.tensor).to(ATensor)
proc atan_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("atan_out", aresult.tensor, self.tensor).to(ATensor)
proc atan_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::atan_out", aresult.tensor, self.tensor).to(ATensor)
proc bartlett_window*(ty: TensorType; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bartlett_window", window_length, options).to(ATensor)
proc bartlett_window*(_: typedesc[torch]; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bartlett_window", window_length, options).to(ATensor)
proc bartlett_window*(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bartlett_window", window_length, periodic, options).to(ATensor)
proc bartlett_window*(_: typedesc[torch]; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bartlett_window", window_length, periodic, options).to(ATensor)
proc batch_norm*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64, cudnn_enabled: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor)
proc batch_norm*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, momentum: float64, eps: float64, cudnn_enabled: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, momentum, eps, cudnn_enabled).to(ATensor)
proc bernoulli*(self: Tensor, p: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bernoulli", p.tensor, generator).to(ATensor)
proc bernoulli*(ty: TensorType; self: Tensor, p: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bernoulli", self.tensor, p.tensor, generator).to(ATensor)
proc bernoulli*(_: typedesc[torch]; self: Tensor, p: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bernoulli", self.tensor, p.tensor, generator).to(ATensor)
proc bernoulli*(self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bernoulli", p, generator).to(ATensor)
proc bernoulli*(ty: TensorType; self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bernoulli", self.tensor, p, generator).to(ATensor)
proc bernoulli*(_: typedesc[torch]; self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bernoulli", self.tensor, p, generator).to(ATensor)
proc bernoulli*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bernoulli").to(ATensor)
proc bernoulli*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bernoulli", self.tensor).to(ATensor)
proc bernoulli*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bernoulli", self.tensor).to(ATensor)
proc bernoulli_u*(self: Tensor, p: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bernoulli_", p.tensor, generator).to(ATensor)
proc bernoulli_u*(ty: TensorType; self: Tensor, p: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bernoulli_", self.tensor, p.tensor, generator).to(ATensor)
proc bernoulli_u*(_: typedesc[torch]; self: Tensor, p: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bernoulli_", self.tensor, p.tensor, generator).to(ATensor)
proc bernoulli_u*(self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bernoulli_", p, generator).to(ATensor)
proc bernoulli_u*(ty: TensorType; self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bernoulli_", self.tensor, p, generator).to(ATensor)
proc bernoulli_u*(_: typedesc[torch]; self: Tensor, p: float64, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bernoulli_", self.tensor, p, generator).to(ATensor)
proc bernoulli_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bernoulli_").to(ATensor)
proc bernoulli_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bernoulli_", self.tensor).to(ATensor)
proc bernoulli_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bernoulli_", self.tensor).to(ATensor)
proc bilinear*(ty: TensorType; input1: Tensor, input2: Tensor, weight: Tensor, bias: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor)
proc bilinear*(_: typedesc[torch]; input1: Tensor, input2: Tensor, weight: Tensor, bias: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bilinear", input1.tensor, input2.tensor, weight.tensor, bias.tensor).to(ATensor)
proc bincount*(self: Tensor, weights: Tensor, minlength: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("bincount", weights.tensor, minlength).to(ATensor)
proc bincount*(ty: TensorType; self: Tensor, weights: Tensor, minlength: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("bincount", self.tensor, weights.tensor, minlength).to(ATensor)
proc bincount*(_: typedesc[torch]; self: Tensor, weights: Tensor, minlength: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::bincount", self.tensor, weights.tensor, minlength).to(ATensor)
proc blackman_window*(ty: TensorType; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("blackman_window", window_length, options).to(ATensor)
proc blackman_window*(_: typedesc[torch]; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::blackman_window", window_length, options).to(ATensor)
proc blackman_window*(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("blackman_window", window_length, periodic, options).to(ATensor)
proc blackman_window*(_: typedesc[torch]; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::blackman_window", window_length, periodic, options).to(ATensor)
proc broadcast_tensors*(ty: TensorType; tensors: TensorList): TensorList {.inline, noinit.} = ty.dynamicCppCall("broadcast_tensors", tensors).to(TensorList)
proc broadcast_tensors*(_: typedesc[torch]; tensors: TensorList): TensorList {.inline, noinit.} = dynamicCCall("at::broadcast_tensors", tensors).to(TensorList)
proc cat*(ty: TensorType; tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cat", tensors, dim).to(ATensor)
proc cat*(_: typedesc[torch]; tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cat", tensors, dim).to(ATensor)
proc cat_out*(ty: TensorType; aresult: Tensor, tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cat_out", aresult.tensor, tensors, dim).to(ATensor)
proc cat_out*(_: typedesc[torch]; aresult: Tensor, tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cat_out", aresult.tensor, tensors, dim).to(ATensor)
proc ceil*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ceil").to(ATensor)
proc ceil*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ceil", self.tensor).to(ATensor)
proc ceil*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ceil", self.tensor).to(ATensor)
proc ceil_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ceil_").to(ATensor)
proc ceil_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ceil_", self.tensor).to(ATensor)
proc ceil_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ceil_", self.tensor).to(ATensor)
proc ceil_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ceil_out", aresult.tensor, self.tensor).to(ATensor)
proc ceil_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ceil_out", aresult.tensor, self.tensor).to(ATensor)
proc chunk*(self: Tensor, chunks: int64, dim: int64 = 0): TensorList {.inline, noinit.} = self.tensor.dynamicCppCall("chunk", chunks, dim).to(TensorList)
proc chunk*(ty: TensorType; self: Tensor, chunks: int64, dim: int64 = 0): TensorList {.inline, noinit.} = ty.dynamicCppCall("chunk", self.tensor, chunks, dim).to(TensorList)
proc chunk*(_: typedesc[torch]; self: Tensor, chunks: int64, dim: int64 = 0): TensorList {.inline, noinit.} = dynamicCCall("at::chunk", self.tensor, chunks, dim).to(TensorList)
proc clamp*(self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("clamp", min, max).to(ATensor)
proc clamp*(ty: TensorType; self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp", self.tensor, min, max).to(ATensor)
proc clamp*(_: typedesc[torch]; self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp", self.tensor, min, max).to(ATensor)
proc clamp_u*(self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("clamp_", min, max).to(ATensor)
proc clamp_u*(ty: TensorType; self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_", self.tensor, min, max).to(ATensor)
proc clamp_u*(_: typedesc[torch]; self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_", self.tensor, min, max).to(ATensor)
proc clamp_out*(ty: TensorType; aresult: Tensor, self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_out", aresult.tensor, self.tensor, min, max).to(ATensor)
proc clamp_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, min: float, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_out", aresult.tensor, self.tensor, min, max).to(ATensor)
proc clamp_max*(self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("clamp_max", max).to(ATensor)
proc clamp_max*(ty: TensorType; self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_max", self.tensor, max).to(ATensor)
proc clamp_max*(_: typedesc[torch]; self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_max", self.tensor, max).to(ATensor)
proc clamp_max_u*(self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("clamp_max_", max).to(ATensor)
proc clamp_max_u*(ty: TensorType; self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_max_", self.tensor, max).to(ATensor)
proc clamp_max_u*(_: typedesc[torch]; self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_max_", self.tensor, max).to(ATensor)
proc clamp_max_out*(ty: TensorType; aresult: Tensor, self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_max_out", aresult.tensor, self.tensor, max).to(ATensor)
proc clamp_max_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, max: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_max_out", aresult.tensor, self.tensor, max).to(ATensor)
proc clamp_min*(self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("clamp_min", min).to(ATensor)
proc clamp_min*(ty: TensorType; self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_min", self.tensor, min).to(ATensor)
proc clamp_min*(_: typedesc[torch]; self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_min", self.tensor, min).to(ATensor)
proc clamp_min_u*(self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("clamp_min_", min).to(ATensor)
proc clamp_min_u*(ty: TensorType; self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_min_", self.tensor, min).to(ATensor)
proc clamp_min_u*(_: typedesc[torch]; self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_min_", self.tensor, min).to(ATensor)
proc clamp_min_out*(ty: TensorType; aresult: Tensor, self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clamp_min_out", aresult.tensor, self.tensor, min).to(ATensor)
proc clamp_min_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, min: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clamp_min_out", aresult.tensor, self.tensor, min).to(ATensor)
proc cudnn_is_acceptable*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("cudnn_is_acceptable", self.tensor).to(bool)
proc cudnn_is_acceptable*(_: typedesc[torch]; self: Tensor): bool {.inline, noinit.} = dynamicCCall("at::cudnn_is_acceptable", self.tensor).to(bool)
proc convolution*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups).to(ATensor)
proc convolution*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups).to(ATensor)
proc u_convolution*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled).to(ATensor)
proc u_convolution*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_convolution", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled).to(ATensor)
proc u_convolution_nogroup*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding).to(ATensor)
proc u_convolution_nogroup*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_convolution_nogroup", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, transposed, output_padding).to(ATensor)
proc u_convolution_double_backward*(ty: TensorType; ggI: Tensor, ggW: Tensor, ggb: Tensor, gO: Tensor, weight: Tensor, self: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc u_convolution_double_backward*(_: typedesc[torch]; ggI: Tensor, ggW: Tensor, ggb: Tensor, gO: Tensor, weight: Tensor, self: Tensor, stride: IntList, padding: IntList, dilation: IntList, transposed: bool, output_padding: IntList, groups: int64, benchmark: bool, deterministic: bool, cudnn_enabled: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_convolution_double_backward", ggI.tensor, ggW.tensor, ggb.tensor, gO.tensor, weight.tensor, self.tensor, stride, padding, dilation, transposed, output_padding, groups, benchmark, deterministic, cudnn_enabled, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc conv1d*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("conv1d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor)
proc conv1d*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::conv1d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor)
proc conv2d*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("conv2d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor)
proc conv2d*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::conv2d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor)
proc conv3d*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("conv3d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor)
proc conv3d*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], dilation: IntList = @[1], groups: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::conv3d", input.tensor, weight.tensor, bias.tensor, stride, padding, dilation, groups).to(ATensor)
proc conv_tbc*(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, pad: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor)
proc conv_tbc*(_: typedesc[torch]; self: Tensor, weight: Tensor, bias: Tensor, pad: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::conv_tbc", self.tensor, weight.tensor, bias.tensor, pad).to(ATensor)
proc conv_tbc_backward*(ty: TensorType; self: Tensor, input: Tensor, weight: Tensor, bias: Tensor, pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc conv_tbc_backward*(_: typedesc[torch]; self: Tensor, input: Tensor, weight: Tensor, bias: Tensor, pad: int64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::conv_tbc_backward", self.tensor, input.tensor, weight.tensor, bias.tensor, pad).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc conv_transpose1d*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("conv_transpose1d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor)
proc conv_transpose1d*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::conv_transpose1d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor)
proc conv_transpose2d*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("conv_transpose2d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor)
proc conv_transpose2d*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::conv_transpose2d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor)
proc conv_transpose3d*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("conv_transpose3d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor)
proc conv_transpose3d*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, stride: IntList = @[1], padding: IntList = @[0], output_padding: IntList = @[0], groups: int64 = 1, dilation: IntList = @[1]): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::conv_transpose3d", input.tensor, weight.tensor, bias.tensor, stride, padding, output_padding, groups, dilation).to(ATensor)
proc cos*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cos").to(ATensor)
proc cos*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cos", self.tensor).to(ATensor)
proc cos*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cos", self.tensor).to(ATensor)
proc cos_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cos_").to(ATensor)
proc cos_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cos_", self.tensor).to(ATensor)
proc cos_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cos_", self.tensor).to(ATensor)
proc cos_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cos_out", aresult.tensor, self.tensor).to(ATensor)
proc cos_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cos_out", aresult.tensor, self.tensor).to(ATensor)
proc cosh*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cosh").to(ATensor)
proc cosh*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cosh", self.tensor).to(ATensor)
proc cosh*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cosh", self.tensor).to(ATensor)
proc cosh_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cosh_").to(ATensor)
proc cosh_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cosh_", self.tensor).to(ATensor)
proc cosh_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cosh_", self.tensor).to(ATensor)
proc cosh_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cosh_out", aresult.tensor, self.tensor).to(ATensor)
proc cosh_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cosh_out", aresult.tensor, self.tensor).to(ATensor)
proc cosine_embedding_loss*(ty: TensorType; input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor)
proc cosine_embedding_loss*(_: typedesc[torch]; input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cosine_embedding_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor)
proc cudnn_affine_grid_generator*(ty: TensorType; theta: Tensor, N: int64, C: int64, H: int64, W: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor)
proc cudnn_affine_grid_generator*(_: typedesc[torch]; theta: Tensor, N: int64, C: int64, H: int64, W: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_affine_grid_generator", theta.tensor, N, C, H, W).to(ATensor)
proc cudnn_affine_grid_generator_backward*(ty: TensorType; grad: Tensor, N: int64, C: int64, H: int64, W: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor)
proc cudnn_affine_grid_generator_backward*(_: typedesc[torch]; grad: Tensor, N: int64, C: int64, H: int64, W: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_affine_grid_generator_backward", grad.tensor, N, C, H, W).to(ATensor)
proc cudnn_batch_norm*(ty: TensorType; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_batch_norm*(_: typedesc[torch]; input: Tensor, weight: Tensor, bias: Tensor, running_mean: Tensor, running_var: Tensor, training: bool, exponential_average_factor: float64, epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::cudnn_batch_norm", input.tensor, weight.tensor, bias.tensor, running_mean.tensor, running_var.tensor, training, exponential_average_factor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_batch_norm_backward*(ty: TensorType; input: Tensor, grad_output: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, save_mean: Tensor, save_var: Tensor, epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_batch_norm_backward*(_: typedesc[torch]; input: Tensor, grad_output: Tensor, weight: Tensor, running_mean: Tensor, running_var: Tensor, save_mean: Tensor, save_var: Tensor, epsilon: float64): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::cudnn_batch_norm_backward", input.tensor, grad_output.tensor, weight.tensor, running_mean.tensor, running_var.tensor, save_mean.tensor, save_var.tensor, epsilon).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_convolution*(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution*(_: typedesc[torch]; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_backward_input*(ty: TensorType; self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_backward_input*(_: typedesc[torch]; self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_backward*(ty: TensorType; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_convolution_backward*(_: typedesc[torch]; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::cudnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_convolution_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor)
proc cudnn_convolution_backward_bias*(_: typedesc[torch]; grad_output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution_backward_bias", grad_output.tensor).to(ATensor)
proc cudnn_convolution_backward_weight*(ty: TensorType; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_backward_weight*(_: typedesc[torch]; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_transpose*(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_transpose*(_: typedesc[torch]; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution_transpose", self.tensor, weight.tensor, bias.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_transpose_backward*(ty: TensorType; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_convolution_transpose_backward*(_: typedesc[torch]; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, output_padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::cudnn_convolution_transpose_backward", self.tensor, grad_output.tensor, weight.tensor, padding, output_padding, stride, dilation, groups, benchmark, deterministic, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc cudnn_convolution_transpose_backward_bias*(ty: TensorType; grad_output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor)
proc cudnn_convolution_transpose_backward_bias*(_: typedesc[torch]; grad_output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution_transpose_backward_bias", grad_output.tensor).to(ATensor)
proc cudnn_convolution_transpose_backward_input*(ty: TensorType; grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_transpose_backward_input*(_: typedesc[torch]; grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution_transpose_backward_input", grad_output.tensor, weight.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_transpose_backward_weight*(ty: TensorType; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_convolution_transpose_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_convolution_transpose_backward_weight*(_: typedesc[torch]; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, benchmark: bool, deterministic: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_convolution_transpose_backward_weight", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, benchmark, deterministic).to(ATensor)
proc cudnn_grid_sampler*(ty: TensorType; self: Tensor, grid: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor)
proc cudnn_grid_sampler*(_: typedesc[torch]; self: Tensor, grid: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cudnn_grid_sampler", self.tensor, grid.tensor).to(ATensor)
proc cudnn_grid_sampler_backward*(ty: TensorType; self: Tensor, grid: Tensor, grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.grid = newTensor tupleRes[1]
proc cudnn_grid_sampler_backward*(_: typedesc[torch]; self: Tensor, grid: Tensor, grad_output: Tensor): tuple[self: Tensor, grid: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::cudnn_grid_sampler_backward", self.tensor, grid.tensor, grad_output.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.self = newTensor tupleRes[0]
  result.grid = newTensor tupleRes[1]
proc cumsum*(self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cumsum", dim, dtype).to(ATensor)
proc cumsum*(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumsum", self.tensor, dim, dtype).to(ATensor)
proc cumsum*(_: typedesc[torch]; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumsum", self.tensor, dim, dtype).to(ATensor)
proc cumsum*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cumsum", dim).to(ATensor)
proc cumsum*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumsum", self.tensor, dim).to(ATensor)
proc cumsum*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumsum", self.tensor, dim).to(ATensor)
proc cumsum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumsum_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc cumsum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumsum_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc cumsum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumsum_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc cumsum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumsum_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc cumprod*(self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cumprod", dim, dtype).to(ATensor)
proc cumprod*(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumprod", self.tensor, dim, dtype).to(ATensor)
proc cumprod*(_: typedesc[torch]; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumprod", self.tensor, dim, dtype).to(ATensor)
proc cumprod*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("cumprod", dim).to(ATensor)
proc cumprod*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumprod", self.tensor, dim).to(ATensor)
proc cumprod*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumprod", self.tensor, dim).to(ATensor)
proc cumprod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumprod_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc cumprod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumprod_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc cumprod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("cumprod_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc cumprod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::cumprod_out", aresult.tensor, self.tensor, dim).to(ATensor)
proc ctc_loss*(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, reduction).to(ATensor)
proc ctc_loss*(_: typedesc[torch]; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank, reduction).to(ATensor)
proc ctc_loss*(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: Tensor, target_lengths: Tensor, blank: int64 = 0, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor)
proc ctc_loss*(_: typedesc[torch]; log_probs: Tensor, targets: Tensor, input_lengths: Tensor, target_lengths: Tensor, blank: int64 = 0, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ctc_loss", log_probs.tensor, targets.tensor, input_lengths.tensor, target_lengths.tensor, blank, reduction).to(ATensor)
proc u_ctc_loss*(ty: TensorType; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_ctc_loss*(_: typedesc[torch]; log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, blank: int64 = 0): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_ctc_loss", log_probs.tensor, targets.tensor, input_lengths, target_lengths, blank).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_ctc_loss_backward*(ty: TensorType; grad: Tensor, log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, neg_log_likelihood: Tensor, log_alpha: Tensor, blank: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths, target_lengths, neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor)
proc u_ctc_loss_backward*(_: typedesc[torch]; grad: Tensor, log_probs: Tensor, targets: Tensor, input_lengths: IntList, target_lengths: IntList, neg_log_likelihood: Tensor, log_alpha: Tensor, blank: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_ctc_loss_backward", grad.tensor, log_probs.tensor, targets.tensor, input_lengths, target_lengths, neg_log_likelihood.tensor, log_alpha.tensor, blank).to(ATensor)
proc det*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("det").to(ATensor)
proc det*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("det", self.tensor).to(ATensor)
proc det*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::det", self.tensor).to(ATensor)
proc diagflat*(self: Tensor, offset: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("diagflat", offset).to(ATensor)
proc diagflat*(ty: TensorType; self: Tensor, offset: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("diagflat", self.tensor, offset).to(ATensor)
proc diagflat*(_: typedesc[torch]; self: Tensor, offset: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::diagflat", self.tensor, offset).to(ATensor)
proc diagonal*(self: Tensor, offset: int64 = 0, dim1: int64 = 0, dim2: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("diagonal", offset, dim1, dim2).to(ATensor)
proc diagonal*(ty: TensorType; self: Tensor, offset: int64 = 0, dim1: int64 = 0, dim2: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("diagonal", self.tensor, offset, dim1, dim2).to(ATensor)
proc diagonal*(_: typedesc[torch]; self: Tensor, offset: int64 = 0, dim1: int64 = 0, dim2: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::diagonal", self.tensor, offset, dim1, dim2).to(ATensor)
proc adiv*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("div", other.tensor).to(ATensor)
proc adiv*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("div", self.tensor, other.tensor).to(ATensor)
proc adiv*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::div", self.tensor, other.tensor).to(ATensor)
proc div_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("div_", other.tensor).to(ATensor)
proc div_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("div_", self.tensor, other.tensor).to(ATensor)
proc div_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("div_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc div_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::div_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc adiv*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("div", other).to(ATensor)
proc adiv*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("div", self.tensor, other).to(ATensor)
proc adiv*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::div", self.tensor, other).to(ATensor)
proc div_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("div_", other).to(ATensor)
proc div_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("div_", self.tensor, other).to(ATensor)
proc dot*(self: Tensor, tensor: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("dot", tensor.tensor).to(ATensor)
proc dot*(ty: TensorType; self: Tensor, tensor: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("dot", self.tensor, tensor.tensor).to(ATensor)
proc dot*(_: typedesc[torch]; self: Tensor, tensor: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::dot", self.tensor, tensor.tensor).to(ATensor)
proc dot_out*(ty: TensorType; aresult: Tensor, self: Tensor, tensor: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("dot_out", aresult.tensor, self.tensor, tensor.tensor).to(ATensor)
proc dot_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, tensor: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::dot_out", aresult.tensor, self.tensor, tensor.tensor).to(ATensor)
proc einsum*(ty: TensorType; equation: StdString, tensors: TensorList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("einsum", equation, tensors).to(ATensor)
proc einsum*(_: typedesc[torch]; equation: StdString, tensors: TensorList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::einsum", equation, tensors).to(ATensor)
proc embedding*(ty: TensorType; weight: Tensor, indices: Tensor, padding_idx: int64 = -1, scale_grad_by_freq: bool = false, sparse: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor)
proc embedding*(_: typedesc[torch]; weight: Tensor, indices: Tensor, padding_idx: int64 = -1, scale_grad_by_freq: bool = false, sparse: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::embedding", weight.tensor, indices.tensor, padding_idx, scale_grad_by_freq, sparse).to(ATensor)
proc embedding_backward*(ty: TensorType; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool, sparse: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor)
proc embedding_backward*(_: typedesc[torch]; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool, sparse: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::embedding_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq, sparse).to(ATensor)
proc embedding_dense_backward*(ty: TensorType; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor)
proc embedding_dense_backward*(_: typedesc[torch]; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::embedding_dense_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor)
proc embedding_renorm_u*(ty: TensorType; self: Tensor, indices: Tensor, max_norm: float64, norm_type: float64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(ATensor)
proc embedding_renorm_u*(_: typedesc[torch]; self: Tensor, indices: Tensor, max_norm: float64, norm_type: float64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::embedding_renorm_", self.tensor, indices.tensor, max_norm, norm_type).to(ATensor)
proc embedding_sparse_backward*(ty: TensorType; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor)
proc embedding_sparse_backward*(_: typedesc[torch]; grad: Tensor, indices: Tensor, num_weights: int64, padding_idx: int64, scale_grad_by_freq: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::embedding_sparse_backward", grad.tensor, indices.tensor, num_weights, padding_idx, scale_grad_by_freq).to(ATensor)
proc embedding_bag*(ty: TensorType; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
proc embedding_bag*(_: typedesc[torch]; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
proc u_embedding_bag*(ty: TensorType; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
proc u_embedding_bag*(_: typedesc[torch]; weight: Tensor, indices: Tensor, offsets: Tensor, scale_grad_by_freq: bool = false, mode: int64 = 0, sparse: bool = false): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_embedding_bag", weight.tensor, indices.tensor, offsets.tensor, scale_grad_by_freq, mode, sparse).to(StdTuple4[ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
proc u_embedding_bag_backward*(ty: TensorType; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64, sparse: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor)
proc u_embedding_bag_backward*(_: typedesc[torch]; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64, sparse: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_embedding_bag_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode, sparse).to(ATensor)
proc u_embedding_bag_sparse_backward*(ty: TensorType; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor)
proc u_embedding_bag_sparse_backward*(_: typedesc[torch]; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_embedding_bag_sparse_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor)
proc u_embedding_bag_dense_backward*(ty: TensorType; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor)
proc u_embedding_bag_dense_backward*(_: typedesc[torch]; grad: Tensor, indices: Tensor, offsets: Tensor, offset2bag: Tensor, bag_size: Tensor, maximum_indices: Tensor, num_weights: int64, scale_grad_by_freq: bool, mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_embedding_bag_dense_backward", grad.tensor, indices.tensor, offsets.tensor, offset2bag.tensor, bag_size.tensor, maximum_indices.tensor, num_weights, scale_grad_by_freq, mode).to(ATensor)
proc empty*(ty: TensorType; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("empty", size, options).to(ATensor)
proc empty*(_: typedesc[torch]; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::empty", size, options).to(ATensor)
proc empty_out*(ty: TensorType; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("empty_out", aresult.tensor, size).to(ATensor)
proc empty_out*(_: typedesc[torch]; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::empty_out", aresult.tensor, size).to(ATensor)
proc empty_like*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("empty_like", self.tensor).to(ATensor)
proc empty_like*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::empty_like", self.tensor).to(ATensor)
proc empty_like*(ty: TensorType; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("empty_like", self.tensor, options).to(ATensor)
proc empty_like*(_: typedesc[torch]; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::empty_like", self.tensor, options).to(ATensor)
proc empty*(ty: TensorType; dtype: TensorType, size: IntList): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("empty", dtype, size).to(ATensor)
proc empty*(_: typedesc[torch]; dtype: TensorType, size: IntList): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::empty", dtype, size).to(ATensor)
proc erf*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("erf").to(ATensor)
proc erf*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erf", self.tensor).to(ATensor)
proc erf*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erf", self.tensor).to(ATensor)
proc erf_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("erf_").to(ATensor)
proc erf_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erf_", self.tensor).to(ATensor)
proc erf_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erf_", self.tensor).to(ATensor)
proc erf_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erf_out", aresult.tensor, self.tensor).to(ATensor)
proc erf_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erf_out", aresult.tensor, self.tensor).to(ATensor)
proc erfc*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("erfc").to(ATensor)
proc erfc*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erfc", self.tensor).to(ATensor)
proc erfc*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erfc", self.tensor).to(ATensor)
proc erfc_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("erfc_").to(ATensor)
proc erfc_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erfc_", self.tensor).to(ATensor)
proc erfc_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erfc_", self.tensor).to(ATensor)
proc erfc_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("erfc_out", aresult.tensor, self.tensor).to(ATensor)
proc erfc_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::erfc_out", aresult.tensor, self.tensor).to(ATensor)
proc exp*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("exp").to(ATensor)
proc exp*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("exp", self.tensor).to(ATensor)
proc exp*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::exp", self.tensor).to(ATensor)
proc exp_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("exp_").to(ATensor)
proc exp_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("exp_", self.tensor).to(ATensor)
proc exp_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::exp_", self.tensor).to(ATensor)
proc exp_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("exp_out", aresult.tensor, self.tensor).to(ATensor)
proc exp_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::exp_out", aresult.tensor, self.tensor).to(ATensor)
proc expm1*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("expm1").to(ATensor)
proc expm1*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("expm1", self.tensor).to(ATensor)
proc expm1*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::expm1", self.tensor).to(ATensor)
proc expm1_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("expm1_").to(ATensor)
proc expm1_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("expm1_", self.tensor).to(ATensor)
proc expm1_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::expm1_", self.tensor).to(ATensor)
proc expm1_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("expm1_out", aresult.tensor, self.tensor).to(ATensor)
proc expm1_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::expm1_out", aresult.tensor, self.tensor).to(ATensor)
proc expand*(self: Tensor, size: IntList, implicit: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("expand", size, implicit).to(ATensor)
proc expand*(ty: TensorType; self: Tensor, size: IntList, implicit: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("expand", self.tensor, size, implicit).to(ATensor)
proc expand_as*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("expand_as", other.tensor).to(ATensor)
proc expand_as*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("expand_as", self.tensor, other.tensor).to(ATensor)
proc eye*(ty: TensorType; n: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eye", n, options).to(ATensor)
proc eye*(_: typedesc[torch]; n: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eye", n, options).to(ATensor)
proc eye*(ty: TensorType; n: int64, m: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eye", n, m, options).to(ATensor)
proc eye*(_: typedesc[torch]; n: int64, m: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eye", n, m, options).to(ATensor)
proc eye_out*(ty: TensorType; aresult: Tensor, n: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eye_out", aresult.tensor, n).to(ATensor)
proc eye_out*(_: typedesc[torch]; aresult: Tensor, n: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eye_out", aresult.tensor, n).to(ATensor)
proc eye_out*(ty: TensorType; aresult: Tensor, n: int64, m: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eye_out", aresult.tensor, n, m).to(ATensor)
proc eye_out*(_: typedesc[torch]; aresult: Tensor, n: int64, m: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::eye_out", aresult.tensor, n, m).to(ATensor)
proc eye*(ty: TensorType; dtype: TensorType, n: int64, m: int64 = -1): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("eye", dtype, n, m).to(ATensor)
proc eye*(_: typedesc[torch]; dtype: TensorType, n: int64, m: int64 = -1): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::eye", dtype, n, m).to(ATensor)
proc flatten*(self: Tensor, start_dim: int64 = 0, end_dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("flatten", start_dim, end_dim).to(ATensor)
proc flatten*(ty: TensorType; self: Tensor, start_dim: int64 = 0, end_dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("flatten", self.tensor, start_dim, end_dim).to(ATensor)
proc flatten*(_: typedesc[torch]; self: Tensor, start_dim: int64 = 0, end_dim: int64 = -1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::flatten", self.tensor, start_dim, end_dim).to(ATensor)
proc fill_u*(self: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("fill_", value).to(ATensor)
proc fill_u*(ty: TensorType; self: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fill_", self.tensor, value).to(ATensor)
proc fill_u*(_: typedesc[torch]; self: Tensor, value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fill_", self.tensor, value).to(ATensor)
proc fill_u*(self: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("fill_", value.tensor).to(ATensor)
proc fill_u*(ty: TensorType; self: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fill_", self.tensor, value.tensor).to(ATensor)
proc fill_u*(_: typedesc[torch]; self: Tensor, value: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fill_", self.tensor, value.tensor).to(ATensor)
proc floor*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("floor").to(ATensor)
proc floor*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("floor", self.tensor).to(ATensor)
proc floor*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::floor", self.tensor).to(ATensor)
proc floor_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("floor_").to(ATensor)
proc floor_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("floor_", self.tensor).to(ATensor)
proc floor_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::floor_", self.tensor).to(ATensor)
proc floor_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("floor_out", aresult.tensor, self.tensor).to(ATensor)
proc floor_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::floor_out", aresult.tensor, self.tensor).to(ATensor)
proc full*(ty: TensorType; size: IntList, fill_value: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("full", size, fill_value, options).to(ATensor)
proc full*(_: typedesc[torch]; size: IntList, fill_value: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::full", size, fill_value, options).to(ATensor)
proc full_out*(ty: TensorType; aresult: Tensor, size: IntList, fill_value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("full_out", aresult.tensor, size, fill_value).to(ATensor)
proc full_out*(_: typedesc[torch]; aresult: Tensor, size: IntList, fill_value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::full_out", aresult.tensor, size, fill_value).to(ATensor)
proc full_like*(ty: TensorType; self: Tensor, fill_value: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("full_like", self.tensor, fill_value).to(ATensor)
proc full_like*(_: typedesc[torch]; self: Tensor, fill_value: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::full_like", self.tensor, fill_value).to(ATensor)
proc full_like*(ty: TensorType; self: Tensor, fill_value: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("full_like", self.tensor, fill_value, options).to(ATensor)
proc full_like*(_: typedesc[torch]; self: Tensor, fill_value: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::full_like", self.tensor, fill_value, options).to(ATensor)
proc full*(ty: TensorType; dtype: TensorType, size: IntList, fill_value: float): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("full", dtype, size, fill_value).to(ATensor)
proc full*(_: typedesc[torch]; dtype: TensorType, size: IntList, fill_value: float): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::full", dtype, size, fill_value).to(ATensor)
proc grid_sampler*(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor)
proc grid_sampler*(_: typedesc[torch]; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::grid_sampler", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor)
proc grid_sampler_2d*(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor)
proc grid_sampler_2d*(_: typedesc[torch]; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::grid_sampler_2d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor)
proc grid_sampler_2d_backward*(ty: TensorType; grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc grid_sampler_2d_backward*(_: typedesc[torch]; grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::grid_sampler_2d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc grid_sampler_3d*(ty: TensorType; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor)
proc grid_sampler_3d*(_: typedesc[torch]; input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::grid_sampler_3d", input.tensor, grid.tensor, interpolation_mode, padding_mode).to(ATensor)
proc grid_sampler_3d_backward*(ty: TensorType; grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc grid_sampler_3d_backward*(_: typedesc[torch]; grad_output: Tensor, input: Tensor, grid: Tensor, interpolation_mode: int64, padding_mode: int64): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::grid_sampler_3d_backward", grad_output.tensor, input.tensor, grid.tensor, interpolation_mode, padding_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc hann_window*(ty: TensorType; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hann_window", window_length, options).to(ATensor)
proc hann_window*(_: typedesc[torch]; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hann_window", window_length, options).to(ATensor)
proc hann_window*(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hann_window", window_length, periodic, options).to(ATensor)
proc hann_window*(_: typedesc[torch]; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hann_window", window_length, periodic, options).to(ATensor)
proc hamming_window*(ty: TensorType; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hamming_window", window_length, options).to(ATensor)
proc hamming_window*(_: typedesc[torch]; window_length: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hamming_window", window_length, options).to(ATensor)
proc hamming_window*(ty: TensorType; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hamming_window", window_length, periodic, options).to(ATensor)
proc hamming_window*(_: typedesc[torch]; window_length: int64, periodic: bool, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hamming_window", window_length, periodic, options).to(ATensor)
proc hamming_window*(ty: TensorType; window_length: int64, periodic: bool, alpha: float64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hamming_window", window_length, periodic, alpha, options).to(ATensor)
proc hamming_window*(_: typedesc[torch]; window_length: int64, periodic: bool, alpha: float64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hamming_window", window_length, periodic, alpha, options).to(ATensor)
proc hamming_window*(ty: TensorType; window_length: int64, periodic: bool, alpha: float64, beta: float64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hamming_window", window_length, periodic, alpha, beta, options).to(ATensor)
proc hamming_window*(_: typedesc[torch]; window_length: int64, periodic: bool, alpha: float64, beta: float64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hamming_window", window_length, periodic, alpha, beta, options).to(ATensor)
proc hinge_embedding_loss*(ty: TensorType; self: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor)
proc hinge_embedding_loss*(_: typedesc[torch]; self: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hinge_embedding_loss", self.tensor, target.tensor, margin, reduction).to(ATensor)
proc ger*(self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ger", vec2.tensor).to(ATensor)
proc ger*(ty: TensorType; self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ger", self.tensor, vec2.tensor).to(ATensor)
proc ger*(_: typedesc[torch]; self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ger", self.tensor, vec2.tensor).to(ATensor)
proc ger_out*(ty: TensorType; aresult: Tensor, self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ger_out", aresult.tensor, self.tensor, vec2.tensor).to(ATensor)
proc ger_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, vec2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ger_out", aresult.tensor, self.tensor, vec2.tensor).to(ATensor)
proc gesv*(self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("gesv", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc gesv*(ty: TensorType; self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("gesv", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc gesv*(_: typedesc[torch]; self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::gesv", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc gesv_out*(ty: TensorType; solution: Tensor, lu: Tensor, self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("gesv_out", solution.tensor, lu.tensor, self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.solution = newTensor tupleRes[0]
  result.lu = newTensor tupleRes[1]
proc gesv_out*(_: typedesc[torch]; solution: Tensor, lu: Tensor, self: Tensor, A: Tensor): tuple[solution: Tensor, lu: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::gesv_out", solution.tensor, lu.tensor, self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.solution = newTensor tupleRes[0]
  result.lu = newTensor tupleRes[1]
proc u_gesv_helper*(self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_gesv_helper", A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_gesv_helper*(ty: TensorType; self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_gesv_helper", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_gesv_helper*(_: typedesc[torch]; self: Tensor, A: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_gesv_helper", self.tensor, A.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc group_norm*(ty: TensorType; input: Tensor, num_groups: int64, weight: Tensor, bias: Tensor, eps: float64, cudnn_enabled: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor)
proc group_norm*(_: typedesc[torch]; input: Tensor, num_groups: int64, weight: Tensor, bias: Tensor, eps: float64, cudnn_enabled: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::group_norm", input.tensor, num_groups, weight.tensor, bias.tensor, eps, cudnn_enabled).to(ATensor)
proc fft*(self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("fft", signal_ndim, normalized).to(ATensor)
proc fft*(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("fft", self.tensor, signal_ndim, normalized).to(ATensor)
proc fft*(_: typedesc[torch]; self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::fft", self.tensor, signal_ndim, normalized).to(ATensor)
proc ifft*(self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("ifft", signal_ndim, normalized).to(ATensor)
proc ifft*(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ifft", self.tensor, signal_ndim, normalized).to(ATensor)
proc ifft*(_: typedesc[torch]; self: Tensor, signal_ndim: int64, normalized: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ifft", self.tensor, signal_ndim, normalized).to(ATensor)
proc rfft*(self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("rfft", signal_ndim, normalized, onesided).to(ATensor)
proc rfft*(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rfft", self.tensor, signal_ndim, normalized, onesided).to(ATensor)
proc rfft*(_: typedesc[torch]; self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rfft", self.tensor, signal_ndim, normalized, onesided).to(ATensor)
proc irfft*(self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true, signal_sizes: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("irfft", signal_ndim, normalized, onesided, signal_sizes).to(ATensor)
proc irfft*(ty: TensorType; self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true, signal_sizes: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("irfft", self.tensor, signal_ndim, normalized, onesided, signal_sizes).to(ATensor)
proc irfft*(_: typedesc[torch]; self: Tensor, signal_ndim: int64, normalized: bool = false, onesided: bool = true, signal_sizes: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::irfft", self.tensor, signal_ndim, normalized, onesided, signal_sizes).to(ATensor)
proc u_fft_with_size*(self: Tensor, signal_ndim: int64, complex_input: bool, complex_output: bool, inverse: bool, checked_signal_sizes: IntList, normalized: bool, onesided: bool, output_sizes: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_fft_with_size", signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes, normalized, onesided, output_sizes).to(ATensor)
proc u_fft_with_size*(ty: TensorType; self: Tensor, signal_ndim: int64, complex_input: bool, complex_output: bool, inverse: bool, checked_signal_sizes: IntList, normalized: bool, onesided: bool, output_sizes: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_fft_with_size", self.tensor, signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes, normalized, onesided, output_sizes).to(ATensor)
proc u_fft_with_size*(_: typedesc[torch]; self: Tensor, signal_ndim: int64, complex_input: bool, complex_output: bool, inverse: bool, checked_signal_sizes: IntList, normalized: bool, onesided: bool, output_sizes: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_fft_with_size", self.tensor, signal_ndim, complex_input, complex_output, inverse, checked_signal_sizes, normalized, onesided, output_sizes).to(ATensor)
proc u_cufft_get_plan_cache_size*(ty: TensorType; ): int64 {.inline, noinit.} = ty.dynamicCppCall("_cufft_get_plan_cache_size").to(int64)
proc u_cufft_get_plan_cache_size*(_: typedesc[torch]; ): int64 {.inline, noinit.} = dynamicCCall("at::_cufft_get_plan_cache_size").to(int64)
proc u_cufft_get_plan_cache_max_size*(ty: TensorType; ): int64 {.inline, noinit.} = ty.dynamicCppCall("_cufft_get_plan_cache_max_size").to(int64)
proc u_cufft_get_plan_cache_max_size*(_: typedesc[torch]; ): int64 {.inline, noinit.} = dynamicCCall("at::_cufft_get_plan_cache_max_size").to(int64)
proc u_cufft_set_plan_cache_max_size*(ty: TensorType; max_size: int64): void {.inline, noinit.} = ty.dynamicCppCall("_cufft_set_plan_cache_max_size", max_size).to(void)
proc u_cufft_set_plan_cache_max_size*(_: typedesc[torch]; max_size: int64): void {.inline, noinit.} = dynamicCCall("at::_cufft_set_plan_cache_max_size", max_size).to(void)
proc u_cufft_clear_plan_cache*(ty: TensorType; ): void {.inline, noinit.} = ty.dynamicCppCall("_cufft_clear_plan_cache").to(void)
proc u_cufft_clear_plan_cache*(_: typedesc[torch]; ): void {.inline, noinit.} = dynamicCCall("at::_cufft_clear_plan_cache").to(void)
proc index*(self: Tensor, indices: TensorList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index", indices).to(ATensor)
proc index*(ty: TensorType; self: Tensor, indices: TensorList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index", self.tensor, indices).to(ATensor)
proc index*(_: typedesc[torch]; self: Tensor, indices: TensorList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::index", self.tensor, indices).to(ATensor)
proc index_copy_u*(self: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index_copy_", dim, index.tensor, source.tensor).to(ATensor)
proc index_copy_u*(ty: TensorType; self: Tensor, dim: int64, index: Tensor, source: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_copy_", self.tensor, dim, index.tensor, source.tensor).to(ATensor)
proc index_put*(self: Tensor, indices: TensorList, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index_put", indices, values.tensor).to(ATensor)
proc index_put*(ty: TensorType; self: Tensor, indices: TensorList, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_put", self.tensor, indices, values.tensor).to(ATensor)
proc index_put*(_: typedesc[torch]; self: Tensor, indices: TensorList, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::index_put", self.tensor, indices, values.tensor).to(ATensor)
proc index_put_u*(self: Tensor, indices: TensorList, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("index_put_", indices, values.tensor).to(ATensor)
proc index_put_u*(ty: TensorType; self: Tensor, indices: TensorList, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("index_put_", self.tensor, indices, values.tensor).to(ATensor)
proc index_put_u*(_: typedesc[torch]; self: Tensor, indices: TensorList, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::index_put_", self.tensor, indices, values.tensor).to(ATensor)
proc inverse*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("inverse").to(ATensor)
proc inverse*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("inverse", self.tensor).to(ATensor)
proc inverse*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::inverse", self.tensor).to(ATensor)
proc inverse_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("inverse_out", aresult.tensor, self.tensor).to(ATensor)
proc inverse_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::inverse_out", aresult.tensor, self.tensor).to(ATensor)
proc isclose*(self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("isclose", other.tensor, rtol, atol, equal_nan).to(ATensor)
proc isclose*(ty: TensorType; self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("isclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(ATensor)
proc isclose*(_: typedesc[torch]; self: Tensor, other: Tensor, rtol: float64, atol: float64, equal_nan: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::isclose", self.tensor, other.tensor, rtol, atol, equal_nan).to(ATensor)
proc is_cuda*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_cuda").to(bool)
proc is_cuda*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_cuda", self.tensor).to(bool)
proc is_cuda*(_: typedesc[torch]; self: Tensor): bool {.inline, noinit.} = dynamicCCall("at::is_cuda", self.tensor).to(bool)
proc is_distributed*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_distributed").to(bool)
proc is_distributed*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_distributed", self.tensor).to(bool)
proc is_distributed*(_: typedesc[torch]; self: Tensor): bool {.inline, noinit.} = dynamicCCall("at::is_distributed", self.tensor).to(bool)
proc is_floating_point*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_floating_point").to(bool)
proc is_floating_point*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_floating_point", self.tensor).to(bool)
proc is_floating_point*(_: typedesc[torch]; self: Tensor): bool {.inline, noinit.} = dynamicCCall("at::is_floating_point", self.tensor).to(bool)
proc is_nonzero*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_nonzero").to(bool)
proc is_nonzero*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_nonzero", self.tensor).to(bool)
proc is_nonzero*(_: typedesc[torch]; self: Tensor): bool {.inline, noinit.} = dynamicCCall("at::is_nonzero", self.tensor).to(bool)
proc is_same_size*(self: Tensor, other: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_same_size", other.tensor).to(bool)
proc is_same_size*(ty: TensorType; self: Tensor, other: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_same_size", self.tensor, other.tensor).to(bool)
proc is_same_size*(_: typedesc[torch]; self: Tensor, other: Tensor): bool {.inline, noinit.} = dynamicCCall("at::is_same_size", self.tensor, other.tensor).to(bool)
proc is_signed*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_signed").to(bool)
proc is_signed*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_signed", self.tensor).to(bool)
proc is_signed*(_: typedesc[torch]; self: Tensor): bool {.inline, noinit.} = dynamicCCall("at::is_signed", self.tensor).to(bool)
proc is_sparse*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_sparse").to(bool)
proc is_sparse*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_sparse", self.tensor).to(bool)
proc is_sparse*(_: typedesc[torch]; self: Tensor): bool {.inline, noinit.} = dynamicCCall("at::is_sparse", self.tensor).to(bool)
proc kthvalue*(self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("kthvalue", k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc kthvalue*(ty: TensorType; self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc kthvalue*(_: typedesc[torch]; self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::kthvalue", self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc kthvalue_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("kthvalue_out", values.tensor, indices.tensor, self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc kthvalue_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, k: int64, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::kthvalue_out", values.tensor, indices.tensor, self.tensor, k, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc layer_norm*(ty: TensorType; input: Tensor, normalized_shape: IntList, weight: Tensor, bias: Tensor, eps: float64, cudnn_enable: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("layer_norm", input.tensor, normalized_shape, weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor)
proc layer_norm*(_: typedesc[torch]; input: Tensor, normalized_shape: IntList, weight: Tensor, bias: Tensor, eps: float64, cudnn_enable: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::layer_norm", input.tensor, normalized_shape, weight.tensor, bias.tensor, eps, cudnn_enable).to(ATensor)
proc linspace*(ty: TensorType; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("linspace", start, aend, options).to(ATensor)
proc linspace*(_: typedesc[torch]; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::linspace", start, aend, options).to(ATensor)
proc linspace*(ty: TensorType; start: float, aend: float, steps: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("linspace", start, aend, steps, options).to(ATensor)
proc linspace*(_: typedesc[torch]; start: float, aend: float, steps: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::linspace", start, aend, steps, options).to(ATensor)
proc linspace_out*(ty: TensorType; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("linspace_out", aresult.tensor, start, aend).to(ATensor)
proc linspace_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::linspace_out", aresult.tensor, start, aend).to(ATensor)
proc linspace_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, steps: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("linspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc linspace_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, steps: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::linspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc linspace*(ty: TensorType; dtype: TensorType, start: float, aend: float, steps: int64 = 100): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("linspace", dtype, start, aend, steps).to(ATensor)
proc linspace*(_: typedesc[torch]; dtype: TensorType, start: float, aend: float, steps: int64 = 100): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::linspace", dtype, start, aend, steps).to(ATensor)
proc log*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log").to(ATensor)
proc log*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log", self.tensor).to(ATensor)
proc log*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log", self.tensor).to(ATensor)
proc log_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log_").to(ATensor)
proc log_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_", self.tensor).to(ATensor)
proc log_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_", self.tensor).to(ATensor)
proc log_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_out", aresult.tensor, self.tensor).to(ATensor)
proc log_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_out", aresult.tensor, self.tensor).to(ATensor)
proc log10*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log10").to(ATensor)
proc log10*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log10", self.tensor).to(ATensor)
proc log10*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log10", self.tensor).to(ATensor)
proc log10_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log10_").to(ATensor)
proc log10_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log10_", self.tensor).to(ATensor)
proc log10_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log10_", self.tensor).to(ATensor)
proc log10_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log10_out", aresult.tensor, self.tensor).to(ATensor)
proc log10_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log10_out", aresult.tensor, self.tensor).to(ATensor)
proc log1p*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log1p").to(ATensor)
proc log1p*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log1p", self.tensor).to(ATensor)
proc log1p*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log1p", self.tensor).to(ATensor)
proc log1p_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log1p_").to(ATensor)
proc log1p_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log1p_", self.tensor).to(ATensor)
proc log1p_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log1p_", self.tensor).to(ATensor)
proc log1p_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log1p_out", aresult.tensor, self.tensor).to(ATensor)
proc log1p_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log1p_out", aresult.tensor, self.tensor).to(ATensor)
proc log2*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log2").to(ATensor)
proc log2*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log2", self.tensor).to(ATensor)
proc log2*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log2", self.tensor).to(ATensor)
proc log2_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log2_").to(ATensor)
proc log2_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log2_", self.tensor).to(ATensor)
proc log2_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log2_", self.tensor).to(ATensor)
proc log2_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log2_out", aresult.tensor, self.tensor).to(ATensor)
proc log2_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log2_out", aresult.tensor, self.tensor).to(ATensor)
proc logdet*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("logdet").to(ATensor)
proc logdet*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logdet", self.tensor).to(ATensor)
proc logdet*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::logdet", self.tensor).to(ATensor)
proc logspace*(ty: TensorType; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logspace", start, aend, options).to(ATensor)
proc logspace*(_: typedesc[torch]; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::logspace", start, aend, options).to(ATensor)
proc logspace*(ty: TensorType; start: float, aend: float, steps: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logspace", start, aend, steps, options).to(ATensor)
proc logspace*(_: typedesc[torch]; start: float, aend: float, steps: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::logspace", start, aend, steps, options).to(ATensor)
proc logspace_out*(ty: TensorType; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logspace_out", aresult.tensor, start, aend).to(ATensor)
proc logspace_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::logspace_out", aresult.tensor, start, aend).to(ATensor)
proc logspace_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, steps: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc logspace_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, steps: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::logspace_out", aresult.tensor, start, aend, steps).to(ATensor)
proc logspace*(ty: TensorType; dtype: TensorType, start: float, aend: float, steps: int64 = 100): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logspace", dtype, start, aend, steps).to(ATensor)
proc logspace*(_: typedesc[torch]; dtype: TensorType, start: float, aend: float, steps: int64 = 100): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::logspace", dtype, start, aend, steps).to(ATensor)
proc log_softmax*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("log_softmax", dim).to(ATensor)
proc log_softmax*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_softmax", self.tensor, dim).to(ATensor)
proc log_softmax*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_softmax", self.tensor, dim).to(ATensor)
proc log_softmax_backward_data*(ty: TensorType; grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor)
proc log_softmax_backward_data*(_: typedesc[torch]; grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::log_softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor)
proc logsumexp*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("logsumexp", dim, keepdim).to(ATensor)
proc logsumexp*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logsumexp", self.tensor, dim, keepdim).to(ATensor)
proc logsumexp*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::logsumexp", self.tensor, dim, keepdim).to(ATensor)
proc logsumexp_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("logsumexp_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc logsumexp_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::logsumexp_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc margin_ranking_loss*(ty: TensorType; input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor)
proc margin_ranking_loss*(_: typedesc[torch]; input1: Tensor, input2: Tensor, target: Tensor, margin: float64, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::margin_ranking_loss", input1.tensor, input2.tensor, target.tensor, margin, reduction).to(ATensor)
proc matmul*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("matmul", other.tensor).to(ATensor)
proc matmul*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("matmul", self.tensor, other.tensor).to(ATensor)
proc matmul*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::matmul", self.tensor, other.tensor).to(ATensor)
proc matmul_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("matmul_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc matmul_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::matmul_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc matrix_rank*(ty: TensorType; self: Tensor, tol: float64, symmetric: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("matrix_rank", self.tensor, tol, symmetric).to(ATensor)
proc matrix_rank*(_: typedesc[torch]; self: Tensor, tol: float64, symmetric: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::matrix_rank", self.tensor, tol, symmetric).to(ATensor)
proc matrix_rank*(ty: TensorType; self: Tensor, symmetric: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("matrix_rank", self.tensor, symmetric).to(ATensor)
proc matrix_rank*(_: typedesc[torch]; self: Tensor, symmetric: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::matrix_rank", self.tensor, symmetric).to(ATensor)
proc max*(self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("max", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc max*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc max*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc max_out*(ty: TensorType; max: Tensor, max_values: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_values: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_out", max.tensor, max_values.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.max = newTensor tupleRes[0]
  result.max_values = newTensor tupleRes[1]
proc max_out*(_: typedesc[torch]; max: Tensor, max_values: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[max: Tensor, max_values: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_out", max.tensor, max_values.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.max = newTensor tupleRes[0]
  result.max_values = newTensor tupleRes[1]
proc max_values*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("max_values", dim, keepdim).to(ATensor)
proc max_values*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_values", self.tensor, dim, keepdim).to(ATensor)
proc max_values*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_values", self.tensor, dim, keepdim).to(ATensor)
proc max_pool1d_with_indices*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("max_pool1d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc max_pool1d_with_indices*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::max_pool1d_with_indices", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc max_pool1d*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_pool1d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor)
proc max_pool1d*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_pool1d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor)
proc max_pool2d*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_pool2d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor)
proc max_pool2d*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_pool2d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor)
proc max_pool3d*(ty: TensorType; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("max_pool3d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor)
proc max_pool3d*(_: typedesc[torch]; self: Tensor, kernel_size: IntList, stride: IntList, padding: IntList = @[0], dilation: IntList = @[1], ceil_mode: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::max_pool3d", self.tensor, kernel_size, stride, padding, dilation, ceil_mode).to(ATensor)
proc mean*(self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mean", dtype).to(ATensor)
proc mean*(ty: TensorType; self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean", self.tensor, dtype).to(ATensor)
proc mean*(_: typedesc[torch]; self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean", self.tensor, dtype).to(ATensor)
proc mean*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mean").to(ATensor)
proc mean*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean", self.tensor).to(ATensor)
proc mean*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean", self.tensor).to(ATensor)
proc mean*(self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mean", dim, keepdim, dtype).to(ATensor)
proc mean*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean", self.tensor, dim, keepdim, dtype).to(ATensor)
proc mean*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean", self.tensor, dim, keepdim, dtype).to(ATensor)
proc mean*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mean", dim, keepdim).to(ATensor)
proc mean*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean", self.tensor, dim, keepdim).to(ATensor)
proc mean*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean", self.tensor, dim, keepdim).to(ATensor)
proc mean*(self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mean", dim, dtype).to(ATensor)
proc mean*(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean", self.tensor, dim, dtype).to(ATensor)
proc mean*(_: typedesc[torch]; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean", self.tensor, dim, dtype).to(ATensor)
proc mean_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean_out", aresult.tensor, self.tensor, dim, keepdim, dtype).to(ATensor)
proc mean_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean_out", aresult.tensor, self.tensor, dim, keepdim, dtype).to(ATensor)
proc mean_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc mean_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc mean_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mean_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc mean_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mean_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc median*(self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("median", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc median*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc median*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::median", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc median_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("median_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc median_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::median_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc min*(self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("min", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc min*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc min*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::min", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc min_out*(ty: TensorType; min: Tensor, min_indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("min_out", min.tensor, min_indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.min = newTensor tupleRes[0]
  result.min_indices = newTensor tupleRes[1]
proc min_out*(_: typedesc[torch]; min: Tensor, min_indices: Tensor, self: Tensor, dim: int64, keepdim: bool = false): tuple[min: Tensor, min_indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::min_out", min.tensor, min_indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.min = newTensor tupleRes[0]
  result.min_indices = newTensor tupleRes[1]
proc min_values*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("min_values", dim, keepdim).to(ATensor)
proc min_values*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("min_values", self.tensor, dim, keepdim).to(ATensor)
proc min_values*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::min_values", self.tensor, dim, keepdim).to(ATensor)
proc mkldnn_convolution*(ty: TensorType; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor)
proc mkldnn_convolution*(_: typedesc[torch]; self: Tensor, weight: Tensor, bias: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mkldnn_convolution", self.tensor, weight.tensor, bias.tensor, padding, stride, dilation, groups).to(ATensor)
proc mkldnn_convolution_backward_input*(ty: TensorType; self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mkldnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, bias_defined).to(ATensor)
proc mkldnn_convolution_backward_input*(_: typedesc[torch]; self_size: IntList, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mkldnn_convolution_backward_input", self_size, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, bias_defined).to(ATensor)
proc mkldnn_convolution_backward_weights*(ty: TensorType; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("mkldnn_convolution_backward_weights", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc mkldnn_convolution_backward_weights*(_: typedesc[torch]; weight_size: IntList, grad_output: Tensor, self: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, bias_defined: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::mkldnn_convolution_backward_weights", weight_size, grad_output.tensor, self.tensor, padding, stride, dilation, groups, bias_defined).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc mkldnn_convolution_backward*(ty: TensorType; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc mkldnn_convolution_backward*(_: typedesc[torch]; self: Tensor, grad_output: Tensor, weight: Tensor, padding: IntList, stride: IntList, dilation: IntList, groups: int64, output_mask: StdArray[bool, 3]): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::mkldnn_convolution_backward", self.tensor, grad_output.tensor, weight.tensor, padding, stride, dilation, groups, output_mask).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc mm*(self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mm", mat2.tensor).to(ATensor)
proc mm*(ty: TensorType; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mm", self.tensor, mat2.tensor).to(ATensor)
proc mm*(_: typedesc[torch]; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mm", self.tensor, mat2.tensor).to(ATensor)
proc mm_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mm_out", aresult.tensor, self.tensor, mat2.tensor).to(ATensor)
proc mm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mm_out", aresult.tensor, self.tensor, mat2.tensor).to(ATensor)
proc mode*(self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("mode", dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc mode*(ty: TensorType; self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc mode*(_: typedesc[torch]; self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::mode", self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc mode_out*(ty: TensorType; values: Tensor, indices: Tensor, self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("mode_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc mode_out*(_: typedesc[torch]; values: Tensor, indices: Tensor, self: Tensor, dim: int64 = -1, keepdim: bool = false): tuple[values: Tensor, indices: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::mode_out", values.tensor, indices.tensor, self.tensor, dim, keepdim).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.values = newTensor tupleRes[0]
  result.indices = newTensor tupleRes[1]
proc mul*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mul", other.tensor).to(ATensor)
proc mul*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mul", self.tensor, other.tensor).to(ATensor)
proc mul*(_: typedesc[torch]; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mul", self.tensor, other.tensor).to(ATensor)
proc mul_u*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mul_", other.tensor).to(ATensor)
proc mul_u*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mul_", self.tensor, other.tensor).to(ATensor)
proc mul_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mul_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc mul_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mul_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc mul*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mul", other).to(ATensor)
proc mul*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mul", self.tensor, other).to(ATensor)
proc mul*(_: typedesc[torch]; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mul", self.tensor, other).to(ATensor)
proc mul_u*(self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mul_", other).to(ATensor)
proc mul_u*(ty: TensorType; self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mul_", self.tensor, other).to(ATensor)
proc mv*(self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mv", vec.tensor).to(ATensor)
proc mv*(ty: TensorType; self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mv", self.tensor, vec.tensor).to(ATensor)
proc mv*(_: typedesc[torch]; self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mv", self.tensor, vec.tensor).to(ATensor)
proc mv_out*(ty: TensorType; aresult: Tensor, self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mv_out", aresult.tensor, self.tensor, vec.tensor).to(ATensor)
proc mv_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, vec: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mv_out", aresult.tensor, self.tensor, vec.tensor).to(ATensor)
proc mvlgamma*(self: Tensor, p: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mvlgamma", p).to(ATensor)
proc mvlgamma*(ty: TensorType; self: Tensor, p: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mvlgamma", self.tensor, p).to(ATensor)
proc mvlgamma*(_: typedesc[torch]; self: Tensor, p: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::mvlgamma", self.tensor, p).to(ATensor)
proc mvlgamma_u*(self: Tensor, p: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("mvlgamma_", p).to(ATensor)
proc mvlgamma_u*(ty: TensorType; self: Tensor, p: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("mvlgamma_", self.tensor, p).to(ATensor)
proc narrow*(self: Tensor, dim: int64, start: int64, length: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("narrow", dim, start, length).to(ATensor)
proc narrow*(ty: TensorType; self: Tensor, dim: int64, start: int64, length: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("narrow", self.tensor, dim, start, length).to(ATensor)
proc narrow*(_: typedesc[torch]; self: Tensor, dim: int64, start: int64, length: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::narrow", self.tensor, dim, start, length).to(ATensor)
proc ones*(ty: TensorType; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ones", size, options).to(ATensor)
proc ones*(_: typedesc[torch]; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ones", size, options).to(ATensor)
proc ones_out*(ty: TensorType; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ones_out", aresult.tensor, size).to(ATensor)
proc ones_out*(_: typedesc[torch]; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ones_out", aresult.tensor, size).to(ATensor)
proc ones_like*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ones_like", self.tensor).to(ATensor)
proc ones_like*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ones_like", self.tensor).to(ATensor)
proc ones_like*(ty: TensorType; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ones_like", self.tensor, options).to(ATensor)
proc ones_like*(_: typedesc[torch]; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::ones_like", self.tensor, options).to(ATensor)
proc ones*(ty: TensorType; dtype: TensorType, size: IntList): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("ones", dtype, size).to(ATensor)
proc ones*(_: typedesc[torch]; dtype: TensorType, size: IntList): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::ones", dtype, size).to(ATensor)
proc pairwise_distance*(ty: TensorType; x1: Tensor, x2: Tensor, p: float64 = 2, eps: float64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor)
proc pairwise_distance*(_: typedesc[torch]; x1: Tensor, x2: Tensor, p: float64 = 2, eps: float64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pairwise_distance", x1.tensor, x2.tensor, p, eps, keepdim).to(ATensor)
proc permute*(self: Tensor, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("permute", dims).to(ATensor)
proc permute*(ty: TensorType; self: Tensor, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("permute", self.tensor, dims).to(ATensor)
proc pin_memory*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("pin_memory").to(ATensor)
proc pin_memory*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pin_memory", self.tensor).to(ATensor)
proc pin_memory*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pin_memory", self.tensor).to(ATensor)
proc pinverse*(self: Tensor, rcond: float64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("pinverse", rcond).to(ATensor)
proc pinverse*(ty: TensorType; self: Tensor, rcond: float64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pinverse", self.tensor, rcond).to(ATensor)
proc pinverse*(_: typedesc[torch]; self: Tensor, rcond: float64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pinverse", self.tensor, rcond).to(ATensor)
proc rand*(ty: TensorType; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rand", size, options).to(ATensor)
proc rand*(_: typedesc[torch]; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rand", size, options).to(ATensor)
proc rand*(ty: TensorType; size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rand", size, generator, options).to(ATensor)
proc rand*(_: typedesc[torch]; size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rand", size, generator, options).to(ATensor)
proc rand_out*(ty: TensorType; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rand_out", aresult.tensor, size).to(ATensor)
proc rand_out*(_: typedesc[torch]; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rand_out", aresult.tensor, size).to(ATensor)
proc rand_out*(ty: TensorType; aresult: Tensor, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rand_out", aresult.tensor, size, generator).to(ATensor)
proc rand_out*(_: typedesc[torch]; aresult: Tensor, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rand_out", aresult.tensor, size, generator).to(ATensor)
proc rand_like*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rand_like", self.tensor).to(ATensor)
proc rand_like*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rand_like", self.tensor).to(ATensor)
proc rand_like*(ty: TensorType; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rand_like", self.tensor, options).to(ATensor)
proc rand_like*(_: typedesc[torch]; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rand_like", self.tensor, options).to(ATensor)
proc rand*(ty: TensorType; dtype: TensorType, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rand", dtype, size, generator).to(ATensor)
proc rand*(_: typedesc[torch]; dtype: TensorType, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::rand", dtype, size, generator).to(ATensor)
proc randint*(ty: TensorType; high: int64, size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint", high, size, options).to(ATensor)
proc randint*(_: typedesc[torch]; high: int64, size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint", high, size, options).to(ATensor)
proc randint*(ty: TensorType; high: int64, size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint", high, size, generator, options).to(ATensor)
proc randint*(_: typedesc[torch]; high: int64, size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint", high, size, generator, options).to(ATensor)
proc randint*(ty: TensorType; low: int64, high: int64, size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint", low, high, size, options).to(ATensor)
proc randint*(_: typedesc[torch]; low: int64, high: int64, size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint", low, high, size, options).to(ATensor)
proc randint*(ty: TensorType; low: int64, high: int64, size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint", low, high, size, generator, options).to(ATensor)
proc randint*(_: typedesc[torch]; low: int64, high: int64, size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint", low, high, size, generator, options).to(ATensor)
proc randint*(ty: TensorType; dtype: TensorType, high: int64, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint", dtype, high, size, generator).to(ATensor)
proc randint*(_: typedesc[torch]; dtype: TensorType, high: int64, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint", dtype, high, size, generator).to(ATensor)
proc randint*(ty: TensorType; dtype: TensorType, low: int64, high: int64, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint", dtype, low, high, size, generator).to(ATensor)
proc randint*(_: typedesc[torch]; dtype: TensorType, low: int64, high: int64, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint", dtype, low, high, size, generator).to(ATensor)
proc randint_out*(ty: TensorType; aresult: Tensor, high: int64, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_out", aresult.tensor, high, size).to(ATensor)
proc randint_out*(_: typedesc[torch]; aresult: Tensor, high: int64, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_out", aresult.tensor, high, size).to(ATensor)
proc randint_out*(ty: TensorType; aresult: Tensor, high: int64, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_out", aresult.tensor, high, size, generator).to(ATensor)
proc randint_out*(_: typedesc[torch]; aresult: Tensor, high: int64, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_out", aresult.tensor, high, size, generator).to(ATensor)
proc randint_out*(ty: TensorType; aresult: Tensor, low: int64, high: int64, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_out", aresult.tensor, low, high, size).to(ATensor)
proc randint_out*(_: typedesc[torch]; aresult: Tensor, low: int64, high: int64, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_out", aresult.tensor, low, high, size).to(ATensor)
proc randint_out*(ty: TensorType; aresult: Tensor, low: int64, high: int64, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_out", aresult.tensor, low, high, size, generator).to(ATensor)
proc randint_out*(_: typedesc[torch]; aresult: Tensor, low: int64, high: int64, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_out", aresult.tensor, low, high, size, generator).to(ATensor)
proc randint_like*(ty: TensorType; self: Tensor, high: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_like", self.tensor, high).to(ATensor)
proc randint_like*(_: typedesc[torch]; self: Tensor, high: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_like", self.tensor, high).to(ATensor)
proc randint_like*(ty: TensorType; self: Tensor, low: int64, high: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_like", self.tensor, low, high).to(ATensor)
proc randint_like*(_: typedesc[torch]; self: Tensor, low: int64, high: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_like", self.tensor, low, high).to(ATensor)
proc randint_like*(ty: TensorType; self: Tensor, high: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_like", self.tensor, high, options).to(ATensor)
proc randint_like*(_: typedesc[torch]; self: Tensor, high: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_like", self.tensor, high, options).to(ATensor)
proc randint_like*(ty: TensorType; self: Tensor, low: int64, high: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randint_like", self.tensor, low, high, options).to(ATensor)
proc randint_like*(_: typedesc[torch]; self: Tensor, low: int64, high: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randint_like", self.tensor, low, high, options).to(ATensor)
proc randn*(ty: TensorType; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randn", size, options).to(ATensor)
proc randn*(_: typedesc[torch]; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randn", size, options).to(ATensor)
proc randn*(ty: TensorType; size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randn", size, generator, options).to(ATensor)
proc randn*(_: typedesc[torch]; size: IntList, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randn", size, generator, options).to(ATensor)
proc randn_out*(ty: TensorType; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randn_out", aresult.tensor, size).to(ATensor)
proc randn_out*(_: typedesc[torch]; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randn_out", aresult.tensor, size).to(ATensor)
proc randn_out*(ty: TensorType; aresult: Tensor, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randn_out", aresult.tensor, size, generator).to(ATensor)
proc randn_out*(_: typedesc[torch]; aresult: Tensor, size: IntList, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randn_out", aresult.tensor, size, generator).to(ATensor)
proc randn_like*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randn_like", self.tensor).to(ATensor)
proc randn_like*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randn_like", self.tensor).to(ATensor)
proc randn_like*(ty: TensorType; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randn_like", self.tensor, options).to(ATensor)
proc randn_like*(_: typedesc[torch]; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randn_like", self.tensor, options).to(ATensor)
proc randn*(ty: TensorType; dtype: TensorType, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randn", dtype, size, generator).to(ATensor)
proc randn*(_: typedesc[torch]; dtype: TensorType, size: IntList, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::randn", dtype, size, generator).to(ATensor)
proc randperm*(ty: TensorType; n: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randperm", n, options).to(ATensor)
proc randperm*(_: typedesc[torch]; n: int64, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randperm", n, options).to(ATensor)
proc randperm*(ty: TensorType; n: int64, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randperm", n, generator, options).to(ATensor)
proc randperm*(_: typedesc[torch]; n: int64, generator: Generator, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randperm", n, generator, options).to(ATensor)
proc randperm_out*(ty: TensorType; aresult: Tensor, n: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randperm_out", aresult.tensor, n).to(ATensor)
proc randperm_out*(_: typedesc[torch]; aresult: Tensor, n: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randperm_out", aresult.tensor, n).to(ATensor)
proc randperm_out*(ty: TensorType; aresult: Tensor, n: int64, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randperm_out", aresult.tensor, n, generator).to(ATensor)
proc randperm_out*(_: typedesc[torch]; aresult: Tensor, n: int64, generator: Generator): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::randperm_out", aresult.tensor, n, generator).to(ATensor)
proc randperm*(ty: TensorType; dtype: TensorType, n: int64, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("randperm", dtype, n, generator).to(ATensor)
proc randperm*(_: typedesc[torch]; dtype: TensorType, n: int64, generator: Generator = nil): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::randperm", dtype, n, generator).to(ATensor)
proc range*(ty: TensorType; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("range", start, aend, options).to(ATensor)
proc range*(_: typedesc[torch]; start: float, aend: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::range", start, aend, options).to(ATensor)
proc range*(ty: TensorType; start: float, aend: float, step: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("range", start, aend, step, options).to(ATensor)
proc range*(_: typedesc[torch]; start: float, aend: float, step: float, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::range", start, aend, step, options).to(ATensor)
proc range_out*(ty: TensorType; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("range_out", aresult.tensor, start, aend).to(ATensor)
proc range_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::range_out", aresult.tensor, start, aend).to(ATensor)
proc range_out*(ty: TensorType; aresult: Tensor, start: float, aend: float, step: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("range_out", aresult.tensor, start, aend, step).to(ATensor)
proc range_out*(_: typedesc[torch]; aresult: Tensor, start: float, aend: float, step: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::range_out", aresult.tensor, start, aend, step).to(ATensor)
proc range*(ty: TensorType; dtype: TensorType, start: float, aend: float, step: float = 1): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("range", dtype, start, aend, step).to(ATensor)
proc range*(_: typedesc[torch]; dtype: TensorType, start: float, aend: float, step: float = 1): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::range", dtype, start, aend, step).to(ATensor)
proc repeat*(self: Tensor, repeats: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("repeat", repeats).to(ATensor)
proc repeat*(ty: TensorType; self: Tensor, repeats: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("repeat", self.tensor, repeats).to(ATensor)
proc reshape*(self: Tensor, shape: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("reshape", shape).to(ATensor)
proc reshape*(ty: TensorType; self: Tensor, shape: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reshape", self.tensor, shape).to(ATensor)
proc reshape*(_: typedesc[torch]; self: Tensor, shape: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::reshape", self.tensor, shape).to(ATensor)
proc reshape_as*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("reshape_as", other.tensor).to(ATensor)
proc reshape_as*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("reshape_as", self.tensor, other.tensor).to(ATensor)
proc RoiPooling2d_forward*(ty: TensorType; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc RoiPooling2d_forward*(_: typedesc[torch]; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::RoiPooling2d_forward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc RoiPooling2d_backward*(ty: TensorType; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64, gradOutput: Tensor, argmaxes: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor)
proc RoiPooling2d_backward*(_: typedesc[torch]; input: Tensor, rois: Tensor, pooledHeight: int64, pooledWidth: int64, spatialScale: float64, gradOutput: Tensor, argmaxes: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::RoiPooling2d_backward", input.tensor, rois.tensor, pooledHeight, pooledWidth, spatialScale, gradOutput.tensor, argmaxes.tensor).to(ATensor)
proc round*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("round").to(ATensor)
proc round*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("round", self.tensor).to(ATensor)
proc round*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::round", self.tensor).to(ATensor)
proc round_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("round_").to(ATensor)
proc round_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("round_", self.tensor).to(ATensor)
proc round_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::round_", self.tensor).to(ATensor)
proc round_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("round_out", aresult.tensor, self.tensor).to(ATensor)
proc round_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::round_out", aresult.tensor, self.tensor).to(ATensor)
proc rrelu*(ty: TensorType; self: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu", self.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu*(_: typedesc[torch]; self: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu", self.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_u*(ty: TensorType; self: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rrelu_", self.tensor, lower, upper, training, generator).to(ATensor)
proc rrelu_u*(_: typedesc[torch]; self: Tensor, lower: float, upper: float, training: bool = false, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rrelu_", self.tensor, lower, upper, training, generator).to(ATensor)
proc relu*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("relu").to(ATensor)
proc relu*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("relu", self.tensor).to(ATensor)
proc relu*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::relu", self.tensor).to(ATensor)
proc relu_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("relu_").to(ATensor)
proc relu_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("relu_", self.tensor).to(ATensor)
proc relu_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::relu_", self.tensor).to(ATensor)
proc hardshrink*(self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("hardshrink", lambd).to(ATensor)
proc hardshrink*(ty: TensorType; self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardshrink", self.tensor, lambd).to(ATensor)
proc hardshrink*(_: typedesc[torch]; self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardshrink", self.tensor, lambd).to(ATensor)
proc hardshrink_backward*(self: Tensor, grad_out: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("hardshrink_backward", grad_out.tensor, lambd).to(ATensor)
proc hardshrink_backward*(ty: TensorType; grad_out: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hardshrink_backward", grad_out.tensor, self.tensor, lambd).to(ATensor)
proc hardshrink_backward*(_: typedesc[torch]; grad_out: Tensor, self: Tensor, lambd: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hardshrink_backward", grad_out.tensor, self.tensor, lambd).to(ATensor)
proc rsqrt*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("rsqrt").to(ATensor)
proc rsqrt*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rsqrt", self.tensor).to(ATensor)
proc rsqrt*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rsqrt", self.tensor).to(ATensor)
proc rsqrt_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("rsqrt_").to(ATensor)
proc rsqrt_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rsqrt_", self.tensor).to(ATensor)
proc rsqrt_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rsqrt_", self.tensor).to(ATensor)
proc rsqrt_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rsqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc rsqrt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rsqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc select*(self: Tensor, dim: int64, index: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("select", dim, index).to(ATensor)
proc select*(ty: TensorType; self: Tensor, dim: int64, index: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("select", self.tensor, dim, index).to(ATensor)
proc select*(_: typedesc[torch]; self: Tensor, dim: int64, index: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::select", self.tensor, dim, index).to(ATensor)
proc selu*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("selu", self.tensor).to(ATensor)
proc selu*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::selu", self.tensor).to(ATensor)
proc selu_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("selu_", self.tensor).to(ATensor)
proc selu_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::selu_", self.tensor).to(ATensor)
proc celu*(ty: TensorType; self: Tensor, alpha: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("celu", self.tensor, alpha).to(ATensor)
proc celu*(_: typedesc[torch]; self: Tensor, alpha: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::celu", self.tensor, alpha).to(ATensor)
proc celu_u*(ty: TensorType; self: Tensor, alpha: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("celu_", self.tensor, alpha).to(ATensor)
proc celu_u*(_: typedesc[torch]; self: Tensor, alpha: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::celu_", self.tensor, alpha).to(ATensor)
proc sigmoid*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sigmoid").to(ATensor)
proc sigmoid*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sigmoid", self.tensor).to(ATensor)
proc sigmoid*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sigmoid", self.tensor).to(ATensor)
proc sigmoid_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sigmoid_").to(ATensor)
proc sigmoid_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sigmoid_", self.tensor).to(ATensor)
proc sigmoid_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sigmoid_", self.tensor).to(ATensor)
proc sigmoid_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sigmoid_out", aresult.tensor, self.tensor).to(ATensor)
proc sigmoid_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sigmoid_out", aresult.tensor, self.tensor).to(ATensor)
proc sin*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sin").to(ATensor)
proc sin*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sin", self.tensor).to(ATensor)
proc sin*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sin", self.tensor).to(ATensor)
proc sin_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sin_").to(ATensor)
proc sin_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sin_", self.tensor).to(ATensor)
proc sin_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sin_", self.tensor).to(ATensor)
proc sin_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sin_out", aresult.tensor, self.tensor).to(ATensor)
proc sin_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sin_out", aresult.tensor, self.tensor).to(ATensor)
proc sinh*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sinh").to(ATensor)
proc sinh*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sinh", self.tensor).to(ATensor)
proc sinh*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sinh", self.tensor).to(ATensor)
proc sinh_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sinh_").to(ATensor)
proc sinh_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sinh_", self.tensor).to(ATensor)
proc sinh_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sinh_", self.tensor).to(ATensor)
proc sinh_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sinh_out", aresult.tensor, self.tensor).to(ATensor)
proc sinh_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sinh_out", aresult.tensor, self.tensor).to(ATensor)
proc size*(self: Tensor, dim: int64): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("size", dim).to(int64)
proc size*(ty: TensorType; self: Tensor, dim: int64): int64 {.inline, noinit.} = ty.dynamicCppCall("size", self.tensor, dim).to(int64)
proc size*(_: typedesc[torch]; self: Tensor, dim: int64): int64 {.inline, noinit.} = dynamicCCall("at::size", self.tensor, dim).to(int64)
proc slice*(self: Tensor, dim: int64 = 0, start: int64 = 0, aend: int64 = 9223372036854775807, step: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("slice", dim, start, aend, step).to(ATensor)
proc slice*(ty: TensorType; self: Tensor, dim: int64 = 0, start: int64 = 0, aend: int64 = 9223372036854775807, step: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("slice", self.tensor, dim, start, aend, step).to(ATensor)
proc slice*(_: typedesc[torch]; self: Tensor, dim: int64 = 0, start: int64 = 0, aend: int64 = 9223372036854775807, step: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::slice", self.tensor, dim, start, aend, step).to(ATensor)
proc slogdet*(self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("slogdet").to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc slogdet*(ty: TensorType; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("slogdet", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc slogdet*(_: typedesc[torch]; self: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::slogdet", self.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc smm*(self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("smm", mat2.tensor).to(ATensor)
proc smm*(ty: TensorType; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("smm", self.tensor, mat2.tensor).to(ATensor)
proc smm*(_: typedesc[torch]; self: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::smm", self.tensor, mat2.tensor).to(ATensor)
proc softmax*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("softmax", dim).to(ATensor)
proc softmax*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softmax", self.tensor, dim).to(ATensor)
proc softmax*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softmax", self.tensor, dim).to(ATensor)
proc softmax_backward_data*(ty: TensorType; grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor)
proc softmax_backward_data*(_: typedesc[torch]; grad_output: Tensor, output: Tensor, dim: int64, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::softmax_backward_data", grad_output.tensor, output.tensor, dim, self.tensor).to(ATensor)
proc u_sparse_add_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sparse_add_out", aresult.tensor, self.tensor, other.tensor, alpha).to(ATensor)
proc u_sparse_add_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sparse_add_out", aresult.tensor, self.tensor, other.tensor, alpha).to(ATensor)
proc u_sparse_dense_add_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: ASparseTensorRef, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sparse_dense_add_out", aresult.tensor, self.tensor, other, alpha).to(ATensor)
proc u_sparse_dense_add_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: ASparseTensorRef, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sparse_dense_add_out", aresult.tensor, self.tensor, other, alpha).to(ATensor)
proc u_sparse_div_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sparse_div_out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_sparse_div_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sparse_div_out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_sparse_mul_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sparse_mul_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_sparse_mul_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sparse_mul_out", aresult.tensor, self.tensor, other.tensor).to(ATensor)
proc u_sparse_mul_scalar_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sparse_mul_scalar_out", aresult.tensor, self.tensor, other).to(ATensor)
proc u_sparse_mul_scalar_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sparse_mul_scalar_out", aresult.tensor, self.tensor, other).to(ATensor)
proc split*(self: Tensor, split_size: int64, dim: int64 = 0): TensorList {.inline, noinit.} = self.tensor.dynamicCppCall("split", split_size, dim).to(TensorList)
proc split*(ty: TensorType; self: Tensor, split_size: int64, dim: int64 = 0): TensorList {.inline, noinit.} = ty.dynamicCppCall("split", self.tensor, split_size, dim).to(TensorList)
proc split*(_: typedesc[torch]; self: Tensor, split_size: int64, dim: int64 = 0): TensorList {.inline, noinit.} = dynamicCCall("at::split", self.tensor, split_size, dim).to(TensorList)
proc split_with_sizes*(self: Tensor, split_sizes: IntList, dim: int64 = 0): TensorList {.inline, noinit.} = self.tensor.dynamicCppCall("split_with_sizes", split_sizes, dim).to(TensorList)
proc split_with_sizes*(ty: TensorType; self: Tensor, split_sizes: IntList, dim: int64 = 0): TensorList {.inline, noinit.} = ty.dynamicCppCall("split_with_sizes", self.tensor, split_sizes, dim).to(TensorList)
proc split_with_sizes*(_: typedesc[torch]; self: Tensor, split_sizes: IntList, dim: int64 = 0): TensorList {.inline, noinit.} = dynamicCCall("at::split_with_sizes", self.tensor, split_sizes, dim).to(TensorList)
proc squeeze*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("squeeze").to(ATensor)
proc squeeze*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("squeeze", self.tensor).to(ATensor)
proc squeeze*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::squeeze", self.tensor).to(ATensor)
proc squeeze*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("squeeze", dim).to(ATensor)
proc squeeze*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("squeeze", self.tensor, dim).to(ATensor)
proc squeeze*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::squeeze", self.tensor, dim).to(ATensor)
proc squeeze_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("squeeze_").to(ATensor)
proc squeeze_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("squeeze_", self.tensor).to(ATensor)
proc squeeze_u*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("squeeze_", dim).to(ATensor)
proc squeeze_u*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("squeeze_", self.tensor, dim).to(ATensor)
proc sspaddmm*(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sspaddmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc sspaddmm*(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sspaddmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc sspaddmm*(_: typedesc[torch]; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sspaddmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc sspaddmm_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sspaddmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc sspaddmm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sspaddmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc stack*(ty: TensorType; tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("stack", tensors, dim).to(ATensor)
proc stack*(_: typedesc[torch]; tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::stack", tensors, dim).to(ATensor)
proc stack_out*(ty: TensorType; aresult: Tensor, tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("stack_out", aresult.tensor, tensors, dim).to(ATensor)
proc stack_out*(_: typedesc[torch]; aresult: Tensor, tensors: TensorList, dim: int64 = 0): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::stack_out", aresult.tensor, tensors, dim).to(ATensor)
proc stft*(self: Tensor, n_fft: int64, hop_length: int64, win_length: int64, window: Tensor, normalized: bool = false, onesided: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("stft", n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor)
proc stft*(ty: TensorType; self: Tensor, n_fft: int64, hop_length: int64, win_length: int64, window: Tensor, normalized: bool = false, onesided: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("stft", self.tensor, n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor)
proc stft*(_: typedesc[torch]; self: Tensor, n_fft: int64, hop_length: int64, win_length: int64, window: Tensor, normalized: bool = false, onesided: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::stft", self.tensor, n_fft, hop_length, win_length, window.tensor, normalized, onesided).to(ATensor)
proc stride*(self: Tensor, dim: int64): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("stride", dim).to(int64)
proc stride*(ty: TensorType; self: Tensor, dim: int64): int64 {.inline, noinit.} = ty.dynamicCppCall("stride", self.tensor, dim).to(int64)
proc stride*(_: typedesc[torch]; self: Tensor, dim: int64): int64 {.inline, noinit.} = dynamicCCall("at::stride", self.tensor, dim).to(int64)
proc sum*(self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sum", dtype).to(ATensor)
proc sum*(ty: TensorType; self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum", self.tensor, dtype).to(ATensor)
proc sum*(_: typedesc[torch]; self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum", self.tensor, dtype).to(ATensor)
proc sum*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sum").to(ATensor)
proc sum*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum", self.tensor).to(ATensor)
proc sum*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum", self.tensor).to(ATensor)
proc u_sum*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_sum").to(ATensor)
proc u_sum*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sum", self.tensor).to(ATensor)
proc u_sum*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sum", self.tensor).to(ATensor)
proc sum*(self: Tensor, dim: IntList, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sum", dim, keepdim, dtype).to(ATensor)
proc sum*(ty: TensorType; self: Tensor, dim: IntList, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum", self.tensor, dim, keepdim, dtype).to(ATensor)
proc sum*(_: typedesc[torch]; self: Tensor, dim: IntList, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum", self.tensor, dim, keepdim, dtype).to(ATensor)
proc sum*(self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sum", dim, keepdim).to(ATensor)
proc sum*(ty: TensorType; self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum", self.tensor, dim, keepdim).to(ATensor)
proc sum*(_: typedesc[torch]; self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum", self.tensor, dim, keepdim).to(ATensor)
proc sum*(self: Tensor, dim: IntList, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sum", dim, dtype).to(ATensor)
proc sum*(ty: TensorType; self: Tensor, dim: IntList, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum", self.tensor, dim, dtype).to(ATensor)
proc sum*(_: typedesc[torch]; self: Tensor, dim: IntList, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum", self.tensor, dim, dtype).to(ATensor)
proc u_sum*(self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_sum", dim, keepdim).to(ATensor)
proc u_sum*(ty: TensorType; self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sum", self.tensor, dim, keepdim).to(ATensor)
proc u_sum*(_: typedesc[torch]; self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sum", self.tensor, dim, keepdim).to(ATensor)
proc sum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: IntList, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum_out", aresult.tensor, self.tensor, dim, keepdim, dtype).to(ATensor)
proc sum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: IntList, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum_out", aresult.tensor, self.tensor, dim, keepdim, dtype).to(ATensor)
proc sum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc sum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc sum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: IntList, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sum_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc sum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: IntList, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sum_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc u_sum_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sum_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_sum_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: IntList, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sum_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_sum_cuda_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sum_cuda_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_sum_cuda_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sum_cuda_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc sqrt*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sqrt").to(ATensor)
proc sqrt*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sqrt", self.tensor).to(ATensor)
proc sqrt*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sqrt", self.tensor).to(ATensor)
proc sqrt_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sqrt_").to(ATensor)
proc sqrt_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sqrt_", self.tensor).to(ATensor)
proc sqrt_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sqrt_", self.tensor).to(ATensor)
proc sqrt_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc sqrt_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sqrt_out", aresult.tensor, self.tensor).to(ATensor)
proc std*(self: Tensor, unbiased: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("std", unbiased).to(ATensor)
proc std*(ty: TensorType; self: Tensor, unbiased: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("std", self.tensor, unbiased).to(ATensor)
proc std*(_: typedesc[torch]; self: Tensor, unbiased: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::std", self.tensor, unbiased).to(ATensor)
proc std*(self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("std", dim, unbiased, keepdim).to(ATensor)
proc std*(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("std", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc std*(_: typedesc[torch]; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::std", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc std_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("std_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc std_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::std_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc prod*(self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("prod", dtype).to(ATensor)
proc prod*(ty: TensorType; self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod", self.tensor, dtype).to(ATensor)
proc prod*(_: typedesc[torch]; self: Tensor, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod", self.tensor, dtype).to(ATensor)
proc prod*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("prod").to(ATensor)
proc prod*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod", self.tensor).to(ATensor)
proc prod*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod", self.tensor).to(ATensor)
proc u_prod*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_prod").to(ATensor)
proc u_prod*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_prod", self.tensor).to(ATensor)
proc u_prod*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_prod", self.tensor).to(ATensor)
proc prod*(self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("prod", dim, keepdim, dtype).to(ATensor)
proc prod*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod", self.tensor, dim, keepdim, dtype).to(ATensor)
proc prod*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod", self.tensor, dim, keepdim, dtype).to(ATensor)
proc prod*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("prod", dim, keepdim).to(ATensor)
proc prod*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod", self.tensor, dim, keepdim).to(ATensor)
proc prod*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod", self.tensor, dim, keepdim).to(ATensor)
proc prod*(self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("prod", dim, dtype).to(ATensor)
proc prod*(ty: TensorType; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod", self.tensor, dim, dtype).to(ATensor)
proc prod*(_: typedesc[torch]; self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod", self.tensor, dim, dtype).to(ATensor)
proc u_prod*(self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_prod", dim, keepdim).to(ATensor)
proc u_prod*(ty: TensorType; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_prod", self.tensor, dim, keepdim).to(ATensor)
proc u_prod*(_: typedesc[torch]; self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_prod", self.tensor, dim, keepdim).to(ATensor)
proc prod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod_out", aresult.tensor, self.tensor, dim, keepdim, dtype).to(ATensor)
proc prod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod_out", aresult.tensor, self.tensor, dim, keepdim, dtype).to(ATensor)
proc prod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc prod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc prod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("prod_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc prod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, dtype: AScalarType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::prod_out", aresult.tensor, self.tensor, dim, dtype).to(ATensor)
proc u_prod_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_prod_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc u_prod_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_prod_out", aresult.tensor, self.tensor, dim, keepdim).to(ATensor)
proc t*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("t").to(ATensor)
proc t*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("t", self.tensor).to(ATensor)
proc t*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::t", self.tensor).to(ATensor)
proc t_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("t_").to(ATensor)
proc t_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("t_", self.tensor).to(ATensor)
proc tan*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("tan").to(ATensor)
proc tan*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tan", self.tensor).to(ATensor)
proc tan*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tan", self.tensor).to(ATensor)
proc tan_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("tan_").to(ATensor)
proc tan_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tan_", self.tensor).to(ATensor)
proc tan_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tan_", self.tensor).to(ATensor)
proc tan_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tan_out", aresult.tensor, self.tensor).to(ATensor)
proc tan_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tan_out", aresult.tensor, self.tensor).to(ATensor)
proc tanh*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("tanh").to(ATensor)
proc tanh*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tanh", self.tensor).to(ATensor)
proc tanh*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tanh", self.tensor).to(ATensor)
proc tanh_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("tanh_").to(ATensor)
proc tanh_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tanh_", self.tensor).to(ATensor)
proc tanh_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tanh_", self.tensor).to(ATensor)
proc tanh_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tanh_out", aresult.tensor, self.tensor).to(ATensor)
proc tanh_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::tanh_out", aresult.tensor, self.tensor).to(ATensor)
proc transpose*(self: Tensor, dim0: int64, dim1: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("transpose", dim0, dim1).to(ATensor)
proc transpose*(ty: TensorType; self: Tensor, dim0: int64, dim1: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("transpose", self.tensor, dim0, dim1).to(ATensor)
proc transpose*(_: typedesc[torch]; self: Tensor, dim0: int64, dim1: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::transpose", self.tensor, dim0, dim1).to(ATensor)
proc transpose_u*(self: Tensor, dim0: int64, dim1: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("transpose_", dim0, dim1).to(ATensor)
proc transpose_u*(ty: TensorType; self: Tensor, dim0: int64, dim1: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("transpose_", self.tensor, dim0, dim1).to(ATensor)
proc flip*(self: Tensor, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("flip", dims).to(ATensor)
proc flip*(ty: TensorType; self: Tensor, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("flip", self.tensor, dims).to(ATensor)
proc flip*(_: typedesc[torch]; self: Tensor, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::flip", self.tensor, dims).to(ATensor)
proc rot90*(self: Tensor, k: int64 = 1, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("rot90", k, dims).to(ATensor)
proc rot90*(ty: TensorType; self: Tensor, k: int64 = 1, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rot90", self.tensor, k, dims).to(ATensor)
proc rot90*(_: typedesc[torch]; self: Tensor, k: int64 = 1, dims: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rot90", self.tensor, k, dims).to(ATensor)
proc u_trilinear*(ty: TensorType; i1: Tensor, i2: Tensor, i3: Tensor, expand1: IntList, expand2: IntList, expand3: IntList, sumdim: IntList, unroll_dim: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1, expand2, expand3, sumdim, unroll_dim).to(ATensor)
proc u_trilinear*(_: typedesc[torch]; i1: Tensor, i2: Tensor, i3: Tensor, expand1: IntList, expand2: IntList, expand3: IntList, sumdim: IntList, unroll_dim: int64 = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_trilinear", i1.tensor, i2.tensor, i3.tensor, expand1, expand2, expand3, sumdim, unroll_dim).to(ATensor)
proc triplet_margin_loss*(ty: TensorType; anchor: Tensor, positive: Tensor, negative: Tensor, margin: float64, p: float64 = 2, eps: float64, swap: bool = false, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor)
proc triplet_margin_loss*(_: typedesc[torch]; anchor: Tensor, positive: Tensor, negative: Tensor, margin: float64, p: float64 = 2, eps: float64, swap: bool = false, reduction: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::triplet_margin_loss", anchor.tensor, positive.tensor, negative.tensor, margin, p, eps, swap, reduction).to(ATensor)
proc trunc*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("trunc").to(ATensor)
proc trunc*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("trunc", self.tensor).to(ATensor)
proc trunc*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::trunc", self.tensor).to(ATensor)
proc trunc_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("trunc_").to(ATensor)
proc trunc_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("trunc_", self.tensor).to(ATensor)
proc trunc_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::trunc_", self.tensor).to(ATensor)
proc trunc_out*(ty: TensorType; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("trunc_out", aresult.tensor, self.tensor).to(ATensor)
proc trunc_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::trunc_out", aresult.tensor, self.tensor).to(ATensor)
proc type_as*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("type_as", other.tensor).to(ATensor)
proc type_as*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("type_as", self.tensor, other.tensor).to(ATensor)
proc u_unique*(self: Tensor, sorted: bool = false, return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = self.tensor.dynamicCppCall("_unique", sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_unique*(ty: TensorType; self: Tensor, sorted: bool = false, return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_unique", self.tensor, sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_unique*(_: typedesc[torch]; self: Tensor, sorted: bool = false, return_inverse: bool = false): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_unique", self.tensor, sorted, return_inverse).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_unsafe_view*(ty: TensorType; self: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_unsafe_view", self.tensor, size).to(ATensor)
proc u_unsafe_view*(_: typedesc[torch]; self: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_unsafe_view", self.tensor, size).to(ATensor)
proc unsqueeze*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("unsqueeze", dim).to(ATensor)
proc unsqueeze*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("unsqueeze", self.tensor, dim).to(ATensor)
proc unsqueeze*(_: typedesc[torch]; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::unsqueeze", self.tensor, dim).to(ATensor)
proc unsqueeze_u*(self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("unsqueeze_", dim).to(ATensor)
proc unsqueeze_u*(ty: TensorType; self: Tensor, dim: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("unsqueeze_", self.tensor, dim).to(ATensor)
proc avar*(self: Tensor, unbiased: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("var", unbiased).to(ATensor)
proc avar*(ty: TensorType; self: Tensor, unbiased: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("var", self.tensor, unbiased).to(ATensor)
proc avar*(_: typedesc[torch]; self: Tensor, unbiased: bool = true): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::var", self.tensor, unbiased).to(ATensor)
proc avar*(self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("var", dim, unbiased, keepdim).to(ATensor)
proc avar*(ty: TensorType; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("var", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc avar*(_: typedesc[torch]; self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::var", self.tensor, dim, unbiased, keepdim).to(ATensor)
proc var_out*(ty: TensorType; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("var_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc var_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, dim: int64, unbiased: bool = true, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::var_out", aresult.tensor, self.tensor, dim, unbiased, keepdim).to(ATensor)
proc view_as*(self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("view_as", other.tensor).to(ATensor)
proc view_as*(ty: TensorType; self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("view_as", self.tensor, other.tensor).to(ATensor)
proc where*(self: Tensor, condition: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("where", condition.tensor, other.tensor).to(ATensor)
proc where*(ty: TensorType; condition: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("where", condition.tensor, self.tensor, other.tensor).to(ATensor)
proc where*(_: typedesc[torch]; condition: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::where", condition.tensor, self.tensor, other.tensor).to(ATensor)
proc u_s_where*(self: Tensor, condition: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_s_where", condition.tensor, other.tensor).to(ATensor)
proc u_s_where*(ty: TensorType; condition: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor)
proc u_s_where*(_: typedesc[torch]; condition: Tensor, self: Tensor, other: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_s_where", condition.tensor, self.tensor, other.tensor).to(ATensor)
proc zeros*(ty: TensorType; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("zeros", size, options).to(ATensor)
proc zeros*(_: typedesc[torch]; size: IntList, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::zeros", size, options).to(ATensor)
proc zeros_out*(ty: TensorType; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("zeros_out", aresult.tensor, size).to(ATensor)
proc zeros_out*(_: typedesc[torch]; aresult: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::zeros_out", aresult.tensor, size).to(ATensor)
proc zeros_like*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("zeros_like", self.tensor).to(ATensor)
proc zeros_like*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::zeros_like", self.tensor).to(ATensor)
proc zeros_like*(ty: TensorType; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("zeros_like", self.tensor, options).to(ATensor)
proc zeros_like*(_: typedesc[torch]; self: Tensor, options: TensorOptions): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::zeros_like", self.tensor, options).to(ATensor)
proc zeros*(ty: TensorType; dtype: TensorType, size: IntList): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("zeros", dtype, size).to(ATensor)
proc zeros*(_: typedesc[torch]; dtype: TensorType, size: IntList): Tensor {.deprecated, inline, noinit.} = 
  result = newTensor dynamicCCall("at::zeros", dtype, size).to(ATensor)
proc u_standard_gamma_grad*(self: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_standard_gamma_grad", output.tensor).to(ATensor)
proc u_standard_gamma_grad*(ty: TensorType; self: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_standard_gamma_grad", self.tensor, output.tensor).to(ATensor)
proc u_standard_gamma_grad*(_: typedesc[torch]; self: Tensor, output: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_standard_gamma_grad", self.tensor, output.tensor).to(ATensor)
proc u_standard_gamma*(self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_standard_gamma", generator).to(ATensor)
proc u_standard_gamma*(ty: TensorType; self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_standard_gamma", self.tensor, generator).to(ATensor)
proc u_standard_gamma*(_: typedesc[torch]; self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_standard_gamma", self.tensor, generator).to(ATensor)
proc poisson*(ty: TensorType; self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("poisson", self.tensor, generator).to(ATensor)
proc poisson*(_: typedesc[torch]; self: Tensor, generator: Generator = nil): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::poisson", self.tensor, generator).to(ATensor)
proc native_norm*(ty: TensorType; self: Tensor, p: float = 2): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_norm", self.tensor, p).to(ATensor)
proc native_norm*(_: typedesc[torch]; self: Tensor, p: float = 2): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_norm", self.tensor, p).to(ATensor)
proc norm*(self: Tensor, p: float = 2): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("norm", p).to(ATensor)
proc norm*(ty: TensorType; self: Tensor, p: float = 2): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("norm", self.tensor, p).to(ATensor)
proc norm*(_: typedesc[torch]; self: Tensor, p: float = 2): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::norm", self.tensor, p).to(ATensor)
proc norm*(self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("norm", p, dim, keepdim).to(ATensor)
proc norm*(ty: TensorType; self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("norm", self.tensor, p, dim, keepdim).to(ATensor)
proc norm*(_: typedesc[torch]; self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::norm", self.tensor, p, dim, keepdim).to(ATensor)
proc norm_out*(ty: TensorType; aresult: Tensor, self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("norm_out", aresult.tensor, self.tensor, p, dim, keepdim).to(ATensor)
proc norm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, p: float, dim: int64, keepdim: bool = false): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::norm_out", aresult.tensor, self.tensor, p, dim, keepdim).to(ATensor)
proc native_clone*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_clone", self.tensor).to(ATensor)
proc native_clone*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_clone", self.tensor).to(ATensor)
proc clone*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("clone").to(ATensor)
proc clone*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("clone", self.tensor).to(ATensor)
proc clone*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::clone", self.tensor).to(ATensor)
proc native_resize_as_u*(ty: TensorType; self: Tensor, the_template: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_resize_as_", self.tensor, the_template.tensor).to(ATensor)
proc native_resize_as_u*(_: typedesc[torch]; self: Tensor, the_template: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_resize_as_", self.tensor, the_template.tensor).to(ATensor)
proc resize_as_u*(self: Tensor, the_template: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("resize_as_", the_template.tensor).to(ATensor)
proc resize_as_u*(ty: TensorType; self: Tensor, the_template: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("resize_as_", self.tensor, the_template.tensor).to(ATensor)
proc resize_as_u*(_: typedesc[torch]; self: Tensor, the_template: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::resize_as_", self.tensor, the_template.tensor).to(ATensor)
proc native_pow_out*(ty: TensorType; aresult: Tensor, self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_pow_out", aresult.tensor, self.tensor, exponent).to(ATensor)
proc native_pow_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_pow_out", aresult.tensor, self.tensor, exponent).to(ATensor)
proc native_pow*(ty: TensorType; self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_pow", self.tensor, exponent).to(ATensor)
proc native_pow*(_: typedesc[torch]; self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_pow", self.tensor, exponent).to(ATensor)
proc pow_out*(ty: TensorType; aresult: Tensor, self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow_out", aresult.tensor, self.tensor, exponent).to(ATensor)
proc pow_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pow_out", aresult.tensor, self.tensor, exponent).to(ATensor)
proc pow*(self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("pow", exponent).to(ATensor)
proc pow*(ty: TensorType; self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("pow", self.tensor, exponent).to(ATensor)
proc pow*(_: typedesc[torch]; self: Tensor, exponent: float): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::pow", self.tensor, exponent).to(ATensor)
proc native_zero_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_zero_", self.tensor).to(ATensor)
proc native_zero_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_zero_", self.tensor).to(ATensor)
proc zero_u*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("zero_").to(ATensor)
proc zero_u*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("zero_", self.tensor).to(ATensor)
proc zero_u*(_: typedesc[torch]; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::zero_", self.tensor).to(ATensor)
proc sub_out*(ty: TensorType; aresult: Tensor, self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sub_out", aresult.tensor, self.tensor, other.tensor, alpha).to(ATensor)
proc sub_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sub_out", aresult.tensor, self.tensor, other.tensor, alpha).to(ATensor)
proc sub*(self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sub", other.tensor, alpha).to(ATensor)
proc sub*(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sub", self.tensor, other.tensor, alpha).to(ATensor)
proc sub*(_: typedesc[torch]; self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sub", self.tensor, other.tensor, alpha).to(ATensor)
proc sub_u*(self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sub_", other.tensor, alpha).to(ATensor)
proc sub_u*(ty: TensorType; self: Tensor, other: Tensor, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sub_", self.tensor, other.tensor, alpha).to(ATensor)
proc sub*(self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sub", other, alpha).to(ATensor)
proc sub*(ty: TensorType; self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sub", self.tensor, other, alpha).to(ATensor)
proc sub*(_: typedesc[torch]; self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::sub", self.tensor, other, alpha).to(ATensor)
proc sub_u*(self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sub_", other, alpha).to(ATensor)
proc sub_u*(ty: TensorType; self: Tensor, other: float, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sub_", self.tensor, other, alpha).to(ATensor)
proc s_native_addmm_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("s_native_addmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc s_native_addmm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::s_native_addmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc s_native_addmm*(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc s_native_addmm*(_: typedesc[torch]; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::s_native_addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc s_native_addmm_u*(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc s_native_addmm_u*(_: typedesc[torch]; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::s_native_addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc addmm_out*(ty: TensorType; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc addmm_out*(_: typedesc[torch]; aresult: Tensor, self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addmm_out", aresult.tensor, self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc addmm*(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addmm", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc addmm*(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc addmm*(_: typedesc[torch]; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::addmm", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc addmm_u*(self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("addmm_", mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc addmm_u*(ty: TensorType; self: Tensor, mat1: Tensor, mat2: Tensor, beta: float = 1, alpha: float = 1): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("addmm_", self.tensor, mat1.tensor, mat2.tensor, beta, alpha).to(ATensor)
proc native_tensor*(ty: TensorType; self_ty: TensorType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_tensor", self_ty).to(ATensor)
proc native_tensor*(_: typedesc[torch]; self_ty: TensorType): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_tensor", self_ty).to(ATensor)
proc native_tensor*(ty: TensorType; self_ty: TensorType, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_tensor", self_ty, size).to(ATensor)
proc native_tensor*(_: typedesc[torch]; self_ty: TensorType, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::native_tensor", self_ty, size).to(ATensor)
proc tensor*(ty: TensorType; dtype: TensorType): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tensor", dtype).to(ATensor)
proc tensor*(ty: TensorType; dtype: TensorType, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("tensor", dtype, size).to(ATensor)
proc native_sparse_coo_tensor*(ty: TensorType; indices: Tensor, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor)
proc native_sparse_coo_tensor*(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("native_sparse_coo_tensor", indices.tensor, values.tensor, size).to(ATensor)
proc sparse_coo_tensor*(ty: TensorType; indices: Tensor, values: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sparse_coo_tensor", indices.tensor, values.tensor).to(ATensor)
proc sparse_coo_tensor*(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sparse_coo_tensor", indices.tensor, values.tensor, size).to(ATensor)
proc u_native_sparse_coo_tensor_unsafe*(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_native_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size).to(ATensor)
proc u_sparse_coo_tensor_unsafe*(ty: TensorType; indices: Tensor, values: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size).to(ATensor)
proc u_sparse_coo_tensor_unsafe*(_: typedesc[torch]; indices: Tensor, values: Tensor, size: IntList): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::_sparse_coo_tensor_unsafe", indices.tensor, values.tensor, size).to(ATensor)
proc sparse_raw_resize_u*(self: Tensor, size: IntList, sparseDims: int64, denseDims: int64): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("sparse_raw_resize_", size, sparseDims, denseDims).to(ATensor)
proc sparse_raw_resize_u*(ty: TensorType; self: Tensor, size: IntList, sparseDims: int64, denseDims: int64): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("sparse_raw_resize_", self.tensor, size, sparseDims, denseDims).to(ATensor)
proc u_sparse_mask*(self: Tensor, mask: ASparseTensorRef): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_sparse_mask", mask).to(ATensor)
proc u_sparse_mask*(ty: TensorType; self: Tensor, mask: ASparseTensorRef): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_sparse_mask", self.tensor, mask).to(ATensor)
proc to_dense*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("to_dense").to(ATensor)
proc to_dense*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("to_dense", self.tensor).to(ATensor)
proc u_sparseDims*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("_sparseDims").to(int64)
proc u_sparseDims*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("_sparseDims", self.tensor).to(int64)
proc u_dimI*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("_dimI").to(int64)
proc u_dimI*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("_dimI", self.tensor).to(int64)
proc u_denseDims*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("_denseDims").to(int64)
proc u_denseDims*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("_denseDims", self.tensor).to(int64)
proc u_dimV*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("_dimV").to(int64)
proc u_dimV*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("_dimV", self.tensor).to(int64)
proc u_nnz*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("_nnz").to(int64)
proc u_nnz*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("_nnz", self.tensor).to(int64)
proc coalesce*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("coalesce").to(ATensor)
proc coalesce*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("coalesce", self.tensor).to(ATensor)
proc is_coalesced*(self: Tensor): bool {.inline, noinit.} = self.tensor.dynamicCppCall("is_coalesced").to(bool)
proc is_coalesced*(ty: TensorType; self: Tensor): bool {.inline, noinit.} = ty.dynamicCppCall("is_coalesced", self.tensor).to(bool)
proc u_indices*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_indices").to(ATensor)
proc u_indices*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_indices", self.tensor).to(ATensor)
proc u_values*(self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor self.tensor.dynamicCppCall("_values").to(ATensor)
proc u_values*(ty: TensorType; self: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("_values", self.tensor).to(ATensor)
proc hspmm_out*(ty: TensorType; aresult: Tensor, mat1: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hspmm_out", aresult.tensor, mat1.tensor, mat2.tensor).to(ATensor)
proc hspmm_out*(_: typedesc[torch]; aresult: Tensor, mat1: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hspmm_out", aresult.tensor, mat1.tensor, mat2.tensor).to(ATensor)
proc hspmm*(ty: TensorType; mat1: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("hspmm", mat1.tensor, mat2.tensor).to(ATensor)
proc hspmm*(_: typedesc[torch]; mat1: Tensor, mat2: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::hspmm", mat1.tensor, mat2.tensor).to(ATensor)
proc raw_copy_sparse_u*(ty: TensorType; self: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("raw_copy_sparse_", self.tensor, src.tensor).to(ATensor)
proc raw_copy_sparse_u*(_: typedesc[torch]; self: Tensor, src: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::raw_copy_sparse_", self.tensor, src.tensor).to(ATensor)
proc numel*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("numel").to(int64)
proc numel*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("numel", self.tensor).to(int64)
proc numel*(_: typedesc[torch]; self: Tensor): int64 {.inline, noinit.} = dynamicCCall("at::numel", self.tensor).to(int64)
proc unbind*(self: Tensor, dim: int64 = 0): TensorList {.inline, noinit.} = self.tensor.dynamicCppCall("unbind", dim).to(TensorList)
proc unbind*(ty: TensorType; self: Tensor, dim: int64 = 0): TensorList {.inline, noinit.} = ty.dynamicCppCall("unbind", self.tensor, dim).to(TensorList)
proc unbind*(_: typedesc[torch]; self: Tensor, dim: int64 = 0): TensorList {.inline, noinit.} = dynamicCCall("at::unbind", self.tensor, dim).to(TensorList)
proc native_get_device*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("native_get_device", self.tensor).to(int64)
proc native_get_device*(_: typedesc[torch]; self: Tensor): int64 {.inline, noinit.} = dynamicCCall("at::native_get_device", self.tensor).to(int64)
proc get_device*(self: Tensor): int64 {.inline, noinit.} = self.tensor.dynamicCppCall("get_device").to(int64)
proc get_device*(ty: TensorType; self: Tensor): int64 {.inline, noinit.} = ty.dynamicCppCall("get_device", self.tensor).to(int64)
proc get_device*(_: typedesc[torch]; self: Tensor): int64 {.inline, noinit.} = dynamicCCall("at::get_device", self.tensor).to(int64)
proc meshgrid*(ty: TensorType; tensors: TensorList): TensorList {.inline, noinit.} = ty.dynamicCppCall("meshgrid", tensors).to(TensorList)
proc meshgrid*(_: typedesc[torch]; tensors: TensorList): TensorList {.inline, noinit.} = dynamicCCall("at::meshgrid", tensors).to(TensorList)
proc u_local_scalar*(self: Tensor): float {.inline, noinit.} = self.tensor.dynamicCppCall("_local_scalar").to(float)
proc u_local_scalar*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("_local_scalar", self.tensor).to(float)
proc u_local_scalar*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::_local_scalar", self.tensor).to(float)
proc u_local_scalar_dense*(ty: TensorType; self: Tensor): float {.inline, noinit.} = ty.dynamicCppCall("_local_scalar_dense", self.tensor).to(float)
proc u_local_scalar_dense*(_: typedesc[torch]; self: Tensor): float {.inline, noinit.} = dynamicCCall("at::_local_scalar_dense", self.tensor).to(float)
proc u_thnn_fused_lstm_cell*(ty: TensorType; input_gates: Tensor, hidden_gates: Tensor, cx: Tensor, input_bias: Tensor, hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc u_thnn_fused_lstm_cell*(_: typedesc[torch]; input_gates: Tensor, hidden_gates: Tensor, cx: Tensor, input_bias: Tensor, hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_thnn_fused_lstm_cell", input_gates.tensor, hidden_gates.tensor, cx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc u_thnn_fused_lstm_cell_backward*(ty: TensorType; grad_hy: Tensor, grad_cy: Tensor, cx: Tensor, cy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
  result.result4 = newTensor tupleRes[4]
proc u_thnn_fused_lstm_cell_backward*(_: typedesc[torch]; grad_hy: Tensor, grad_cy: Tensor, cx: Tensor, cy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_thnn_fused_lstm_cell_backward", grad_hy.tensor, grad_cy.tensor, cx.tensor, cy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
  result.result4 = newTensor tupleRes[4]
proc u_thnn_fused_gru_cell*(ty: TensorType; input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_thnn_fused_gru_cell*(_: typedesc[torch]; input_gates: Tensor, hidden_gates: Tensor, hx: Tensor, input_bias: Tensor, hidden_bias: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_thnn_fused_gru_cell", input_gates.tensor, hidden_gates.tensor, hx.tensor, input_bias.tensor, hidden_bias.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc u_thnn_fused_gru_cell_backward*(ty: TensorType; grad_hy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
  result.result4 = newTensor tupleRes[4]
proc u_thnn_fused_gru_cell_backward*(_: typedesc[torch]; grad_hy: Tensor, workspace: Tensor, has_bias: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor, result3: Tensor, result4: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::_thnn_fused_gru_cell_backward", grad_hy.tensor, workspace.tensor, has_bias).to(StdTuple5[ATensor, ATensor, ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
  result.result3 = newTensor tupleRes[3]
  result.result4 = newTensor tupleRes[4]
proc lstm*(ty: TensorType; input: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("lstm", input.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc lstm*(_: typedesc[torch]; input: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::lstm", input.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc lstm*(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("lstm", data.tensor, batch_sizes.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc lstm*(_: typedesc[torch]; data: Tensor, batch_sizes: Tensor, hx: TensorList, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor, result2: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::lstm", data.tensor, batch_sizes.tensor, hx, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple3[ATensor, ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
  result.result2 = newTensor tupleRes[2]
proc gru*(ty: TensorType; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("gru", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc gru*(_: typedesc[torch]; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::gru", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc gru*(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("gru", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc gru*(_: typedesc[torch]; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::gru", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_tanh*(ty: TensorType; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("rnn_tanh", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_tanh*(_: typedesc[torch]; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::rnn_tanh", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_tanh*(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_tanh*(_: typedesc[torch]; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::rnn_tanh", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_relu*(ty: TensorType; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("rnn_relu", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_relu*(_: typedesc[torch]; input: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool, batch_first: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::rnn_relu", input.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional, batch_first).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_relu*(ty: TensorType; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc rnn_relu*(_: typedesc[torch]; data: Tensor, batch_sizes: Tensor, hx: Tensor, params: TensorList, has_biases: bool, num_layers: int64, dropout: float64, train: bool, bidirectional: bool): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::rnn_relu", data.tensor, batch_sizes.tensor, hx.tensor, params, has_biases, num_layers, dropout, train, bidirectional).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc lstm_cell*(ty: TensorType; input: Tensor, hx: TensorList, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = ty.dynamicCppCall("lstm_cell", input.tensor, hx, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc lstm_cell*(_: typedesc[torch]; input: Tensor, hx: TensorList, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): tuple[result0: Tensor, result1: Tensor] {.inline, noinit.} = 
  let tupleRes = dynamicCCall("at::lstm_cell", input.tensor, hx, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(StdTuple2[ATensor, ATensor]).toNimTuple()
  result.result0 = newTensor tupleRes[0]
  result.result1 = newTensor tupleRes[1]
proc gru_cell*(ty: TensorType; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor)
proc gru_cell*(_: typedesc[torch]; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::gru_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor)
proc rnn_tanh_cell*(ty: TensorType; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor)
proc rnn_tanh_cell*(_: typedesc[torch]; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rnn_tanh_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor)
proc rnn_relu_cell*(ty: TensorType; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor ty.dynamicCppCall("rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor)
proc rnn_relu_cell*(_: typedesc[torch]; input: Tensor, hx: Tensor, w_ih: Tensor, w_hh: Tensor, b_ih: Tensor, b_hh: Tensor): Tensor {.inline, noinit.} = 
  result = newTensor dynamicCCall("at::rnn_relu_cell", input.tensor, hx.tensor, w_ih.tensor, w_hh.tensor, b_ih.tensor, b_hh.tensor).to(ATensor)
