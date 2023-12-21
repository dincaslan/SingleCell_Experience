STARSolo alignment with in in silico rRNA depleted reads only for R2 reads

> aligndir=/Your/Directory/STARSolo/

```shell
for infile in $adapttrim/*_R1.fastq.gz
do
SAMPLE=$(basename $infile _R1.fastq.gz)
/Your/STAR/Directory/STAR-2.7.10b/bin/Linux_x86_64/STAR --runThreadN 3 --genomeDir /Your/Comprehensive/Genome/Directory/ --readFilesCommand zcat --readFilesIn  $adapttrim/${SAMPLE}_R2.fastq.gz $adapttrim/${SAMPLE}_R1.fastq.gz --soloType CB_UMI_Simple --soloStrand Forward --outFileNamePrefix $aligndir/${SAMPLE} --outSAMtype BAM SortedByCoordinate --outSAMunmapped Within --outSAMattributes Standard --outFilterMultimapNmax 50 --soloCBwhitelist /Your/CR/Directory/cellranger-7.1.0/lib/python/cellranger/barcodes/3M-february-2018.txt --soloUMIlen 12 --outReadsUnmapped Fastx --outFilterScoreMinOverLread 0 --outFilterMatchNminOverLread 0 --winAnchorMultimapNmax 100 --outFilterMatchNmin 15 --outFilterScoreMin 14 --outFilterMismatchNoverLmax 0.05 --seedMultimapNmax 100000 --seedSplitMin 9 --seedSearchStartLmax 25 --outSAMmultNmax 1 --alignEndsType EndToEnd --soloCellFilter EmptyDrops_CR --soloCBmatchWLtype 1MM_multi_Nbase_pseudocounts --soloUMIdedup 1MM_CR --soloFeatures Gene GeneFull SJ Velocyto --soloMultiMappers EM --runRNGseed 13
done
```
