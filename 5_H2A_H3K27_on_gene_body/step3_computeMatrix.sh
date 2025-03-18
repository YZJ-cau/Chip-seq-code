#!/bin/bash
computeMatrix scale-regions --missingDataAsZero -bs 10 -b 2000 -a 2000 --regionBodyLength 6000 --sortRegions keep -R Genes_2k_with_H3K27_bed -S ../peak_process/emf1-H3K27_FE.bdg.sort.bw -o Genes_2k_with_H3K27.computeMatrix.gz -p max &
computeMatrix scale-regions --missingDataAsZero -bs 10 -b 2000 -a 2000 --regionBodyLength 6000 --sortRegions keep -R Genes_2k_with_H2A_bed -S ../peak_process/B73-H2A_FE.bdg.sort.bw ../peak_process/emf1-H2A_FE.bdg.sort.bw -o Genes_2k_with_H2A.computeMatrix.gz -p max &

computeMatrix scale-regions --missingDataAsZero -bs 10 -b 2000 -a 2000 --regionBodyLength 6000 --sortRegions keep -R Genes_2k_with_both_H2A_H3K27_bed -S ../peak_process/B73-H3K27_FE.bdg.sort.bw ../peak_process/emf1-H3K27_FE.bdg.sort.bw -o Genes_2k_with_both_H2A_H3K27.K27.computeMatrix.gz -p max &
computeMatrix scale-regions --missingDataAsZero -bs 10 -b 2000 -a 2000 --regionBodyLength 6000 --sortRegions keep -R Genes_2k_with_both_H2A_H3K27_bed -S ../peak_process/B73-H2A_FE.bdg.sort.bw ../peak_process/emf1-H2A_FE.bdg.sort.bw -o Genes_2k_with_both_H2A_H3K27.H2A.computeMatrix.gz -p max &

computeMatrix scale-regions --missingDataAsZero -bs 10 -b 2000 -a 2000 --regionBodyLength 6000 --sortRegions keep -R Genes_2k_with_only_H3K27_bed -S ../peak_process/B73-H3K27_FE.bdg.sort.bw ../peak_process/emf1-H3K27_FE.bdg.sort.bw -o Genes_2k_with_only_H3K27.K27.computeMatrix.gz -p max &
computeMatrix scale-regions --missingDataAsZero -bs 10 -b 2000 -a 2000 --regionBodyLength 6000 --sortRegions keep -R Genes_2k_with_only_H2A_bed -S ../peak_process/B73-H2A_FE.bdg.sort.bw ../peak_process/emf1-H2A_FE.bdg.sort.bw -o Genes_2k_with_only_H2A.H2A.computeMatrix.gz -p max &
wait
peak_process