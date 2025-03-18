#!/bin/sh
plotHeatmap --zMin -3 --zMax 3 --heatmapHeight 15 --heatmapWidth 6 --colorMap bwr -m Genes_2k_with_H3K27.computeMatrix.gz -out Genes_2k_with_H3K27_plotHeatmap.pdf &
plotHeatmap --zMin -3 --zMax 3 --heatmapHeight 15 --heatmapWidth 6 --colorMap bwr -m Genes_2k_with_H2A.computeMatrix.gz -out Genes_2k_with_H2A_plotHeatmap.pdf &
plotHeatmap --zMin -3 --zMax 3 --heatmapHeight 15 --heatmapWidth 6 --colorMap bwr -m Genes_2k_with_both_H2A_H3K27.K27.computeMatrix.gz -out Genes_2k_with_both_H2A_H3K27.K27_plotHeatmap.pdf &
plotHeatmap --zMin -3 --zMax 3 --heatmapHeight 15 --heatmapWidth 6 --colorMap bwr -m Genes_2k_with_both_H2A_H3K27.H2A.computeMatrix.gz -out Genes_2k_with_both_H2A_H3K27.H2A_plotHeatmap.pdf &
plotHeatmap --zMin -3 --zMax 3 --heatmapHeight 15 --heatmapWidth 6 --colorMap bwr -m Genes_2k_with_only_H3K27.K27.computeMatrix.gz -out Genes_2k_with_only_H3K27.K27_plotHeatmap.pdf &
plotHeatmap --zMin -3 --zMax 3 --heatmapHeight 15 --heatmapWidth 6 --colorMap bwr -m Genes_2k_with_only_H2A.H2A.computeMatrix.gz -out Genes_2k_with_only_H2A.H2A_plotHeatmap.pdf &
wait