#!/bin/bash

#qsub -tc 30 -e /home/sih13/sge-log-files/ -o $1 -t 1-$(find $1 -maxdepth 1 -name "*.fasta_*"|wc -l) importer.sh $1

## $1 samples to map, only the name root
## $2 reference
## $3 output
##export MRKDUP=/home/sih13/tool/picard-tools-1.119/MarkDuplicates.jar

#sbatch --error $1/error.txt --output $1/output.txt --array=1-$(find $1 -maxdepth 1 -name "*.fasta"|wc -l) importer.sh $1


sbatch -c 8 --mem=100G --error ./error.txt --output ./output.txt --array=1-$(find $1 -maxdepth 2 -iname "*.fasta" |wc -l)%10 -p long importer_fasta.sh $1
