import os
import re

path = '/home/tannerv1/single_copy_orthologs/S_ciliatus_267108'
for files in os.listdir(path):
	if re.search(r'.*faa', files):
		break
	else:
		writing_path = f'/home/tannerv1/single_copy_orthologs/S_ciliatus_267108/{files}.faa'
		with open(writing_path, 'a') as Protein:
			inputfile = files
			f = open(inputfile, "r")
			seq = f.read()
			line = re.findall(r'>.*', seq)
			Protein.write(f'{line[0]}\n')
			seq = seq.replace(line[0], "")
			seq = seq.replace("\n", "")
			seq = seq.replace("\r", "")
			table = {
			'ATA':'I', 'ATC':'I', 'ATT':'I', 'ATG':'M',
			'ACA':'T', 'ACC':'T', 'ACG':'T', 'ACT':'T',
			'AAC':'N', 'AAT':'N', 'AAA':'K', 'AAG':'K',
			'AGC':'S', 'AGT':'S', 'AGA':'R', 'AGG':'R',
			'CTA':'L', 'CTC':'L', 'CTG':'L', 'CTT':'L',
			'CCA':'P', 'CCC':'P', 'CCG':'P', 'CCT':'P',
			'CAC':'H', 'CAT':'H', 'CAA':'Q', 'CAG':'Q',
			'CGA':'R', 'CGC':'R', 'CGG':'R', 'CGT':'R',
			'GTA':'V', 'GTC':'V', 'GTG':'V', 'GTT':'V',
			'GCA':'A', 'GCC':'A', 'GCG':'A', 'GCT':'A',
			'GAC':'D', 'GAT':'D', 'GAA':'E', 'GAG':'E',
			'GGA':'G', 'GGC':'G', 'GGG':'G', 'GGT':'G',
			'TCA':'S', 'TCC':'S', 'TCG':'S', 'TCT':'S',
			'TTC':'F', 'TTT':'F', 'TTA':'L', 'TTG':'L',
			'TAC':'Y', 'TAT':'Y', 'TAA':'', 'TAG':'',
			'TGC':'C', 'TGT':'C', 'TGA':'', 'TGG':'W',
			}
			z = 0
			for i in range(0, len(seq), 3):
				codon = seq[i:i + 3]
				if codon in table:
					if table[codon] == '':
						Protein.write("")
						break
					else:
						amino_acid = table[codon]
						Protein.write(amino_acid)
				else:
					break	
