#!/bin/bash
#SBATCH -J apogee-setup
#SBATCH -o logs/apogee-setup.o%j
#SBATCH -e logs/apogee-setup.e%j
#SBATCH -N 2
#SBATCH -t 04:00:00
#SBATCH -p cca
#SBATCH -C rome

source ~/.bash_profile
init_conda
conda activate dr17-binaries
export HQ_RUN_PATH=/mnt/home/apricewhelan/projects/katie-simulated-binaries/hq-config
echo $HQ_RUN_PATH

cd /mnt/ceph/users/apricewhelan/projects/katie-simulated-binaries

date

mpirun python3 -m mpi4py.run -rc thread_level='funneled' \
$CONDA_PREFIX/bin/hq make_prior_cache -v --mpi

hq make_tasks -v

date
