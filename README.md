# NimTorch

Pytorch - Py + Nim

A Nim frontend for pytorch, aiming to be mostly auto-generated and internally using ATen.

**Because Nim compiles to C++, this is not a wrapper or binding library. It generates 1-to-1 native ATen code.**

The only requirement from pytorch is ATen's core tensor library. Because of this, nimtorch is extremely versatile and can compile on any kind of device.

## Current status

**Early stage**

- [x] Automatically generated, from `Declarations.yaml`, the full ATen API
- [x] Cuda support ( add -d:cuda when compiling with nim )
- [x] WASM support ( add -d:wasm when compiling with nim )
- [x] Automatically generated, from `derivatives.yaml`, gradient procs
- [ ] Add missing derivatives
- [ ] Autograd
- [ ] High level pytorch API (Module, Models etc)
- [ ] ...

The final aim is to be as compatible as possible with the pytorch API.

## Why

Ease of use of the python language while keeping fully bare metal native C++ performance

### Python code

```python
# GRUCell
gi = x.matmul(w_input.t()) + b_input
gh = hidden.matmul(w_recur.t()) + b_recur
i_r, i_i, i_n = gi.chunk(3, 1)
h_r, h_i, h_n = gh.chunk(3, 1)
resetgate = (i_r + h_r).sigmoid()
inputgate = torch.sigmoid(i_i + h_i)
newgate = (i_n + resetgate * h_n).tanh()
hy = newgate + inputgate * (hidden - newgate)
```

### Nim code

```nimrod
# GRUCell
let
  gi = x.matmul(w_input.t()) + b_input
  gh = hidden.matmul(w_recur.t()) + b_recur
  (i_r, i_i, i_nn) = gi.chunk(3, 1)
  (h_r, h_i, h_n)  = gh.chunk(3, 1)
  resetgate = (i_r + h_r).sigmoid()
  inputgate = torch.sigmoid(i_i + h_i)
  newgate = (i_nn + resetgate * h_n).tanh()
  hy = newgate + inputgate * (hidden - newgate)
```

Also python is a complete mess...

![python mess](https://camo.githubusercontent.com/953249a42e8fe655a8c1fdfe80744a42b4d25723/68747470733a2f2f696d67732e786b63642e636f6d2f636f6d6963732f707974686f6e5f656e7669726f6e6d656e742e706e67)

## Getting started

Make sure you have a recent Nim version and Nimble in your path

`nimble install nimtorch`

*or*

1. clone this repo
2. `cd nimtorch`
3. `nimble develop`

*finally*

1. set `$ATEN` environment variable to point to ATen's folder (see instructions below)
2. (optional) run self test `nim cpp -r nimtorch.nim`

## ATen build instructions

*Windows was tested and works, instructions should be similar to linux.*

**Linux**

### Easy way

*Build ATen libraries, in this example for a native linux system (will work on other distros as well, as long as core libs are up-to-date)*

1. Make sure you have a system with docker installed
2. `cd docker && cd docker-aten-native`
3. `docker build -t docker_aten_native .`
4. `docker run --name docker_aten_native-temp -d docker_aten_native /bin/bash`
5. `docker cp docker_aten_native-temp:/root/pytorch/aten/built/output output`
6. `docker rm docker_aten_native-temp`
7. Retrieve the *output* folder
  
### Hard way

1. Check content of dockerfiles for requirements and cmake command
