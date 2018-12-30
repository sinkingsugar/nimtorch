import fragments/buildandrun

when defined wasm:
  echo "Injecting wasm options"
  echo "If the build fails make sure emcc is in your path, on linux you might have to run:"
  echo "source /etc/profile.d/emscripten.sh"

  switch("cc", "clang")
  switch("os", "linux")
  switch("cpu", "i386")
  switch("define", "emscripten")
  switch("clang.exe", "emcc")
  switch("clang.cpp.exe", "em++")
  switch("clang.linkerexe", "emcc")
  switch("clang.cpp.linkerexe", "em++")

  when defined release:
    # TODO - add -s USE_PTHREADS=1
    switch("clang.options.always", "-std=c++14 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=1")
    switch("clang.options.linker", "-s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=1")
    switch("clang.cpp.options.always", "-std=c++14 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=1")
    switch("clang.cpp.options.linker", "-s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=1")
  else:
    switch("clang.options.always", "-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=0")
    switch("clang.options.linker", "-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=0")
    switch("clang.cpp.options.always", "-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -std=c++14 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=0")
    switch("clang.cpp.options.linker", "-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=1 -s DISABLE_EXCEPTION_CATCHING=0")

when defined pytorch:
  let hasNimPy {.compiletime.} = buildandrun:
    import nimpy
    let torch = pyImport("torch")
    echo "Done"

  when hasNimPy.exitCode == 0 and hasNimPy.output == "Done":
    echo "Compiling with nimpy support"
    switch("define", "hasPytorch")
  else:
    echo "Failed to load nimpy or pytorch"
    echo hasNimPy.output
    assert false

task torch, "Custom ntorch build":
  setCommand "cpp"