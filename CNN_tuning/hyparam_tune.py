## Setting up environment

# Main imports
import numpy as np
import pandas as pd
import torch
import time
import matplotlib.pyplot as plt
import itertools
from itertools import product
from collections import OrderedDict
from collections import namedtuple
from IPython.display import clear_output
import json
import torchvision

# PyTorch shorthands
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

# For viewing different hyperparameter combinations
from torch.utils.tensorboard import SummaryWriter

# Set print options
torch.set_printoptions(linewidth=120)

# Load data - add arg parse here
with np.load('/home/sliced_data.npz') as data:
    raw_param = data['param']
    raw_sim = data['sim']
    pos = data['pos']

## Preprocessing

# Normalization
sim = (raw_sim - raw_sim.mean()) / raw_sim.std()

# Turn sim data into tensor
sim_tensor = torch.from_numpy(sim)
sim_tensor = sim_tensor.double()
sim_tensor = sim_tensor.unsqueeze(dim = 1)

# Turn param data into tensor (changed "new_p" to "param")
param = np.array([list(item) for item in raw_param])
param = param[:, 2:7]
param = torch.from_numpy(np.array(param))

# Specify training data
train = torch.utils.data.TensorDataset(sim_tensor, param)

## Design networks

# Standard network
class Net(nn.Module):
  def __init__(self):
    super().__init__()
    self.conv1 = nn.Conv2d(1, 6, 5)
    self.pool = nn.MaxPool2d(4, 4)
    self.conv2 = nn.Conv2d(6, 16, 5)

    self.fc1 = nn.Linear(16 * 3 * 77, 120)
    self.fc2 = nn.Linear(120, 84)
    self.fc3 = nn.Linear(84, 5)

    # Define all the steps for one full forward pass
  def forward(self, x):
    x = self.pool(F.relu(self.conv1(x)))
    x = self.pool(F.relu(self.conv2(x)))

    x = x.view(-1, 16 * 3 * 77)

    x = F.relu(self.fc1(x))
    x = F.relu(self.fc2(x))
    x = self.fc3(x)
    return x

# Network with some batch normalization
class NetSomeBatch(nn.Module):
  def __init__(self):
    super().__init__()
    self.conv1 = nn.Conv2d(1, 6, 5)
    self.batch1 = nn.BatchNorm2d(6)
    self.pool = nn.MaxPool2d(4, 4)
    self.conv2 = nn.Conv2d(6, 16, 5)

    self.fc1 = nn.Linear(16 * 3 * 77, 120)
    self.batch2 = nn.BatchNorm1d(120)
    self.fc2 = nn.Linear(120, 84)
    self.fc3 = nn.Linear(84, 5)

  def forward(self, x):
    x = self.batch1(self.pool(F.relu(self.conv1(x))))
    x = self.pool(F.relu(self.conv2(x)))
    
    x = x.view(-1, 16 * 3 * 77)
    
    x = self.batch2(F.relu(self.fc1(x)))
    x = F.relu(self.fc2(x))
    x = self.fc3(x)
    return x

# Network with all the batch norm
class NetBatch(nn.Module):
  def __init__(self):
    super().__init__()
    self.conv1 = nn.Conv2d(1, 6, 5)
    self.batch1 = nn.BatchNorm2d(6)
    self.pool = nn.MaxPool2d(4, 4)
    self.conv2 = nn.Conv2d(6, 16, 5)
    self.batch2 = nn.BatchNorm2d(16)

    self.fc1 = nn.Linear(16 * 3 * 77, 120)
    self.batch3 = nn.BatchNorm1d(120)
    self.fc2 = nn.Linear(120, 84)
    self.batch4 = nn.BatchNorm1d(84)
    self.fc3 = nn.Linear(84, 5)

  def forward(self, x):
    x = self.batch1(self.pool(F.relu(self.conv1(x))))
    x = self.batch2(self.pool(F.relu(self.conv2(x))))

    x = x.view(-1, 16 * 3 * 77)

    x = self.batch3(F.relu(self.fc1(x)))
    x = self.batch4(F.relu(self.fc2(x)))
    x = self.fc3(x)
    return x

# Set all networks
network1 = Net()
network1 = network1.double()
network2 = NetSomeBatch()
network2 = network2.double()
network3 = NetBatch()
network3 = network3.double()

