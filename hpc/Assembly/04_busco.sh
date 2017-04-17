!/bin/bash
#Set the name of the job
#PBS -N DUMMY_busco

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=20
#Allocate required amount of memory
#PBS -l pmem=2gb
source /etc/profile.d/modules.sh/
module load hammer
module load blast
module load python/3.5.1


cd /homes/27/jc275567/Porites_competition/hpc/Assembly/DUMMY_trinity

python3 /homes/27/jc275567/Software/busco -m trans --cpu 16 -l ~/homes/27/jc275567/Databases/eukaryota_odb9 \
-o DUMMY_busco -in DUMMY_Trinity.fasta
