# Create links to error corrected reads that were generated during assembly
#
for f in ../Assembly/*.cor.*; do ln -s $f .;done

