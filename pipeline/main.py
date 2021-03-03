# Note that msms.py has many other imports
import msms
import torch
import numpy as np
import time

# Decide on train / dev split
lookup = np.load("../../data/metadata/lookup.npy", allow_pickle = True).item()
num_dev = 4 # Number of data files to reserve for dev set
shuffled_ids = np.random.choice(range(lookup['num_files']), lookup['num_files'], replace = False)
train_ids = shuffled_ids[:-num_dev]
dev_ids = shuffled_ids[-num_dev:]

# Set the network parameters
# The number of channels per convolution layer (think colour channels in an image), input channels assumed to be 1
channels = [3, 6, 8]
# The size of the kernel at each convolution step. Length of this list should match length of `channels`
kernels = [5, 4, 3]
# Max pooling sizes for each convolutional layer. Our low `num_indivs` generally makes this a bad idea, but you can make it work with few convolutional layers.
pools = [2, 1, 1]
# The nodes in each hidden fully connected layer. The length of the list is independent of the other lists.
nodes = [500, 100]
# The number of distinct label classes
num_labels = 4

# Setup hyperparameters and loss function
epochs = 4
batch_size = 4
report_every = 2 # How many minibatches to process before printing and recording loss and (hardmax) accuracy 
lr_0 = 0.00005 # Initial learning rate
lr_r = 0.8 # Learning rate decary rate
l2_lambd = 0.5 # Weight decay rate (L2 regularization) 
criterion = torch.nn.CrossEntropyLoss()

# Initialize datasets
train_set = msms.Dataset("../../data/data", "../../data/metadata/lookup.npy", "../../data/metadata/ms_param.csv", train_ids)
dev_set = msms.Dataset("../../data/data", "../../data/metadata/lookup.npy", "../../data/metadata/ms_param.csv", dev_ids)

if __name__ == '__main__':
    torch.multiprocessing.set_start_method('spawn', force=True)

    # Initialize dataloaders
    # - Note that you currently can't add more `num_workers`, maybe due to fighting over GPU resources?
    train_loader = torch.utils.data.DataLoader(train_set, batch_size = batch_size, shuffle = True, num_workers = 2)
    dev_loader = torch.utils.data.DataLoader(dev_set, batch_size = batch_size, shuffle = True, num_workers = 0)
    
    # Create the network with the given parameters and send it to the gpu
    net = msms.Net(train_set.num_indivs, train_set.num_sites, channels, kernels, pools, nodes, num_labels).cuda()
    
    # Init overall loss accumulator
    losses = []
    
    # Try running the network
    for epoch in range(epochs):
        # Define optimizer with hyperparameters for current epoch
        # Done per epoch to implement learning rate decay
        optimizer = torch.optim.Adam(net.parameters(), lr = lr_0 * (lr_r ** epoch), weight_decay = l2_lambd)
    
        # Init running loss accumulator
        running_loss = 0.
        running_correct = 0.
    
        for i, (snp, pos, label) in enumerate(train_loader):
            # The data loader reads in each file as though it were a training example
            # As each file is actually a collection of training examples (a chunk), we must reshape with `view()`
            # We also need to add a dimension to snp (with unsqueeze) to indicate there is only one colour channel
            snp = snp.view(-1, train_set.num_indivs, train_set.num_sites).unsqueeze(1)
            pos = pos.view(-1, train_set.num_sites)
            label = label.view(-1)
    
            # Zero the gradients
            optimizer.zero_grad()
    
            # Perform one forward pass
            t0 = time.time()
            out = net(snp, pos)
            loss = criterion(out, label)
            loss.backward()
            optimizer.step()
    
            # Calculate number correct (hardmax) for this minibatch, add to running total
            temp = torch.argmax(out, 1)
            running_correct += (temp == label).float().sum()
    
            # Print output and shape
            running_loss += loss.item()
            if i % report_every == (report_every - 1):
                # Print running loss and accuracy. Format is [epoch, minibatch]
                print(f'[{epoch}, {i + 1}] Loss: {running_loss / report_every} Acc: {running_correct / (train_set.num_sims * batch_size * report_every) * 100} Time: {time.time() - t0:.3f} seconds')
                losses.append(running_loss)
                # reset accumulators
                running_loss = 0.
                running_correct = 0.

    print("Done Training")

    # Check testing accuracy
    running_correct = 0.
    with torch.no_grad():
        for snp, pos, label in dev_loader:
            # Reshape!
            snp = snp.view(-1, train_set.num_indivs, train_set.num_sites).unsqueeze(1)
            pos = pos.view(-1, train_set.num_sites)
            label = label.view(-1)

            # Predict and count number of correct labels
            out = torch.argmax(net(snp, pos), 1)
            running_correct += (out == label).float().sum()

    print(f'Dev Accuracy: {running_correct / (dev_set.num_sims * num_dev) * 100}')

    # Save the recorded losses for plotting elsewhere
    np.save("training_loss.npy", losses)
