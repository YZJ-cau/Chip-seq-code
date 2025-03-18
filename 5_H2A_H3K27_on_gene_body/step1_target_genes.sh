perl extract_exp_gene.pl ./expressed_genes_in_B73_both_reps ../step7_genes_with_peaks/Genes_2k_with_B73_H3K27_peaks_uniq Genes_2k_with_B73_H3K27_peaks_uniq
perl extract_exp_gene.pl ./expressed_genes_in_B73_both_reps ../step7_genes_with_peaks/Genes_2k_with_B73_H2A_peaks_uniq Genes_2k_with_B73_H2A_peaks_uniq
cut -f 4 Genes_2k_with_B73_H3K27_peaks_uniq > Genes_2k_with_H3K27
cut -f 4  Genes_2k_with_B73_H2A_peaks_uniq > Genes_2k_with_H2A

cat Genes_2k_with_H3K27 Genes_2k_with_H2A|sort|uniq -c|awk '$1==2'|awk '{print $NF}' > Genes_2k_with_both_H2A_H3K27

perl hash.pl Genes_2k_with_both_H2A_H3K27 Genes_2k_with_H2A Genes_2k_with_only_H2A
perl hash.pl Genes_2k_with_both_H2A_H3K27 Genes_2k_with_H3K27 Genes_2k_with_only_H3K27
