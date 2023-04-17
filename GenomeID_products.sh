#!/bin/bash
gawk '
NR==FNR {                                    # first run 
    if(($0 in strs)||($0 in subs))           # process only unseen strings
        next
        {if($3!~/\yCDS\y/) next; }
        {n = split($9,a,";")} {
        for(i=1 ;i<=n; i++)
          if(a[i]~"^Dbxref=GeneID:") dbxref=substr(a[i],15);
          else if(a[i]~"^product=") product=substr(a[i],9) ;
    }
    {n = split(dbxref,b,",")}
    {c = gsub(/%2C/,",",product)}
    {n = split(product,d," isoform X")}
{print "LOC"b[1], d[1]}}
' FS="\t" OFS="\t" GCF_001266775.1_Austrofundulus_limnaeus-1.0_genomic.gff > GenomeREF_23_LOC_products.tsv


