when defined wasm:
  {.emit: """/*INCLUDESECTION*/
  #include <emscripten.h>
  """.}
  {.pragma: exportTorch, codegendecl: """extern "C" $# EMSCRIPTEN_KEEPALIVE $#$#""", exportc.}
  proc wasm_ready() {.exportTorch.} =
    {.emit: "EM_ASM(torchLoaded());".}
  wasm_ready()
else:
  {.pragma: exportTorch, exportc.}

import ../../torch
import ../../torch/[nn, optim]

proc xor_run() {.exportTorch.} =
  let inputs = torch.tensor([
    [0.0, 0.0],
    [0.0, 1.0],
    [1.0, 0.0],
    [1.0, 1.0],
  ])
  
  let targets = torch.tensor([
    [0.0],
    [1.0],
    [1.0],
    [0.0],
  ])
  
  let
    fc1 = nn.Linear(2, 4)
    fc2 = nn.Linear(4, 1)
    loss_fn = nn.MSELoss()
    optimizer = optim.SGD(fc1.parameters & fc2.parameters , lr = 0.01, momentum = 0.1)
  
  set_num_threads(1)
  
  for i in 0 ..< 50000:
    optimizer.zero_grad()
  
    let predictions = inputs.fc1.relu.fc2.sigmoid
  
    let loss = loss_fn(predictions, targets)
    loss.backward()
    optimizer.step()
  
    if i mod 5000 == 0:
      print(loss)
  