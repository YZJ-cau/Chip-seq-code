intersectBed -a B73-H2A/B73-H2A_RPKM_on_wt_mt.bed -b ../../../../ncbi/maize_V4_genomic_on_genes.kind -f 0.5 -wo |sort|uniq > B73-H2A/B73-H2A_RPKM_on_wt_mt.bed_distr

intersectBed -a B73-H3K27/B73-H3K27_RPKM_on_wt_mt.bed -b ../../../../ncbi/maize_V4_genomic_on_genes.kind -f 0.5 -wo |sort|uniq > B73-H3K27/B73-H3K27_RPKM_on_wt_mt.bed_distr

intersectBed -a emf1-H2A/emf1-H2A_RPKM_on_wt_mt.bed -b ../../../../ncbi/maize_V4_genomic_on_genes.kind -f 0.5 -wo |sort|uniq > emf1-H2A/emf1-H2A_RPKM_on_wt_mt.bed_distr

intersectBed -a emf1-H3K27/emf1-H3K27_RPKM_on_wt_mt.bed -b ../../../../ncbi/maize_V4_genomic_on_genes.kind -f 0.5 -wo |sort|uniq > emf1-H3K27/emf1-H3K27_RPKM_on_wt_mt.bed_distr

