input_id=$1
input_file=$2
mkdir -p ${input_id}
intersectBed -a ${input_file} -b ./ncbi/maize_up2K_uniq -f 0.5 -u|wc -l|awk '{print "Gene_up2kb "$0}' > ${input_id}/${input_id}_ditri_of_peaks
intersectBed -a ${input_file} -b ./ncbi/maize_up2K_uniq -f 0.5 -u > ${input_id}/Gene_up2kb_${input_id}_ditri_of_peaks_cor.txt

intersectBed -a ${input_file} -b ./ncbi/maize_exon_uniq -f 0.5 -u|wc -l|awk '{print "Gene_exon "$0}' >> ${input_id}/${input_id}_ditri_of_peaks
intersectBed -a ${input_file} -b ./ncbi/maize_exon_uniq -f 0.5 -u > ${input_id}/Gene_exon_${input_id}_ditri_of_peaks_cor.txt

intersectBed -a ${input_file} -b ./ncbi/maize_intron_uniq -f 0.5 -u|wc -l|awk '{print "Gene_intron "$0}' >> ${input_id}/${input_id}_ditri_of_peaks
intersectBed -a ${input_file} -b ./ncbi/maize_intron_uniq -f 0.5 -u > ${input_id}/Gene_intron_${input_id}_ditri_of_peaks_cor.txt

intersectBed -a ${input_file} -b ./ncbi/maize_down2K_uniq -f 0.5 -u|wc -l|awk '{print "Gene_down2kb "$0}' >> ${input_id}/${input_id}_ditri_of_peaks
intersectBed -a ${input_file} -b ./ncbi/maize_down2K_uniq -f 0.5 -u > ${input_id}/Gene_down2kb_${input_id}_ditri_of_peaks_cor.txt

intersectBed -a ${input_file} -b ./ncbi/maize_intergenic_uniq -f 0.5 -u|wc -l|awk '{print "Intergenic "$0}' >> ${input_id}/${input_id}_ditri_of_peaks
intersectBed -a ${input_file} -b ./ncbi/maize_intergenic_uniq -f 0.5 -u > ${input_id}/Intergenic_${input_id}_ditri_of_peaks_cor.txt

intersectBed -a ${input_file} -b ./ncbi/maize_V4_TE -f 0.5 -u|wc -l|awk '{print "TE "$0}' >> ${input_id}/${input_id}_ditri_of_peaks
intersectBed -a ${input_file} -b ./ncbi/maize_V4_TE -f 0.5 -u > ${input_id}/TE_${input_id}_ditri_of_peaks_cor.txt
