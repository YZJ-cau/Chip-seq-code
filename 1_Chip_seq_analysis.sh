#!/bin/bash

# 从命令行参数获取输入文件
input_R1=$1  # Read 1文件
input_R2=$2  # Read 2文件

# 检查输入文件是否存在
if [ ! -f "${input_R1}" ] || [ ! -f "${input_R2}" ]; then
  echo "Error: Input files ${input_R1} or ${input_R2} not found!"
  exit 1
fi

# 提取样本名称（假设输入文件名为 sample_R1.fastq.gz 和 sample_R2.fastq.gz）
sample_name=$(basename ${input_R1} | sed 's/_R1.fastq.gz//')

# 1. fastp质控和过滤
echo "Running fastp for ${sample_name}..."
fastp --thread 2 \
  -i ${input_R1} \
  -o ${sample_name}_R1_clean.fastq.gz \
  -I ${input_R2} \
  -O ${sample_name}_R2_clean.fastq.gz \
  -j ${sample_name}_fastp.json \
  -h ${sample_name}_fastp.html

# 检查fastp是否成功
if [ $? -ne 0 ]; then
  echo "Error: fastp failed for ${sample_name}!"
  exit 1
fi

# 2. 基因组比对
echo "Running bowtie2 for ${sample_name}..."
bowtie2 -t -q -N 0 -L 25 -X 1000 -p 10 \
  -x ./bowtie2_index/B73V4_index \
  -1 ${sample_name}_R1_clean.fastq.gz \
  -2 ${sample_name}_R2_clean.fastq.gz \
  | samtools view -bS -q 20 - \
  | samtools sort - -o ${sample_name}.sorted.bam

# 检查bowtie2是否成功
if [ $? -ne 0 ]; then
  echo "Error: bowtie2 failed for ${sample_name}!"
  exit 1
fi

# 3. 去除PCR重复
echo "Removing PCR duplicates for ${sample_name}..."
samtools rmdup ${sample_name}.sorted.bam ${sample_name}.rmdup.sorted.bam

# 检查去重是否成功
if [ $? -ne 0 ]; then
  echo "Error: samtools rmdup failed for ${sample_name}!"
  exit 1
fi

# 4. 合并重复（如果有多个重复样本）
# 假设有多个重复样本，命名为 ${sample_name}-rep1, ${sample_name}-rep2, 等等
# 这里假设只有一个样本，跳过合并步骤
# 如果有多个重复样本，可以取消注释以下代码：
# samtools merge ${sample_name}.merged.sorted.bam ${sample_name}-rep1.rmdup.sorted.bam ${sample_name}-rep2.rmdup.sorted.bam

# 5. Peak calling
echo "Running MACS2 peak calling for ${sample_name}..."
###组蛋白修饰peak calling
macs2 callpeak --broad \
  -t ${sample_name}.rmdup.sorted.bam \
  -c B73-input.sorted.bam \
  -f BAM -g 2.06e+9 -q 0.01 \
  -n ${sample_name} --bdg --SPMR

###转录因子peak calling
macs2 callpeak \
  -t ${sample_name}.rmdup.sorted.bam \
  -c B73-input.sorted.bam \
  -f BAM -g 2.06e+9 -q 0.01 \
  -n B73-H2A --bdg --SPMR

# 检查MACS2是否成功
if [ $? -ne 0 ]; then
  echo "Error: MACS2 peak calling failed for ${sample_name}!"
  exit 1
fi

echo "Pipeline completed successfully for ${sample_name}!"