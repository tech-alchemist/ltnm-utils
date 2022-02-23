#!/bin/bash
## Author : TechAlchemist (https://git.io/vddbF) ##
## Description : Install Precompiled LTNM Binaries ##

## Install Required Packages ##
sudo apt update -y
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
sudo apt-get install -y libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libzmq3-dev libqrencode-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools
sudo apt-get install -y libboost-all-dev git curl wget git vim htop net-tools python3-dev python3-setuptools python3 zip unzip gcc g++ make cmake python3-pip jq net-tools
sudo pip3 install awscli

## Install precompiled LibDb_cxx ##
[[ ! -f /usr/local/lib/libdb_cxx-4.8.so ]] && { sudo cp -par /opt/opsdude/ltnm-utils/libdb_cxx-4.8.so  /usr/local/lib/libdb_cxx-4.8.so ;
sudo chmod +x /usr/local/lib/libdb_cxx-4.8.so ; sudo chown -R root.root /usr/local/lib/libdb_cxx-4.8.so ; sudo ldconfig ; }

## Download & Extract Binary ##
sudo mkdir -p /home/LTNM/Data/WalletData /home/LTNM/Data/NodeData
sudo -H chown -R ${USER}.${USER} /home/LTNM ; cd /home/LTNM/
function gdrive_download () { CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p');   wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2;   rm -rf /tmp/cookies.txt; }
gdrive_download 14smRDg3VjKZ-L3fOT8DaMnVKsoSXaCGp Bins.tgz
tar -xvzf Bins.tgz

## Prepare Config ##
cp -par /opt/opsdude/ltnm-utils/LTNM.conf /home/LTNM/LTNM.conf
RPCUSER="$(< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-12})"
RPCPASS="$(< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-12})"
sed -i "s|RPCUSER|${RPCUSER}|g" /home/LTNM/LTNM.conf
sed -i "s|RPCPASS|${RPCPASS}|g" /home/LTNM/LTNM.conf

## E O F ##
