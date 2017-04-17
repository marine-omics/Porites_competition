#!/bin/bash
#Set the name of the job
#PBS -N DUMMY_trinity

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=22
#Allocate required amount of memory
#PBS -l pmem=5gb

source /etc/profile.d/modules.sh
module load trinityrnaseq/2.4.0
module load bowtie2
module load java/oracle-jdk1.8.0_121
cd /homes/27/jc275567/Porites_competition/hpc/Assembly

Trinity --seqType fq --max_memory 100G --trimmomatic --CPU 22 --output DUMMY_trinity \
--left $(ls -1 DUMMY*R1.cor* | tr '\n' ',') \
--right $(ls -1 DUMMY*R2.cor* | tr '\n' ',') \
--normalize_reads
