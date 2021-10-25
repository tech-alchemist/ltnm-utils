#!/bin/bash
## Script to Monitor LTNM Node According to ports given in /home/LTNM/LTNM.conf ##
## Author Abhishek Rana ##

BINARY="/home/LTNM/Bins/BitcoinLatinum-stakingd"
CONFIG="/home/LTNM/LTNM.conf"
P2P_PORT="$(grep -R "^port=" ${CONFIG} | cut -d '=' -f2)"
PROCESS="$(/usr/bin/lsof -i:${P2P_PORT} | grep "^Bitcoin" | grep LISTEN)"

[[ -z "${PROCESS}" ]] && {
${BINARY} -conf=${CONFIG}
echo "[+] LTNM Node Started @ P2P Port ${P2P_PORT}"
}

## EOF ##
