#!bin/bash

# Download the missing packages (the lack of which causes the installation to fail):

wget http://ftp.ca.debian.org/debian/pool/main/g/gstreamer0.10/libgstreamer0.10-0_0.10.36-1.5_amd64.deb

wget http://ftp.ca.debian.org/debian/pool/main/g/gst-plugins-base0.10/libgstreamer-plugins-base0.10-0_0.10.36-2_amd64.deb

# Install them:

sudo dpkg -i libgstreamer0.10-0_0.10.36-1.5_amd64.deb

sudo dpkg -i libgstreamer-plugins-base0.10-0_0.10.36-2_amd64.deb

# Make sure they don't get over-written at the next software update:

sudo apt-mark hold libgstreamer-plugins-base0.10-0

sudo apt-mark hold libgstreamer0.10

# Download and Install R if you need put your current version of https://cran.r-project.org/
wget https://cran.r-project.org/bin/linux/ubuntu/bionic-cran35/dh-r_20180506~ubuntu18.04.1~ppa1_all.deb
sudo dpkg -i dh-r_20180506_ubuntu18.04.1_ppa1_all.deb

# add gpg key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

# add r repository
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo add-apt-repository ppa:marutter/c2d4u3.5
sudo apt-get update && sudo dpkg -i rstudio-1.0.124-amd64.deb

# Launch RStudio:

rstudio

