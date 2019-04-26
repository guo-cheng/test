getwd()
list.files()
count_tab = read.table("yeast_EV_DNMT3B_count.tab",header =T)# ,row.name =1
rownames(count_tab) = count_tab$gene_id
count_tab = count_tab[,-c(1)]
colData = read.table("SRR_Acc_List_sample.txt",header = T)
colData$condition = factor(colData$condition,c("EV","DNMT3B"))
library(DESeq2)
dds <- DESeqDataSetFromMatrix(countData = count_tab,
                              colData = colData,
                              design= ~ condition)
dds <- DESeq(dds)
resultsNames(dds) # lists the coefficients
res <- results(dds, name="condition_DNMT3B_vs_EV")
res = res[order(res$padj), ]
resDF = as.data.frame(res)
resDF$gene_id = rownames(resDF)
resDF = resDF[ ,c(7,1,2,3,4,5,6)
write.table(resDF,file = "yeast_DEseq2_DEG.tab",sep = "\t",quote = FALSE,row.names = FALSE)
# or to shrink log fold changes association with condition:
res <- lfcShrink(dds, coef="condition_trt_vs_untrt", type="apeglm")
## PCA plot
library(ggplot2)
vsd <- vst(dds, blind=FALSE)
pcaData <- plotPCA(vsd, intgroup=c("condition"), returnData=TRUE)
percentVar <- round(100 * attr(pcaData, "percentVar"))
plot_Fig = ggplot(pcaData, aes(PC1, PC2, color=condition)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
  coord_fixed()
ggsave(plot_Fig,filename = "yeast_DEseq2_PCA.pdf")
# plotPCA(vsd, intgroup=c("condition", "type"))
## MA plot
pdf("yeast_MAplot.pdf")
plotMA(res, ylim=c(-2,2))
dev.off()

