Functional Annotation
================
Ira Cooke
21/08/2017

``` r
library(tidyverse)
```

When interpreting gene expression data from Corset our count values will
be assigned to Corset clusters but annotation information from Trinotate
is available for individual transcripts. Although a mapping is available
at the identifier level we need to reconcile situations where multiple
annotations are available for a single corset cluster. The purpose of
this file is to deal with this issue. The overall process is as follows;

First load all the data, including trinotate annotation report and
corset
clusters

``` r
trinotate_data <-read_tsv("hpc/trinotate/trinotate_annotation_report_with_genes.xls") %>% rename(gene_id=`#gene_id`)
cluster_data <- read.delim("hpc/corset/03-clusters.txt",stringsAsFactors = FALSE, header = FALSE)
names(cluster_data) <- c("transcript_id","cluster_id")

counts <- read_tsv("hpc/corset/03-counts.txt") %>% rename(cluster_id=X1)
```

Join trinotate annotations and corset clusters based on `transcript_id`.
The result of this join is that we will now have multiple entries for
each Corset cluster.

``` r
cluster_data <- counts %>% left_join(cluster_data,by="cluster_id")

ann_cluster_data <- cluster_data %>% left_join(trinotate_data, by="transcript_id")
```

In order to reduce the data down to one entry per Corset cluster our aim
is to pick the best annotated entry. To facilitate this we create a
column with an annotation score. This score counts number number of
non-empty columns in the trinotate annotation and then adds to this the
relative transcript length. If after this there are still entries with
equal scores one is simply picked at random to ensure one annotation
entry per
cluster.

``` r
# This is to create a row "score" which is higher for better annotated transcripts.
ann_scores <- apply(ann_cluster_data,1,function(row){
  sum(row != ".")
})
ann_cluster_data <- cbind(ann_cluster_data,ann_scores)

# Adding to the score the length of the transcript and predicted protein
ann_cluster_data <- ann_cluster_data %>% 
  mutate(ts_len = str_length(transcript)/max(str_length(transcript))) %>% 
  mutate(pep_len = str_length(transcript)/max(str_length(transcript))) %>% 
  mutate(ann_scores=ann_scores+ts_len+pep_len)

# Now we pick the row with the top score.  If there are multiple rows with the same score just pick one at random
reag_ann_cluster_data <- ann_cluster_data %>% group_by(cluster_id) %>% top_n(n=1,wt=ann_scores) %>% sample_n(1)

#write file with annotated transcriptome
saveRDS(reag_ann_cluster_data,file = "cache/annotated_clusters_Porites.rda")
```
