redownload <- FALSE # Should already downloaded files be redownloaded and overwritten?

downloadDirectory <- "./MDS-LAS/" # Where to download the files to

parallelize <- TRUE # Requires the parallel library
numParallel <- 8 # Number of parallel downloads if parallelizing


idList <- list.dirs("./MDS/", full.names = FALSE, recursive = FALSE)

if(!redownload){
  alreadyDownloaded <- sub( ".laz", "", 
    list.files(downloadDirectory, full.names = FALSE, recursive = FALSE) )
  idList <- setdiff( idList, alreadyDownloaded )
}

downloadFromID <- function(id){
  urlFromId <- paste0( 
    "http://geosampa.prefeitura.sp.gov.br/PaginasPublicas/downloadArquivoOL.aspx?orig=DownloadMDSLAZ&arq=MDS_2017%5C",
    id,
    ".laz&arqTipo=LAZ"
  )
  saveNameFromId <- paste0("D:/DataSampa/MDS/", id, ".laz")
  message("Downloading ID ", id )
  download.file( urlFromId, saveNameFromId, mode="wb", quiet=TRUE )
}

if(parallelize){
  library(parallel)
  cl <- makeCluster(numParallel)
  clusterExport(cl, c("downloadDirectory"))
  parLapplyLB( cl, idList, downloadFromID )
  stopCluster(cl)
} else{
  lapply( idList, downloadFromID )
}
