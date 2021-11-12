## BitCoin Latinum Utilities

## Prerequisites ##

 - Ubuntu 20 OS with Internet
 - Traffic Ports : 9338 for P2P, 38555-38556 for RPC (Recommended for thsi stack to work)
 - Disk : 50 GB Recommended

## Configuring LTNM Node ##

#### Install Required Utilities
Install these useful LTNM utilities
```
sudo mkdir /opt/opsdude ; sudo -H chown ${USER}.${USER} /opt/opsdude ; cd /opt/opsdude
git clone https://github.com/tech-alchemist/ltnm-utils.git ; cd /opt/opsdude/ltnm-utils
```

#### Install latest binary to Server
```
cd /opt/opsdude/ltnm-utils && git pull origin master
bash install.sh
```

#### Starting LTNM node
```
cd /opt/opsdude/ltnm-utils && git pull origin master
bash start-node.sh
```

#### Stopping LTNM Node (Optional)
```
cd /opt/opsdude/ltnm-utils && git pull origin master
bash stop-node.sh
```


## Additional Node Management ## 

#### Add Auto Monitoring 

To Auto-Start the stopped node, adding cronjob for monitor script

```
cd /opt/opsdude/ltnm-utils && git pull origin master
crontab -l > /tmp/crontab.tmp
sed -i '/bash monitor.sh/d' /tmp/crontab.tmp
echo "## bash monitor.sh , Monitor script to keep LTNM node running ##" >>  /tmp/crontab.tmp
echo "*/2 * * * * cd /opt/opsdude/ltnm-utils && bash monitor.sh" >> /tmp/crontab.tmp
crontab /tmp/crontab.tmp
```

#### Compile LTNM Node from Latest Github
Rather than using precompiled binaries, Compile binaries from latest source code. (Timetaking)
```
cd /opt/opsdude/ltnm-utils
bash compile.sh
```


#### Nginx Config Generator For RPC Node

Installing NGINX
```
sudo apt install nginx-full
sudo systemctl enable nginx
sudo service nginx start
```

Routing RPC calls via NGINX
```
cd /opt/opsdude/ltnm-utils
bash nginx.sh DOMAINNAME PROXYHOST PROXYPORT
```
Example:
```
bash nginx.sh example.main.ltnm.net 192.168.0.10 38555
```
This will create `/etc/nginx/sites-enable/example.main.ltnm.net.conf` with proxy mapped to RPC like : `http://192.168.0.10:38555`  

Configure SSL
```
sudo service nginx stop
sudo certbot certonly --standalone -d DOMAINNAME
sudo service nginx restart
```


#### Adding S3 Backup of Wallet Data
 
Configure S3 Bucket (Keep bucket private and highly secure)
```
AKEY="S3_User_Access_key"
SKEY="S3_User_Secret_key"
PROF="ltnm-backups"
mkdir ~/.aws/ ; touch ~/.aws/credentials ; chmod 600 ~/.aws/credentials
echo -ne "[${PROF}]\naws_access_key_id = ${AKEY}\naws_secret_access_key =  ${SKEY}\n" | tee ~/.aws/credentials
```

Check configured credentials after providing security from AWS IAM & S3
```
aws s3 --profile ltnm-backups ls s3://ltnm-backups/
```
Add cronjob for backup
```
cd /opt/opsdude/ltnm-utils && git pull origin master
crontab -l > /tmp/crontab.tmp
sed -i '/bash backup.sh/d' /tmp/crontab.tmp
echo "## bash backup.sh , Daily Backup Script for configuredNodes and Wallet Data ##" >> /tmp/crontab.tmp
echo "00 00 * * * cd /opt/opsdude/ltnm-utils && bash backup.sh" >> /tmp/crontab.tmp
crontab /tmp/crontab.tmp
```



