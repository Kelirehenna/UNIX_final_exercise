setwd('~/projects/final-exercise')

library(tidyverse)


#plot showing the quality distribution by position on chromosome
read_tsv('data/data-whole-g.tsv') -> a

ggplot(a,aes(POS, QUAL)) + geom_point(size=0.1, color="plum4") +
  ggtitle("PHRED quality distribution in genome") +
  ylab("quality") +
  xlab("position") -> pa
pa

#plots showing the quality by the chromosome
#chromosome 1-6
read_tsv('data/data-chr1-6.tsv', col_names = c("CHROM", "POS", "QUAL")) -> b
ggplot(b,aes(POS, QUAL)) + geom_point(size = 0.1, color="steelblue3") + 
  facet_wrap(~CHROM, ncol = 2) +
  ggtitle("PHRED quality distribution in chromosome 1 - 6") +
  ylab("quality") +
  xlab("position") -> pb
pb

#chromosome 7-12
read_tsv('data/data-chr7-12.tsv', col_names = c("CHROM", "POS", "QUAL")) -> c
ggplot(c,aes(POS, QUAL)) + geom_point(size = 0.1, color="deepskyblue3") + 
  facet_wrap(~CHROM, ncol = 2) +
  ggtitle("PHRED quality distribution in chromosome 7 - 12") +
  ylab("quality") +
  xlab("position") -> pc
pc

#chromosome 13-18
read_tsv('data/data-chr13-18.tsv', col_names = c("CHROM", "POS", "QUAL")) -> d
ggplot(d,aes(POS, QUAL)) + geom_point(size = 0.1, color="cornflowerblue") + 
  facet_wrap(~CHROM, ncol = 2) +
  ggtitle("PHRED quality distribution in chromosome 13 - 18") +
  ylab("quality") +
  xlab("position") -> pd
pd

#chromosome 19-24
read_tsv('data/data-chr19-24.tsv', col_names = c("CHROM", "POS", "QUAL")) -> e
ggplot(e, aes(POS, QUAL)) + geom_point(size = 0.1, color="royalblue") + 
  facet_wrap(~CHROM, ncol = 2) +
  ggtitle("PHRED quality distribution in chromosome 19 - 24") +
  ylab("quality") +
  xlab("position") -> pe
pe

#chromosome 25-Z 
read_tsv('data/data-chr25-Z.tsv', col_names = c("CHROM", "POS", "QUAL")) -> f
ggplot(f, aes(POS, QUAL)) + geom_point(size = 0.1, color="lightseagreen") + 
  facet_wrap(~CHROM, ncol = 1) +
  ggtitle("PHRED quality distribution in chromosome 25 - Z") +
  ylab("quality") +
  xlab("position") -> pf
pf


#saving plots in the results folder
jpeg("results/whole-genome.jpg",width=1200,height=800, quality = 100)
plot(pa)
dev.off()

jpeg("results/chr1-6.jpg",width=1200,height=800, quality = 100)
plot(pb)
dev.off()

jpeg("results/chr7-12.jpg",width=1200,height=800, quality = 100)
plot(pc)
dev.off()

jpeg("results/chr13-18.jpg",width=1200,height=800, quality = 100)
plot(pd)
dev.off()

jpeg("results/chr19-24.jpg",width=1200,height=800, quality = 100)
plot(pe)
dev.off()

jpeg("results/chr25-Z.jpg",width=1200,height=800, quality = 100)
plot(pf)
dev.off()
