#!/bin/bash
## Author : TechAlchemist (https://git.io/vddbF) ##
## Description : Script to Install Nginx Conf to Nginx Controller Server ## 

DOMAINNAME="$1"
PROXYHOST="$2"
PROXYPORT="$3"

[[ ! -z ${DOMAINAME} ]] || [[ ! -z "${PROXYHOST}" ]] || [[ ! -z ${PROXYPORT} ]] || { echo "[-] Usage : $0 <DOMAINNAME> <PROXYHOST> <PROXYPORT>" ; exit 1 ; } 

sed -e "s/DOMAINNAME/${DOMAINNAME}/g" -e "s|PROXYHOST|${PROXYHOST}|g" -e "s|PROXYPORT|${PROXYPORT}|g" /opt/opsdude/ltnm-utils/nginx.sample.conf | sudo tee -a /etc/nginx/sites-enabled/${DOMAINNAME}.conf
sudo service nginx restart

echo "Added ${DOMAINNAME}"
## E O F ##

