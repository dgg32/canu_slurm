#!/bin/sh
#$ -S /bin/bash




#/home/sih13/tool/blast/blastp -db /home/sih13/database/md5nr/md5nr_no_hyphen -query $STR -num_threads 1 -max_target_seqs 10 -evalue 1e-10 -outfmt 6

#cat $STR  | /megx/home/shuang/SilmarilX2/Darkhorse_for_SGE_stdin_tab/Darkhorse_for_SGE -d -k -o $STR -p $2 -t $3

#/home/sih13/tool/megahit-master/megahit -1 $1 -2 $2 -r $3 -o $4 -t 28

#/home/sih13/tool/RAPSearch2.23_64bits/rapsearch -q $STR -d '/home/sih13/database/merops_9_12_rapdb' -e -10 -z 1 -v 10 -b 1 -o ${STR}_rap_nr.txt


#R1=$1"_R1_trimmed.fa"
#R2=$1"_R2_trimmed.fa"
#single=$1"_single.fa"

# echo $R1
# echo $R2
# echo $single
#bash /home/sih13/tool/CONCOCT/scripts/map-bowtie2-markduplicates.sh -ct 28 -p '-f' $R1 $R2 $single  pair $2 asm $3

STR=$(find $1 -maxdepth 2 -iname "*.fasta"  | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)


OUT=$STR"_dfast"


dfast --genome $STR -o $OUT --cpu 8 --use_original_name t
