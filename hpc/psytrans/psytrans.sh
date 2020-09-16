host_ref=$(pwd)/amil_1.0.maker_006.cds.fasta
sym_ref=$(pwd)/Symbiodinium_B.fasta.fasta


psytrans.py good.PdPf_transfuse95_cons.fa -A ${host_ref} -B ${sym_ref} -p 32 -T blastn -t /fast/tmp > psytrans.out

