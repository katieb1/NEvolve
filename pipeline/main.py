# Note that msms.py has many other imports
import msms
import torch

# Initialize a dataset
example_set = msms.Dataset("data", "metadata/lookup.npy")

# Initialize a dataloader with the dataset
# - Note that you currently can't add more `num_workers`, maybe due to fighting over GPU resources?
example_loader = torch.utils.data.DataLoader(example_set, batch_size = 2, shuffle = True, num_workers = 0)

# Set the network parameters
# Max pooling size for all convolutional layers. Our low `num_indivs` generally makes this a bad idea, but you can make it work with few convolutional layers.
pool_size = 1
# The number of channels per training example, input channels assumed to be 1
channels = [4, 6, 8]
# The size of the kernel at each convolution step
kernels = [5, 4, 3]
# The nodes in each hidden linear layer. The last should be the number of labels
nodes = [500, 100, 5]

# Create the network with the given parameters and send it to the gpu
example_net = msms.Net(example_set.num_indivs, example_set.num_sites, pool_size, channels, kernels, nodes).cuda()

# Try running the network
for snp, pos, label in example_loader:
    # The data loader reads in each file as though it were a training example
    # As each file is actually a collection of training examples (a chunk), we must reshape with `view()`
    # We also need to add a dimension to snp (with unsqueeze) to indicate there is only one colour channel
    snp = snp.view(-1, example_set.num_indivs, example_set.num_sites).unsqueeze(1)
    pos = pos.view(-1, example_set.num_sites)
    label = label.view(-1)

    # Perform one forward pass
    out = example_net(snp, pos)

    # Print output and shape
    print(out)
    print(out.shape)
