
import ../torch, ../torch/[nn, optim]
import strformat, math, times

const
  discountFactor = 0.99
  traceLength {.intdefine.} = 5
  totalStepCount {.intdefine.} = 1000
  batchSize {.intdefine.} = 128
  hiddenCount {.intdefine.} = 16
  logSteps {.intdefine.} = 100

when defined cuda:
  template toDevice(self: untyped): untyped = self.cuda()
else:
  template toDevice(self: untyped): untyped = self.cpu()

proc normalized_columns_init(self: Tensor; std: float = 1.0): Tensor {.discardable.} =
  result = randn_like(self, TensorKind.FloatTensor)
  result.mul_inplace(std / sqrt((result * result).sum([0], keepdim = true)))
  self.copy_inplace(result)
  return self

type
  Model = ref object
    hiddenSize: int
    state_h: Tensor
    gru: GRUCellModule
    policyNet: LinearModule
    valueNFunctionNet: LinearModule
    optimizer: Optimizer

proc newModel(traceLength, observationCount, actionCount, hiddenSize: int): Model =

  new result
  result.hiddenSize = hiddenSize

  result.gru = GRUCell(observationCount, hiddenSize)
  result.policyNet = Linear(hiddenSize, actionCount)
  result.valueNFunctionNet = Linear(hiddenSize, 1)

  result.gru.toDevice()
  result.policyNet.toDevice()
  result.valueNFunctionNet.toDevice()

  normalized_columns_init(result.policyNet.weight.data)
  normalized_columns_init(result.valueNFunctionNet.weight.data)

  result.optimizer = Adam(result.gru.parameters & result.policyNet.parameters & result.valueNFunctionNet.parameters)

proc policy(self: Model; observation, initialState: Tensor; mask: Tensor = nil): tuple[logits, values: Tensor] =

  var observation = observation
  while observation.ndimension < 3:
    observation = observation.unsqueeze(0)

  let
    #featureCount = np.prod(observationSpace)
    batchSize = observation.size(1)
    traceLength = observation.size(0)

  self.state_h = initialState
  if initialState.isNil:
    self.state_h = zeros([batchSize, self.hiddenSize]).toDevice()

  var
    logits: seq[Tensor]# = newSeq[Tensor](traceLength)
    values: seq[Tensor]# = newSeq[Tensor](traceLength)

  for i in 0 ..< traceLength:
    self.state_h = self.state_h.detach()
    self.state_h = self.gru(observation[i], self.state_h)

    if not mask.isNil:
      # Mask off invalid steps. This will also zero the gadient
      self.state_h = self.state_h * mask[i].toType(ScalarType.kFloat).unsqueeze(-1)

    logits.add self.policyNet(self.state_h)
    values.add self.valueNFunctionNet(self.state_h)

    # logits[i] = self.policyNet(self.state_h)
    # values[i] = self.valueNFunctionNet(self.state_h)

  result.logits = logits.stack()
  result.values = values.stack().squeeze()

proc explorationStep(self: Model; observation, initialState: Tensor): tuple[sampledAction, valueFunction, state: Tensor] =
  no_grad:
    let
      (logits, valueFunction) = self.policy(observation, initialState)
      probs = logits.softmax(2)

    result.valueFunction = valueFunction
    result.sampledAction = probs.squeeze(0).multinomial(1).squeeze()
    result.state = self.state_h

proc inferenceStep(self: Model; observation, initialState: Tensor): tuple[preferredAction, state: Tensor] =
  no_grad:
    let (logits, valueFunction) = self.policy(observation, initialState)
    result.preferredAction = logits.argmax(2).toType(ScalarType.kFloat).squeeze()
    result.state = self.state_h

proc estimateValue(self: Model; observation, initialState: Tensor): Tensor =
  no_grad:
    let (logits, valueFunction) = self.policy(observation, initialState)
    return valueFunction

