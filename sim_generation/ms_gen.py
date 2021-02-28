import subprocess
import os
import math
import collections
import random
import csv

# port of ms paramter gen script from R

# number of sims to generate (102400)
sims = 1024
sim_seq = [i*32 for i in range(int(sims/32))]

# generate command line inputs for ms
# 3 Ne sizes, two fixed times of change

mspar = collections.OrderedDict()
mspar['samples'] = 1 # number of samples per parameter set
mspar['indvs'] = 72 # number of individuals to simulate
mspar['snps'] = 1263 # number of SNP sites to simulate
mspar['theta'] = (9.35e-8) # mutation rate
mspar['time1'] = 400  # timing of most recent pop change
mspar['time2'] = 12000  # timing second pop change
mspar['scen_tuples'] = [(1,1),(2,2),(0.5,0.5),(2,0.5),(0.5,2)] # general pop multipliers for times 1,2 (will have random amount added); scenario 4 has two possible shapes
mspar['ne0_rand'] = [1*random.randint(500,500000) for i in range(sims)] # generate random starting population Ne
mspar['ne1_rand'] = [1*(-0.3 + (random.random()*(0.6-0.05))) for i in range(sims)] # generate random amount to perturb pop multiplier (time 1)
mspar['ne2_rand'] = [1*(-0.3 + (random.random()*(0.6-0.05))) for i in range(sims)] # generate random amount to perturb pop multiplier (time 2)

## Scenario generator (loop)
# parameter csv file structure
# batch#, filename, ne0, ne1, ne2, label

with open('./cnn_batched/ms_param.csv', 'w') as csvfile:
    csvwr = csv.writer(csvfile, delimiter=',') # open parameter file csv writer
    csvwr.writerow(["batch","filename","ne0","ne1","ne2","labels"]) # write parameter csv header
    countb = 0 # set batch counter to 0
    for q in sim_seq: # for loop for all batches
      countb += 1 #add one to batch counter
      fn = "./cnn_batched/msb_{:06}.msout".format(countb) # create file name for this batch (06 allows for up to 1 million names with fixed width--i.e., 32 million sims)
      with open(fn,"w") as csvsimf: # open batch file for ouput
        csvsim = csv.writer(csvsimf, delimiter=',') # open batch file writer
        for z in range(32): #run through sim generation for all sims in batch
          #following lines divide one batch into even numbers of each scenario
          if z<8:
            scenario = 0
            scen = 1
          elif z<16:
            scenario  = 1
            scen = 2
          elif z<24:
            scenario = 2
            scen = 3
          else: # scenario 4 has two possible shapes; randomly pick one
            ud = random.randint(0,1)
            scenario = 3 + ud
            scen = 4

          it_all = q+z # get current index out of number of sims
          ne0 = mspar['ne0_rand'][it_all] # get random Ne for this sim
          ne1 = mspar['scen_tuples'][scenario][0]+mspar['ne1_rand'][it_all] # add random component to scenario multiplier (time 1)
          ne2 = mspar['scen_tuples'][scenario][1]+mspar['ne2_rand'][it_all] # add random component to scenario multiplier (time 2)

          csvwr.writerow([countb,fn,ne0,ne1,ne2,scen]) # write parameters to file (outputs for CNN)

          # generate string command for subprocess
          command = "./msdir/ms {0} {1} -t {2} -eN {3} {4} -eN {5} {6} -s {7} | tail -n +7".format(mspar['indvs'],mspar['samples'], mspar['theta']*ne0, mspar['time1']/ne0,ne1,mspar['time2']/ne0,ne2,mspar['snps'])
          p1 = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)

          # get output from ms (read in as one string)
          output = p1.communicate()[0]

          #turn output into utf-8 from byte
          output = output.decode('utf-8')

          #remove "position: ", split along lines
          output = output[11:].split("\n")

          first = 0 # first line flag
          for line in output: # run through ms output
            if first==0: # if first line, split positions into list
              line = line.rstrip().split(" ")
              first=1 # no longer first line, change flag
            else: # split string of 1s and 0s into list
              line=list(line)
            
            csvsim.writerow(line) # output ms line to csv batch file
            # This batch csv will have <snps> number of columns and 32 * (indvs + 1 blank) rows