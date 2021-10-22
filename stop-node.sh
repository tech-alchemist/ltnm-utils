#!/bin/bash
## Script to stop cryptocurrency node ##

VAR1="LTNM"
VAR2="Bins"

for PID in $(ps | aux | grep "${VAR1}" | grep "${VAR2}" | sed '/grep/d' | awk '{print $2}')
do
kill -9 $PID
echo "[+] $PID Killed"
done