proc train(self: Model; observation, action, done, targetValue, value, initialState: Tensor): tuple[loss, policyGradientLoss, valueFunctionLoss, policyEntropy: Tensor] =

  let (logits, valueFunction) = self.policy(observation, initialState, done)

  let
    probs = logits.softmax(2)
    logProbs = logits.log_softmax(2) # Robust against zero-grads, unline `log(softmax())`

    actionCount = logits.size(1)
    oneHotActions = zeros_like(logits).scatter_inplace(2, action.unsqueeze(-1).toType(ScalarType.kLong), 1.0) # one_hot(action, actionCount)

    advantage = targetValue - value
    valueDiff = targetValue - valueFunction

  result.policyEntropy = -mean(sum(probs * logProbs, [2]))
  result.policyGradientLoss = -mean(sum(logProbs * oneHotActions, [2]) * advantage) # tf.nn.sparse_softmax_cross_entropy_with_logits(logits = policy.pi, labels = action)
  result.valueFunctionLoss = 0.5 * mean(valueDiff * valueDiff)
  result.loss = result.policyGradientLoss + 0.5 * result.valueFunctionLoss - 0.01 * result.policyEntropy

  result.loss.backward()
  self.optimizer.step()
  self.optimizer.zero_grad()

type
  Environment = ref object
    batchSize: int
    
    gravity: float
    masscart: float
    masspole: float
    total_mass: float
    length: float
    polemass_length: float
    force_mag: float
    tau: float
    euler_integrator: bool

    theta_threshold_radians: float
    x_threshold: float

    action_space: int
    observation_space: int

    state: Tensor
    done: Tensor

proc reset(self: Environment; done: Tensor = nil): Tensor =
  if done.isNil:
    self.state.uniform_inplace(-0.05, 0.05)
  else:
    self.state.masked_scatter_inplace(done.unsqueeze(1), zeros([self.state.numel]).toDevice().uniform_inplace(-0.05, 0.05))
  
  self.done = self.done.zeros_like()

  return self.state

proc newEnvironment(batchSize: int): Environment =
  new result
  result.batchSize = batchSize

  result.gravity = 9.8
  result.masscart = 1.0
  result.masspole = 0.1
  result.total_mass = (result.masspole + result.masscart)
  result.length = 0.5 # actually half the pole's length
  result.polemass_length = (result.masspole * result.length)
  result.force_mag = 10.0
  result.tau = 0.02  # seconds between state updates
  result.euler_integrator = true

  # Angle at which to fail the episode
  result.theta_threshold_radians = 12 * 2 * math.PI / 360
  result.x_threshold = 2.4

  # Angle limit set to 2 * theta_threshold_radians so failing observation is still within bounds
  # let angleLimit = [
  #   self.x_threshold * 2, float.high,
  #   self.theta_threshold_radians * 2, float.high
  # ]

  result.action_space = 2 #spaces.Discrete(2)
  result.observation_space = 4 #spaces.Box(-high, high, dtype=np.float32)

  #result.seed()
  result.state = zeros([batchSize, 4]).toDevice()
  result.done = zeros([batchSize]).toDevice().toType(ScalarType.kByte)

proc step(self: Environment; action: Tensor): tuple[observation, reward, done: Tensor] =
  #assert self.action_space.contains(action), "%r (%s) invalid"%(action, type(action))
  var (x, x_dot, theta, theta_dot) = (self.state[_, 0], self.state[_, 1], self.state[_, 2], self.state[_, 3])

  let
    force = (action * 2.0 - 1.0) * self.force_mag
    costheta = cos(theta)
    sintheta = sin(theta)
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
    x  = x + self.tau * x_dot
    theta_dot = theta_dot + self.tau * thetaacc
    theta = theta + self.tau * theta_dot

  (self.state[_, 0], self.state[_, 1], self.state[_, 2], self.state[_, 3]) = (x, x_dot, theta, theta_dot)

  let reward = zeros([self.batchSize]).toDevice()
  reward.masked_fill_inplace(not self.done, 1.0)

  self.done =
    self.done or
    (x < -self.x_threshold).toType(ScalarType.kByte) or
    (x > self.x_threshold).toType(ScalarType.kByte) or
    (theta < -self.theta_threshold_radians).toType(ScalarType.kByte) or
    (theta > self.theta_threshold_radians).toType(ScalarType.kByte)
  result = (self.state, reward, self.done)

