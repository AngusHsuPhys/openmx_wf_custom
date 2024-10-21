#!/bin/bash -l

#SBATCH --nodes=$${nodes}
#SBATCH --ntasks=$${ntasks}
#SBATCH --ntasks-per-node=$${ntasks_per_node}
#SBATCH --cpus-per-task=$${cpus_per_task}
#SBATCH --mem=$${mem}
#SBATCH --gres=$${gres}
#SBATCH --qos=$${qos}
#SBATCH --time=$${walltime}
#SBATCH --partition=$${queue}
#SBATCH --account=bansil
#SBATCH --job-name=$${job_name}
#SBATCH --license=$${license}
#SBATCH --output=$${job_name}-%j.out
#SBATCH --error=$${job_name}-%j.error
#SBATCH --constraint=$${constraint}

ssh -Nf -L 9999:localhost:27017 angush@129.10.50.208

export PATH="$PATH:/home/t.hsu/openmx/source"
module load intel/compilers-2022.0.1
module load intel/mpi-2021.5.0
module load hdf5/1.12.1-intel2022

source /shared/centos7/intel/oneapi/2021.3.0/setvars.sh

conda activate /work/bansil/angus.h/atomate/atomate_env


$${pre_rocket}
cd $${launch_dir}
$${rocket_launch}
$${post_rocket}

# CommonAdapter (SLURM) completed writing Template
