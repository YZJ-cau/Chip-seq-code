for i in `cat file_list`
do
macs2 bdgcmp -t ${i}/${i}_treat_pileup.bdg -c ${i}/${i}_control_lambda.bdg -o ${i}/${i}_FE.bdg -m FE
done
