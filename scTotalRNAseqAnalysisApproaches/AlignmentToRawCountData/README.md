In this section, the alignment of pre-processed reads and raw count data retrieval with STARSolo was explained. 

Morever, if there other modalities (HTO, ADT tags), you need to retrieve the count data separately. No need for alignment as they are NOT RNA reads, they are only oligo-tags attached to specific cell surface antibodies with known sequence.

For HTO and ADT CITE-Seq-Count tool, the Pyhton version might need to be downgraded to 1.4.0 as shown below:

```shell
pip install pandas==1.4.0
```

> upgrade to the latest version once you are done

> pip install pandas==1.x.x


### Useful Links/Discussions Regarding Parameter Optimizations
> Small RNA mapping settings optimizations
https://github.com/alexdobin/STAR/issues/891

> Filtering reads - matching fragments
https://groups.google.com/g/rna-star/c/UCUM5x9cXGk?pli=1

> Anchor Setting for multimapping
https://github.com/alexdobin/STAR/issues/243

> Alignment and penalty scores
https://github.com/alexdobin/STAR/issues/408

