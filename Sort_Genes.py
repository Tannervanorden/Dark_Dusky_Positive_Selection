import os
import re
import pandas as pd

#This is just a path to where the Transcriptomes you want to look at are stored
path = '/home/tannerv1/compute/CDS_files/Transcriptomes'
Cap_names = []
Gene_names = []
Gene_names_all = []
os.mkdir(f'/home/tannerv1/compute/CDS_files/Transcriptomes/single_copy_orthologs')

for files in os.listdir(path):
	if re.search(r'.*.fas', files):
		z = files.split('.')
		os.mkdir(f'/home/tannerv1/compute/CDS_files/Transcriptomes/single_copy_orthologs/{z[0]}')
		with open(files, 'r') as S_fasta:

            #opens the emapper.annotations file as a data frame and reads the query column and the Preferred_name column into a list.
            #Python takes this list and groups all of the preferred names together and then chooses the correspondind gene to the name as the best copy of that gene. 
			data = pd.read_csv(f'{z[0]}.emapper.annotations', sep="\t")
			data["score"] = pd.to_numeric(data["score"])
			data = data.loc[data.groupby('Preferred_name')["score"].idxmax()]
			Cap_names = data['#query'].tolist()
			Gene_names = data['Preferred_name'].tolist()
			#Gene_names_all.extend(Gene_names)
			Everything = S_fasta.read()

            #iterates through the list and keeps track of which gene name goes with which Gene  name.
			for i, name in enumerate(Cap_names):
				Everything = Everything.replace(Cap_names[i], Gene_names[i])

            #opens the already used trinity fasta file and writes over it with the new gene names.
			with open(files, 'w') as F_files:
				F_files.write(Everything)
				F_files.close()
			S_fasta.close()

			#pulls genes to a different directory
			for i, names in enumerate(Gene_names):
				writing_path = f'/home/tannerv1/compute/CDS_files/Transcriptomes/single_copy_orthologs/{z[0]}/{names}'
				with open(writing_path, 'w') as gene_files:
					with open(files, 'r')  as edited_fasta:
						Everthing = edited_fasta.read()
						gene = re.findall(f'>{Gene_names[i]}.*\n[G|C|A|T|\n]*>', Everything)
						if len(gene) == 1:
							gene_str = str(gene[0])
							gene_files.write(gene_str[:-1])
						else:
							gene_files.write('')
