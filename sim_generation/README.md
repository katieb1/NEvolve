## Quick readme for sim generation

Use ms_gen.py to create sims; adjust sim number using 'sims' variable.

The script currently generates 4 demographic scenarios (no change, increasing, decreasing, cyclic)
There are two possible shapes for cyclic--we may need to consider generating more sims for that class, but 32/4 was very convenient...Sims for that scenarios are currently randomly assigned to the up/down cyclic shape

The script directly calls ms, and outputs to cnn_batched