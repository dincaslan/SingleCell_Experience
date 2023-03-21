There are many tutorials available online.
Yet, many people still suffer where to start.
I see your point and 
it totally makes sense if you are missing some points of the analysis.
I also agree that some details appears once you try to deal with the data itself.
So, I decided to share as many details as possible here to make sure you understand the basic concepts from scratch.
Let's see how it will work!
(Please note that bioinformatics is a huge field requiring intensive skills, therefore please do not expect to be an expert after reading this at night and suddenly become one in the morning. Thanks for your understanding and cooperation.)

## What to Expect

There will be some tools that we will be using and two main programming workspace that we need to get familiar with the syntax and commands.
Firstly, I use *FileZilla* to have desktop-similar workspace in the server. I recommend you to download from here, if you prefer such things: https://filezilla-project.org/download.php?type=client .
Secondly, *Command Line Tools* (for Linux/Ubuntu based servers, Ubuntu LTS for Windows or Terminal of Mac) and *R* (https://www.r-project.org/about.html and its IDE-RStudio: https://posit.co/download/rstudio-desktop/). 

Before starting, I would like to share my favourite beginner friendly analysis resources:
1. For Bulk RNA-Seq analysis and udnerstand the concepts: 
  Intro2RNASeq- https://chagall.med.cornell.edu/RNASEQcourse/Intro2RNAseq.pdf
3. For Single Cell analysis and understand the concepts: 
  https://www.singlecellcourse.org/

I usually run preliminary inspection of raw fastq files (grep, cat, awk, seed etc.), quality control of the raw data (fastqc), relevant trimming (adapter or some poly-nucleotides), in silico rRNA removal (where applicable), alignment (STAR, STARSolo, CellRanger, bowtie etc.), raw count data retrieval (featureCounts, HTseq, MGCount) on the server as there are more space and cores available. Next, I do downstream analysis (might be generating cool plots of preliminary data specs, differential gene expression/heteregeneoity analysis via Seurat) on R and gene enrichment analysis with/out online tools using the differential features without using the server.

## Accessing a Data from a Server

It depends on which operating system you are using. If you are using Windows, please consider downloading Ubuntu LTS from Microsoft Store (free, https://ubuntu.com/download/server). Whereas Mac users do not need specific tool, just open Finder and search for Terminal (and click).

After opening Ubuntu LTS or Terminal, I prefer ssh ([more info](https://www.ucl.ac.uk/isd/what-ssh-and-how-do-i-use-it)) to access my directory on the server. An example is given below.
```
ssh name@IP_address
```
> name is your directory name that you want to access (e.g. JDoe), and IP_address is the bunch of numbers (e.g. 01.010.010.01)
Once you ssh, it will ask your password for the given directory that you are requesting to access. You need to type that, too!

## Running FastQC and Preliminary Read Inspection



