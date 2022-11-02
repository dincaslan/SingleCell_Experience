1.  First go to NCBI-SRA Run Selector
2.  There might be multiple files, use "Filters List" to filter on the upper-left side.
3.  Download the selected accession by using "Select">"Selected">"Accession List" 
4.  Use this txt file to give as a input for the below code to download only the relevant fastq files together.

> how to download sratools to run fasts-dump: https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit
> for my case, it did not work for the configuration step, so I downloaded sratoolkit via homebrew
> home-brew details: https://docs.brew.sh/Installation
```shell
  git clone https://github.com/Homebrew/brew homebrew
  eval "$(homebrew/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
```

> installation via brew details
```shell
  brew install sratoolkit
  cd /your/path/to/homebrew/Cellar/sratoolkit/3.0.0/bin
  vdb-config -i
```

> details of while-do-done and IFG, modified from https://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/

> details of how to retrieve different file formats of accessions: https://www.ncbi.nlm.nih.gov/sra/docs/sradownload/

try echo run to see how it works
```shell
  input="/your/path/to/SRR_Acc_List.txt"
  while IFS= read -r line
  do
  echo	" fasterq-dump --split-files $line "
  done < "$input"
 ```

> outcome will be fasterq-dump --split-file for each line, in this case
> SRR14783059
> SRR14783060

it basically reads each accession line by line and retrieve via faster- dump


********ONLY CODE PLEASE********

```shell
  #!/bin/bash
  input="/your/path/to/SRR_Acc_List.txt"
  while IFS= read -r line
  do
    fasterq-dump --split-files $line
  done < "$input"
```
