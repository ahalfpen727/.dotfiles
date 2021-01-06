# R script to interactively change R-environment variables from R-console
# bash format \n R format

# R_LIBS_USER
Sys.setenv(R_USER="~/R/x86_64-pc-linux-gnu-library/3.4") # just an example directory
# R_HOME=/usr/lib/R
R.home("/usr/lib/R")
# R_LIBS_SITE=/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library
.Library.site <- file.path(chartr("\\", "/", R.home()), "/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library:~/R/x86_64-pc-linux-gnu-library/3.4")
# R_LIBS=~/home/drew/R/x86_64-pc-linux-gnu-library/3.4
.libPaths("~/home/drew/R/x86_64-pc-linux-gnu-library/3.4")
# R_INCLUDE_DIR                 /usr/share/R/include
#Set a CRAN mirror
local({r <- getOption("repos")
r["CRAN"] <- "http://my.local.cran"
options(repos=r)})
#This will allow you to not have to install all the packages again with each R version update.
#Sometimes it is useful to have a shortcut for a long R expression. A common example of this setting an active binding to access the last top-level expression result without having to type out .Last.value:
makeActiveBinding(".", function(){.Last.value}, .GlobalEnv)


# R_JAVA_LD_LIBRARY_PATH=${JAVA_HOME}/jre/lib/amd64/server
# JAVA_HOME=/usr/lib/jvm/java-8-oracle
# PKG_CONFIG_PATH=/usr/lib/pkgconfig
