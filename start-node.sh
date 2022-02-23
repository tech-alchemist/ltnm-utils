#!/bin/bash
## Author : TechAlchemist (https://git.io/vddbF) ##
## Description : Script to Start LTNM Node According to /home/LTNM/LTNM.conf ##


BINARY="/home/LTNM/Bins/BitcoinLatinum-stakingd"
CONFIG="/home/LTNM/LTNM.conf"

${BINARY} -conf=${CONFIG}
 
## EOF ##
