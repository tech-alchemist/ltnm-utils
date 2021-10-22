#!/bin/bash
## Script to Install Bitcoin Latinum Nodes to Ubuntu 20 Server ##
## Author : Abhishek Rana ##
## Client : Bitcoin Latinum ##

sudo mkdir -p /home/LTNM/Data/WalletData /home/LTNM/Data/NodeData
sudo -H chown -R ${USER}.${USER} /home/LTNM
cp -par /opt/opsdude/ltnm-utils/Bins /home/LTNM/
sudo cp -par /opt/opsdude/ltnm-utils/LTNM.conf /home/LTNM/LTNM.conf

## E O F ##
