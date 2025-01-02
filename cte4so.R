# Hua Sun
# v0.2


library(Seurat)
library(dplyr)
library(stringr)
library(this.path)
library(GetoptLong)


path <- dirname(this.path())
fpath <- paste0(path, '/src/')
r_source <- list.files(fpath, recursive = T, full.names = T, pattern = ".R")
invisible(lapply(r_source, source))

db_path <- paste0(path, '/db')

db <- 'hsFB'
tissue <- 'Brain'
assay <- 'SCT'

title <- ''
reduction <- 'umap'
groupby <- 'seurat_clusters,cell_type,cell_type2'

outdir <- 'out_celltype'

GetoptLong(
    "rds=s",         "rds file path",
    "assay=s",       "obj type",
    "db=s",          "marker db",
    "tissue=s",      "tissue name",
    "save",          "save to rds",
    "plot",          "plot",
    "title=s",       "title name in plot",
    "reduction=s",   "reduction in plot",
    "groupby=s",     "group in plot",
    "outdir=s",      "output path"
)





dir.create(outdir)


# set db
f_db <- paste0(db_path, '/', db, '.xlsx')
if (!file.exists(f_db)){
    print('[ERROR] The db file does not exists!')
    print(f_db)
    quit()
}

print('[INFO] Reading .rds data ...')
seu <- readRDS(rds)


print('[INFO] Calculate scale data ...')
DefaultAssay(seu) <- assay

print('[INFO] Annotating cell type ...')
seu <- ScTypeAnnotation(seu, assay, f_db, tissue, outdir)

# write metadata
metadata <- as.data.frame(seu@meta.data)
write.table(metadata, file = paste0(outdir, "/metaData.cellType.xls"), sep="\t", quote=F, col.names = NA)


# create cluster_cellType file
record_anno <- unique(metadata[,c('seurat_clusters', 'cell_type', 'cell_type2', 'sctype.score')])
if ('cluster_plus' %in% colnames(metadata)){
    record_anno <- unique(metadata[,c('seurat_clusters', 'cell_type', 'cell_type2', 'cluster_plus', 'sctype.score')])
}
record_anno <- record_anno[order(record_anno$sctype.score, decreasing=TRUE),]
write.table(record_anno, file = paste0(outdir, "/cluster_cellType.xls"), sep="\t", quote=F, row.names = F)


# save rds
if (save){
    print('[INFO] Saving data ...')
    saveRDS(seu, file = paste0(outdir, '/sc_celltype_anno.rds'))
}




# plot
if (plot){
    groupset <- str_split(groupby, ',')[[1]]
    for (group in groupset){
        CustomizedPlotUMAP(obj=seu, title=title, reduction=reduction, group_by=group, label=TRUE, outdir=outdir)
    }
}














