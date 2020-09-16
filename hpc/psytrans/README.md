# Separation of Symbiont and Host Transcripts

The machine learning tool, [psytrans](https://github.com/sylvainforet/psytrans) was used to separate symbiont and host transcripts using the initial assembly produced by transfuse. 

In order to learn the difference between host and symbiont psytrans requires reference databases.  We use predicted transcripts from the Acropora millepora genome as a host reference and EST sequences from *Breviolum minutum* as a symbiont reference.

The output file `species1_good.PdPf_transfuse95_cons.fa` from psytrans represents the final reference transcriptome used in this study. 

BUSCO results for this are;


> # BUSCO version is: 2.0.1 
> # Summarized benchmarking in BUSCO notation for file species1_good.PdPf_transfuse95_cons.fa
> # BUSCO was run in mode: tran
>
>	C:97.0%[S:33.3%,D:63.7%],F:2.3%,M:0.7%,n:303
>
>	294	Complete BUSCOs (C)
>	101	Complete and single-copy BUSCOs (S)
>	193	Complete and duplicated BUSCOs (D)
>	7	Fragmented BUSCOs (F)
>	2	Missing BUSCOs (M)
>	303	Total BUSCO groups searched

