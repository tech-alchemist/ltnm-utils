#!/bin/bash
## Bitcoin latinum Compile Script ##

GH_TOKEN="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"

sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
sudo apt-get install -y libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev
sudo apt-get install -y libzmq3-dev
sudo apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools
sudo apt-get install -y libqrencode-dev
sudo apt-get install -y libboost-all-dev git curl wget git vim htop net-tools python3-dev python3-setuptools python3 zip unzip gcc g++ make cmake

wget http://download.oracle.com/berkeley-db/db-4.8.30.zip
unzip db-4.8.30.zip
sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30/dbinc/atomic.h
 
cd db-4.8.30
cd build_unix/
../dist/configure --prefix=/usr/local --enable-cxx
make -j$((`nproc`))
sudo make install
sudo ldconfig

cd /tmp/
git clone "https://latinumcore:${GH_TOKEN}@github.com/bitcoinlatinumofficial/bitcoinlatinumcore.git" || { echo "[-] Unable to clone , Token Expired, Contact Latinum Devs" ; exit 1 ; } 
cd bitcoinlatinumcore
./autogen.sh ; ./configure ; make -j$((`nproc`))
sudo mkdir -p /home/LTNM/Bins/ ; sudo -H chown -R ${USER}.${USER} /home/LTNM
cp -par /tmp/bitcoinlatinumcore/src/Bitcoinlatinum-staking* /home/LTNM/Bins
