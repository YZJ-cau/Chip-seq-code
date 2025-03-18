for i in `cat file_list`
do
sed '/ctg/d' ${i}/${i}_FE.bdg.sort_2 > ${i}/${i}_FE.bdg.sort_noContig
bedGraphToBigWig ${i}/${i}_FE.bdg.sort_noContig Zea_mays.AGPv4.dna.chr.fa.len_2 ${i}/${i}_FE.bdg.sort.bw
done
