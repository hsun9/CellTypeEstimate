

CellTypeEstimate (CTE)
=======================
```
Cell type annotation tool for single cell data

Developer: Hua Sun

Version: v1.0
```

Description
----------------------
The CellTypeEstimate (CTE) is a cell type annotation tool developed based on ScType (Ianevski et al., Nat Commun 2022). It was built for 10xMultiome project and specifically solve brain tissue annotation. Its characteristics are simplicity, convenience, ease of use and strong scalability. It is suitable for directly using Seurat4/5 objects for cell type annotation of scRNA/snRNA/10xMultiome data. Currently contains a limited set of brain markers. It will continue to be upgraded as needed in the future.

* [ Notice ]

    Most cell type markers were collected from normally developing brains, with a few marker sets coming from ependymomas (tumors). If a marker was collected from tumor data, it will be labeled "similar" and annotated in the "Region" column as coming from that tumor type. This is because these marker sets were created for analysis of healthy brains and ependymoma brain tumors.


Install R packages
----------------------
```
R >= 4.2.1
Seurat 4/5
dplyr
HGNChelper
readxl
```


Usage
----------------------
* Test
```
Rscript cte.R --rds scrna.rds --db v3.hsFB --umap umap --assay SCT --outdir out_celltype
```
> output: cluster_cellType.xls, metaData.cellType.xls


* Save cell type to seurat object
```
Rscript cte.R --rds scrna.rds --db v3.hsFB --umap umap --assay SCT --outdir out_celltype --save
```
> output: cluster_cellType.xls, metaData.cellType.xls, sc_celltype_anno.rds


### Parameter
```
--tissue    Brain (default)
--db        v3.hsFB  (Human Forebrain)
            v3.hsHD  (Human Hindbrain)
            v3.mmFB  (Mouse Forebrain)

--rds       scrna.rds
--assay     SCT (default)
--umap      umap (default)
--save      save annotated rds
--outdir    out_celltype (default)
```


Cite
----------------------
If you use this tool or the cell type marker set in your research/analysis, please cite `github.com/hsun9/CellTypeEstimate`


The first manuscript using this tool
----------------------
Alisha Kardian, Hua Sun, et al., bioRxiv 2024. Dominant Malignant Clones Leverage Lineage Restricted Epigenomic Programs to Drive Ependymoma Development.


Contact
----------------------
Hua Sun, <hua.sun@stjude.org> | <hua.sun229@gmail.com> 



