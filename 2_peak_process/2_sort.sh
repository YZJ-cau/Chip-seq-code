for i in `cat file_list`
do
	sort -k1,1 -k2,2n ${i}/${i}_FE.bdg > ${i}/${i}_FE.bdg.sort
done
