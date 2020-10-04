#!/bin/bash
#Set the name of the job
#PBS -N corset_alldifferent

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=20
#Allocate required amount of memory
#PBS -l pmem=2gb

source /etc/profile.d/modules.sh
module load corset

cd /homes/27/jc275567/Porites_competition/hpc/corset

corset -n PdLa,PdLb,PdLc,PdLd,PdLe,PdC,PfLa,PfLb,PfLc,PfLd,PfLe,PfC \
Pd_T2_CAK9TANXX_GCCAAT.bam Pd_T98_CAK9TANXX_AGTCAA.bam Pd_T116_CAK9TANXX_CTTGTA.bam Pd_T83_CAK9TANXX_AGTTCC.bam \
Pd_T119_CAK9TANXX_ACAGTG.bam Pd_T107_CAK9TANXX_ATGTCA.bam \
Pf_T104_CAK9TANXX_GTGAAA.bam Pf_T53_CAK9TANXX_GTTTCG.bam Pf_T89_CAK9TANXX_CGATGT.bam Pf_T74_CAK9TANXX_TGACCA.bam \
Pf_T71_CAK9TANXX_CAGATC.bam Pf_T68_CAK9TANXX_CCGTCC.bam