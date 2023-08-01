
library("optparse")

# segmentation file format:
# SampleID Chromosome Start_position End_position total_cn A_cn B_cn ploidy
 
option_list = list(
  make_option(c("-s", "--seg"), type="character", default=NULL, 
              help="Segmentation file name", metavar="character"),
  make_option(c("-w", "--wd"), type="character", default=NULL, 
              help="Directory of the scarHRD scripts for the imports", metavar="character"),
  make_option(c("-o", "--outDir"), type="character", default=NULL, 
              help="Output file name", metavar="character"),
  make_option(c("-g", "--genome"), type="character", default="grch38",
              help="Name of the reference genome: default grch38", metavar="character"),
  make_option(c("-z", "--sequenza"), action="store_true", default=FALSE,
              help="input seqmentation follows sequenza format: default FALSE")
); 
 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

#set working directory for imports
setwd(opt$wd)

load("sysdata.rda")
source("preprocess.hrd.R")
source("preprocess.seqz.R")
source("calc.ai_new.R")
source("calc.hrd.R")
source("calc.lst.R")
source("shrink.seg.ai.R")
source("shrink.seg.ai.wrapper.R")
source("scar_score.R")

scar_score(opt$seg ,reference = opt$genome, seqz=FALSE, outputdir = opt$outDir)

