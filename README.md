# UNIX: Final exercise
## Task 1: Distribution of PHRED qualities over the whole genome and by chromosome
This repository contains the solution to task 1 of the UNIX course: Distribution of PHRED qualities over the whole genome and by chromosome.

## Running the script
Choose a working directory. The script will create a data and results directory. It will copy the input file into the data directory. The created files for the R script willbe placed in the data directory as well. The resulting graphs will be placed in the results directory.
First, we need to make the script executable.
```
chmod +x workflow.sh
```
Then the script can be run.
```
./workflow.sh
```
The script will also inform you about what it is currently doing.

## Step by step
`luscinia_vars.vcf.gz ` contains the data we need. It is put into a variable for easier work. To visualize the distribution of the PHRED qualities we need to firstly remove the header part, which does not contain any actual data. Then we extract the desired columns, which are the chromosome number column (CHROM), the position (POS), and the quality (QUAL). To keep the data clean, we also remove the # at the start of the first line. Saving the result in a new file prepares the data for the whole genome PHRED distribution visualization.
```
INPUTDATA=./data/luscinia_vars.vcf.gz
zcat $INPUTDATA | grep -v '^##' | cut -f1,2,6 | tail -c +2 > ./data/data-whole-g.tsv
```
To prepare files for the distribution by chromosome graphs, we use the file we created in the previous step. To keep the data amount mmanable, the script divides the chromosomes into five groups, which will have separate graphs. We extract data only for the chromosomes in the group and create five separate files.
```
GENOM=./data/data-whole-g.tsv
< $GENOM grep -e '^chr1\s' -e '^chr2\s' -e '^chr3\s' -e '^chr4\s' -e '^chr5\s' -e '^chr6\s' > ./data/data-chr1-6.tsv
```
Afterwards, it is time to run the script for the plots in R, using library `ggplot2`
```
Rscript plots.R
```

## Resulting graphs
The resulting graphs can be found in the results folder.

### 1. Whole genome PHRED qualities distribution
The first graph shows the distribution of quality of the reads in the whole genome, according to position on the chromosome.

![whole-genome](https://user-images.githubusercontent.com/75188506/147891546-da937f63-d91a-479c-89e4-b9055521fff4.jpg)

### 2. PHRED quality distribution on chromosome 1-6
These subsequent graphs show the distribution of the quality of the reads on the individual chromosomes. 

![chr1-6](https://user-images.githubusercontent.com/75188506/147891562-ae32404d-9e08-4601-8bf1-46cf5ff64ddc.jpg)

### 2. PHRED quality distribution on chromosome 7-12
![chr7-12](https://user-images.githubusercontent.com/75188506/147891564-8b7c9b87-4eb5-4343-8bec-216e6e882a9f.jpg)

### 2. PHRED quality distribution on chromosome 13-18
![chr13-18](https://user-images.githubusercontent.com/75188506/147891570-cdf949b3-e200-4cb5-ba46-c7efae4a468c.jpg)

### 2. PHRED quality distribution on chromosome 19-24
![chr19-24](https://user-images.githubusercontent.com/75188506/147891573-5aec4e1a-32a0-4020-83f2-3f247ede4776.jpg)

### 2. PHRED quality distribution on chromosome 25-Z
![chr25-Z](https://user-images.githubusercontent.com/75188506/147891574-dd72828c-44e3-4269-a059-138cf4532343.jpg)



