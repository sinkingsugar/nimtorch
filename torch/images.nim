import images/stb_image
import ../torch
import sequtils

proc loadImage*(fileName: string; desiredChannels: int = 0): Tensor =
  let image = load(fileName, desiredChannels)
  var data: seq[float32]
  data.setLen(image.width * image.height * image.channels)
  for i, v in data.mpairs:
    v = image.data[][i].float32
  result = data.toTensor([1, image.height, image.width, image.channels])
  result = result.permute([0, 3, 1, 2])
  image.free()

proc saveJpg*(self: Tensor; fileName: string; quality: int = 100) =
  assert(self.ndimension == 4)
  assert(self.size(0) == 1)
  assert(self.size(1) <= 4)

  let tmp = self.permute([0, 2, 3, 1]).contiguous()
  var data = tmp.toSeq(float32).map do (x: float32) -> uint8: x.uint8
  write_jpg(fileName, self.size(3), self.size(2), self.size(1), addr data[0], quality)