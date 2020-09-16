!/bin/bash
#Set the name of the job
#PBS -N DUMMY_bowtie2

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=4
#Allocate required amount of memory
#PBS -l pmem=2gb

source /etc/profile.d/modules.sh/
module load bowtie2
module load samtools

cd ${PBS_O_WORKDIR}

f=DUMMY
r1=$f
r2=${f/R1/R2}
r12name=${f/R1/both}
outname=${r12name%_trim_paired.cor.fq.gz}

echo "Running bowtie2 on $outname and writing outputs to $outname.bam"

bowtie2 --no-mixed --no-discordant --end-to-end --all \
--min-score L,-0.6,-0.6 \
--threads 4 \
-x species1_good.PdPf_transfuse95_cons.fa -1 $r1 -2 $r2 | samtools view --threads 4 -b - > $outname.bam

