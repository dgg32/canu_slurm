#!/bin/sh
#$ -S /bin/bash

#sbatch -p long -c 28 --mem=240G --error ./error.txt --output ./output.txt importer.sh $inputFile $size

#sbatch -p long -c 28 --mem=240G --wrap="canu -p asm -d '/home/sih13/tmp/ExportJob_812_20200430-105153/cromwell-job/call-export_fastq/execution/canu'  genomeSize=500m -pacbio-hifi '/home/sih13/tmp/ExportJob_812_20200430-105153/cromwell-job/call-export_fastq/execution/m64090_200428_081855.Q20.fastq' useGrid=false"



OUT=$1"_canu"
ASSEMBLE=$OUT"/asm.contigs.fasta"

SQUAT=$1"_squat"



canu -p asm -d $OUT  genomeSize=$2 -pacbio-hifi $1 useGrid=false


squat.sh $1 -o $SQUAT -r $ASSEMBLE -t 28
