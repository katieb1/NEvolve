# Note that msms.py has many other imports
import msms
import torch

# Initialize a dataset
example_set = msms.Dataset("data", "metadata/lookup.npy")

# Initialize a dataloader with the dataset
# - Note that you currently can't add more `num_workers`, maybe due to fighting over GPU resources?
example_loader = torch.utils.data.DataLoader(example_set, batch_size = 2, shuffle = True)

# This is just a sanity check to make sure `reshape()` can be used to combine chunks (each file) into minibatch sizes of our choice
# Note that we cannot randomize within chunks (msms output files) at the moment, so we should make balanced files
for snp, pos, label in example_loader:
    print('Shapes:')
    print(f'SNP: {snp.shape}')
    print(f'Positions: {pos.shape}')
    print(f'Labels: {label.shape}')

    print('\nData:')
    print(f'SNP: {snp}')
    print(f'Positions: {pos}')
    print(f'Labels: {label}')

    print('\nReshaped:')
    snp = snp.reshape(-1, example_set.num_indivs, example_set.num_sites)
    pos = pos.reshape(-1, example_set.num_sites)
    label = label.reshape(-1)

    print('Shapes:')
    print(f'SNP: {snp.shape}')
    print(f'Positions: {pos.shape}')
    print(f'Labels: {label.shape}')

    print('\nData:')
    print(f'SNP: {snp}')
    print(f'Positions: {pos}')
    print(f'Labels: {label}')
