#!/bin/bash
## Script to Install Bitcoin Latinum Nodes to Ubuntu 20 Server ##
## Author : Abhishek Rana ##
## Client : Bitcoin Latinum ##

sudo apt update -y
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
sudo apt-get install -y libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev
sudo apt-get install -y libzmq3-dev
sudo apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools
sudo apt-get install -y libqrencode-dev
sudo apt-get install -y libboost-all-dev git curl wget git vim htop net-tools python3-dev python3-setuptools python3 zip unzip gcc g++ make cmake

[[ -f /usr/local/lib/libdb_cxx-4.8.so ]] && {
cd /tmp/
wget http://download.oracle.com/berkeley-db/db-4.8.30.zip && unzip db-4.8.30.zip && sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30/dbinc/atomic.h
cd db-4.8.30 ; cd build_unix/
../dist/configure --prefix=/usr/local --enable-cxx
make -j$((`nproc`))
sudo make install
sudo ldconfig
} || echo "[+] /usr/local/lib/libdb_cxx-4.8.so Already installed"

## Download Binary & Start ##

sudo mkdir -p /home/LTNM/Data/WalletData /home/LTNM/Data/NodeData
sudo -H chown -R ${USER}.${USER} /home/LTNM
cd /home/LTNM/
function gdrive_download () {   CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p');   wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2;   rm -rf /tmp/cookies.txt; }
gdrive_download 14smRDg3VjKZ-L3fOT8DaMnVKsoSXaCGp Bins.tgz
tar -xvzf Bins.tgz
cp -par /opt/opsdude/ltnm-utils/LTNM.conf /home/LTNM/LTNM.conf

## E O F ##
