# To interactively edit R configuration use the commands
usethis::edit_r_environ()

# .Rprofile in bash format \n R format
#.Library.site <- file.path(chartr("\\", "/", R.home()),

# Useful commands with typical directory structure:
#.libPaths("~/home/drew/R/x86_64-pc-linux-gnu-library/3.6")
Sys.setenv(R.home="/usr/lib/R")
# "/usr/local/lib/R/site-library:/usr/lib/R/site-library"
Sys.setenv(R_USER="~/R/x86_64-pc-linux-gnu-library/3.6"); R.home("/usr/lib/R")
.libPaths()

# The system settings for R are:
## Create a new invisible environment for all the functions to go in so it does$
.env <- new.env()
options("repos" = c(BioCsoft="https://bioconductor.org/packages/3.10/bioc",
                    BioCann="https://bioconductor.org/packages/3.10/data/annota$
                    BioCexp="https://bioconductor.org/packages/3.10/data/experi$
                       Rforge="http://r-forge.r-project.org",
                    CRAN = "https://mirrors.ustc.edu.cn/CRAN/"))
#    CRAN = "http://cran.rstudio.com/"))
"%nin%" <- function(x, y) !(x %in% y)
## Returns names(df) in single column, numbered matrix format.
n <- function(df) matrix(names(df))
## Single character shortcuts for summary() and head().
s <- function(x) base::summary()
h <- function(x) utils::head()
## ht==headtail, i.e., show the first and last 10 items of an object
ht <- function(d) rbind(head(d,10),tail(d,10))
