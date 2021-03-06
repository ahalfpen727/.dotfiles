# .Rprofile in bash format \n R format
#Sys.setenv(R_USER="~/R/x86_64-pc-linux-gnu-library/3.6"); R.home("/usr/lib/R")
#.libPaths("~/home/drew/R/x86_64-pc-linux-gnu-library/3.6")
#.Library.site <- file.path(chartr("\\", "/", R.home()),
# "/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library:~/R/x86_64-pc-linux-gnu-library/3.6")

options("repos" = c(BioCsoft="http://www.bioconductor.org/packages/3.11/bioc",
                    Rforge="http://r-forge.r-project.org",
                    CRAN = "https://mirrors.ustc.edu.cn/CRAN/"))
#                    CRAN = "http://cran.rstudio.com/"))

## Create a new invisible environment for all the functions to go in so it doesn't clutter your workspace.
.env <- new.env()

## Returns a logical vector TRUE for elements of X not in Y
.env$"%nin%" <- function(x, y) !(x %in% y) 

## Returns names(df) in single column, numbered matrix format.
.env$n <- function(df) matrix(names(df)) 

## Single character shortcuts for summary() and head().
.env$s <- base::summary
.env$h <- utils::head

## ht==headtail, i.e., show the first and last 10 items of an object
.env$ht <- function(d) rbind(head(d,10),tail(d,10))

## Show the first 5 rows and first 5 columns of a data frame or matrix
.env$hh <- function(d) if(class(d)=="matrix"|class(d)=="data.frame") d[1:5,1:5]

# simplify the install command
.env$install <- function(x) {
    if (!requireNamespace(x))
        install.packages(x)}

# simplify the bioc install command for newer versions
.env$biocM <- function(x){
    BiocManager::install(x)}

# simplified command for older bioc version
.env$biocI <- function(x) {
    source("http://bioconductor.org/biocLite.R")
    biocLite(x)}

## Read data on clipboard.
#.env$read.cb <- function(...) {
#  ismac <- Sys.info()[1]=="Darwin"
#  if (!ismac) read.table(file="clipboard", ...)
#  else read.table(pipe("pbpaste"), ...)
#}

## Strip row names from a data frame (stolen from plyr)
.env$unrowname <- function(x) {
    rownames(x) <- NULL
    x
}

## List objects and classes (from @_inundata, mod by ateucher)
.env$lsa <- function() {
{
    obj_type <- function(x) class(get(x, envir = .GlobalEnv)) # define environment
    foo = data.frame(sapply(ls(envir = .GlobalEnv), obj_type))
    foo$object_name = rownames(foo)
    names(foo)[1] = "class"
    names(foo)[2] = "object"
    return(unrowname(foo))
}

## List all functions in a package (also from @_inundata)
.env$lsp <-function(package, all.names = FALSE, pattern) {
    package <- deparse(substitute(package))
    ls(
        pos = paste("package", package, sep = ":"),
        all.names = all.names,
        pattern = pattern
    )
}

## Attach all the variables above
attach(.env)

## .First() run at the start of every R session. 
## Use to load commonly used packages? 
.First <- function() {
	# library(ggplot2)
	cat("\nSuccessfully loaded .Rprofile at", date(), "\n")
}

## .Last() run at the end of the session
.Last <- function() {
	# save command history here?
	cat("\nGoodbye at ", date(), "\n")
}
