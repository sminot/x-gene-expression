# x-gene-expression
Reproducing "Sex-Biased Gene Expression and Evolution of the X Chromosome in Nematodes"

This repository will encompass the work needed to reproduce the analysis performed in:

Sarah Elizabeth Albritton, Anna-Lena Kranz, Prashant Rao, Maxwell Kramer, Christoph Dieterich, and Sevinç Ercan, (2014) "Sex-Biased Gene Expression and Evolution of the X Chromosome in Nematodes." Genetics. 197(3): 865-83. doi:  10.1534/genetics.114.163311 PMCID: PMC4096367

The workflow for this analysis will take the following steps:

1.  Boot up a free t2.micro instance on the Amazon Web Service. 
2.  Log in to that computer at the IP address provided, and clone this repository into the home directory.
`git clone git@github.com:sminot/x-gene-expression.git`
3.  A folder will be created, `x-gene-expression/`, containing all of the files in this repository. Move into that directory and execute the following scripts:
4.  `bash install_prerequisites.sh` to install the programs needed to run all further analyses.
5.  `bash download_raw_data.sh` to download the data from Albritton, et al. from public repositories to the current machine. 
6.  `bash align_reads.sh` to perform the basic read alignments.
7.  `python analyze_alignments.py` to perform the statistical analysis of the read alignments needed to generate the final results in the manner described in the paper. 

As you build and develop this analytical process, any changes to the files within this repository can be saved by using the `git commit` and `git push` commands. That way each improvement to each individual script can be saved, while all changes are tracked clearly by Github. If at any point you want to go back to a previous version of a script or analysis, the exact state of this repository from any point in time can be recreated. 
