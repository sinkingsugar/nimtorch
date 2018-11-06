# Package

version     = "0.2.2"
author      = "Giovanni Petrantoni"
description = "A nim flavor of pytorch"
license     = "MIT"
skipDirs    = @["docker", "media", "conda", "bin", "scripts"]
skipFiles   = @[".gitlab-ci.yml", ".travis.yml"]

# Deps

requires "nim >= 0.19.1"
requires "fragments >= 0.1.23"

task test, "Run cpu tests":
  exec """nim cpp -r -o:test torch/generator.nim"""
  exec """nim cpp --define:useRealtimeGC -r -o:test torch"""
  exec """nim cpp --define:useRealtimeGC -d:release -r -o:test torch"""
  exec """nim cpp --define:useRealtimeGC -r -o:test torch/nn/modules.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release -r -o:test torch/nn/modules.nim"""
  exec """nim cpp --define:useRealtimeGC -r -o:test torch/nn/init.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release -r -o:test torch/nn/init.nim"""
  exec """nim cpp --define:useRealtimeGC -r -o:test torch/nn/functional.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release -r -o:test torch/nn/functional.nim"""
  exec """nim cpp --define:useRealtimeGC -r -o:test tests/test_autograd.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release -r -o:test tests/test_autograd.nim"""
  exec """nim cpp --define:useRealtimeGC -r -o:test tests/test_xor.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release -r -o:test tests/test_xor.nim"""

task test_wasm, "Run wasm tests":
  exec """nim cpp -r -o:test torch/generator.nim"""
  exec """nim cpp -d:release -d:wasm -o:test.js torch && node test.js"""
  exec """nim cpp -d:release -d:wasm -o:test.js torch/nn/modules.nim && node test.js"""
  exec """nim cpp -d:release -d:wasm -o:test.js torch/nn/init.nim && node test.js"""
  exec """nim cpp -d:release -d:wasm -o:test.js torch/nn/functional.nim && node test.js"""
  exec """nim cpp -d:release -d:wasm -o:test.js tests/test_autograd.nim && node test.js"""
  exec """nim cpp -d:release -d:wasm -o:test.js tests/test_xor.nim && node test.js"""

task test_cuda, "Run cuda gpu tests":
  exec """nim cpp -r -o:test torch/generator.nim"""
  exec """nim cpp -r -o:test -d:cuda torch"""
  exec """nim cpp -d:release -r -o:test -d:cuda torch"""
  exec """nim cpp -r -o:test -d:cuda torch/nn/modules.nim"""
  exec """nim cpp -d:release -r -o:test -d:cuda torch/nn/modules.nim"""
  exec """nim cpp -r -o:test -d:cuda torch/nn/init.nim"""
  exec """nim cpp -d:release -r -o:test -d:cuda torch/nn/init.nim"""
  exec """nim cpp -r -o:test -d:cuda torch/nn/functional.nim"""
  exec """nim cpp -d:release -r -o:test -d:cuda torch/nn/functional.nim"""
  exec """nim cpp -r -o:test -d:cuda tests/test_autograd.nim"""
  exec """nim cpp -d:release -r -o:test -d:cuda tests/test_autograd.nim"""
  exec """nim cpp -r -o:test -d:cuda tests/test_xor.nim"""
  exec """nim cpp -d:release -r -o:test -d:cuda tests/test_xor.nim"""

task test_clang, "Run clang tests":
  exec """nim cpp -r -o:test torch/generator.nim"""
  exec """nim cpp --define:useRealtimeGC --cc:clang -r -o:test torch"""
  exec """nim cpp --define:useRealtimeGC -d:release --cc:clang -r -o:test torch"""
  exec """nim cpp --define:useRealtimeGC --cc:clang -r -o:test torch/nn/modules.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release --cc:clang -r -o:test torch/nn/modules.nim"""
  exec """nim cpp --define:useRealtimeGC --cc:clang -r -o:test torch/nn/init.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release --cc:clang -r -o:test torch/nn/init.nim"""
  exec """nim cpp --define:useRealtimeGC --cc:clang -r -o:test torch/nn/functional.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release --cc:clang -r -o:test torch/nn/functional.nim"""
  exec """nim cpp --define:useRealtimeGC --cc:clang -r -o:test tests/test_autograd.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release --cc:clang -r -o:test tests/test_autograd.nim"""
  exec """nim cpp --define:useRealtimeGC --cc:clang -r -o:test tests/test_xor.nim"""
  exec """nim cpp --define:useRealtimeGC -d:release --cc:clang -r -o:test tests/test_xor.nim"""

task test_clang_cuda, "Run clang cuda gpu tests":
  exec """nim cpp -r -o:test torch/generator.nim"""
  exec """nim cpp --cc:clang -r -o:test -d:cuda torch"""
  exec """nim cpp -d:release --cc:clang -r -o:test -d:cuda torch"""
  exec """nim cpp --cc:clang -r -o:test -d:cuda torch/nn/modules.nim"""
  exec """nim cpp -d:release --cc:clang -r -o:test -d:cuda torch/nn/modules.nim"""
  exec """nim cpp --cc:clang -r -o:test -d:cuda torch/nn/init.nim"""
  exec """nim cpp -d:release --cc:clang -r -o:test -d:cuda torch/nn/init.nim"""
  exec """nim cpp --cc:clang -r -o:test -d:cuda torch/nn/functional.nim"""
  exec """nim cpp -d:release --cc:clang -r -o:test -d:cuda torch/nn/functional.nim"""
  exec """nim cpp --cc:clang -r -o:test -d:cuda tests/test_autograd.nim"""
  exec """nim cpp -d:release --cc:clang -r -o:test -d:cuda tests/test_autograd.nim"""
  exec """nim cpp --cc:clang -r -o:test -d:cuda tests/test_xor.nim"""
  exec """nim cpp -d:release --cc:clang -r -o:test -d:cuda tests/test_xor.nim"""