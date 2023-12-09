There are many tutorials available online.
Yet, many people still suffer where to start.
I see your point and 
it totally makes sense if you are missing some points of the analysis.
I also agree that some details appears once you try to deal with the data itself.
So, I decided to share as many details as possible here to make sure you understand the basic concepts from scratch.
Let's see how it will work!
(Please note that bioinformatics is a huge field requiring intensive skills, therefore please do not expect to be an expert after reading this at night and suddenly become one in the morning. Thanks for your understanding and cooperation.)

-------------------

## What to Expect

There will be some tools that we will be using and two main programming workspace that we need to get familiar with the syntax and commands.
Firstly, I use *FileZilla* to have desktop-similar workspace in the server. I recommend you to download from here, if you prefer such things: https://filezilla-project.org/download.php?type=client .
Secondly, *Command Line Tools* (for Linux/Ubuntu based servers, Ubuntu LTS for Windows or Terminal of Mac) and *R* (https://www.r-project.org/about.html and its IDE-RStudio: https://posit.co/download/rstudio-desktop/). 

Before starting, I would like to share my favourite beginner friendly analysis resources:
1. For Bulk RNA-Seq analysis and udnerstand the concepts: 
  Intro2RNASeq- https://chagall.med.cornell.edu/RNASEQcourse/Intro2RNAseq.pdf
3. For Single Cell analysis and understand the concepts: 
  https://www.singlecellcourse.org/

-------------------

I usually run preliminary inspection of raw fastq files (grep, cat, awk, seed etc.), quality control of the raw data (fastqc), relevant trimming (adapter or some poly-nucleotides), in silico rRNA removal (where applicable), alignment (STAR, STARSolo, CellRanger, bowtie etc.), raw count data retrieval (featureCounts, HTseq, MGCount) on the server as there are more space and cores available. Next, I do downstream analysis (might be generating cool plots of preliminary data specs, differential gene expression/heteregeneoity analysis via Seurat) on R and gene enrichment analysis with/out online tools using the differential features without using the server.

> Tips: Useful Commands to Learn Before You Start
>   *cd* (to go to a directory and set it), *ls* (list the files in the directory), *mkdir* (create a new directory/folder), *rm* (remove files/folders), *scp* or *cp* (copy files/folders from one to another), *pwd* (recall your current location/directory), *gunzip* (to unzip zipped files)

-------------------

## Accessing a Data from a Server

It depends on which operating system you are using. If you are using Windows, please consider downloading Ubuntu LTS from Microsoft Store (free, https://ubuntu.com/download/server). Whereas Mac users do not need specific tool, just open Finder and search for Terminal (and click).

After opening Ubuntu LTS or Terminal, I prefer ssh ([more info](https://www.ucl.ac.uk/isd/what-ssh-and-how-do-i-use-it)) to access my directory on the server. An example is given below.
```
ssh name@IP_address
```
> name is your directory name that you want to access (e.g. JDoe), and IP_address is the bunch of numbers (e.g. 01.010.010.01)
Once you ssh, it will ask your password for the given directory that you are requesting to access. You need to type that, too!

> Just to check where you are before starting any sort of analysis, you can try pwd() to recall your current location

-------------------

## Running FastQC and Preliminary Read Inspection

First of all, you need to install the relevant quality control tool to the workspace and activate it. (After you installed anaconda or minconda, and setting enviroment active), you can install the tool (in our case, Babraham Bionformatics' FastQC: https://anaconda.org/bioconda/fastqc).

> Just to make sure, you can include full path of the tool while calling it
```
/your/path/to/FastQC/fastqc /your/path/to/samples/*.fastq.gz
```
> *. option allows you to run FastQC on all the sample in the given directory
> You will find the report files in the directory you run your analysis
If you are not sure what to expect from this report, please check out the tool's own page as a reference: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/

-------------------

Following this, you can inspect the data by using commands to grep patterns, the reads having certain qualifications or even modify them. In this case, it is better to be aware of some online tutorials regarding data inspection and manipulation on command line. A few examples are shared below.

> Let's say you are looking for this sequence as pattern: AGTAGTCT, which you might replace with some adapters etc.
```
grep -c AGTAGTCT /your/path/to/samples/your.fastq
```
> The code above returns the number of occurances of this pattern in your fastq file
```
cat /your/path/to/samples/your.fastq | grep AGTAGTCT | head 20
```
> The code above returns first 20 occurances of this pattern in your fastq file with corresponding read lines/sequences containing
```
zcat /your/path/to/samples/your.fastq.gz | grep AGTAGTCT | tail 20
```
> same above for the tail, and except if the file is zipped

-------------------

## Pre-processing, Alignment and Raw Count Data Retrieval

The remaning part will be divide into two main sessions. In the first session, we will be discussing how to run pre-processing and STAR alignment manually (which will not inlude single cell demultiplexing, but will given an idea about overall processing). In the second part, we will be discussing how run CellRanger or STARSolo with single cell demultiplexing. These will include the retrieval of raw count data. 

-------------------

### Manual Processing for Each Step


-------------------

### Single Cell Demultiplexing

-------------------

#### Cell Ranger

-------------------

#### STARSolo

-------------------

## Downstream Analysis



