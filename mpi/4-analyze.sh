#!/bin/bash
#SBATCH -J apogee-analyze
#SBATCH -o logs/apogee-analyze.o%j
#SBATCH -e logs/apogee-analyze.e%j
#SBATCH -N 5
#SBATCH -t 6:00:00
#SBATCH -p cca 
#SBATCH --constraint=rome

source ~/.bash_profile
init_conda
conda activate dr17-binaries
export HQ_RUN_PATH=/mnt/home/apricewhelan/projects/katie-simulated-binaries/hq-config
echo $HQ_RUN_PATH

cd /mnt/ceph/users/apricewhelan/projects/katie-simulated-binaries

date

mpirun python3 -m mpi4py.run -rc thread_level='funneled' \
$CONDA_PREFIX/bin/hq analyze_thejoker -v --mpi

date
