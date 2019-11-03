#!/usr/bin/sh

sdir=/opt/src
wdir=`pwd`

apt-get update
apt-get upgrade -y

apt-get install -y git ruby ruby-dev wget python-dev swig zlib1g-dev build-essential perl libperl-dev

mkdir -p $sdir
cd $sdir
wget http://ccl.cse.nd.edu/software/files/cctools-7.0.19-source.tar.gz
tar xvf cctools*.tar.gz
cd cctools*-source
./configure --prefix /opt/cctools
make
make install

cd /opt/cctools
rsync -hapvP lib/python2.7/site-packages/ /usr/local/lib/python2.7/dist-packages/
cp bin/* /usr/local/bin/

cd $sdir
wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.9.0+-x64-linux.tar.gz
tar xvf ncbi-blast*.tar.gz
cd ncbi-blast*+
cp bin/* /usr/local/bin/

cd $sdir
gem install sequenceserver
seqpth=`gem environment | grep '\- INSTALLATION ' | cut -f 2 -d ':'`

mkdir BLASTEasy
cd BLASTEasy
git init
git remote add origin -f https://github.com/raptorslab/blastEasy.git
git config core.sparseCheckout true
echo Sequenceserver_1_0_12 > .git/info/sparse-checkout
git pull origin master
rsync -hapvP Sequenceserver_1_0_12/ $seqpth/gems/sequenceserver*/

cd $wdir
