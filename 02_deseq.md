DESeq analysis
================
Natalia Andrade and Ira Cooke
07/08/2017

Counts obtained from Corset were analysed with DESeq to identify
differentially expressed genes between HardCoral treatments.

Initial data exploration with PCA revealed that PdLd is an extreme
outlier. We therefore excluded this sample from further analysis

Differential Expression Analysis with the outlier excluded was then
performed based on a model with no intercept and a separate coefficient
for each level of the variable `HardCoralTrt`. This model gives us
maximum flexibility for statistical testing using different contrasts.

> \~ 0+HardCoralTrt

    ## [1] "HardCoralTrtPd_C" "HardCoralTrtPd_T" "HardCoralTrtPf_C"
    ## [4] "HardCoralTrtPf_T"

Before proceeding with contrasts we first check a PCA with the outlier
excluded. This shows very clearly that Porites genotype is the dominant
source of variation in the data, accounting for 89%. PC2 accounts for
just 5% of variation and captures differences due to the competing
Lobophytum colony and whether competition exists at all (Control).

![](02_deseq_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

To set up contrasts we first use `resultsNames()` to extract a list of
fitted coefficients in the model

    ## [1] "HardCoralTrtPd_C" "HardCoralTrtPd_T" "HardCoralTrtPf_C"
    ## [4] "HardCoralTrtPf_T"

Based on this we formulate the contrasts;

1.  `contrast_ct <- c(1,-1,1,-1)` which captures genes consistently
    different between treatment and control across both Porites colonies
2.  `contrast_pd <- c(1,-1,0,0)` capturing genes DE between treatment
    and control for `Pd` only
3.  `contrast_pf <- c(0,0,1,-1)` capturing genes DE between treatment
    and control for `Pf` only

For the top genes differentially expressed between control and treatment
we plot raw values as scatterplots. This is just to give a feel for how
strong these candidates are when looking at the raw data directly.

Scanning through these plots I can see quite a few genes with consistent
differences between both controls and the treatment values … BUT ..
there are others where the change seems to be driven by a strong change
in just one of the controls (usually Pf). This also seems to emerge from
looking at the heatmap (see below).

![](02_deseq_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

Now a heatmap for all the DE genes between treatment and control. For
this the relative change in expression is plotted (relative to the mean
for a gene) so that clustering is meaningful. The clusters reveal some
interesting patterns (not sure if worth writing about but interesting).
There is a big cluster where the Pf control has higher expression. There
are also clusters driven by higher expression in a few specific
interactions (PfLa, PfLc, PdLb) for one cluster .. and (PdLa, PdLe,
PfLc) for the other. It would be fascinating if this was also evident in
the behavioural data. Other clusters are driven by an overall higher
expression in Pd vs Pf (bottom small cluster).

![](02_deseq_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->
