for i in *.fasta
do
conda activate fasttree
x="$( echo $i|cut -d\. -f1)"
FastTree -nt -gtr -gamma $x.fasta > $x.tre
done
