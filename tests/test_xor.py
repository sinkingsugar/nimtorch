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

fc = nn.Linear(2, 1)
loss_fn = nn.MSELoss()
optimizer = optim.SGD(fc.parameters(), lr = 0.01, momentum = 0.1)

for i in range(0, 50000):
  optimizer.zero_grad()

  predictions = fc(inputs).sin()

  loss = loss_fn(predictions, targets)
  loss.backward()
  optimizer.step()

  if i % 5000 == 0:
    print(loss)
