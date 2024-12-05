


CellTypeEstimate (CTE)
=======================
```
Cell type annotation tool for single cell data

Developer: Hua Sun

Version: v1.0
```

Description
----------------------
The CellTypeEstimate (CTE) is a cell type annotation tool developed based on ScType (Ianevski et al., Nat Commun 2022). It was built for 10xMultiome project and specifically solve brain tissue annotation. Its characteristics are simplicity, convenience, ease of use and strong scalability. It is suitable for directly using Seurat4/5 objects for cell type annotation of scRNA/snRNA/snMultiome data. Currently contains a limited set of brain markers. It will continue to be upgraded as needed in the future.

* [ Notice ]

    Most cell type markers were collected from normally developing brains, with a few marker sets coming from ependymomas (tumors). If a marker was collected from tumor data, it will be labeled "-Like" and annotated in the "Region" column as coming from that tumor type. This is because these marker sets were created for analysis of healthy brains and ependymoma brain tumors. (2024-10-04)



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
Rscript cte.R --rds scrna.rds --db hsFB --assay SCT --outdir out_celltype
```
> output: cluster_cellType.xls, metaData.cellType.xls


* Save cell type to seurat object
```
Rscript cte.R --rds scrna.rds --db hsFB --assay SCT --outdir out_celltype --save
```
> output: cluster_cellType.xls, metaData.cellType.xls, sc_celltype_anno.rds


### Parameter
```
--tissue    Brain (default)              
--ver       v3 (default)               # version of cell type marker set
--db        hsFB  (Human Forebrain)    # normal data annotation
            hsHD  (Human Hindbrain)    # normal data annotation
            mmFB  (Mouse Forebrain)    # normal/tumor data annotation
            hsFB.T  (Human Forebrain)  # tumor data annotation (includes markers collected from tumor data)
            hsHD.T  (Human Hindbrain)  # tumor data annotation (includes markers collected from tumor data)

--rds       seurat.rds                 # seurat object file (.rds)
--assay     SCT (default)              # Seurat assay type. RNA/SCT
--save                                 # save annotated rds or not
--outdir    out_celltype (default)     # output directory
```

### Marker set version
```
v3 (default): These markers match the August 15, 2024 bioRxiv preprint
```


Cite
----------------------
If you use this tool or the cell type marker set in your research/analysis, please cite `github.com/hsun9/CellTypeEstimate`


The first manuscript using this tool
----------------------
Alisha Kardian, Hua Sun, et al., bioRxiv 2024. Dominant Malignant Clones Leverage Lineage Restricted Epigenomic Programs to Drive Ependymoma Development.


Contact
----------------------
Hua Sun, <hua.sun@stjude.org> | <hua.sun229@gmail.com> ; Stephen Mack (PI), <stephen.mack@stjude.org> 




