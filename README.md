# NimTorch

Pytorch - Py + Nim

A pytorch's nim frontend.

Aiming to be mostly auto-generated, internally using ATen.

**Because nim compiles into cpp, this is not a wrapper or binding library, this is 1:1 ATen bare metal**

The only requirement from pytorch is ATens core tensor library, because of this nimtorch is extremely versatible and can compile on any kind of device.

## Current status

**Early stage**

- [x] Automatically generated, from `Declarations.yaml`, the full ATen's API
- [x] Cuda support
- [x] WASM support
- [x] Automatically generated, from `derivatives.yaml`, gradient procs
- [ ] Add missing derivatives
- [ ] Autograd
- [ ] High level pytorch API (Module, Models etc)
- [ ] ...

The final aim is to be as compatible as possible with the pytorch API

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
  gi = x.matmul(w_input.()) + b_input
  gh = hidden.matmul(w_recur.t()) + b_recur
  (i_r, i_i, i_nn) = gi.chunk(3, 1)
  (h_r, h_i, h_n)  = gh.chunk(3, 1)
  resetgate = (i_r + h_r).sigmoid()
  inputgate = torch.sigmoid(i_i + h_i)
  newgate = (i_nn + resetgate * h_n).tanh()
  hy = newgate + inputgate * (hidden - newgate)
```

also python is a renown mess...

![python mess](https://camo.githubusercontent.com/953249a42e8fe655a8c1fdfe80744a42b4d25723/68747470733a2f2f696d67732e786b63642e636f6d2f636f6d6963732f707974686f6e5f656e7669726f6e6d656e742e706e67)

## Getting started

Make sure you have a recent nim version and nimble in your path

`nimble install nimtorch`

*or*

1. clone this repo
2. `cd nimtorch`
3. `nimble develop`
4. set $ATEN environment variable to point at ATens folder (see instructions under)
5. (optional) run self test `nim cpp -r torch.nim`

## ATen's build instructions

Windows was tested and works, instructions should be similar to linux.

**Linux only**

### Easy way

*Build ATen libraries, in this example for cuda8/ubuntu16.04 kind of system (will work on other distros as well)*

1. Make sure you have a system with docker installed
2. `cd docker && cd docker-cuda8-ubuntu16.04`
3. `docker build -t aten_cuda8_ubuntu16lts .`
4. `docker run --name aten_cuda8_ubuntu16lts-temp -d aten_cuda8_ubuntu16lts /bin/bash`
5. `docker cp aten_cuda8_ubuntu16lts-temp:/root/pytorch/aten/built/output output`
6. `docker rm aten_cuda8_ubuntu16lts-temp`
7. Profit your *output* folder
  
### Hard way

1. Check content of dockerfiles for requirements and cmake command

To build a *wasm* version you this might be helpful:
```shell
emconfigure cmake -DUSE_CUDA=OFF -Wno-deprecated -DCMAKE_BUILD_TYPE=Release -DCAFFE2_CMAKE_BUILDING_WITH_MAIN_REPO=OFF -DCMAKE_C_FLAGS="-Wno-implicit-function-declaration -DEMSCRIPTEN -s DISABLE_EXCEPTION_CATCHING=0" -DCMAKE_CXX_FLAGS="-Wno-implicit-function-declaration -DEMSCRIPTEN -s DISABLE_EXCEPTION_CATCHING=0" -DCMAKE_INSTALL_PREFIX=`pwd`/output ../

emmake make
```


