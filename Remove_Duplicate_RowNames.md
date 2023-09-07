Sometimes there is no consensus on which sequences represents the common name as diazdc explained here in this pot https://github.com/satijalab/seurat/issues/1710
, so you might want to rename your feature csv file of the STARSolo or CellRanger single-cell count matrix folder.
I will share my partial code here, modified from diazdc's example in the link given above.

> # ATTENTION! You might want to copy and save the original feature csv file to somewhere else just in case!

```R
# Change the duplicated row names in STARSolo outcome folder
  features <- read_tsv("/Your/Path/to/STARSolo_Example/Gene/filtered/features.tsv", col_names = FALSE)
  names <- make.unique(features$X2)
  features$X2 <- names
  write_tsv(features, "Your/Path/to/STARSolo_Example/Gene/filtered/features.tsv", col_names = FALSE)
```

> If you like to see how it works View(as.data.frame(YourSample@assays[["RNA"]]@data@Dimnames[[1]]))

********ONLY CODE PLEASE********

```R
  features <- read_tsv("/Your/Path/to/STARSolo_Example/Gene/filtered/features.tsv", col_names = FALSE)
  names <- make.unique(features$X2)
  features$X2 <- names
  write_tsv(features, "Your/Path/to/STARSolo_Example/Gene/filtered/features.tsv", col_names = FALSE)
```
