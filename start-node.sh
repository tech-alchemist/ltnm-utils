#!/bin/bash
## Script to Start LTNM Node According to /home/LTNM/LTNM.conf ##
## Author Abhishek Rana ##

BINARY="/home/LTNM/Bins/BitcoinLatinum-stakingd"
CONFIG="/home/LTNM/LTNM.conf"

${BINARY} -conf=${CONFIG}
 
## EOF ##