df -lh
sudo fdisk -l
sudo mkdir /media/drew/usb2gb
sudo mount /dev/sdk2 /media/drew/usb2gb/
df -lh
sudo fdisk -l
sudo apt-get install gpart gparted rsync git emacs
df -lh
sudo fdisk -l
xkill
xkill
df -lh
sudo fdisk -l
df -lh
sudo fdisk -l
df -lh
sudo fdisk -l
sudo mkdir /media/drew/hitachi
sudo mount /dev/sdi1 /media/drew/hitachi
df -lh
sudo fdisk -l
R
sudo apt install r-base-core
R
ls
unzip dotfiles-master.zip 
unzip emacs.d-master.zip 
ls
mv .dotfiles-master/ .dotfiles
mv .emacs.d-master/ .emacs.d
cd .dotfiles/
ls
cp .bash* ../
cd
source .bashrc
source .bash_profile 
source .bash_aliases
cp .emacs.d/.emacs .
source .emacs
emacs
sudoemacs /etc/apt/sources.list
sudo add-apt-repository ppa:marutter/c2d4u && sudo apt-get update
sudo add-apt-repository ppa:marutter/c2d4u3.5 && sudo apt update
sudo apt-get upgrade
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get install oracle-java8-installer openjdk-8-jdk
sudo apt-get update 
sudo apt-get install oracle-java8-installer openjdk-8-jdk
sudo apt-get install  openjdk-8-jdk
sudo update-alternatives --config java
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
echo $JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo apt autoremove
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update && apt-get install docker-ce docker-ce-cli containerd.io
sudo mkdir /media/drew/UNTITLED
sudo mount /dev/sdb1 /media/drew/UNTITLED
sudo add-apt-repository universe
sudo apt install exfat-fuse exfat-utils
sudo apt update 
sudo mount -t exfat /dev/sdb1 /media/drew/UNTITLED
sudo mkfs.exfat /dev/sdb1; sudo mount -t exfat /dev/sdb1 /media/drew/UNTITLED
sudo nano /etc/fstab
cd /media/drew/
cd hitachi/
cd ../CAELinux2018/
sudo apt-get update
sudo apt-get upgrade
sudo apt autoremove
sudo apt autoclean
df -lh
bash Miniconda3-latest-Linux-x86_64.sh 
conda config --set auto_activate_base false
source .bashrc
source .bash_aliases
source .bash_profile 
bash Cytoscape_3_8_2_unix.sh 
sudo apt-get install openjdk-11-jdk
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get install openjdk-11-jdk
sudo apt-get update
sudo apt-get install openjdk-11-jdk
sudo update-alternatives --config java
echo $JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
echo $JAVA_HOME
export PATH=$PATH:$JAVA_HOME
echo $PATH
df -lh
sudo fdisk -l
mv Cytoscape_3_8_2_unix.sh  toolbin/
cd toolbin/
bash Cytoscape_3_8_2_unix.sh 
ls
rm Cytoscape_3_8_2_unix.sh 
cd bcftools-1.11/plugins/
wget https://raw.githubusercontent.com/freeseek/gtc2vcf/master/{gtc2vcf.{c,h},affy2vcf.c}
cd ../../
wget ftp://webdata2:webdata2@ussd-ftp.illumina.com/downloads/software/iaap/iaap-cli-linux-x64-1.1.0.tar.gz
git clone git://github.com/statgen/Minimac3.git
sed -i 's/USER_WARNINGS ?= -Werror/USER_WARNINGS ?= -Wno-format-truncation/' Minimac3/Library/libStatGenForMinimac3/general/Makefile
sed -i 's/bool legacy_count = 0/int legacy_count = 0/' Minimac3/Library/libStatGenForMinimac3/general/Parameters.cpp
sed -i 's/"\([0-9][0-9]*\)"/"\1","chr\1"/g;s/,"X"/,"X","chrX"/;s/finChromosome=="X"/(finChromosome=="X" || finChromosome=="chrX")/;s/finChromosome!="X"/(finChromosome!="X" \&\& finChromosome!="chrX")/' Minimac3/src/HaplotypeSet.cpp
sed -i 's/rHap.finChromosome!="X"/rHap.finChromosome!="X" \&\& rHap.finChromosome!="chrX"/' Minimac3/src/Imputation.cpp
cd Minimac3 && make && cd ..
bcftools plugins -l
bcftools plugin -l
source ../.profile
bcftools plugin -l
export BCFTOOLS_PLUGINS="/home/drew/toolbin/bcftools-1.11/plugins/"
bcftools plugin -l
ls
cd gtc2vcf-master/
mv ./* ../bcftools-1.11/plugins/
cd ../bcftools-1.11/plugins/
sudo chmod a+rwx ./*
bcftools plugin -l
cd ../../
mv mocha-master/* bcftools-1.11/plugins/
sudo chmod a+rwx  bcftools-1.11/plugins/*
bcftools plugin -l
ls
rm mocha-master
ls
cd gtc2vcf-master/
cd ..
rm -rf gtc2vcf-master
ls
rm mocha-master
rm -rf mocha-master
gunzip iaap-cli-linux-x64-1.1.0.tar.gz 
tar xvf iaap-cli-linux-x64-1.1.0.tar 
ls
rm iaap-cli-linux-x64-1.1.0.tar gtc2vcf-master.zip mocha-master.zip 
ls
cd
source .bash_aliases
source .bashrc
source .bash_profile 
pkgs
bcftools plugin -l
export BCFTOOLS_PLUGINS=/home/drew/toolbin/bcftools-1.11/plugins/
bcftools plugin -l
df -lh
sudo fdisk -l
sudo mkdir /media/drew/UNTITLED
sudo mount /dev/sdb2 /media/drew/UNTITLED/
sudo mount /dev/sdb2 /media/drew/UNTITLED
sudo mount /dev/sdb /media/drew/UNTITLED
df -lh
sudo fdisk -l
df -lh
sudo fdisk -l
sudo blkid
sudo mkdir /media/drew/L4N
cd Downloads/MGH-Coding-Test/
emacs README.txt
cd
sudo dpkg -i rstudio-1.3.1093-amd64.deb 
sudo apt-get --fix-missing 
sudo apt-get --fix-missing update
sudo apt-get --fix-broken upgrade 
sudo bash Cytoscape_3_8_2_unix.sh 
cd toolbin/
ls
bunzip2 htslib-1.11.tar.bz2 
bunzip2 bcftools-1.11.tar.bz2 
bunzip2 samtools-1.11.tar.bz2 
ls
tar xvf samtools-1.11.tar 
ls
tar xvf htslib-1.11.tar 
ls
tar xvf bcftools-1.11.tar 
ls
rm bcftools-1.11.tar samtools-1.11.tar htslib-1.11.tar 
unzip plink_linux_x86_64_20201019.zip 
unzip balena-etcher-electron-1.5.113-linux-x64.zip 
rm balena-etcher-electron-1.5.113-linux-x64.zip plink_linux_x86_64_20201019.zip 
cd htslib-1.11/
ls
make
sudo autoheader && sudo autoconf && sudo bash ./configure && sudo make && sudo make install && sudo make check
ls
cd ../samtools-1.11/
sudo autoheader && sudo autoconf && sudo bash ./configure && sudo make && sudo make install && sudo make check
cd ../bcftools-1.11/
sudo autoheader && sudo autoconf && sudo bash ./configure && sudo make && sudo make install && sudo make check
ls
cd plugins/
export BCFTOOLS_PLUGINS=/home/drew/toolbin/bcftools-1.11/plugins
cd
cd toolbin/
ls
sudo apt install wget git g++ zlib1g-dev unzip samtools bedtools bcftools libgomp1
sudo apt install libbz2-dev libssl-dev liblzma-dev libgsl0-dev
wget https://data.broadinstitute.org/alkesgroup/Eagle/downloads/dev/eagle_v2.4.1
ls
chmod a+rwx eagle_v2.4.1 
cd bcftools-1.11/plugins/
wget https://raw.githubusercontent.com/freeseek/mocha/master/{{mocha,beta_binom,genome_rules}.h,{mocha,trio-phase,mochatools,extendFMT}.c}
sudo apt install wget git g++ zlib1g-dev bwa unzip samtools msitools cabextract mono-devel libgdiplus libicu66 bcftools
sudo apt install libbz2-dev libssl-dev liblzma-dev libgsl0-dev
sudo apt install wget git g++ zlib1g-dev bwa unzip samtools msitools cabextract mono-devel libgdiplus libicu66 bcftools
sudo apt install wget git g++ zlib1g-dev bwa unzip samtools msitools cabextract mono-devel libgdiplus  bcftools
sudo apt install wget git g++ zlib1g-dev bwa unzip samtools msitools cabextract mono-devel libgdiplus 
ls
sudo chmod a+rwx ./*
ls
export PATH=$PATH:/home/drew/toolbin:/home/drew/toolbin/bcftools-1.11:/home/drew/toolbin/bcftools-1.11/plugins:/home/drew/toolbin/samtools-1.11:/home/drew/toolbin/htslib-1.11
echo $PATH
echo $BCFTOOLS_PLUGINS
sudo apt-get install -y libcurl4-openssl-dev
cd /media/drew/easystore/
cd umb_triley/
diff tailor tailor-master/
rm -rf tailor-master/
sudo systemctl status docker
sudo usermod -aG docker drew
sudo groupadd docker
sudo usermod -aG docker drew
sudo find ~/ -name 'docker' -print > xargs
chmod -R 777 xargs
docker search *
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
cd
cd toolbin/
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update && apt-get install docker-ce docker-ce-cli containerd.io
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl status docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chown "$USER":"$USER" /usr/bin/dockerd
docker
service docker restart
docker pull hello-world
sudo chown drew /var/run/docker
docker pull hello-world
sudo chown drew /var/run/docker*
docker pull hello-world
cd Downloads/
cd MGH-Coding-Test/
head counts.txt
head rpkm.txt
head genes.txt
df -lh
sudo fdisk -l
sudo blkid
xkill
df -lh
sudo chown drew /media/drew/UNTITLED1
df -lh
docker
docker ps
sudo mkdir /media/drew/UNTITLED1/eQTL
mkdir /media/drew/UNTITLED1/eQTL
mv /media/drew/UNTITLED1/eQTL /media/drew/UNTITLED1/eQTL-Resources
samtools
bcftools
vcftools
sudo apt install vcftools
vcftools
pip install pysam pyseer
sudo apt install python3-pip
pip install pysam pyseer
pip install --upgrade pip
pip install --upgrade python
cd toolbin/
rm workbench-linux64-v1.4.2.zip 
wget -O- http://neuro.debian.net/lists/xenial.us-nh.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
sudo apt-get update
sudoemacs /etc/apt/sources.list
sudo apt-get install connectome-workbench
mkdir ChIP-Seq-Resources
mkdir scRNA-Seq,scATAC-Seq_Resources
Variant-Analysis-Resources
mkdir Variant-Analysis-Resources
sudo apt-get install chrome
cd toolbin/
gunzip ibm-aspera-connect-3.11.0.5-linux-g2.12-64.tar.gz 
tar xvf ibm-aspera-connect-3.11.0.5-linux-g2.12-64.tar 
ls
bash ibm-aspera-connect-3.11.0.5-linux-g2.12-64.
bash ibm-aspera-connect-3.11.0.5-linux-g2.12-64.sh 
ls
rm IBM_Aspera_Connect_3.11_User_Guide_Linux.pdf IBM_ASP_CONNECT_V3.11.0_RN_EN.pdf ibm-aspera-connect-3.11.0.5-linux-g2.12-64.tar  ibm-aspera-connect-3.11.0.5-linux-g2.12-64.sh 
ls
more prettify 
sudo apt-get install r-bioc-bioc*
cd R/x86_64-pc-linux-gnu-library/3.6/
R CMD INSTALL clusterProfiler_3.18.0.tar.gz 
R CMD INSTALL DOSE_3.16.0.tar.gz 
R CMD INSTALL clusterProfiler_3.18.0.tar.gz 
xkill
cd /media/drew/UNTITLED1/
mkdir ChIP-Seq-Reads-mouse
cd ChIP-Seq-Reads-mouse/
wget -r ftp://ngs.sanger.ac.uk/production/epi-gen/ChIPseq/ChIPseqReads/French_Samples/
xkill
df -lh
sudo fdisk -l
$ export BCFTOOLS_PLUGINS=/path/to/bcftools/plugins && 
$ export BCFTOOLS_PLUGINS=/home/drew/toolbin/bcftools-1.11/plugins/
bcftools +gtc2vcf
export BCFTOOLS_PLUGINS=/home/drew/toolbin/bcftools-1.11/plugins/
bcftools +gtc2vcf
cd toolbin/
cd bcftools-1.11/
cd plugins/
cd
echo $PATH
echo $HOME
cd toolbin/
mv samtools-1.11/ samtools
mv bcftools-1.11/ bcftools
mv htslib-1.11/ htslib
ls
unzip gatk-4.1.9.0.zip 
ls
rm gatk-4.1.9.0
cd bcftools/
emacs .profile 
source .profile
bcftools +gtc2vcf
$ export BCFTOOLS_PLUGINS="$HOME/toolbin/bcftools/plugins/"
export BCFTOOLS_PLUGINS="$HOME/toolbin/bcftools/plugins/"
bcftools +gtc2vcf
cd plugins/
sudo chown drew ./*
exit
ls
bcftools +gtc2vcf
bcftools plugin -l
cd toolbin/
wget -P bcftools/plugins https://raw.githubusercontent.com/freeseek/gtc2vcf/master/{gtc2vcf.{c,h},affy2vcf.c}
wget -P bcftools/plugins https://raw.githubusercontent.com/freeseek/mocha/master/{{mocha,beta_binom,genome_rules}.h,{mocha,trio-phase,mochatools,extendFMT}.c}
sudo chmod -R a+rwx bcftools/plugins/*
host
hostname
export BCFTOOLS_PLUGINS=$HOME/toolbin/bcftools/plugins && bcftools plugin gtc2vcf
cd toolbin/bcftools/plugins/
mv gtc2vcf.c.1 gtc2vcf.c
mv gtc2vcf.h.1 gtc2vcf.h
mv affy2vcf.c.1 affy2vcf.c
mv mocha.c.1 mocha.c
ls
mv beta_binom.h.1 beta_binom.h
mv genome_rules.h.1 genome_rules.h
mv trio-phase.c.1 trio-phase.c
mv mochatools.c.1 mochatools.c
mv extendFMT.c.1 extendFMT.c
ls
sudo chown drew ./*
sudo chown drew $HOME/toolbin/bcftools/plugins/*
bcftools +gtc2vcf
htslib
export PATH=$PATH:$HOME/toolbin/htslib
cd toolbin/
export PATH=$PATH:$HOME/toolbin/samtools
vcftools
samtools
htslib
source ~/.profile
htslib
sudo apt-get install htslib-test 
sudo apt-get install bcftools
sudo apt-get install bcftools libgsl2
sudo apt install wget git g++ zlib1g-dev bwa unzip samtools msitools cabextract mono-devel libgdiplus libicu66 bcftools
sudo apt install libbz2-dev libssl-dev liblzma-dev libgsl0-dev
htslib
exit
cd
source .profile
source .bashrc
source .bash_profile 
source .bash_aliases 
rm core 
ls
source .bash_aliases 
ls
source .profile
ls
rm .profile.~1~ 
df -lh
sudo fdisk -l
sudo apt-get install -y     openjdk-8-jre-headless     g++     python3.6 python3-pip     libopenblas-base liblapack3
sudo apt-get install -y     openjdk-8-jre-headless     g++     python3-pip     libopenblas-base liblapack3
sudo apt-get install flashplugin-installer flashplugin-nonfree-extrasound vlc pulseaudio pulseaudio-utils chromium-browser inxi  alsa-base pulseaudio
alsamixer
df -lh
sudo fdisk -l
sudoemacs .bash_aliases 
cp .bash_aliases .dotfiles/
ls
emacs .bashrc
emacs .bash_profile 
rm .bash_aliases.~1~ 
cp .Rprofile  .dotfiles/
cp .Renviron  .dotfiles/
