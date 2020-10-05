#!/bin/sh
#$ -S /bin/bash

#sbatch -p long -c 28 --mem=240G --error ./error.txt --output ./output.txt importer.sh $inputFile $size

#sbatch -p long -c 28 --mem=240G --wrap="canu -p asm -d '/home/sih13/tmp/ExportJob_812_20200430-105153/cromwell-job/call-export_fastq/execution/canu'  genomeSize=500m -pacbio-hifi '/home/sih13/tmp/ExportJob_812_20200430-105153/cromwell-job/call-export_fastq/execution/m64090_200428_081855.Q20.fastq' useGrid=false"



OUT=$1"_canu"
ASSEMBLE=$OUT"/asm.contigs.fasta"

#SQUAT=$1"_squat"



#canu -p asm -d $OUT corOutCoverage=10000 corMhapSensitivity=high corMinCoverage=0 redMemory=32 oeaMemory=32 batMemory=200 genomeSize=500m useGrid=false genomeSize=$2 -pacbio-hifi $1 useGrid=false

## pacbio official

canu -assemble -p asm -d $OUT genomeSize=$2 -maxInputCoverage=5000 -pacbio-hifi $1 batOptions="-eg 0.0 -sb 0.001 -dg 0 -db 3 -dr 0 -ca 2000 -cp 200"

#squat.sh $1 -o $SQUAT -r $ASSEMBLE -t 28