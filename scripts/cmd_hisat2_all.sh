hisat2 -x /home/guocheng/yeast_project/data/reference/yeast_ref -U /home/guocheng/yeast_project/data/raw_data/file.fq.gz//SRR1916153.fastq.gz | samtools view -bS - | samtools sort - -o EV_strain_4.srt.bam
samtools index EV_strain_4.srt.bam
hisat2 -x /home/guocheng/yeast_project/data/reference/yeast_ref -U /home/guocheng/yeast_project/data/raw_data/file.fq.gz//SRR1916156.fastq.gz | samtools view -bS - | samtools sort - -o 3b_strain_4.srt.bam
samtools index 3b_strain_4.srt.bam
hisat2 -x /home/guocheng/yeast_project/data/reference/yeast_ref -U /home/guocheng/yeast_project/data/raw_data/file.fq.gz//SRR1916155.fastq.gz | samtools view -bS - | samtools sort - -o 3b_strain_3.srt.bam
samtools index 3b_strain_3.srt.bam
#hisat2 -x /home/guocheng/yeast_project/data/reference/yeast_ref -U /home/guocheng/yeast_project/data/raw_data/file.fq.gz//SRR1916154.fastq.gz | samtools view -bS - | samtools sort - -o 3b_strain_2.srt.bam
#samtools index 3b_strain_2.srt.bam
hisat2 -x /home/guocheng/yeast_project/data/reference/yeast_ref -U /home/guocheng/yeast_project/data/raw_data/file.fq.gz//SRR1916152.fastq.gz | samtools view -bS - | samtools sort - -o EV_strain_3.srt.bam
samtools index EV_strain_3.srt.bam
