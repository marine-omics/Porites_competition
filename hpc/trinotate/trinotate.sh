DBPATH=/home/00/sci-irc/fast/trinotate_dbs
TRINOTATE_HOME=/usr/local/sci-irc/sw/trinotate-3.0.1/

module load transdecoder
module load blast
module load trinotate-local/3.0.1
module load hmmer/3.1b2
module load tmhmm/2.0c
module load signalp-local/4.1

transcriptome=species1_good.PdPf_transfuse95_cons.fa

TransDecoder.LongOrfs -t ${transcriptome}

ln -s species1_good.PdPf_transfuse95_cons.fa.transdecoder_dir/longest_orfs.pep transdecoder.pep

blastp -query transdecoder.pep -db $DBPATH/uniprot_sprot.pep -num_threads 48 -max_target_seqs 1 -outfmt 6 > blastp.outfmt6

hmmscan --cpu 48 --domtblout TrinotatePFAM.out $DBPATH/Pfam-A.hmm transdecoder.pep > pfam.log


signalp -f short -n signalp.out transdecoder.pep


tmhmm --short < transdecoder.pep > tmhmm.out

$TRINOTATE_HOME/util/rnammer_support/RnammerTranscriptome.pl --transcriptome ${transcriptome} --path_to_rnammer /usr/local/sci-irc/sw/rnammer-1.2/rnammer


#

grep '>' species1_good.PdPf_transfuse95_cons.fa | sed -E 's/>(.*)/\1 \1/' | tr ' ' '\t' >  species1_good.PdPf_transfuse95_cons.gene_trans_map
grep '>' species1_good.PdPf_transfuse95_cons.fa | sed -E 's/>(.*)/\1 \1/' | sed -E 's/\.[0-9]+$//' > species1_good.PdPf_transfuse95_cons.bygene.gene_trans_map


