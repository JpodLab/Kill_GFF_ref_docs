#!/bin/bash
gawk '!seen[$0]++' GenomeREF_23_LOC_products.tsv > GenomeREF_23_LOC_products_nodups.tsv
sort GenomeREF_23_LOC_products_nodups.tsv > GenomeREF_23_LOC_products_nodups_sorted.tsv
sort GenomeRef23_genes.tsv > GenomeRef23_genes_sorted.tsv
join -j 1 -t $'\t' GenomeRef23_genes_sorted.tsv GenomeREF_23_LOC_products_nodups_sorted.tsv > GenomeRef23.tsv
gawk 'BEGIN{print  "ID\t","Name\t", "Gene_Biotype\t", "Scaffold\t", "Feature\t", "Start_bp\t", "End_bp\t", "Strand\t", "Product\t";}' > GenomeRef_Header.tsv
cat GenomeRef_Header.tsv GenomeRef23.tsv GenomeRef_MITOgenes.tsv > GenomeRef23_wMITO.tsv
rm GenomeREF_23_LOC_products.tsv GenomeREF_23_LOC_products_nodups.tsv GenomeREF_23_LOC_products_nodups_sorted.tsv GenomeRef23_genes.tsv GenomeRef23_genes_sorted.tsv GenomeRef_Header.tsv GenomeRef23.tsv GenomeRef_MITOgenes.tsv
