# Package

version     = "0.2.0"
author      = "Giovanni Petrantoni"
description = "A nim flavor of pytorch"
license     = "MIT"
skipDirs    = @["docker"]
skipFiles   = @[".gitlab-ci.yml"]

# Deps

requires "nim >= 0.18.1"
requires "fragments >= 0.1.16"
