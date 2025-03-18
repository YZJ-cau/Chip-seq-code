

awk '{print $4"\t"$1"\t"$2"\t"$3}' ../step4_peak_calling/emf1-H3K27_peaks.broadPeak >emf1-H3K27_position_of_peak.txt
awk '{print $4"\t"$1"\t"$2"\t"$3}' ../step4_peak_calling/B73-H3K27_peaks.broadPeak >B73-H3K27_position_of_peak.txt
awk '{print $4"\t"$1"\t"$2"\t"$3}' ../step4_peak_calling/B73-H2A_peaks.narrowPeak >B73-H2A_position_of_peak.txt
awk '{print $4"\t"$1"\t"$2"\t"$3}' ../step4_peak_calling/emf1-H2A_peaks.narrowPeak >emf1-H2A_position_of_peak.txt

perl step1_calculate-depth.pl B73-H2A_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H2A.sorted.bam > B73-H2A_peak_depth &
perl step1_calculate-depth.pl B73-H2A_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H2A.sorted.bam > B73-H2A_peak_depth_on_emf1 &
perl step1_calculate-depth.pl B73-H3K27_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H3K27.sorted.bam > B73-H3K27_peak_depth &
perl step1_calculate-depth.pl B73-H3K27_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H3K27.sorted.bam > B73-H3K27_peak_depth_on_emf1 &
perl step1_calculate-depth.pl emf1-H2A_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H2A.sorted.bam > emf1-H2A_peak_depth &
perl step1_calculate-depth.pl emf1-H2A_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H2A.sorted.bam > emf1-H2A_peak_depth_on_B73 &
perl step1_calculate-depth.pl emf1-H3K27_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H3K27.sorted.bam > emf1-H3K27_peak_depth
perl step1_calculate-depth.pl emf1-H3K27_position_of_peak.txt /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H3K27.sorted.bam > emf1-H3K27_peak_depth_on_B73
wait

sed -i 1d *peak_depth*
awk '{print $1"\t"$1"\t"$4-$3+1}' emf1-H3K27_position_of_peak.txt > emf1-H3K27_peaks_length_reshape.txt
awk '{print $1"\t"$1"\t"$4-$3+1}' B73-H3K27_position_of_peak.txt > B73-H3K27_peaks_length_reshape.txt
awk '{print $1"\t"$1"\t"$4-$3+1}' B73-H2A_position_of_peak.txt > B73-H2A_peaks_length_reshape.txt
awk '{print $1"\t"$1"\t"$4-$3+1}' emf1-H2A_position_of_peak.txt > emf1-H2A_peaks_length_reshape.txt

perl step2_calculate-rpkm.pl B73-H2A_peaks_length_reshape.txt B73-H2A_peak_depth /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H2A.sorted.bam > B73-H2A_RPKM &
perl step2_calculate-rpkm.pl B73-H2A_peaks_length_reshape.txt B73-H2A_peak_depth_on_emf1 /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H2A.sorted.bam > B73-H2A_peak_RPKM_on_emf1 &
perl step2_calculate-rpkm.pl B73-H3K27_peaks_length_reshape.txt B73-H3K27_peak_depth /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H3K27.sorted.bam > B73-H3K27_RPKM &
perl step2_calculate-rpkm.pl B73-H3K27_peaks_length_reshape.txt B73-H3K27_peak_depth_on_emf1 /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H3K27.sorted.bam > B73_H3K27_peak_RPKM_on_emf1 &
perl step2_calculate-rpkm.pl emf1-H2A_peaks_length_reshape.txt emf1-H2A_peak_depth /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H2A.sorted.bam > emf1-H2A_RPKM &
perl step2_calculate-rpkm.pl emf1-H2A_peaks_length_reshape.txt emf1-H2A_peak_depth_on_B73 /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H2A.sorted.bam > emf1-H2A_peak_RPKM_on_B73 &
perl step2_calculate-rpkm.pl emf1-H3K27_peaks_length_reshape.txt emf1-H3K27_peak_depth /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/emf1-H3K27.sorted.bam > emf1-H3K27_RPKM 
perl step2_calculate-rpkm.pl emf1-H3K27_peaks_length_reshape.txt emf1-H3K27_peak_depth_on_B73 /public1/home/sc32033/TLi/YZJ_chip/step3_merge_replication/B73-H3K27.sorted.bam > emf1-H3K27_peak_RPKM_on_B73
wait

