!/bin/bash
#Set the name of the job
#PBS -N PPdPf_busco

#Allocate required amount of wall time
#PBS -l walltime=1000:00:00
#Set the number of nodes and processors
#PBS -l nodes=1:ppn=20
#Allocate required amount of memory
#PBS -l pmem=2gb
source /etc/profile.d/modules.sh/
module load hmmer
module load blast
module load python/3.6.1

cd ${PBS_O_WORKDIR}

python3 /homes/27/jc275567/Software/busco/BUSCO.py -m tran --cpu 16 -l /homes/27/jc275567/Databases/eukaryota_odb9 \
-o PPdPf_busco -i species1_good.PdPf_transfuse95_cons.fa
