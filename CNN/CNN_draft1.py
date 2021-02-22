# Main imports
import numpy as np
import torch
import time

# PyTorch shorthands
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

tic = time.perf_counter()

### data loader will need to be modified!! ###
# Currently using toy data set
with np.load('./toy_dat/sliced_data.npz') as data:
    param = data['param']
    raw_sim = data['sim']
    pos = data['pos']
	
# Normalize to mean of 0, sd of 1

sim = (raw_sim - 0.5) / 0.5 # May need something more efficient for the full set?
# print(raw_sim[0,1])
# print(sim[0,1])

tensor = torch.from_numpy(sim)
tensor = tensor.double()
tensor = tensor.unsqueeze(dim = 1)

new_p = np.array([list(item) for item in param])
new_p = new_p[:, 2:7]
new_p = torch.from_numpy(np.array(new_p))
# print(new_p.shape)

train = torch.utils.data.TensorDataset(tensor, new_p)

trainloader = torch.utils.data.DataLoader(train, batch_size = 20,
                                          shuffle = True)
# print(trainloader)
# tensor = tensor.unsqueeze(dim = 1)
# print(tensor.shape)
# print(tensor.shape)
#t1 = tensor[1,1]

# Build the net

class Net(nn.Module):
    # Define all the transformations we want here
    def __init__(self):
        # Inherit behaviour from PyTorch class
        super(Net, self).__init__()
        # Convolutional transforms
        # input to Conv2d should be a 4D tensor [batch_size, channel, l, w]
        self.conv1 = nn.Conv2d(1, 6, 5)
        self.pool = nn.MaxPool2d(4, 4)
        self.conv2 = nn.Conv2d(6, 16, 5)
        # Regular neural net transforms after unwrap
        self.fc1 = nn.Linear(16 * 3 * 77, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 5)

    # Define all the steps for one full forward pass
    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        # print(x.shape)
        x = x.view(-1, 16 * 3 * 77)
        # print(x.shape)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x

net = Net()

# Loss and optimizer functions

criterion = F.mse_loss
optimizer = optim.SGD(net.parameters(), lr = 0.001, momentum = 0.7)

n_epoch = 20

net = net.double()

# Load CUDA if present
# to load CUDA in colab, go to runtime->change runtime type and select gpu
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
print("Using device: %s" % device)

net.to(device)

for epoch in range(n_epoch): # loope over dataset multiple times
    running_loss = 0.0
    count_b = 0
    for inputs, labels in trainloader:
        count_b += 1
        # data is a list of [inputs, labels]
        #inputs, labels = data[0], data[1] # note that moving tensors to the device is done _out of place_
        inputs, labels = inputs.to(device), labels.to(device)
        # print(f"labels as long: {labels.long()}")
        # print(inputs)
        #inputs = tensor[i,:]
        # zero parameter gradients
        optimizer.zero_grad()

        # forward -> backward -> optimize
        outputs = net(inputs)
        # print(f"output shape: {outputs.shape}" )
        # print(f"label shape: {labels.shape}" )
        # outputs = outputs.unsqueeze(dim=0)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()

        # print statistics
        running_loss += loss.item()
        if count_b % 5 == 4: # print every 20 mini-batches
            print('[%d, %5d] loss: %.3f' % (epoch + 1, count_b + 1, running_loss / 5))
            running_loss = 0.0

print('Finished Training')

toc = time.perf_counter()
print(f"Total time run: {(toc-tic)/60:0.4f} minutes")

### Where we save to needs to be modified!! ###
torch.save(net.state_dict(), "./test.pth")