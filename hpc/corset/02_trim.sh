#!/bin/bash
#Set the name of the job
#PBS -N DUMMY_Trim_correct

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=8
#Allocate required amount of memory
#PBS -l pmem=1gb

source /etc/profile.d/modules.sh
module load trimmomatic
module load java

#cd /homes/27/jc275567/Porites_competition/hpc/corset

cd ${PBS_O_WORKDIR}

TRIMMOMATIC_DIR=/sw/trimmomatic/0.36/

do_trim(){
	fr1=$1
	fr2=${fr1%R1.cor.fq.gz}R2.cor.fq.gz
	java -jar $TRIMMOMATIC_DIR/trimmomatic-0.36.jar PE -phred33 -threads 8\
 		$fr1 \
 		$fr2 \
 		${fr1%.cor.fq.gz}_trim_paired.cor.fq.gz \
 		${fr1%.cor.fq.gz}_trim_unpaired.cor.fq.gz \
 		${fr2%.cor.fq.gz}_trim_paired.cor.fq.gz \
 		${fr2%.cor.fq.gz}_trim_unpaired.cor.fq.gz \
		ILLUMINACLIP:${PBS_O_WORKDIR}/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
}

f=DUMMY
do_trim $f

