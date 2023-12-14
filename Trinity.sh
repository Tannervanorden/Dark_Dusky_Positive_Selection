#!/bin/bash --login
#SBATCH --time=72:00:00 --nodes=1 --ntasks=10 --mem=155G -J Trinity
#SBATCH --mail-user=Tannervanorden@gmail.com   # email address
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

conda activate Trinity

Trinity --seqType fq --max_memory 150G --trimmomatic --left /home/tannerv1/Transcriptomes/TRINITY/S_variabilis_1003082_RNA_R1.fastq  --right /home/tannerv1/Transcriptomes/TRINITY/S_variabilis_1003082_RNA_R2.fastq  --CPU 10
