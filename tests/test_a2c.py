
import torch
import torch.nn as nn
import torch.optim as optim
import time
import math

def normalized_columns_init(self, std = 1.0):
  result = torch.randn_like(self)
  result.mul_(std / torch.sqrt((result * result).sum([0], keepdim = True)))
  self.data.copy_(result)

class Model():
  def __init__(result, traceLength, observationCount, actionCount, hiddenSize):
    result.hiddenSize = hiddenSize

    result.gru = nn.GRUCell(observationCount, hiddenSize)
    result.policyNet = nn.Linear(hiddenSize, actionCount)
    result.valueNFunctionNet = nn.Linear(hiddenSize, 1)

    normalized_columns_init(result.policyNet.weight.data)
    normalized_columns_init(result.valueNFunctionNet.weight.data)

    result.optimizer = optim.Adam(list(result.gru.parameters()) + list(result.policyNet.parameters()) + list(result.valueNFunctionNet.parameters()))

  def policy(self, observation, initialState, mask = None):

    while observation.ndimension() < 3:
      observation = observation.unsqueeze(0)

    #featureCount = np.prod(observationSpace)
    batchSize = observation.size(1)
    traceLength = observation.size(0)

    self.state_h = initialState
    if initialState is None:
      self.state_h = torch.zeros([batchSize, self.hiddenSize])

    logits = []
    values = []

    for i in range(0, traceLength):
      self.state_h = self.state_h.detach()
      self.state_h = self.gru(observation[i], self.state_h)

      if not (mask is None):
        # Mask off invalid steps. This will also zero the gadient
        self.state_h = self.state_h * mask[i].type(torch.FloatTensor).unsqueeze(-1)

      logits.append(self.policyNet(self.state_h))
      values.append(self.valueNFunctionNet(self.state_h))

    return (torch.stack(logits), torch.stack(values).squeeze())

  def explorationStep(self, observation, initialState):
    with torch.no_grad():
      
      logits, valueFunction = self.policy(observation, initialState)
      probs = logits.softmax(2)

      action = probs.squeeze(0).multinomial(1).squeeze()
      return (action, valueFunction, self.state_h)

  def inferenceStep(self, observation, initialState):
    with torch.no_grad():
      logits, valueFunction = self.policy(observation, initialState)
      action = logits.argmax(2).type(torch.FloatTensor).squeeze()
      return (action, self.state_h)

  def estimateValue(self, observation, initialState): 
    with torch.no_grad():
      logits, valueFunction = self.policy(observation, initialState)
      return valueFunction

  def train(self, observation, action, done, targetValue, value, initialState):

    logits, valueFunction = self.policy(observation, initialState, done)

    probs = logits.softmax(2)
    logProbs = logits.log_softmax(2) # Robust against zero-grads, unline `log(softmax())`

    actionCount = logits.size(1)
    oneHotActions = torch.zeros_like(logits).scatter_(2, action.unsqueeze(-1).type(torch.LongTensor), 1.0) # one_hot(action, actionCount)

    advantage = targetValue - value
    valueDiff = targetValue - valueFunction

    policyEntropy = -torch.mean(torch.sum(probs * logProbs, [2]))
    policyGradientLoss = -torch.mean(torch.sum(logProbs * oneHotActions, [2]) * advantage) # tf.nn.sparse_softmax_cross_entropy_with_logits(logits = policy.pi, labels = action)
    valueFunctionLoss = 0.5 * torch.mean(valueDiff * valueDiff)
    loss = policyGradientLoss + 0.5 * valueFunctionLoss - 0.01 * policyEntropy

    loss.backward()
    self.optimizer.step()
    self.optimizer.zero_grad()

    return (loss, policyGradientLoss, valueFunctionLoss, policyEntropy)

discountFactor = 0.99
traceLength = 5
totalStepCount = 10000000000
batchSize = 128
hiddenCount = 16

