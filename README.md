# Selection Strength on Sex-Specific Genes in Hermaphroditic and Dioecious Caenorhabditis Lineages

## Introduction

The goal of this project is to compare rates of evolutionary selection 
of one-to-one orthologs between the briggsae vs. remanei lineages (by 
comparison to the species brenneri) for genes with varying levels of 
sex-specific expression.

Background (email from M. Palopoli):

> Cutter (2005) compared genes between briggsae and elegans and (among
other things) found an elevated rate of evolution for sperm-specific
genes. He suggested several alternative hypotheses that could not be
ruled out but might explain this pattern, including: (1) relaxed
selection on sperm function in these two hermaphroditic lineages; and
(2) antagonistic coevolution between sperm and oocytes and between the
sexes in each lineage.

> The former should NOT be true for lineages that still have males and
females, such as remanei. However, the latter SHOULD BE EVEN MORE true
for lineages with males and females, such as remanei. Hence, this
suggests the simple idea of comparing brenneri-briggsae divergence
against brenneri-remanei divergence for genes with varying levels of
sex-specific expression. The relaxed selection hypothesis predicts that
brenneri-briggsae divergences will be greater for male-specific genes;
the antagonistic coevolution hypothesis predicts that brenneri-remanei
divergences will be greater for male-specific genes. I believe that both
hypotheses predict that these differences should disappear for genes
expressed in both sexes.

> What needs to be done?

> Need to figure out the degree to which each gene exhibits sex-specific
expression (perhaps using the approach used in Albritton et al.). Also, 
need to make sure that each gene being compared is a one-to-one ortholog 
between briggsae and remanei (e.g. reciprocal best blast). Also, best 
to make sure that each gene is also in a consistent location (at least 
with respect to X-linkage vs. autosomal). Then need to line up each gene 
between brenneri and remanei on the one hand, and between brenneri and 
briggsae on the other hand, and compare Ka values. Perhaps use a simple 
Chi-square test to see whether there is a nonrandom tendency for either 
type of comparison to result in higher Ka values for genes in different 
categories (e.g., male-specific vs. expressed in both sexes).

Background from S. Minot:

> A parallel goal of this project is to learn how to execute a computational 
experiment that adheres to a standard of reproducible research. In the 
traditional biological sciences there is a well-developed set of standards 
for the steps that must be taken to ensure that an experiment can be 
reproduced. However, such standards have not been established for 
computational biology, and often the experiments described in journal 
articles cannot be attempted or confirmed by independent researchers due 
to a lack of code and documentation. This lack of reproducibility is a 
fundamental barrier to the advancement of computational biology, and anyone
working in research (of any sort) should hold themselves and others to a
standard of reproducibility. 

> Reproducibility is also a huge benefit for the advancement of research 
within a single research group. As a research question expands and is 
taken on by more investigators, the projects that are structured in a 
consistent, reproducible way are going to be much easier to build upon
and develop. 

> All of the specific practices outlined here are not the only way to set
up a robust research project, but they do use a set of resources and 
practices that are generally accepted by the research community. Over time
the specific pieces of software and conventions will surely change, but 
I am confident that the general approach will be a benefit for anyone 
who wants to answer questions using computational tools and communicate
their findings to others. 

## Outline

We can break this project up into the following sections:
1.  Getting Started
2.  Quantify Sex-Specific Expression
3.  Identify *briggsae/remanei/brenneri* Orthologs
4.  Quantify Rates of Selection
5.  Statistical Test for Differential Selection among Lineages

## 1. Getting Started

A short introduction into the computational practices that will
make this project easily reproducible. Very briefly, all analyses
will be saved and tracked in this github repository. That way you
will always know what the state of the code was at any point that 
analysis was executed. Also, the computational environment and pre-
requisites will all be tracked alongside the rest of the code, so
all of the versions of the different software packages that were
used can be easily recreated. Lastly, all of the actual computation
will take place on a node within the Amazon Web Service (AWS). 
This has the double benefit of providing useful computational 
resources, as well as providing a standardized computational 
environment that is accessible to any other researcher in the field. 

See Getting_Started.md for more details. 

## 2. Sex-Specific Expression

We will download public RNAseq datasets containing sex-specific
transcription information. Albritton, et al. [(link)](http://www.ncbi.nlm.nih.gov/pubmed/24793291) will be a
good place to start. Those short reads will be mapped against
the appropriate reference genomes, and the number of reads matching 
each gene will indicate the degree to which each gene is expressed
in a sex-specific manner. The output of this step is a ratio of 
sperm-specificity for each gene. 

Datasets from the NCBI [SRA](http://www.ncbi.nlm.nih.gov/sra) database can be downloaded programmatically 
using the SRA Toolkit ([link](http://www.ncbi.nlm.nih.gov/Traces/sra/?view=software)). While there are many 
short-read aligner algorithms, BWA ([link](https://github.com/lh3/bwa)) is a good standard choice.

Analysis of the output of the short read alignments (and all of the
other data outputs produced in this project) will be done in either 
Python (with Numpy/Pandas) or R. My (Sam's) preference is for Python,
but R is also acceptable if that is more familiar.

All of the guidance, code, and output of this section will be kept 
in the `expression/` folder. 

## 3. Identifying Orthologs

Orthologous genes between the different lineages will be identified 
the so-called "reciprocal best BLAST" approach. Briefly, every gene
from one genome is aligned against every gene from another genome, 
and vice versa. After applying some basic alignment quality filters, 
Those pairs of genes that are both the top hit for the other are 
labeled as being orthologs for the purpose of this analysis. 

While BLAST is available as a web tool, there is also a standalone
command line tool that is available for Linux in the `ncbi-blast+` 
package. 

All of the guidance, code, and output of this section will be kept 
in the `orthologs/` folder. 

## 4. Quantifying Rates of Selection

Each pair of orthologous genes will be aligned, and the rates of 
synonymous and non-synonymous mutation will be calculated. PAML ([link](http://abacus.gene.ucl.ac.uk/software/paml.html)) 
is the standard choice for this type of operation. The resulting 
dN/dS ratio for each gene will be taken as the output of this step. 

All of the guidance, code, and output of this section will be kept 
in the `selection/` folder. 

## 5. Statistical Analysis

Given the inputs outlined above:
-  Rates of sex-specific gene expression for each gene, and
-  dN/dS ratio for each gene,
as well as the annotations available for each gene, the final step
will be to build a statistical model to test whether there is a 
significantly different rate of selection between the different
pairs of lineages, comparing genes that do and do not exhibit sex-
specific expression. 

All of the guidance, code, and output of this section will be kept 
in the `stats/` folder. 
