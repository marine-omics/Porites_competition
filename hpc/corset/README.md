# Corset analysis

We used [Corset](https://github.com/Oshlack/Corset/wiki) version 1.05 to cluster denovo assembled transcripts and count reads assigned to those clusters.

Error corrected reads were first trimmed using Trimmomatic and then mapped to the transcriptome using bowtie2.  Since each sample was run on two lanes the corresponding bam files for these were then merged with samtools merge to produce a single bam file per sample. 

Finally corset was run to produce the output files `03-clusters.txt` and `03-counts.txt`.  
