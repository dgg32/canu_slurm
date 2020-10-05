#!/bin/bash

inputFile=$1

size=$2

#./submit.sh '/home/sih13/tmp/ExportJob_809_20200430-105153/call-export_fastq/execution/m64090_200424_131344.Q20.fastq' 300m

sbatch -p mid -c 28 --mem=240G --error ./error.txt --output ./output.txt importer.sh $inputFile $size
