#!/bin/bash
gawk 'BEGIN{FS="\t"}
{if($3!~/\ygene\y/) next; }
{n = split($9,a,";")}
{
   for(i=1 ;i<=n; i++)
    if(a[i]~"^ID=gene") ID=substr(a[i],8);
    else if(a[i]~"^Name=") name=substr(a[i],6);
    else if(a[i]~"^gene_biotype=") gene_biotype=substr(a[i],14);
    }
{print ID, "mt-"name, gene_biotype, $1, $3, $4, $5, $7}
' FS="\t" OFS="\t" Alim_mtgenome_2.0_annotated_ARmod.gff > GenomeRef_MITOgenes.tsv
