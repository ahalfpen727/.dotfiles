# Install Samtools, BCFTools and htslib on linux

```sh 
# Install some build dependencies

sudo apt-get install autoconf automake make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev

sudo apt install libbz2-dev libssl-dev liblzma-dev libgsl0-dev
```

# [HTSlib]

```sh
wget -P $HOME/toolbin/ https://github.com/samtools/htslib/releases/download/1.3.2/htslib-1.3.2.tar.bz2 -O htslib.tar.bz2
tar -xjvf htslib.tar.bz2
cd htslib
autoreconf -i && autoheader && (autoconf || autoconf) 
./configure --disable-bz2 --disable-gcs --disable-lzma
make
sudo make install
make check
```
# [samtools]

```sh
wget -P $HOME/toolbin/ https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 -O samtools.tar.bz2
tar -xjvf samtools.tar.bz2
cd samtools
autoreconf -i 
./configure 
make
sudo make prefix=$HOME/toolbin/samtools install
make check
```

# Or if you have old version such as 0.x from samtools
# you may remove it and create a link to new version
```sh
sudo apt remove samtools
sudo ln -s /usr/local/bin/bin/samtools /usr/bin/samtools
# Or, you can just use the path to call samtools
/usr/loca/bin/bin/samtools -h

```

# [BCFtools]

```sh
wget https://github.com/samtools/bcftools/releases/download/1.3.1/bcftools-1.3.1.tar.bz2 -O bcftools.tar.bz2
tar -xjvf bcftools.tar.bz2
cd bcftools-{version}
make
sudo make prefix=/usr/local/bin install
sudo ln -s /usr/local/bin/bin/bcftools /usr/bin/bcftools
```


   [samtools]: <https://github.com/samtools/samtools>
   [BCFTools]: http://samtools.github.io/bcftools/
   [HTSlib]: https://github.com/samtools/htslib
   
