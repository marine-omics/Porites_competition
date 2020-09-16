# Porites_competition-corset analysis

02_trim
To generate Trim:
for d in *R1.cor.fq.gz ; do sed s/DUMMY/$d/g 02_trim.sh > ${d}_trim_job.sh ; done
To submit trim:
for d in *R1.cor.fq.gz ; do qsub ${d}_trim_job.sh ; done

02.1_psytrans
To generate psytrans:
sed s/PdPf_transfuse95_good_psytrans/PdPf_psytrans/g 02.1_psytrans.sh> PdPf_transfuse95_good_psytrans_job.sh
To submit psytrans:
qsub PdPf_transfuse95_good_psytrans_job.sh
#Run BUSCO on the 
qsub species1_busco_job.sh 



03_bowtie
#Creat index : 
#1. Make a virtual link where transcriptome with good reads is : ../Assembly/good.PdPf_transfuse95_cons
# Run it once :
bowtie2-build species1_good.PdPf_transfuse95_cons.fa good.PdPf_transfuse95_cons

To generate bowtie2:
for d in *R1_trim_paired.cor.fq.gz ; do sed s/DUMMY/$d/g 03_bowtie2.sh > ${d}_bowtie2_job.sh ; done
To submit bowtie2:
for d in *R1_trim_paired.cor.fq.gz ; do qsub ${d}_bowtie2_job.sh ; done

To check bowtie2 results : samtools flagstat bamfile.bam

03.1_merge_bam
#To generate job : 
sed s/merge_bams_PdPf/merge_bams_PdPf/g 03.1_merge_bams.sh> PdPF_mergeBams_job.sh
# To submit job:
qsub PdPF_mergeBams_job.sh



04_corset
# Pd_L	T2	 La	     Pd
# Pd_L	T98	 Lb	     Pd
# Pd_L	T116 Lc	     Pd
# Pd_L	T83	 Ld	     Pd
# Pd_L	T119 Le	     Pd
# Other T107 Control Pd
# Other	T104 La	     Pf
# Other	T53	 Lb	     Pf
# Other	T89	 Lc	     Pf
# Other	T74	 Ld	     Pf
# Other	T71	 Le	     Pf
# Other T68  Control Pf

#To generate job : 
sed s/corset_alldifferent/PdPf_corset_Alldifferent/g 04_corset.sh> corset_alldifferent_job.sh
# To submit job:
qsub corset_alldifferent_job.sh 