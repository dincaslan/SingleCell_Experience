There are multiple rRNA removal options in silico. My favourite is Ribodetector <https://github.com/hzi-bifo/RiboDetector>.

> riboremove=/Your/Directory/norRNA

> dir=/Your/Directory/

```shell
for infile in $dir/rawData/*_R1.fastq.gz
   SAMPLE=$(basename $infile _R1.fastq.gz)
	ribodetector_cpu -t 3 \
	-l 147 \
	-i $dir/rawData/${SAMPLE}_R1.fastq.gz $dir/FurAnaFil/3Cut_R2/${SAMPLE}_R2.fastq.gz \
	-e rrna \
	--chunk_size 256 \
	-o $riboremove/${SAMPLE}_R1.fastq.gz $riboremove/${SAMPLE}_R2.fastq.gz
done
```

