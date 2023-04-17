#!/bin/bash
gawk 'BEGIN{FS="\t"}
#BEGIN{print  "ID\t","Name\t", "Gene_Biotype\t", "Scaffold\t", "Feature\t", "Start_bp\t", "End_bp\t", "Strand\t";}
{if($3!~/\ygene\y/) next; }
{n = split($9,a,";")}
{
   for(i=1 ;i<=n; i++)
    if(a[i]~"^Dbxref=GeneID:") dbxref=substr(a[i],15);
    else if(a[i]~"^Name=") name=substr(a[i],6);
    else if(a[i]~"^gene_biotype=") gene_biotype=substr(a[i],14);
    }
{print "LOC"dbxref, name, gene_biotype, $1, $3, $4, $5, $7}
' FS="\t" OFS="\t" GCF_001266775.1_Austrofundulus_limnaeus-1.0_genomic.gff > GenomeRef23_genes.tsv
