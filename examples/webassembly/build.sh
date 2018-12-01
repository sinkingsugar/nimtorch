nim torch -d:wasm -d:useRealtimeGC -d:nimtorchGcUs=1000000 -o:xor.js xor.nim
# /home/sugar/develop/Nim/bin/nim torch -d:wasm --gc:destructors -o:xor.js xor.nim