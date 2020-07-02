# canu_slurm
run canu, squat and dfast for pacbio hifi sequence

### Prerequisites

0. Make sure that both submit.sh and importer.sh are executable by 

```
chmod +x submit.sh
chmod +x importer.sh
```

1. Canu installed. Canu should be in the system path so that it can be called without typing its complete path. Install through conda should be OK:

conda install -c bioconda canu
