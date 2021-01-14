pkgs <- as.data.frame(installed.packages(), 
                      stringsAsFactors = FALSE,
                      row.names = FALSE)
pkgs["RCurl", c("Package", "Version", "Built")]
update.packages("RCurl", ask = FALSE, checkBuilt = TRUE)
installed.packages("Rcurl",noCache = T,priority = "high")
tmp <- installed.packages()
installedpkgs <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
save(installedpkgs, file="installed_old.rda")

tmp <- installed.packages()
installedpkgs.new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
missing <- setdiff(installedpkgs, installedpkgs.new)
install.packages(missing)
update.packages(ask = FALSE, checkBuilt = TRUE)

source("https://bioconductor.org/biocLite.R")
BiocInstaller::biocLite()
if (!requireNamespace("BiocManager"))
   install.packages("BiocManager")
chooseBioCmirror()
BiocManager::install("RCurl")
BiocManager::valid()
load("installed_old.rda")
tmp <- installed.packages()
installedpkgs.new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
missing <- setdiff(installedpkgs, installedpkgs.new)
for (i in 1:length(missing)) biocM(missing[i])

all.packages <- installed.packages()
r.version <- paste(version[['major']], '.', version[['minor']], sep = '')
for (i in 1:nrow(all.packages)){
   package.name <- all.packages[i, 1]
   package.version <- all.packages[i, 3]
   if (package.version != r.version){
      print(paste('Installing', package.name))
      update.packages(ask = FALSE, dependencies = c('Suggests'))}}
