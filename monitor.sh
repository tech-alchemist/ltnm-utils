#!/bin/bash
## Author : TechAlchemist (https://git.io/vddbF) ##
## Description : Script to Monitor LTNM Node According to RPC given in /home/LTNM/LTNM.conf ##

BINARY="/home/LTNM/Bins/BitcoinLatinum-stakingd"
CONFIG="/home/LTNM/LTNM.conf"
RPC_PORT="$(grep -R "^rpcport=" ${CONFIG} | cut -d '=' -f2)"
PROCESS="$(/usr/bin/lsof -i:${RPC_PORT} | grep "^Bitcoin" | grep LISTEN)"

[[ -z "${PROCESS}" ]] && {
${BINARY} -conf=${CONFIG}
echo "[+] LTNM Node Started @ RPC Port ${P2P_PORT}"
}

## EOF ##
