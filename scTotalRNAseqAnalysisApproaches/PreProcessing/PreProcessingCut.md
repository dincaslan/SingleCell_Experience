There are lots of polyA tails to be removed before alignment processing. We still rely on cutadapt for this <https://cutadapt.readthedocs.io/en/stable/>

> riboremove=/Your/Directory/norRNA/trimmed/

> adapttrim=/Your/Directory/CutadaptPolyATrim_R2/

```shell
for infile in $riboremove*_R1.fastq.gz
do
  SAMPLE=$(basename $infile _R1.fastq.gz)
  cutadapt -m 16 -a AAAAAAAAAAAAAAA -o $adapttrim/${SAMPLE}_R2.fastq.gz -p $adapttrim/${SAMPLE}_R1.fastq.gz $riboremove/${SAMPLE}_R2.fastq.gz $riboremove/${SAMPLE}_R1.fastq.gz
done
```
