#!/bin/bash
## Script to Manage BTC Latinum Node ##

BINARY="/home/LTNM/Bins/BitcoinLatinum-stakingd"
CONFIG="/home/LTNM/LTNM.conf"

${BINARY} -conf=${CONFIG}
