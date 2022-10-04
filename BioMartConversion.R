---
  title: "BioMartConversion"
author: "Fatma Betul Dincaslan"
date: '2022-10-04'
output: pdf_document
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## BioMart Conversion to Explore the Distribution of Gene/Transcripts Types of Count Data

If you are a sequencing assay developer, and curios about how many/what type of gene/transcripts that you are able to capture after a sequencing run, this annotation script might be helpful. The visualization will be a  big plus to interpret the results easily. Hope you enjoy, too!
  
  ### Packages
  
  ```{r, echo=TRUE}
# un/comment block of code use Command+Shift+C
# packages required
# if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
# BiocManager::install("biomaRt")     # Install bioMart package
library(biomaRt)                    # Load bioMart
# install.packages("dplyr")           # Install dplyr package
library("dplyr")                    # Load dplyr
# install.packages("devtools")
# devtools::install_github("tidyverse/ggplot2")
# install.packages("ggrepel")
# install.packages("tidyverse")
library(ggplot2)
library(ggrepel)
library(tidyverse)
#library(ggpubr)
#theme_set(theme_pubr())
# install.packages("lessR")
library(lessR)
# install.packages("UpSetR")
library(UpSetR)
# install.packages("gcookbook")
library(gcookbook)
```

### Ensembl Reference Data and Atribute Selection 

```{r}
# useful tutorials: https://bioconductor.org/packages/release/bioc/vignettes/biomaRt/inst/doc/accessing_ensembl.html and 
# https://bioconductor.org/packages/release/bioc/vignettes/biomaRt/inst/doc/accessing_other_marts.html
# might be useful https://stackoverflow.com/questions/28543517/how-can-i-convert-ensembl-id-to-gene-symbol-in-r

# because my seq data is from human cell line, I will chose homo sapiens
ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")
mart <- useDataset("hsapiens_gene_ensembl", useMart("ensembl"))
# these are the attributes that you can select
attributes = listAttributes(ensembl)
# we will mostly be interested in these
# description Gene description feature_page
# gene_biotype Gene type feature_page
# hgnc_symbol HGNC symbol feature_page
# external_synonym Gene Synonym feature_page
# ensembl_gene_id Gene stable ID feature_page
```

### Setting the directory and Retrieval of/Modification on Count Data

```{r, echo=FALSE}
dir <- "/Users/dincaslan/Desktop/20220609Fastq"
```

```{r}
# dir <- "/Users/Your/Path" # example /Users/lion/202209Fastq"
file <- "Sample_STAR_Cut_counts.txt" # retrieve the file

# set the directory first
setwd(dir)
# read rhe file
# genlist <- read.csv(file = file, header = FALSE) #lets use htseq counts only here for this exploratory analysis
genlist <- read.csv(file = file, header = FALSE, sep = "")
head(genlist)

# View(genlist)

# remove last 5 line which corresponds to alignment statistics overall
rown_genelist <- dim(genlist)[1]
genlist<- genlist[-c((rown_genelist-4):rown_genelist) , ]

# add column names, id and counts
names(genlist)[1] <- "id"
names(genlist)[2] <- "counts"
head(genlist)
```

### Building a BioMart Query

getBM() will help to retrieve relevant attributes of the matching Ensembl IDs from Ensembl BioMart Server.

```{r}
# # if you retrieve data without versions such as ENSGXXXXXXX instead of ENSGXXXXXXX.y
# BMconvert <- getBM(values = genlist$id, mart = mart, attributes = c("ensembl_gene_id", "external_synonym", "hgnc_symbol","gene_biotype", "description"))
BMconvert <- getBM(values = genlist$id, mart = mart, attributes = c("ensembl_gene_id_version", "external_synonym", "hgnc_symbol","gene_biotype", "description"))
head(BMconvert)
```

```{r}
# merging the data
merged_list <- merge(genlist, BMconvert, by = 1, all =TRUE)
head(merged_list)
# select only with assigned read counts which is counts >0
genlist_c <- merged_list[merged_list$counts>0, ]
# more data cleaning to filter out unique gene/transcript IDs only
# remove non-unique "ensembl id" and the counts (if possible combine counts of same synonym in one gene synonym row)
genl_unique <- distinct(genlist_c, id, .keep_all = TRUE)
```

### Getting the statistics of the frequency of gene biotypes

```{r, echo=T, results='hide'}
# factorize the gene_biotype
factor(genl_unique$gene_biotype)
```

```{r}
# determine the frequency of these in the given data set
genty_freq <- table(genl_unique$gene_biotype)
head(genty_freq)
# percent-wise representation of the unique occurrence of genes with assigned gene_types
genty_freq <- as.data.frame(genty_freq) 
names(genty_freq)[1] <- "types"
names(genty_freq)[2] <- "freq"
# head(genty_freq)
sumf <- sum(genty_freq$freq)
genty_freq <- genty_freq%>% mutate(perc = (freq/sumf)*100)
# lets see them ona proper table format
knitr::kable(genty_freq)
```

### Visualization of Frequency Graphs
I will share three different ways of visualization. You can pick up the one suits you more. If you are comparing two data sets, you might also want to use Upset graphs.

```{r}
# plot the percentage of different RNA types with a bar graph
# might be helpful: https://www.r-bloggers.com/2019/05/detailed-guide-to-the-bar-chart-in-r-with-ggplot/
f_plot <- ggplot(data.frame(genl_unique$gene_biotype), aes(x=genl_unique$gene_biotype)) +
  geom_bar()+
  theme(text = element_text(size = 5))+
  scale_x_discrete(guide = guide_axis(n.dodge = 3))+
  labs(title=paste(file,"Gene Type Frequency"), x ="Type", y = "Count")

f_plot
```

```{r}
# alternative pie chart
# might be helpful: https://ggplot2.tidyverse.org/reference/coord_polar.html
pc <- ggplot(genty_freq, aes(x="", y=perc, fill=types)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

pc
```

```{r}
# or stacked bar chart representation
# might be helpful: https://r-graph-gallery.com/48-grouped-barplot-with-ggplot2.html
sbp<- ggplot(genty_freq, aes(x="", y=perc, fill=types)) +
  geom_bar(width = 1, stat = "identity") 

sbp
```

```{r}
# # find the unique values for each and intersections, then plot upsetR, an example code given below
# # might be helpful: https://cran.r-project.org/web/packages/UpSetR/vignettes/basic.usage.html
# Out_list <- list(S1 = rownames(genl_unique1), S2 = rownames(genl_unique2))
# Out_gns <- UpSetR::fromList(Out_list)
# UpSetR::upset(Out_gns, order.by = "freq")
```

### Session Info
```{r}
sessionInfo()
```