# Create a dictionary to pull from later
networks = {
    'no_batch': network1,
    'some_batch': network2,
    'batch': network3

## Helper classes

# RunBuilder builds a run w/ specified hyperparameters
class RunBuilder():
  @staticmethod
  def get_runs(params):
    
    Run = namedtuple('Run', params.keys())

    runs = []
    for v in product(*params.values()):
      runs.append(Run(*v))

    return runs

# Epoch stores epoch info
class Epoch():
  def __init__(self):
    self.count = 0
    self.loss = 0
    self.start_time = None

# Run stores run info
class Run():
  def __init__(self):
    self.params = None
    self.count = 0
    self.data = []
    self.start_time = None

# RunManager collects info for tensorboard for hyperparam comparison
class RunManager():
  def __init__(self):

    self.epoch = Epoch()

    self.run = Run()

    self.network = None
    self.loader = None
    self.tb = None

  def begin_run(self, run, network, loader):

    self.run.start_time = time.time()

    self.run.params = run
    self.run.count += 1

    self.network = network
    self.loader = loader
    self.tb = SummaryWriter(comment = f' -{run}')

    images, labels = next(iter(self.loader))
    grid = torchvision.utils.make_grid(images)

    self.tb.add_image('images', grid)
    self.tb.add_graph(self.network, images)

  def end_run(self):
    self.tb.close()
    self.epoch.count = 0

  def begin_epoch(self):
    self.epoch.start_time = time.time()

    self.epoch.count += 1
    self.epoch.loss = 0

  def end_epoch(self):

    epoch_duration = time.time() - self.epoch.start_time
    run_duration = time.time() - self.run.start_time

    loss = self.epoch.loss / len(self.loader.dataset)

    self.tb.add_scalar('Loss', loss, self.epoch.count)
    
    results = OrderedDict()
    results["run"] = self.run.count
    results["epoch"] = self.epoch.count
    results["loss"] = loss
    results["epoch duration"] = epoch_duration
    results["run duration"] = run_duration
    for k,v in self.run.params._asdict().items(): results[k] = v
    self.run.data.append(results)
    df = pd.DataFrame.from_dict(self.run.data, orient='columns')

    # Specific to jupyter notebook
    clear_output(wait=True)
    # display(df)

  def track_loss(self, loss):
    self.epoch.loss += loss.item() * self.loader.batch_size

  def save(self, fileName):

    # Save to csv
    pd.DataFrame.from_dict(
        self.run.data,
        orient='columns'
    ).to_csv(f'{fileName}.csv')

    # Save to json - use to build tensorboards
    with open(f'{fileName}.json', 'w', encoding='utf-8') as f:
      json.dump(self.run.data, f, ensure_ascii=False, indent=4)

# NetworkFactory re-initializes weights for each network
class NetworkFactory():
  @staticmethod
  def get_network(name):
    if name == 'no_batch':
      return Net()
    elif name == 'some_batch':
      return NetSomeBatch()
    else:
      return NetBatch()

## Testing out different params

# Create param dictionary
# Change these params depending on what you want to test
params = OrderedDict(
    lr = [0.01, 0.001, 0.0001],
    batch_size = [20, 100],
    shuffle = [True],
    network = list(networks.keys()),
    optim_type = ['Adam', 'SGD'],
    eps = [1e-8, 1e-4, 0.1],
    momentum = [0.9, 0.6, 0.3]
)

# Run through CNN and compare accuracies
m = RunManager()
for run in RunBuilder.get_runs(params):

  net = NetworkFactory.get_network(run.network)
  net = net.double()
  # Access hyperparameters using the run
  loader = torch.utils.data.DataLoader(train,
                                       batch_size=run.batch_size,
                                       num_workers=1,
                                       shuffle=run.shuffle)
  if run.optim_type == 'Adam':
    optimizer = optim.Adam(net.parameters(),
                           lr=run.lr,
                           eps=run.eps)
  if run.optim_type == 'SGD':
    optimizer = optim.SGD(net.parameters(),
                          lr=run.lr,
                          momentum=run.momentum)

  m.begin_run(run, net, loader)
  # Set number of epochs in range
  for epoch in range(20):
    m.begin_epoch()
    for batch in loader:

      images, labels = batch
      preds = net(images)
      #print(preds.shape)
      #print(labels.shape)
      loss = F.mse_loss(preds, labels)
      optimizer.zero_grad()
      loss.backward()
      optimizer.step()

      m.track_loss(loss)
      # m.track_num_correct(preds, labels)
    m.end_epoch()
  m.end_run()
m.save('results')

# Comparisons between runs are stored in the results csv and json files
