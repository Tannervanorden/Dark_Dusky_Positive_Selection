for i in *aligned.fas
do
conda activate pal2nal
x="$( echo $i|cut -d\. -f1)"
perl pal2nal.pl $x.faa  $x.fas -output fasta > $x_pal2nal.fasta
done
