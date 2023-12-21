If you are mixing multiple conditions/samples as one using HTO barcodes, you need to count them separately (if you are not using Cell Ranger demultiplex, and if you prefer available open source tools like StarSolo).

```shell
CITE-seq-Count -R1 /Your/HTOReads/Directory/HTO_L001_R1_001.fastq.gz -R2 /Your/HTOReads/Directory/HTO_L001_R2_001.fastq.gz -t /Your/Directory/For/HTO/Listing/HTOTags/tags.csv -cbf 1 -cbl 16 -umif 17 -umil 28 --bc_collapsing_dist 1 --umi_collapsing_dist 1 --max-error 1 -cells 12000 -wl /Your/CR/Directory/3M-february-2018.txt -o /Your/Output/Directory/HTO/
```
