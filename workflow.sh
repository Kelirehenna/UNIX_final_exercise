#!/bin/bash

echo "Preparing directories and fetching data"

#preparation of your working directory and data
mkdir data
mkdir results
cp /data-shared/vcf_examples/luscinia_vars.vcf.gz data 


#preparation of the file for whole genome analysis

echo "Preparing data for genome analysis"

#make a variable for the input data
INPUTDATA=./data/luscinia_vars.vcf.gz

#preparation of the file for the whole genome quality analysis
#remove header part from data
#extract desired columns - chromosome number (CHROM), the position (POS) and the quality score (QUAL), put into new file
#remove the first # from the name line
zcat $INPUTDATA | grep -v '^##' | cut -f1,2,6 | tail -c +2 > ./data/data-whole-g.tsv


#preparation of the files for the by chromosome analysis

echo "Preparing data for chromosone analysis"

GENOM=./data/data-whole-g.tsv

#preparation of the files for the chromosome graphs
< $GENOM grep -e '^chr1\s' -e '^chr2\s' -e '^chr3\s' -e '^chr4\s' -e '^chr5\s' -e '^chr6\s' > ./data/data-chr1-6.tsv
< $GENOM grep -e '^chr7\s' -e '^chr8\s' -e '^chr9\s' -e '^chr10\s' -e '^chr11\s' -e '^chr12\s' > ./data/data-chr7-12.tsv
< $GENOM grep -e '^chr13\s' -e '^chr14\s' -e '^chr15\s' -e '^chr16\s' -e '^chr17\s' -e '^chr18\s' > ./data/data-chr13-18.tsv
< $GENOM grep -e '^chr19\s' -e '^chr20\s' -e '^chr21\s' -e '^chr22\s' -e '^chr23\s' -e '^chr24\s' > ./data/data-chr19-24.tsv
< $GENOM grep -e '^chr25\s' -e '^chr26\s' -e '^chr27\s' -e '^chrZ\s' > ./data/data-chr25-Z.tsv


echo "Generating graphs"

#run the rscript for the graphs in R
Rscript plots.R

echo "All is done"
