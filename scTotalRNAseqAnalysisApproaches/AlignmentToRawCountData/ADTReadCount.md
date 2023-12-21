If you are interested cell surface markers to idenfiy cell types properly using ADT barcodes, you need to count them separately as in the case of HTO tags (if you are not using Cell Ranger demultiplex, and if you prefer available open source tools like StarSolo).

```shell
CITE-seq-Count -R1 /Your/ADTReads/Directory/ADT_L001_R1_001.fastq.gz -R2 /Your/ADTReads/Directory/ADT_L001_R2_001.fastq.gz -t /Your/Directory/For/ADT/Listing/ADTTags/cellsurfacetags.csv -cbf 1 -cbl 16 -umif 17 -umil 28 --bc_collapsing_dist 1 --umi_collapsing_dist 1 --max-error 1 -cells 12000 -wl /Your/CR/Directory/3M-february-2018.txt -o /Your/Output/Directory/ADT/
```
