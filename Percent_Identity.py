import os
import re
from Bio import SeqIO


path = "/home/tannerv1/BUSTED_RELAX"
results_path = "/home/tannerv1/BUSTED_RELAX/Percent_Identity_Results.txt"
Directory_of_Genes = os.listdir(path)

Overall_nucleotide_matches = []
Overall_mismatches = []
List_of_all_Percent_Identity = []

with open(results_path, 'a') as Output:
	for genes in Directory_of_Genes:

		Matches = 0
		Mismatches = 0

		if re.search(r'.*.fasta', genes):
			records = list(SeqIO.parse(genes, "fasta"))
			S_ciliatus = (records[0].seq) 
			S_variabilis = (records[-1].seq)
			for nucleotidesC, nucleotidesV in zip(S_ciliatus, S_variabilis):
				if nucleotidesC == '-' or nucleotidesV == '-':
					pass
				elif nucleotidesC == nucleotidesV:
					Matches += 1
				else:
					Mismatches += 1
			Percent_Identity = 100 * (Matches / (Matches + Mismatches))

			Overall_nucleotide_matches.append(Matches)
			Overall_mismatches.append(Mismatches)
			List_of_all_Percent_Identity.append(Percent_Identity)

			Output.write(f'The percent identity for {genes} is {Percent_Identity}.\n\n')
	Total_Percent_Identity = 100 * (sum(Overall_nucleotide_matches) / (sum(Overall_nucleotide_matches) + sum(Overall_mismatches)))
	Output.write(f'The percent identity for all genes included overall is {Total_Percent_Identity}\n')
	counter = 0
	for percents in List_of_all_Percent_Identity:
		if percents == 100.0:
			counter += 1
	Output.write(f'{counter} genes were 100 percent the same\n')
	
	Minimum_Percent_Identity = min(List_of_all_Percent_Identity)
	Output.write(f'The gene that was the most different had {Minimum_Percent_Identity} Percent Identity')
