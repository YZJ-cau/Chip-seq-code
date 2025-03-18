#!/bin/sh
for i in `cat file_list`
do 
intersectBed -a mazie_V4_genes_bed_2k_fil -b ${i}/${i}*Peak -wo > ${i}/Genes_2k_with_${i}_peaks
cut -f 1,2,3,4,5 ${i}/Genes_2k_with_${i}_peaks |sort|uniq > ${i}/Genes_2k_with_${i}_peaks_uniq
cut -f 4 ${i}/Genes_2k_with_${i}_peaks_uniq > ${i}/Genes_2k_with_${i}_peaks_uniq_cut4
done

for i in `cat file_list`
do
intersectBed -a mazie_V4_genes_bed_5k_fil -b ${i}/${i}*Peak -wo > ${i}/Genes_5k_with_${i}_peaks
cut -f 1,2,3,4,5 ${i}/Genes_5k_with_${i}_peaks |sort|uniq > ${i}/Genes_5k_with_${i}_peaks_uniq
cut -f 4 ${i}/Genes_5k_with_${i}_peaks_uniq > ${i}/Genes_5k_with_${i}_peaks_uniq_cut4
done
