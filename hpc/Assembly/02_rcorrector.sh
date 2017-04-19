#!/bin/bash
#Set the name of the job
#PBS -N DUMMY_rcorrector

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=20
#Allocate required amount of memory
#PBS -l pmem=2gb

cd /homes/27/jc275567/Porites_competition/hpc/Assembly

perl ~/rcorrector/run_rcorrector.pl \
 -1 $(ls -1 DUMMY*R1* | tr '\n' ',') \
 -2 $(ls -1 DUMMY*R2* | tr '\n' ',') \
 -k 31 -t 20
