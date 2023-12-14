#!/bin/bash --login

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=6   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=5120M   # memory per CPU core
#SBATCH -J "Busco "   # job name
#SBATCH --mail-user=tannervanorden@gmail.com   # email address
#SBATCH --mail-type=END


# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
conda activate busco

busco -m transcriptome -i /home/tannerv1/Transcriptomes/S_variabilis_1003082/trinity_out_dir.Trinity.fasta -o busco_results -l ~/Transcriptomes/BUSCO1/actinopterygii_odb10 --offline
