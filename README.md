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

2. Run canu


```
cd [this_repo_folder]

./submit.sh [input_file] [estimate_size]
```

Example:

```
cd canu_slurm

./submit.sh '/home/sih13/tmp/ExportJob_809_20200430-105153/call-export_fastq/execution/m64090_200424_131344.Q20.fastq' 300m
```

Checked whether the job is finished via squeue.