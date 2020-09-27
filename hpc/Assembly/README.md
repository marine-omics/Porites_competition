# Transcriptome Assembly

A denovo assembly of the *Porites cylindrica* transcriptome was performed using a combination of rcorrector, trinity and transfuse.  The steps used to perform this assembly are included here as numbered shell scripts and are described below;

1. Raw input data for the assembly is available on SRA under accession XXXX
2. [rcorrector](https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0089-y) (version from github commit `24940c9b34a46221a8e95a7bd83ebe39a161f8fb` July 2016) was used to perform error correction on the reads in separate batches for the two genotypically distinct colonies as follows
```bash
for d in Pd Pf ; do sed s/DUMMY/$d/g 02_rcorrector.sh > ${d}_rcorrector_job.sh ; done
for d in Pd Pf ; do qsub ${d}_rcorrector_job.sh ; done
```
3. Error corrected reads were then used as input to [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki) version 2.4.0 with default adapter trimming and read normalization turned on.  Separate Trinity assemblies were generated for reads arising from distinct colonies as follows;
```bash
for d in Pd Pf ; do sed s/DUMMY/$d/g 03_trinity.sh > ${d}_trinity_job.sh ; done
for d in Pd Pf ; do qsub ${d}_trinity_job.sh ; done
```
4. [BUSCO](https://busco.ezlab.org/) version 2.0.1 and [transrate](https://hibberdlab.com/transrate/) were used to evaluate assembly quality and completeness on these preliminary assemblies
5. [transfuse](https://github.com/cboursnell/transfuse) was then used to merge the separate `Pd` and `Pf` assemblies with the `-i` parameter set to allow sequences to cluster at 95% identity for merging. Statistics on the merging process are provided as `PdPf_transfuse95_cons_stats.txt`
6. After merging we reran transrate to identify `good` contigs from this merged assembly. Results from this are provided in `transrate_PdPf_transfuse95_cons`

