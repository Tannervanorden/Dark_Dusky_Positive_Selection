for i in *.fasta
do
conda activate hyphy
x="$( echo $i|cut -d\. -f1)"
hyphy busted --alignment $x.fasta --tree $x.tre --branches All
 --srv Yes --rates 3 --multiple-hits None --syn-rates 3 --grid-size 250 --starting-points 1 --output $x.BUSTED.json 
done
