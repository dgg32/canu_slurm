#!/bin/sh
#$ -S /bin/bash

#sbatch -p long -c 28 --mem=240G --error ./error.txt --output ./output.txt importer.sh $inputFile $size

#sbatch -p long -c 28 --mem=240G --wrap="canu -p asm -d '/home/sih13/tmp/ExportJob_812_20200430-105153/cromwell-job/call-export_fastq/execution/canu'  genomeSize=500m -pacbio-hifi '/home/sih13/tmp/ExportJob_812_20200430-105153/cromwell-job/call-export_fastq/execution/m64090_200428_081855.Q20.fastq' useGrid=false"

file_list=$(find $1  -maxdepth 1 -name '*fastq.gz' -printf '%p ')

OUT=$1"_canu"
ASSEMBLE=$OUT"/asm.contigs.fasta"


## pacbio official


canu -assemble -p asm -d $OUT genomeSize=$2 -maxInputCoverage=5000 useGrid=false batOptions="-eg 0.0 -sb 0.001 -dg 0 -db 3 -dr 0 -ca 2000 -cp 200" -pacbio-hifi $file_list 
