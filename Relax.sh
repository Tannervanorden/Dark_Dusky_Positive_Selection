for i in *.fasta
do
conda activate hyphy
x="$( echo $i|cut -d\. -f1)"
hyphy relax --alignment $x.fasta --tree $x.tre  --test 2 
done
