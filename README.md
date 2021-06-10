# canu_slurm
run canu, squat and dfast for pacbio hifi sequence

### Prerequisites

0. Make sure that both submit.sh and importer.sh are executable by 

```
chmod +x submit.sh
chmod +x importer.sh
```

1. Canu installed. Canu should be in the system path so that it can be called without typing its complete path. Install through conda should be OK:

```
conda install -c bioconda canu
```

To use squat, you need to install SQUAT from

https://github.com/luke831215/SQUAT

and make sure it is in the system path by running something like in Terminal:

```
export PATH=/home/[your_username_here]/tool/SQUAT-master/:$PATH >> ~/.bashrc
```


2. Run canu

In case you want to customize the coverage settings, add the following parameters in the canu line in importer.sh

> corOutCoverage=10000 corMhapSensitivity=high corMinCoverage=0 redMemory=32 oeaMemory=32 batMemory=200 genomeSize=500m useGrid=false


```
cd [this_repo_folder]

./submit.sh [input_folder] [estimate_size]
```

Example:

```
cd canu_slurm

./submit.sh '/home/sih13/tmp/ExportJob_809_20200430-105153/call-export_fastq/execution/' 300m
```

Checked whether the job is finished via squeue.
