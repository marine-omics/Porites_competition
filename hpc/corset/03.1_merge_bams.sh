
#!/bin/bash
#Set the name of the job
#PBS -N merge_bams_PdPf

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=8
#Allocate required amount of memory
#PBS -l pmem=1gb

source /etc/profile.d/modules.sh
module load samtools

cd /homes/27/jc275567/Porites_competition/hpc/corset

for f in `ls *_L007_both.bam`;do 
	l1=$f;
	l2=${f/L007/L008};
	samplename=${f%_L007*};
	samtools merge $samplename.bam $l1 $l2 --threads 4
done
