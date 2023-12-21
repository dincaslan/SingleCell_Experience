In this section, the alignment of pre-processed reads and raw count data retrieval with STARSolo was explained. 

Morever, if there other modalities (HTO, ADT tags), you need to retrieve the count data separately. No need for alignment as they are NOT RNA reads, they are only oligo-tags attached to specific cell surface antibodies with known sequence.

For HTO and ADT CITE-Seq-Count tool, the Pyhton version might need to be downgraded to 1.4.0 as shown below:

```shell
pip install pandas==1.4.0
```
