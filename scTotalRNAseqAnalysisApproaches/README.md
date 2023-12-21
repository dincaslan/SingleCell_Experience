When dealing with Total RNA, you might need to deal with comprehensive RNA biotype information instead of focusing on a few of them.

If you are looking for how to make use of the data, then you might need to preliminary check out all these biotypes before further processing. 

I will be sharing the ways I have tried with simple modifications or implementations on common and available tutorials (e.g., Seurat-based).

#### Recommendations

##### Total-Seq Analysis
* For single-cell total RNA-seq, an alternative approach for the data analysis to look for would be [VASA-Seq](https://github.com/hemberg-lab/VASAseq_2022)
* For bulk total RNA-seq, an alternative approach for the data analysis to look for would be [MGCount](https://github.com/hitaandrea/MGcount/tree/main)

##### Overall Task
You can run the processes in single script with && after each step is done individually. In this case, it might take a little longer. You might want to run everything as a background task. There are multiple commands for this. I prefer [tmux](https://github.com/tmux/tmux/wiki).
> create the task

tmux new -s NameTheTask
> see how it works when you come back

tmux a -t NameTheTask
