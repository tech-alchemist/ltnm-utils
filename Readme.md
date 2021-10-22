## BitCoin Latinum Utilities
### Author : Abhishek Rana

#### Install These Utilities
```
sudo mkdir /opt/opsdude ; sudo -H chown ${USER}.${USER} /opt/opsdude ; cd /opt/opsdude
git clone https://github.com/tech-alchemist/ltnm-utils.git ; cd /opt/opsdude/ltnm-utils
```

#### Install latest Binary to Ubuntu 20.04
```
cd /opt/opsdude/ltnm-utils
bash install.sh
```

#### Start LTNM Node
```
cd /opt/opsdude/ltnm-utils
bash start-node.sh
```

#### Stop LTNM Node
```
cd /opt/opsdude/ltnm-utils
bash stop-node.sh
```

#### Add Auto Monitoring to LTNM Node
```
crontab -e
# Append => 0/5 * * * * /bin/bash /opt/opsdude/ltnm-utils/monitor.sh
```

#### Compile LTNM Node from Latest Github
```
cd /opt/opsdude/ltnm-utils
bash compile.sh
```


#### Nginx Config Generator For Controller Node
```
cd /opt/opsdude/ltnm-utils
bash nginx.sh DOMAINNAME PROXYHOST PROXYPORT
# Example => bash nginx.sh seed1.main.latinum.com 10.0.0.10 9338
```
