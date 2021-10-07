# System (Re)Configuration Documentation
-------------------------------------------------------------------------------------------------------------------------------
Here is some code to help reinstall everything after nuking an OS, which I have done frequently enough to warrant automation of the task. These files and commands configure bash, emacs, R, conda, java, docker, ssh, jupyter-notebook, and git.
-------------------------------------------------------------------------------------------------------------------------------

# R-version 3.4
libraries for linux are distro and version specific
In order to install R-version 3.4.* add the following lines to /etc/apt/sources.list:
```
# ubuntu 18.04
deb http://ppa.launchpad.net/marutter/c2d4u/ubuntu bionic main 
deb-src http://ppa.launchpad.net/marutter/c2d4u/ubuntu bionic main

# debian
# Appends the CRAN repository to your sources.list file 
deb http://<favourite-cran-mirror>/bin/linux/debian stretch-cran35/
# Adds the CRAN GPG key, which is used to sign the R packages for security.
sudo apt-key adv --keyserver subkeys.pgp.net --recv-key 381BA480
sudo apt-get update
sudo apt-get install r-base r-base-dev
```
Afterwards, execute the following command:
```
sudo add-apt-repository ppa:marutter/c2d4u && sudo apt-get update

# In order to install R-version 3.5.* or update R-3.4.* to R-3.5
# comment out the previous sources for R-3.4.* 
# and add the  following lines to /etc/apt/sources.list as sudo user:
```

# R-version 3.5
In order to install R-version 3.4.* add the following lines to /etc/apt/sources.list:
```
deb http://ppa.launchpad.net/marutter/c2d4u3.5/ubuntu bionic main 
deb-src http://ppa.launchpad.net/marutter/c2d4u3.5/ubuntu bionic main 
deb http://ppa.launchpad.net/marutter/rrutter3.5/ubuntu bionic main 
deb-src http://ppa.launchpad.net/marutter/rrutter3.5/ubuntu bionic main 
```
Afterwards, execute the following command:
```
sudo add-apt-repository ppa:marutter/c2d4u3.5 && sudo apt update
```
-------------------------------------------------------------------------------------------------------------------------------
# Notedown and Ipython Notebook Running an IPython Notebook

```
notedown notebook.md --run > executed_notebook.ipynb
# Convert markdown to .ipynb and vice versa with notedown
notedown input.md > output.ipynb
# Convert r-markdown into markdown:
notedown input.Rmd --to markdown --knit > output.md
# Convert r-markdown into an IPython notebook:
notedown input.Rmd --knit > output.ipynb
# Convert a notebook into markdown, stripping all outputs:
notedown input.ipynb --to markdown --strip > output.md
# Convert a notebook into markdown, with output JSON intact:
notedown input.ipynb --to markdown > output_with_outputs.md
# Strip the output cells from markdown:
notedown with_output_cells.md --to markdown --strip > no_output_cells.md
```

-------------------------------------------------------------------------------------------------------------------------------
# SSH public key authentication
After a new installation it is important to create new private and public keys for ssh authentication. In order to enable passwordless loging to a cluster execute the following commands:
```
ssh-keygen -t rsa
ssh-copy-id -i .ssh/id_rsa.pub aj26b@ghpcc06.umassrc.org
```
-------------------------------------------------------------------------------------------------------------------------------
# AWS rsync

```
sudo rsync -av --progress -e "ssh -i .ssh/LightsailDefaultKey-us-east-1.pem" /media/andrew/wd2TBnas/2020SplicingData/Broad-Pipeline-Recapitulation/ ubuntu@54.156.50.149:~/2020splicing
```

-------------------------------------------------------------------------------------------------------------------------------

# Java
Many programs like Cytoscape rely on java version 8 which can be installed using the following commands
```
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get install oracle-java8-installer openjdk-8-jdk
sudo apt-get update 
sudo apt-get install oracle-java11-installer-local openjdk-11-jre
sudo update-alternatives --config java

#verify installation check the java configuration 
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
echo $JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

```
-------------------------------------------------------------------------------------------------------------------------------
# Docker
Make sure to remove previous and possibly broken docker versions before installing current version
add the repository for ubuntu 18.04 with 
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update && apt-get install docker-ce docker-ce-cli containerd.io
# after installation start the docker service with the following command:
sudo systemctl status docker

# To run docker without sudo use the following commands:

sudo usermod -aG docker user
sudo find ~/ -name 'docker' -print > xargs
chmod -R 777 xargs

# To run a docker container use this command:

sudo docker run -i -t kalilinux/kali-linux-docker /bin/bash
sudo docker run -i -t kalilinux/kali-linux-docker /bin/bash
sudo docker attach container-id/name

# Use below syntax to get shell access of docker container.

sudo docker exec -it <CONTAINER ID/NAME> bash

# find a container

docker search *

```
# Running the rocker container in the browser 
username: rstudio password: rstudio
```
docker run --rm -p 8787:8787 rocker/verse
firefox http://localhost:8787
```
link hard-drive to container
```
docker run --rm -p 8787:8787 -v /home/drew/umb_triley: rocker/verse
```
-------------------------------------------------------------------------------------------------------------------------------
# git

Initialize a new repository
```
git init
git add .
git commit -m "new shit"
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
… push a new repository to the remote repository
```
echo "# Tailor-Secondary-Analysis" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ahalfpen727/Tailor-Secondary-Analysis.git
git push -u origin main
```
…or push an existing repository from the command line
```
git remote add origin https://github.com/ahalfpen727/Tailor-Secondary-Analysis.git
git branch -M main
git push -u origin main
```
push a new commit from a new computer to an old repository
```
git remote add origin git@github.com:ahalfpen727/old-repo.git
git pull origin master --allow-unrelated-histories
git push -u origin master
```
merging two repositories
```
cd path/to/B
# Change the remote origin of B to that of A:
git remote rm origin
git remote add origin url_to_rA
# Rename the local master branch of B:
git checkout master
git branch -m master-holder
# Pull all the code of A from rA into your local B repo.
git fetch
git checkout master
git pull origin master
# Push everything to A
git merge master-holder --allow-unrelated-histories
git push origin master
```
Modifying default method for communicating with remote repositories
  Modify from https to ssh
```
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git.
```
  Modify from ssh to https
```
git remote set-url origin https://github.com/USERNAME/REPOSITORY.git
```

-------------------------------------------------------------------------------------------------------------------------------
# conda
configuration for bioconda and other necessary channels
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

# create env from yaml file

conda env create -f env.yml
conda env create --name EnvName --file env.yml
```
-------------------------------------------------------------------------------------------------------------------------------
# Initializing Jekyll to View a Website or Blog
Make sure that ruby and bundler are installed, 
following the 'Requirements' section of GitHub's documentation.
Clone the repository and switch to the docs/ directory
```
git clone http://github.com/developer/repository.git
cd repository/docs
# cd BioC2019/docs
```
Install or update bundler to install the ruby pre-requisities.
```
gem install --user-install bundler
# If the installer complains, add the suggested $PATH_TO_RUBY/bin directory to your ~/.bash_profile or ~/.bashrc
# Install ruby pre-requisites.
bundle install --path vendor/bundle     # once only; references Gemfile
# Execute the jekyll server
bundle exec jekyll serve
# and view the results at https://localhost:4000
firefox https://localhost:4000
```
