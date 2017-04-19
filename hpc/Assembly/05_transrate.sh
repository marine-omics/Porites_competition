#!/bin/bash
#Set the name of the job
#PBS -N DUMMY_transrate

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=22
#Allocate required amount of memory
#PBS -l pmem=5gb



cd /homes/27/jc275567/Porites_competition/hpc/Assembly/DUMMY_trinity

/homes/27/jc275567/Software/transrate-1.0.1-modified/./transrate -o DUMMY_transrate -t 16 \
-a DUMMY_trinity.fasta \
--left insilico_read_normalization/left.norm.fq \
--right insilico_read_normalization/right.norm.fq
