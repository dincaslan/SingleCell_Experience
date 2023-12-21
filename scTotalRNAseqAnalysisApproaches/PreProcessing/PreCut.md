Let's say you have paired end reads. If you used templete switch oligo, this might be useful before processing. 
Cutting 5’ 3Gs from R2 reads using cutadapt <https://cutadapt.readthedocs.io>

> rawDir=/Your/Directory/rawData/

> cutDir=/Your/Directory/3Cut_R2/

```shell
for infile in $rawDir/*R2.fastq.gz
do
cutadapt --cores 2 -u 3 -o $cutDir/"$(basename $infile .fastq.gz)".fastq.gz $infile 
done
```
