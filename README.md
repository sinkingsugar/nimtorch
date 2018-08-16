# NimTorch

Pytorch - Py + Nim

A pytorch's nim port.

Aiming to be mostly auto-generated, internally using ATen.

## Why

## Build instructions

**Linux only**

### Easy way

1. Build ATen libraries
  1. Make sure you have a system with docker installed
  2. Run: `cd docker ; docker build -t aten .
  3. Spin container and copy artifiacts #TODO
  
### Hard way

1. Check contents of `docker/Dockerfile` for requirements and cmake command