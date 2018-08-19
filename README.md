# NimTorch

Pytorch - Py + Nim

A pytorch's nim frontend.

Aiming to be mostly auto-generated, internally using ATen.

## Current status

- [x] Automatically generated, from `Declarations.yaml`, the full ATen's API
- [x] Cuda support
- [x] WASM support
- [ ] Automatically generated, from `derivatives.yaml`, gradient procs
- [ ] Autograd
- [ ] ...

The final aim is to be as compatible as possible with the pytorch API
 
## Why

Ease of use of the python language while keeping fully bare metal native C++ performance

### Python code

```python

```

### Nim code

```nimrod

```

also python is a renown mess...

![python mess](https://camo.githubusercontent.com/953249a42e8fe655a8c1fdfe80744a42b4d25723/68747470733a2f2f696d67732e786b63642e636f6d2f636f6d6963732f707974686f6e5f656e7669726f6e6d656e742e706e67)

## Build instructions

Windows was tested and works, instructions should be similar to linux.

**Linux only**

### Easy way

1. Build ATen libraries
  1. Make sure you have a system with docker installed
  2. Run: `cd docker ; docker build -t aten .
  3. Spin container and copy artifiacts #TODO
  
### Hard way

1. Check contents of `docker/Dockerfile` for requirements and cmake command


