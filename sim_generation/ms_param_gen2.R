#!/usr/bin/env Rscript

##can run this from the command line if desired
##see below for option flags
##could make number of times set-able, but
##I'm currently too lazy...so there are initially 4 modes

##load optparse to get command line args

library("optparse")

#vector of default file names
file_n <- c("uni_ms.param","uni_rand_ms.param","time_fix_ms.param","time_var_ms.param")

##make option flag/default list
option_list = list(
  make_option(c("-m", "--mode"),action = "store", type="integer", default=3,dest="mode", 
              help="mode type"),
  make_option(c("-o", "--output"),action = "store", type="character", default="ms_out.param", 
              dest="out",help="output file name [default= %default]"),
  make_option(c("-a", "--mutation"),action = "store", type="double", default=1.56e-8,dest="mut", 
              help="mutation rate"),
  make_option(c("-g", "--generation"),action = "store", type="integer", default=6,dest="gen", 
              help="generation time"),
  make_option(c("-i", "--sims"),action = "store", type="integer", default=100000,dest="sims", 
              help="number of sims to run"),
  make_option(c("-n", "--sample_size"),action = "store", type="integer", default=72,dest="n", 
              help="number of individuals to sample"),
  make_option(c("-q", "--time1"),action = "store", type="integer", default=500,dest="t1", 
              help="instantaenous pop change time 1"),
  make_option(c("-r", "--time2"),action = "store", type="integer", default=12000,dest="t2", 
              help="instantaenous pop change time 2"),
  make_option(c("-s", "--time1_low"),action = "store", type="integer", default=100,dest="time1_low", 
              help="time1_low min"),
  make_option(c("-t", "--time1_high"),action = "store", type="integer", default=1000,dest="time1_high", 
              help="time1_high max"),
  make_option(c("-u", "--time2_low"),action = "store", type="integer", default=1001,dest="time2_low", 
              help="time2_low min"),
  make_option(c("-v", "--time2_high"),action = "store", type="integer", default=5000,dest="time2_high", 
              help="time2_high max"),
  make_option(c("-w", "--time3_low"),action = "store", type="integer", default=5001,dest="time3_low", 
              help="time3_low min"),
  make_option(c("-x", "--time3_high"),action = "store", type="integer", default=12000,dest="time3_high", 
              help="time3_high max"),
  make_option(c("-y", "--ne_low"),action = "store", type="integer", default=3,dest="ne_low", 
              help="ne low bound (log scale)"),
  make_option(c("-z", "--ne_high"),action = "store", type="integer", default=7,dest="ne_high", 
              help="ne high bound (log scale)"),
  make_option(c("-p", "--snps"),action = "store", type="integer", default=1263,dest="snps", 
              help="# of snps"),
  make_option(c("-l", "--len"), action = "store", type="integer", default=100000, dest="len",
	      help="total sites")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

###if not using command line passing, set variable values here

#opt$mode <- 4  #which sim generation scheme would you like to use
#opt$out <- file_n[opt$mode]
#opt$gen <- 6 #generation time
#opt$mut <- 1.56e-8 #mutatation rate
#opt$sims <- 100000 #number of simulations to generate
#opt$n <- 72 #number of sampled individuals
#opt$t1 <-500 # time 1 at which to instantly change pop size
#opt$t2 <- 11700 # time 2 at which to instantly change pop size
#opt$time1_low <- 100 #mr change, bin 1
#opt$time1_high <- 1000 #earliest change, bin 1
#opt$time2_low <- 1001 #mr change, bin 2
#opt$time2_high <-5000 #earliest change, bin 2
#opt$time3_low <- 5001 #mr change, bin 3
#opt$time3_high <-12000 #earliest change, bin 3
#opt$ne_low <- 3 #log-scale ne min(i.e., 10^x); also applied to pop size change search
#opt$ne_high <- 7 #log-scale ne max (i.e., 10^x); also applied to pop size change search
#opt$snps <- 1263
#opt$len <- 100000


opt$theta <- opt$mut*opt$gen*opt$len

##This first function is mostly to generate a 'simplest case' dataset
##to test out our initial CNN/loading protocols.
##It generates simulations that are evenly spaced across Ne possibilities
if(opt$mode==1){
  ####uniformly distributed contemporary Ne; run all####
  indvs <- rep(opt$n, opt$sims)#constant (72 murres sampled)
  smps <- rep(1,opt$sims)#constant (sample 1 per Ne)
  ne <- 4*opt$theta*10^(seq(from = opt$ne_low, to = opt$ne_high, by=((opt$ne_high-opt$ne_low)/(opt$sims-1))))#generate opt$sims Nes ranging from 1 to 1 million in steps of 10
  snps <- rep(opt$snps,opt$sims)#constant (1263 snps in murre data set)
  write.table(data.frame(indvs, smps,ne,snps),file=opt$out, sep=" ", row.names=F,col.names=F)
}
if(opt$mode==2){
  ###uniformly distributed Ne, random sampling###
  indvs <- rep(opt$n, opt$sims)
  smps <- rep(1,opt$sims)
  ne <- 4*opt$theta*(10^(runif(opt$sims,min=opt$ne_low,max=opt$ne_high)))#get Nes randomly, drawing from uniform log distribution from 100 to 1 million
  snps <- rep(opt$snps,opt$sims)
  write.table(data.frame(indvs, smps,ne,snps),file=opt$out, 
              sep=" ", row.names=F,col.names=F)
}

if(opt$mode==3){
  ###recent demography, 3 fixed times###
  indvs <- rep(opt$n, opt$sims)
  smps <- rep(1,opt$sims)
  ne0 <- 4*10^runif(opt$sims,min=opt$ne_low,max=opt$ne_high)
  theta <- opt$theta*ne0
  ne1r <- 4*10^runif(opt$sims,min=opt$ne_low,max=opt$ne_high)/ne0
  ne2r <- 4*10^runif(opt$sims,min=opt$ne_low,max=opt$ne_high)/ne0
  time1 <- rep(opt$t1,opt$sims)/ne0
  time2 <- rep(opt$t2,opt$sims)/ne0
  snps <- rep(opt$snps,opt$sims)
  write.table(data.frame(indvs, smps, theta, time1,ne1r, time2, ne2r,snps),
              file=opt$out, sep=" ", row.names=F,col.names=F)
}

if(opt$mode==4){
  ###recent demography, 3 variable times###
  indvs <- rep(opt$n, opt$sims)
  smps <- rep(1,opt$sims)
  ne0 <- 4*10^runif(opt$sims,min=opt$ne_low,max=opt$ne_high)
  theta <- opt$theta*ne0
  ne1r <- (4*10^runif(opt$sims,min=opt$ne_low,max=opt$ne_high))/ne0
  ne2r <- (4*10^runif(opt$sims,min=opt$ne_low,max=opt$ne_high))/ne0
  ne3r <- (4*10^runif(opt$sims,min=opt$ne_low,max=opt$ne_high))/ne0
  time1 <- runif(opt$sims,min=opt$time1_low,max=opt$time1_high)/ne0
  time2 <- runif(opt$sims,min=opt$time2_low,max=opt$time2_high)/ne0
  time3 <- runif(opt$sims,min=opt$time3_low,max=opt$time3_high)/ne0
  snps <- rep(opt$snps,opt$sims)
  write.table(data.frame(indvs, smps, theta, time1,ne1r, time2, ne2r,time3, ne3r, snps),
              file=opt$out, sep=" ", row.names=F,col.names=F)
}
