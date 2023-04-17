#Creating a Genome Reference to attach Gene LOC' IDs with gene symbols and biotype (among other features) from the killifish genome annotation file (.gff)

#Run to create the file GenomeRef_MITOgenes.tsv once and save forever
MITO_Biotype.sh

#Download a new GFF file for Austrofundulus limnaeus from NCBI: https://www.ncbi.nlm.nih.gov/genome/?term=austrofundulus%20limnaeus

#Awk commands do not work normally on MAC OS - install gawk which should work for Lunix and Unix, if not, edit the script below to use GAWK
#For Mac OS: Install gawk through brew 
brew install gawk
source 
#then throw alias awk="gawk" in your ~/.zprofile or ~/.bash_profile

#Run the following 

Biotype.sh #to extract information from every gene with a LOC-ID

GenomeID_products.sh #to create a product reference for each LOC ID. These will be a description determined by first isoform.

GFF_massager.sh #to manipulate the docs before combining into one master reference and removing the unnecessary intermediate files:



##IMPORTANT: If importing into excel, change the format of the 'Name' column to text, or else some genes will be converted into a date. very annoying

#Helpful hint - update the file na at the end of the script to represent the date or year you retrieved the data from NCBI.



