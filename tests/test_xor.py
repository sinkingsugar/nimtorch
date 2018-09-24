import torch
import torch.nn as nn
import torch.optim as optim

inputs = torch.tensor([
  [0.0, 0.0],
  [0.0, 1.0],
  [1.0, 0.0],
  [1.0, 1.0],
])

targets = torch.tensor([
  [0.0],
  [1.0],
  [1.0],
  [0.0],
])

fc1 = nn.Linear(2, 4)
fc2 = nn.Linear(4, 1)
loss_fn = nn.MSELoss()
optimizer = optim.SGD(list(fc1.parameters()) + list(fc2.parameters()), lr = 0.01, momentum = 0.1)

for i in range(0, 50000):
  optimizer.zero_grad()

  predictions = fc1(inputs).relu()
  predictions = fc2(predictions).sigmoid()

  loss = loss_fn(predictions, targets)
  loss.backward()
  optimizer.step()

  if i % 5000 == 0:
    print(loss)
