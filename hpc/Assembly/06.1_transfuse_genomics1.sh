#!/bin/bash


module load transfuse
#cat Pd_trinity3/insilico_read_normalization/left.norm.fq Pf_trinity/insilico_read_normalization/left.norm.fq > PdPf_left.norm.fq
#cat Pd_trinity3/insilico_read_normalization/right.norm.fq Pf_trinity/insilico_read_normalization/right.norm.fq > PdPf_right.norm.fq

transfuse -a Pf_trinity/Pf_trinity.fasta,Pd_trinity3/Trinity.fasta -l PdPf_left.norm.fq -r PdPf_right.norm.fq -t 48 -i 0.95 -o PdPf_transfuse95 -v 


