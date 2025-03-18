intersectBed -a B73-H2A/B73-H2A_RPKM_on_wt_mt.bed_distr -b emf1-H2A/emf1-H2A_RPKM_on_wt_mt.bed_distr -f 0.5 -wao > B73-H2A_emf1-H2A_RPKM_on_wt_mt.bed_distr_with_emf1peakornot
intersectBed -a emf1-H2A/emf1-H2A_RPKM_on_wt_mt.bed_distr -b B73-H2A/B73-H2A_RPKM_on_wt_mt.bed -v > emf1-H2A_B73-H2A_RPKM_on_wt_mt.bed_distr_without_B73peak

intersectBed -a B73-H3K27/B73-H3K27_RPKM_on_wt_mt.bed_distr -b emf1-H3K27/emf1-H3K27_RPKM_on_wt_mt.bed_distr -f 0.5 -wao > B73-H3K27_emf1-H3K27_RPKM_on_wt_mt.bed_distr_with_emf1peakornot
intersectBed -a emf1-H3K27/emf1-H3K27_RPKM_on_wt_mt.bed_distr -b B73-H3K27/B73-H3K27_RPKM_on_wt_mt.bed -v > emf1-H3K27_B73-H3K27_RPKM_on_wt_mt.bed_distr_without_B73peak
