#!/bin/bash --login
#SBATCH --time=72:00:00 --ntasks=6 --nodes=1 --mem-per-cpu=5G -J cd-hit
#SBATCH --mail-user=Tannervanorden@gmail.com   # email address
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

cd-hit-est -i Trinity_Output.fasta -o out_cdhit_S_variabilis_1003082.fasta -M 0 -T 6
