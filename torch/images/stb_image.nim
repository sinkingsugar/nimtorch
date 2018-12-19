
import fragments/ffi/cpp
import os

const path = currentSourcePath().parentDir
cppincludes(path & "")

{.emit: """/*INCLUDESECTION*/
#define STB_IMAGE_IMPLEMENTATION
#include <stb_image.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
//#define STBI_MSC_SECURE_CRT
#include <stb_image_write.h>
""".}

type
  Image* = object
    width*: int
    height*: int
    channels*: int
    data*: ptr UncheckedArray[uint8]

proc load*(fileName: string; desiredChannels: int = 0): Image =
  var x, y, c: cint
  result.data = dynamicCCall("stbi_load", fileName.cstring, addr x, addr y, addr c, desiredChannels.cint).to(ptr UncheckedArray[uint8])
  result.width = x
  result.height = y
  result.channels = c

  if result.data == nil:
    raise newException(IOError, "Error while lading image.")

proc write_jpg*(filename: string; width, height, channels: int, data: pointer; quality: int) =
  if 0 == dynamicCCall("stbi_write_jpg", filename.cstring, width.cint, height.cint, channels.cint, data, quality.cint).to(cint):
    raise newException(IOError, "Error while writing image.")

proc free*(image: Image) =
  dynamicCCall("stbi_image_free", cast[pointer](image.data)).to(void)

when isMainModule:
  let image = load("images/input/chicago.jpg", 3)
  echo image.width
  echo image.height
  echo image.channels
  write_jpg("images/input/chicago2.jpg", image.width, image.height, image.channels, image.data, 90)
  image.free()
