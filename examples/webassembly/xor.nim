import ../../torch
import ../../torch/[nn, optim]

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

# At this point we want to notify the JS side that we are ready to work!
EM_ASM("torchLoaded()")

proc xor_run() {.exportTorch.} =
  let
    loss_fn = nn.MSELoss()
    optimizer = optim.SGD(fc1.parameters & fc2.parameters , lr = 0.01, momentum = 0.1)

  for i in 0 ..< 50000:
    withScratchRegion:
      optimizer.zero_grad()
    
      let predictions = inputs.fc1.relu.fc2.sigmoid
    
      let loss = loss_fn(predictions, targets)
      loss.backward()
      optimizer.step()
    
      if i mod 5000 == 0:
        print(loss)

proc activate(input, output: var openarray[float32]) {.exportTorch.} =
  withScratchRegion:
    let 
      inputTensor = toTensor(input, input.len)
      prediction = inputTensor.fc1.relu.fc2.sigmoid
    
    for i in 0..<output.len:
      output[i] = prediction[i]
