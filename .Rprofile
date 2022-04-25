# .Rprofile in bash format \n R format
#Sys.setenv(R_USER="~/R/x86_64-pc-linux-gnu-library/3.6"); R.home("/usr/lib/R")
#.libPaths("~/home/drew/R/x86_64-pc-linux-gnu-library/3.6")
#.Library.site <- file.path(chartr("\\", "/", R.home()),
# "/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library:~/R/x86_64-pc-linux-gnu-library/3.6")

## Create a new invisible environment for all the functions to go in so it doesn't clutter your workspace.
.env <- new.env()
## .First() run at the start of every R session.
## Use to load commonly used packages?
.First <- function() {
    options(download.file.method = "libcurl")
    #options(download.file.method = "wget")
    options(repos = c(BioCsoft="https://bioconductor.org/packages/3.10/bioc",
                      BioCann="https://bioconductor.org/packages/3.10/data/annotation",
                      BioCexp="https://bioconductor.org/packages/3.10/data/experiment",
                      Rforge="http://r-forge.r-project.org",
                      BioCworkflows="https://bioconductor.org/packages/3.10/workflows",
                      # CRAN = "https://mirrors.nics.utk.edu/cran/",
                      CRAN="https://cran.rstudio.com"))
    cat("\nSuccessfully loaded .Rprofile at", date(), "\n")
}

"%nin%" <- function(x, y) !(x %in% y)
## Returns names(df) in single column, numbered matrix format.
n <- function(df) matrix(names(df))
## Single character shortcuts for summary() and head().
s <- function(x) base::summary()
h <- function(x) utils::head()
## ht==headtail, i.e., show the first and last 10 items of an object
ht <- function(d) rbind(head(d,10),tail(d,10))
## Show the first 5 rows and first 5 columns of a data frame or matrix
hd <- function(d) if(class(d)=="matrix"|class(d)=="data.frame") d[1:5,1:5]
# simplify the install command
install <- function(x) {
    if (!requireNamespace(x))
        install.packages(x)
    }
# simplify the bioc install command for newer versions
biocM <- function(x){
    BiocManager::install(x)
    }
# simplified command for older bioc version
biocI <- function(x) {source("http://bioconductor.org/biocLite.R")
    biocLite(x)
    }
## Strip row names from a data frame (stolen from plyr)
unrowname <- function(x) {
    rownames(x) <- NULL;  x
    }

## Attach all the variables above
attach(.env)


## .Last() run at the end of the session
.Last <- function() {
	# save command history here?
	cat("\nGoodbye at ", date(), "\n")
}
