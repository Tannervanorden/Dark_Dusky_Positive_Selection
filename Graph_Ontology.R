library(tidyverse)

##Molecular Bar Graph
Molecular = read_tsv('/Users/tannervanorden/Dropbox/Dark_Dusky_Research/Panther/Molecular.tsv') %>% arrange(desc(Number)) 

z = ggplot(data=Molecular, aes(x=reorder(Molecular, Number), y=Number, fill=reorder(Molecular, -Number))) +
  geom_bar(stat="identity") + labs(x = NULL, y = 'Number') + guides(fill=guide_legend(title="Molecular Function")) + 
  coord_flip() + theme(text = element_text(size = 29))
ggsave('/Users/tannervanorden/Desktop/All_Molecular.pdf', width = 18, height = 9)

##Biological Bar Graph
Biological = read_tsv('/Users/tannervanorden/Dropbox/Dark_Dusky_Research/Panther/Biological.tsv')

y = ggplot(data=Biological, aes(x=reorder(Biological, Number), y=Number, fill=reorder(Biological, -Number))) +
  geom_bar(stat="identity") + labs(x = NULL, y = 'Number') + guides(fill=guide_legend(title="Biological Function")) + 
  coord_flip() + theme(text = element_text(size = 29))

ggsave('/Users/tannervanorden/Desktop/All_Biological.pdf', width = 18, height = 9)

##Protein Bar Graph
Protein = read_tsv('/Users/tannervanorden/Dropbox/Dark_Dusky_Research/Panther/Protein.tsv') 

x = ggplot(data=Protein, aes(x=reorder(Protein, Number), y=Number, fill=reorder(Protein, -Number))) +
  geom_bar(stat="identity") + labs(x = NULL, y = 'Number') + guides(fill=guide_legend(title="Protein Class")) + guides(fill = guide_legend(ncol = 1)) +
  coord_flip() + theme(text = element_text(size = 29))
ggsave('/Users/tannervanorden/Desktop/All_Protein.pdf', width = 22, height = 10)

##Molecular  Selection Bar Graph
Molecular = read_csv('/Users/tannervanorden/Desktop/Panther/Selection_Molecular.csv') %>% arrange(desc(Number)) 

ggplot(data=Molecular, aes(x=reorder(Molecular, Number), y=Number, fill=reorder(Molecular, -Number))) +
  geom_bar(stat="identity") + labs(x = NULL, y = 'Number') + guides(fill=guide_legend(title="Molecular Function")) + 
  coord_flip() + theme(text = element_text(size = 25))
  
ggsave('/Users/tannervanorden/Desktop/Selection_Molecular.pdf', width = 22, height = 10)

##Biological Selection Bar Graph
Biological = read_csv('/Users/tannervanorden/Desktop/Panther/Selection_Biological.csv')

ggplot(data=Biological, aes(x=reorder(Biological, Number), y=Number, fill=reorder(Biological, -Number))) +
  geom_bar(stat="identity") + labs(x = NULL, y = 'Number') + guides(fill=guide_legend(title="Biological Function")) + 
  coord_flip() + theme(text = element_text(size = 25))

ggsave('/Users/tannervanorden/Desktop/Panther/Selection_Biological.pdf', width = 22, height = 10)

##Protein Bar Graph
Protein = read_csv('/Users/tannervanorden/Desktop/Panther/Selection_Protein.csv') 

ggplot(data=Protein, aes(x=reorder(Protein, Number), y=Number, fill=reorder(Protein, -Number))) +
  geom_bar(stat="identity") + labs(x = NULL, y = 'Number') + guides(fill=guide_legend(title="Protein Class")) + guides(fill = guide_legend(ncol = 1)) +
  coord_flip() + theme(text = element_text(size = 25))
ggsave('/Users/tannervanorden/Desktop/Panther/Selection_Protein.pdf', width = 22, height = 10)