let
  environment = newEnvironment(batchSize)
  testEnvironment = newEnvironment(10)
  model = newModel(traceLength, environment.observation_space, environment.action_space, hiddenCount)

var
  observation = environment.reset()
  state: Tensor

  traceTime: float
  trainingTime: float
  trainingCount: int

for batchIndex in 0 ..< totalStepCount:

  var time = epochTime()

  let
    initialState = state
    observationBatch = zeros([traceLength, batchSize, environment.observation_space]).toDevice()
    actionBatch = zeros([traceLength, batchSize]).toDevice()
    valueBatch = zeros([traceLength, batchSize]).toDevice()
    rewardBatch = zeros([traceLength, batchSize]).toDevice()
    doneBatch = zeros([traceLength, batchSize]).toDevice().toType(ScalarType.kByte)

  # Do N steps through the environment, randomly sampling actions from the policy
  for i in 0 ..< traceLength:
    observationBatch[i] = observation
    (actionBatch[i], valueBatch[i], state) = model.explorationStep(observation, state)
    (observation, rewardBatch[i], doneBatch[i]) = environment.step(actionBatch[i])

    if i > 0:
      observation.masked_fill_inplace(doneBatch[i - 1].unsqueeze(-1), 0.0)

    #echo fmt"{actionBatch[i, 0].float32} --> {observation[0, 0].float32}, {observation[0, 1].float32}, {observation[0, 2].float32 / PI * 180}, {observation[0, 3].float32} --> {rewardBatch[i, 0].float32} ({doneBatch[i, 0].totype(ScalarType.kFloat).float32})"

  #observationBatch.masked_fill_inplace(doneBatch.unsqueeze(-1), 0.0)

  # Estimate the value of the state just AFTER the trace
  # If the last step (or any before) was the end of the episode, the estimate is 0.
  var valueEstimate = model.estimateValue(observation, state) * (not doneBatch[traceLength - 1]).toType(ScalarType.kFloat)

  # Propagate the value of each step back through the trace,
  # summing up immediate returns and discounted future returns
  let discountedReturn = zeros([traceLength, batchSize]).toDevice()
  for i in countdown(traceLength - 1, 0):
    valueEstimate = valueEstimate * discountFactor + rewardBatch[i].squeeze()
    discountedReturn[i] = valueEstimate

  traceTime += epochTime() - time
  time = epochTime()

  let (loss, policyLoss, valueLoss, policyEntropy) = model.train(observationBatch, actionBatch, doneBatch, discountedReturn, valueBatch, initialState)

  trainingTime += epochTime() - time
  inc trainingCount

  if batchIndex mod logSteps == logSteps - 1:
    echo fmt"Training: trace collection time: {traceTime / trainingCount.float}s, training time: {trainingTime / trainingCount.float}s"
    echo fmt"Training: loss = {loss.float32}, policyLoss = {policyLoss.float32}, valueLoss = {valueLoss.float32}, policyEntropy = {policyEntropy.float32}"

    time = epochTime()

    var
      observation = testEnvironment.reset()
      action, reward, done, state: Tensor
      totalReward: float32

    var stepCount: int
    while true:
      (action, state) = model.inferenceStep(observation, state)
      (observation, reward, done) = testEnvironment.step(action)

      let rewards = reward.masked_select(not done)
      totalReward += rewards.sum().float32 / observation.size(0).float32

      #echo fmt"{action[0].float32} --> {observation[0, 0].float32}, {observation[0, 1].float32}, {observation[0, 2].float32 / PI * 180}, {observation[0, 3].float32} --> {reward[0].float32} ({done[0].totype(ScalarType.kFloat).float32})"

      inc stepCount

      if stepCount == 200:
        break

      if rewards.numel == 0:
        break

    echo fmt"Testing: total reward = {totalReward}"

  if doneBatch[traceLength - 1].nonzero.numel == batchSize:
    observation = environment.reset()
    state = nil