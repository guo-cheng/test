#CMD:python merge_read_count.py EV_3_count.tab,EV_4_count.tab,DNMT3B_2_count.tab,DNMT3B_3_count.tab,DNMT3B_4_count.tab EV_3,EV_4,DNMT3B_2,DNMT3B_3,DNMT3B_4 | less -S
import sys
sample_counts = sys.argv[1] ##五个样本
sample_names = sys.argv[2]  ##样本名
count_files = sample_counts.split(",")
#print(count_files)
sample_ids = sample_names.split(",")
#print(sample_ids)
count_dict = {} ##字典
for count_file in count_files: ## 循环五个sample，生成gene_id和对应的counts
    with open (count_file) as count:
        for line in count:
            if line.startswith("__"):
                continue
            line = line.rstrip("\n")
            ele = line.split("\t")
            #print(ele)
            #gene_id -> [count1,count2,count3]
            if ele[0] in count_dict:
                count_dict[ele[0]].append(ele[1])
            else:
                count_dict[ele[0]] = [ele[1]]
print("gene_id\t" + "\t".join(sample_ids))
for gene_id in count_dict:
    #print(count_dict[gene_id])
    print(gene_id + "\t" + "\t".join(count_dict[gene_id]))




