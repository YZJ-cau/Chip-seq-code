#!/bin/bash
plotProfile --plotTitle Genes_2k_with_H3K27 --yMin 0 --yMax 8 -m Genes_2k_with_H3K27.computeMatrix.gz --colors red blue --samplesLabel B73 emf1 --perGroup -out Genes_2k_with_H3K27.pdf --outFileNameData Genes_2k_with_H3K27.txt &
plotProfile --plotTitle Genes_2k_with_H2A --yMin 0 --yMax 8 -m Genes_2k_with_H2A.computeMatrix.gz --colors red blue --samplesLabel B73 emf1 --perGroup -out Genes_2k_with_H2A.pdf --outFileNameData Genes_2k_with_H2A.txt &
plotProfile --plotTitle Genes_2k_with_both_H2A_H3K27 --yMin 0 --yMax 8 -m Genes_2k_with_both_H2A_H3K27.K27.computeMatrix.gz --colors red blue --samplesLabel B73 emf1 --perGroup -out Genes_2k_with_both_H2A_H3K27.K27.pdf --outFileNameData Genes_2k_with_both_H2A_H3K27.K27.txt &
plotProfile --plotTitle Genes_2k_with_both_H2A_H3K27 --yMin 0 --yMax 8 -m Genes_2k_with_both_H2A_H3K27.H2A.computeMatrix.gz --colors red blue --samplesLabel B73 emf1 --perGroup -out Genes_2k_with_both_H2A_H3K27.H2A.pdf --outFileNameData Genes_2k_with_both_H2A_H3K27.H2A.txt &
plotProfile --plotTitle Genes_2k_with_only_H3K27 --yMin 0 --yMax 8 -m Genes_2k_with_only_H3K27.K27.computeMatrix.gz --colors red blue --samplesLabel B73 emf1 --perGroup -out Genes_2k_with_only_H3K27.pdf --outFileNameData Genes_2k_with_only_H3K27.K27.txt &
plotProfile --plotTitle Genes_2k_with_only_H2A --yMin 0 --yMax 8 -m Genes_2k_with_only_H2A.H2A.computeMatrix.gz --colors red blue --samplesLabel B73 emf1 --perGroup -out Genes_2k_with_only_H2A.pdf --outFileNameData Genes_2k_with_only_H2A.txt &
wait