class Environment():
  def reset(self, done = None):
    if done == None:
      self.state.uniform_(-0.05, 0.05)
    else:
      self.state.masked_scatter_(done.unsqueeze(1), zeros([self.state.numel]).uniform_(-0.05, 0.05))
    
    self.done = torch.zeros_like(self.done)

    return self.state

  def __init__(result, batchSize):
    result.batchSize = batchSize

    result.gravity = 9.8
    result.masscart = 1.0
    result.masspole = 0.1
    result.total_mass = (result.masspole + result.masscart)
    result.length = 0.5 # actually half the pole's length
    result.polemass_length = (result.masspole * result.length)
    result.force_mag = 10.0
    result.tau = 0.02  # seconds between state updates
    result.euler_integrator = True

    # Angle at which to fail the episode
    result.theta_threshold_radians = 12 * 2 * math.pi / 360
    result.x_threshold = 2.4

    # Angle limit set to 2 * theta_threshold_radians so failing observation is still within bounds
    # let angleLimit = [
    #   self.x_threshold * 2, float.high,
    #   self.theta_threshold_radians * 2, float.high
    # ]

    result.action_space = 2 #spaces.Discrete(2)
    result.observation_space = 4 #spaces.Box(-high, high, dtype=np.float32)

    #result.seed()
    result.state = torch.zeros([batchSize, 4])
    result.done = torch.zeros([batchSize]).type(torch.ByteTensor)

  def step(self, action):
    #assert self.action_space.contains(action), "%r (%s) invalid"%(action, type(action))
    x, x_dot, theta, theta_dot = (self.state[:, 0], self.state[:, 1], self.state[:, 2], self.state[:, 3])

    force = (action * 2.0 - 1.0) * self.force_mag
    costheta = torch.cos(theta)
    sintheta = torch.sin(theta)
    temp = (force + self.polemass_length * theta_dot * theta_dot * sintheta) / self.total_mass

    thetaacc = (self.gravity * sintheta - costheta * temp) / (self.length * (4.0 / 3.0 - self.masspole * costheta * costheta / self.total_mass))
    xacc  = temp - self.polemass_length * thetaacc * costheta / self.total_mass

    if self.euler_integrator:
      x = x + self.tau * x_dot
      x_dot = x_dot + self.tau * xacc
      theta = theta + self.tau * theta_dot
      theta_dot = theta_dot + self.tau * thetaacc

    else: # semi-implicit euler
      x_dot = x_dot + self.tau * xacc
      x = x + self.tau * x_dot
      theta_dot = theta_dot + self.tau * thetaacc
      theta = theta + self.tau * theta_dot

    self.state[:, 0], self.state[:, 1], self.state[:, 2], self.state[:, 3] = (x, x_dot, theta, theta_dot)

    reward = torch.zeros([self.batchSize])
    reward.masked_fill_(self.done ^ 1, 1.0) # not done

    self.done = \
      self.done | \
      (x < -self.x_threshold) | \
      (x > self.x_threshold) | \
      (theta < -self.theta_threshold_radians) | \
      (theta > self.theta_threshold_radians)
    return (self.state, reward, self.done)

environment = Environment(batchSize)
testEnvironment = Environment(10)
model = Model(traceLength, environment.observation_space, environment.action_space, hiddenCount)

observation = environment.reset()
state = None

traceTime = 0.0
trainingTime = 0.0
trainingCount = 0

for batchIndex in range(0, totalStepCount):

  currentTime = time.perf_counter()

  initialState = state
  observationBatch = torch.zeros([traceLength, batchSize, environment.observation_space])
  actionBatch = torch.zeros([traceLength, batchSize])
  valueBatch = torch.zeros([traceLength, batchSize])
  rewardBatch = torch.zeros([traceLength, batchSize])
  doneBatch = torch.zeros([traceLength, batchSize]).type(torch.ByteTensor)

  # Do N steps through the environment, randomly sampling actions from the policy
  for i in range(0, traceLength):
    observationBatch[i] = observation
    actionBatch[i], valueBatch[i], state = model.explorationStep(observation, state)
    observation, rewardBatch[i], doneBatch[i] = environment.step(actionBatch[i])

    if i > 0:
      observation.masked_fill_(doneBatch[i - 1].unsqueeze(-1), 0.0)

    #echo fmt"{actionBatch[i, 0].float32} --> {observation[0, 0].float32}, {observation[0, 1].float32}, {observation[0, 2].float32 / PI * 180}, {observation[0, 3].float32} --> {rewardBatch[i, 0].float32} ({doneBatch[i, 0].type(torch.FloatTensor).float32})"

  #observationBatch.masked_fill_(doneBatch.unsqueeze(-1), 0.0)

  # Estimate the value of the state just AFTER the trace
  # If the last step (or any before) was the end of the episode, the estimate is 0.
  valueEstimate = model.estimateValue(observation, state) * (doneBatch[traceLength - 1] ^ 1).type(torch.FloatTensor)

  # Propagate the value of each step back through the trace,
  # summing up immediate returns and discounted future returns
  discountedReturn = torch.zeros([traceLength, batchSize])
  for i in reversed(range(traceLength)):
    valueEstimate = valueEstimate * discountFactor + rewardBatch[i].squeeze()
    discountedReturn[i] = valueEstimate

  traceTime += time.perf_counter() - currentTime
  currentTime = time.perf_counter()

  loss, policyLoss, valueLoss, policyEntropy = model.train(observationBatch, actionBatch, doneBatch, discountedReturn, valueBatch, initialState)

  trainingTime += time.perf_counter() - currentTime
  trainingCount += 1

  if batchIndex % 100 == 0:
    print(f"Training: trace collection time: {traceTime / trainingCount}s, training time: {trainingTime / trainingCount}s")
    print(f"Training: loss = {loss}, policyLoss = {policyLoss}, valueLoss = {valueLoss}, policyEntropy = {policyEntropy}")

  if batchIndex % 100 == 0:
    currentTime = time.perf_counter()

    eval_state = None
    eval_observation = testEnvironment.reset()
    totalReward = 0.0

    stepCount = 0
    while True:
      eval_action, eval_state = model.inferenceStep(eval_observation, eval_state)
      eval_observation, eval_reward, eval_done = testEnvironment.step(eval_action)

      eval_rewards = eval_reward.masked_select(eval_done ^ 1)
      totalReward += eval_rewards.sum() / eval_observation.size(0)

      # print(f"{action[0].float32} --> {observation[0, 0].float32}, {observation[0, 1].float32}, {observation[0, 2].float32 / PI * 180}, {observation[0, 3].float32} --> {reward[0].float32} ({done[0].type(torch.FloatTensor).float32})")

      stepCount += 1

      if stepCount == 200:
        break

      if eval_rewards.numel() == 0:
        break

    print(f"Testing: total reward = {totalReward}")

  if doneBatch[traceLength - 1].all():
    observation = environment.reset()
    state = None