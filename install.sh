#!/bin/bash
## Script to Install Bitcoin Latinum Nodes to Ubuntu 20 Server ##
## Author : Abhishek Rana ##
## Client : Bitcoin Latinum ##

sudo mkdir -p /home/LTNM/Data/WalletData /home/LTNM/Data/NodeData
sudo -H chown -R ${USER}.${USER} /home/LTNM
cd /home/LTNM/
function gdrive_download () {   CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p');   wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2;   rm -rf /tmp/cookies.txt; }
gdrive_download 14smRDg3VjKZ-L3fOT8DaMnVKsoSXaCGp Bins.tgz
tar -xvzf Bins.tgz
cp -par /opt/opsdude/ltnm-utils/LTNM.conf /home/LTNM/LTNM.conf

## E O F ##
