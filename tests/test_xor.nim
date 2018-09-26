import torch
import torch/[nn, optim]

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

when defined gperftools:
  discard ProfilerStart("test_xor.log")

for i in 0 ..< 50000:
  optimizer.zero_grad()

  let predictions = inputs.fc1.relu.fc2.sigmoid

  let loss = loss_fn(predictions, targets)
  loss.backward()
  discard optimizer.step()

  if i mod 5000 == 0:
    print(loss)

when defined gperftools:
  ProfilerStop()
