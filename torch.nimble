# Package

version     = "0.2.0"
author      = "Giovanni Petrantoni"
description = "A nim flavor of pytorch"
license     = "MIT"
skipDirs    = @["docker", "media", "conda", "bin"]
skipFiles   = @[".gitlab-ci.yml"]

# Deps

requires "nim >= 0.18.1"
requires "fragments >= 0.1.20"

task test, "Run cpu tests":
  exec """nimble -y install fragments"""
  exec """rm -rf nimcache"""
  exec """conda env remove -y -n nimtorch_testing | true"""
  exec """conda create -y -c fragcolor -n nimtorch_testing `cat conda/nimtorch/meta.yaml | grep -o "aten ==[12][0-9]*.[01][0-9]*.[0-3][0-9]*.[0-9]*" | sed -r "s/aten /aten/g"`"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test --nimcache:./nimcache torch/generator.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test --nimcache:./nimcache torch"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test --nimcache:./nimcache torch/nn.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test --nimcache:./nimcache torch/nn/init.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test --nimcache:./nimcache torch/nn/functional.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test --nimcache:./nimcache tests/test_autograd.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test --nimcache:./nimcache tests/test_xor.nim"""

task test_wasm, "Run cpu tests":
  exec """nimble -y install fragments"""
  exec """rm -rf nimcache"""
  exec """conda env remove -y -n nimtorch_testing | true"""
  exec """conda create -y -c fragcolor -n nimtorch_testing `cat conda/nimtorch/meta.yaml | grep -o "aten ==[12][0-9]*.[01][0-9]*.[0-3][0-9]*.[0-9]*" | sed -r "s/aten /aten/g"` wasm"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -d:release -d:wasm -o:test.js --nimcache:./nimcache torch && node test.js"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -d:release -d:wasm -o:test.js --nimcache:./nimcache torch/nn.nim && node test.js"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -d:release -d:wasm -o:test.js --nimcache:./nimcache torch/nn/init.nim && node test.js"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -d:release -d:wasm -o:test.js --nimcache:./nimcache torch/nn/functional.nim && node test.js"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -d:release -d:wasm -o:test.js --nimcache:./nimcache tests/test_autograd.nim && node test.js"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -d:release -d:wasm -o:test.js --nimcache:./nimcache tests/test_xor.nim && node test.js"""

task test_cuda92, "Run cpu tests":
  exec """nimble -y install fragments"""
  exec """rm -rf nimcache"""
  exec """conda env remove -y -n nimtorch_testing | true"""
  exec """conda create -y -c fragcolor -n nimtorch_testing `cat conda/nimtorch/meta.yaml | grep -o "aten ==[12][0-9]*.[01][0-9]*.[0-3][0-9]*.[0-9]*" | sed -r "s/aten /aten/g"`"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/generator.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/nn.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/nn/init.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/nn/functional.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache tests/test_autograd.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache tests/test_xor.nim"""

task test_cuda100, "Run cpu tests":
  exec """nimble -y install fragments"""
  exec """rm -rf nimcache"""
  exec """conda env remove -y -n nimtorch_testing | true"""
  exec """conda create -y -c fragcolor -n nimtorch_testing `cat conda/nimtorch/meta.yaml | grep -o "aten ==[12][0-9]*.[01][0-9]*.[0-3][0-9]*.[0-9]*" | sed -r "s/aten /aten/g"` cuda10.0"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/generator.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/nn.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/nn/init.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache torch/nn/functional.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache tests/test_autograd.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp -r -o:test -d:cuda --nimcache:./nimcache tests/test_xor.nim"""

task test_clang, "Run cpu tests":
  exec """nimble -y install fragments"""
  exec """rm -rf nimcache"""
  exec """conda env remove -y -n nimtorch_testing | true"""
  exec """conda create -y -c fragcolor -n nimtorch_testing `cat conda/nimtorch/meta.yaml | grep -o "aten ==[12][0-9]*.[01][0-9]*.[0-3][0-9]*.[0-9]*" | sed -r "s/aten /aten/g"`"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test --nimcache:./nimcache torch/generator.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test --nimcache:./nimcache torch"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test --nimcache:./nimcache torch/nn.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test --nimcache:./nimcache torch/nn/init.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test --nimcache:./nimcache torch/nn/functional.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test --nimcache:./nimcache tests/test_autograd.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test --nimcache:./nimcache tests/test_xor.nim"""

task test_clang_cuda, "Run cpu tests":
  exec """nimble -y install fragments"""
  exec """rm -rf nimcache"""
  exec """conda env remove -y -n nimtorch_testing | true"""
  exec """conda create -y -c fragcolor -n nimtorch_testing `cat conda/nimtorch/meta.yaml | grep -o "aten ==[12][0-9]*.[01][0-9]*.[0-3][0-9]*.[0-9]*" | sed -r "s/aten /aten/g"`"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test -d:cuda --nimcache:./nimcache torch/generator.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test -d:cuda --nimcache:./nimcache torch"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test -d:cuda --nimcache:./nimcache torch/nn.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test -d:cuda --nimcache:./nimcache torch/nn/init.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test -d:cuda --nimcache:./nimcache torch/nn/functional.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test -d:cuda --nimcache:./nimcache tests/test_autograd.nim"""
  exec """ATEN=$HOME/miniconda3/envs/nimtorch_testing nim cpp --cc:clang -r -o:test -d:cuda --nimcache:./nimcache tests/test_xor.nim"""