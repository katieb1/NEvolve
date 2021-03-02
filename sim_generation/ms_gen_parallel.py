import subprocess
import os
import math
import collections
import random
import csv
import numpy as np
from multiprocessing import Pool

sims = 1024
chunks = 512

sim_seq = [i*chunks for i in range(int(sims/chunks))]

mspar = collections.OrderedDict()
mspar['samples'] = 1 # number of samples per parameter set
mspar['indvs'] = 72 # number of individuals to simulate
mspar['snps'] = 1263 # number of SNP sites to simulate
mspar['theta'] = (9.35e-8) # mutation rate
mspar['time1'] = 400  # timing of most recent pop change
mspar['time2'] = 12000  # timing second pop change
mspar['scen_tuples'] = [(1,1),(2,2),(0.5,0.5),(2,0.5),(0.5,2)] # general pop multipliers for times 1,2 (will have random amount added); scenario 4 has two possible shapes
mspar['ne0_rand'] = [1*random.randint(500,500000) for i in range(sims)] # generate random starting population Ne
mspar['ne1_rand'] = [1*(-0.2 + (random.random()*(0.35-0.05))) for i in range(sims)] # generate random amount to perturb pop multiplier (time 1)
mspar['ne2_rand'] = [1*(-0.2+ (random.random()*(0.35-0.05))) for i in range(sims)] # generate random amount to perturb pop multiplier (time 2)
mspar['no_labels'] = 4 # number of categories being used as output for neural network

# generate npy lookup file
# temp = {'num_sims':sims ,
#        'num_indivs': mspar['indvs'],
#       'num_sites': mspar['snps'],
#        'num_labels': mspar['no_labels'],
#        'num_files': int(sims/chunks)}
#np.save("lookup.npy", temp)

def get_command(x):
  scenario = np.random.choice(np.arange(1,6), p=np.repeat(0.2,5))
  if scenario == 5:
    scen = 3
  else:
    scen = scenario-1
  bat = int(math.floor(x/chunks))
  return [bat,"msb_{:06}.msout".format(bat),mspar['ne0_rand'][x],mspar['scen_tuples'][scen][0]+mspar['ne1_rand'][x],mspar['scen_tuples'][scen][1]+mspar['ne2_rand'][x],scen]
      
      
      #    scenario = np.random.choice(np.arange(1,6), p=np.repeat(0.2,5))
        #  it_all = q+z # get current index out of number of sims
        #  ne0 = mspar['ne0_rand'][it_all] # get random Ne for this sim
         # ne1 = mspar['scen_tuples'][scenario][0]+mspar['ne1_rand'][it_all] # add random component to scenario multiplier (time 1)
         # ne2 = mspar['scen_tuples'][scenario][1]+mspar['ne2_rand'][it_all] # add random component to scenario multiplier (time 2)

def out_param(list_par):
  with open('ms_param.csv', 'w') as csvfile:
    csvwr = csv.writer(csvfile, delimiter=',') # open parameter file csv writer
    csvwr.writerow(["batch","filename","ne0","ne1","ne2","labels"]) # write parameter csv header
    csvwr.writerows(list_par)

def ms_proc(chk):
  with open("msb_{:06}.msout".format(chk),"w") as csvsimf: # open batch file for ouput
    csvsimwr = csv.writer(csvsimf, delimiter=',')
    for q in range(int(chunks*chk),int((chunks*chk)+chunks)):
      # generate string command for subprocess
      command = "./msdir/ms {0} {1} -t {2} -eN {3} {4} -eN {5} {6} -s {7} | tail -n +7".format(mspar['indvs'],mspar['samples'], mspar['theta']*com[q][2], mspar['time1']/com[q][2],com[q][3],mspar['time2']/com[q][2],com[q][4],mspar['snps'])
      
      #proc[chk] = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)

          # get output from ms (read in as one string)
        #  output = proc[chk].communicate()[0]

          #turn output into utf-8 from byte
        #  output = output.decode('utf-8')

          #remove "position: ", split along lines
         # output = output[11:].split("\n")

         # first = 0 # first line flag
          # for line in output: # run through ms output
            # if first==0: # if first line, split positions into list
              # line = line.rstrip().split(" ")
              # first=1 # no longer first line, change flag
            # else: # split string of 1s and 0s into list
              # line=list(line)
              # csvsim.writerow(line)

if __name__ == '__main__':
    with Pool(2) as p:
      com = p.map(get_command, range(sims))
      proc = list(range(int(sims/chunks)))
      p.map(ms_proc, range(int(sims/chunks)))

out_param(com)