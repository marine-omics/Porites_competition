# Porites_competition

# 01_Gather_data
In Assembly folder make a virtual copy of the sequencing_data

# 02_rcorrector

Get rcorrector
git clone https://github.com/mourisl/rcorrector.git
cd rcorrector/
make
perl run_rcorrector.pl
perl ~/rcorrector/run_rcorrector.pl

To generate rcorrector:
for d in Pd Pf ; do sed s/DUMMY/$d/g 02_rcorrector.sh > ${d}_rcorrector_job.sh ; done
for d in Pf ; do sed s/DUMMY/$d/g 02_rcorrector.sh > ${d}_rcorrector_job.sh ; done
To submit:
for d in Pd Pf ; do qsub ${d}_rcorrector_job.sh ; done
To submit just one job : qsub Pf_rcorrector_job.sh

# 03_trinity
To generate Trinity:
for d in Pd Pf ; do sed s/DUMMY/$d/g 03_trinity.sh > ${d}_trinity_job.sh ; done
To submit Trinity:
for d in Pd Pf ; do qsub ${d}_trinity_job.sh ; done
To submit just one job Trinity:
qsub Pd_trinity_job.sh

# 04_Busco
Download the data base on a new working directory Databases:
wget http://busco.ezlab.org/datasets/eukaryota_odb9.tar.gz
Unzip it:
tar -xvzf eukaryota_odb9.tar.gz

To generate BUSCO:
for d in Pd Pf ; do sed s/DUMMY/$d/g 04_busco.sh > ${d}_busco_job.sh ; done
To submit BUSCO:
for d in Pd Pf ; do qsub ${d}_busco_job.sh ; done

# 05_transrate
Use transrate from Software folder because it has modification for avoiding it to crash.

To generate transrate:
for d in Pd Pf ; do sed s/DUMMY/$d/g 05_transrate.sh > ${d}_transrate_job.sh ; done
To submit transrate:
for d in Pd Pf ; do qsub ${d}_transrate_job.sh ; done
qsub Pf_transrate_job.sh


To check job:
qstat -u jc275567
