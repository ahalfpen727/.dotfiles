lib_loc <-c("/media/drew/fb71e22e-7aa7-442e-813a-33628992d311/drew/R/x86_64-pc-linux-gnu-library/3.6")
#,"/media/drew/fb71e22e-7aa7-442e-813a-33628992d311/drew/R/x86_64-pc-linux-gnu-library/3.5","/media/drew/fb71e22e-7aa7-442e-813a-33628992d311/drew/R/x86_64-pc-linux-gnu-library/3.6")
to_install <- unname(installed.packages(lib.loc = lib_loc)[, "Package"])
to_install
install.packages(pkgs = to_install,dependencies = TRUE,quiet = TRUE)
update.packages(ask = FALSE)
