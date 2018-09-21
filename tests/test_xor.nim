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
  fc = nn.Linear(2, 1)
  loss_fn = nn.MSELoss()
  optimizer = optim.SGD(fc.parameters(), lr = 0.001, momentum = 0.1)

for i in 0 ..< 50000:
  optimizer.zero_grad()

  let predictions = fc(inputs).sin()

  let loss = loss_fn(predictions, targets)
  loss.backward()
  discard optimizer.step()

  if i mod 5000 == 0:
    print(loss)
