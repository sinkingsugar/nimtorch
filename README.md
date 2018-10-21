![NimTorch](media/NimTorchBanner.png)

| Master | Release |  |
|-------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [![Build Status](https://travis-ci.com/fragcolor-xyz/nimtorch.svg?branch=master)  ](https://travis-ci.com/fragcolor-xyz/nimtorch  ) | [![Build Status](https://travis-ci.com/fragcolor-xyz/nimtorch.svg?branch=release)  ](https://travis-ci.com/fragcolor-xyz/nimtorch  ) | [![Join the chat at https://gitter.im/nimtorch/Lobby](https://badges.gitter.im/nimtorch/Lobby.svg)  ](https://gitter.im/nimtorch/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge  ) |


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
- [x] Autograd
- [ ] Add missing derivatives
- [ ] More high level pytorch API (Module, Models etc)
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

## Getting started

### Requirements

**Linux**: blas and lapack libraries (if you have numpy, pytorch etc you most likely already have those)

### Super easy, using conda

*Linux, macOS and Windows*

`conda create -n nimtorch -c fragcolor nimtorch` (add `cuda10.0` for cuda 10 linux only or add `wasm` for wasm version)

`source activate nimtorch` or on windows: `conda activate nimtorch`

This will install: nim and ATen binaries, fragments and nimtorch all in one command, nothing else needed.

Make sure you use a recent version of conda and have a compiler installed in your system, on windows you have to add `--cc:vcc` and be on a developer prompt.

Make sure your system is recent (ubuntu 18.04 reference / macOS High Sierra / Windows 10) and you have cuda 9.2 installed (if you need cuda, linux only, more cuda versions coming, please open a issue if you need a specific version).

Test with with something like:

`nim cpp -o:test -r $ATEN/dist/pkgs/nimtorch-\#head/tests/test_xor.nim`

or on windows... (because dlls need to be side by side)

`nim cpp -o:%ATEN%/lib/test.exe -r %ATEN%/dist/pkgs/nimtorch-#head/tests/test_xor.nim`

### Semi manual way

*Linux, macOS and Windows*

Check what version of ATen/PyTorch we need in `conda/nimtorch/meta.yaml` - should be something like `aten ==2018.10.10.1089`

Note the version as you will need it in the next step

`conda create -n aten -c fragcolor aten={version}`

or

**WASM**

`conda create -n aten -c fragcolor aten={version} wasm`

or Cuda 10.0 (linux only)

`conda create -n aten -c fragcolor aten={version} cuda10.0`

activate aten environment

`source activate aten` or on windows: `conda activate aten`

1. Make sure you have a recent Nim and Nimble version in your path
  * [Easy option: install nim with choosenim](https://github.com/dom96/choosenim)
    * `choosenim devel`
2. clone the **release** branch `git clone -b release https://github.com/fragcolor-xyz/nimtorch.git`
3. `cd nimtorch`
4. `nimble develop`

*finally*

run self test `nim cpp -o:test -r torch.nim` (use `-o:%ATEN%/lib/test.exe` instead on windows because of dll location)

in the case of WASM:

run self test `nim cpp -d:wasm -o:test.js torch.nim && node test.js` (needs node.js)

### Manual way without requiring conda
**Build ATEN**
```sh
pip2 install pyyaml typing
git clone -b fragcolor-devel https://github.com/fragcolor-xyz/pytorch.git
cd pytorch
git reset --hard <commit hash> # from torch/commit.txt
git submodule update --init
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DUSE_CUDA=OFF -DBUILD_ATEN_ONLY=ON -DCMAKE_INSTALL_PREFIX=`pwd`/output ../
make -j4
make install
```
**Test the build**
```
cd <nimtorch repo>
ATEN=<installation path of ATEN> nim cpp -r -f -o:/tmp/z01 torch.nim # for eg: ATEN=pathto/pytorch/build/output/
```

## Notes

* We suggest setting `OMP_WAIT_POLICY` environment variable to `PASSIVE` when running on CPU.
