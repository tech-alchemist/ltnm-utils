#!/bin/bash
## Script to Backup Crypto Data to S3 Bucket ##
## Author : Abhishek Rana ##

BUCKET_NAME="ltnm-backups"
S3_PROFILE="ltnm-backups"

INSTANCE_ID="$(ec2metadata --instance-id)"
DATE="$(date +%d.%b.%Y_%I.%M.%p)"

cd /home/LTNM/Data || { echo "[-] Data Directory Not found, Exiting..." ; exit 1 ; }
backup_blocks(){
BACKUP_FILE="${DATE}.${INSTANCE_ID}.NodeData.tgz"
tar -czf ${BACKUP_FILE} NodeData
aws s3 --profile ${S3_PROFILE} cp ${BACKUP_FILE} s3://${BUCKET_NAME}/BlockChain/${INSTANCE_ID}/
echo "Blocks Backup file pushed to s3://${BUCKET_NAME}/BlockChain/${INSTANCE_ID}/${BACKUP_FILE}"
}

backup_wallet(){
BACKUP_FILE="${DATE}.${INSTANCE_ID}.WalletData.tgz"
tar -czf ${BACKUP_FILE} WalletData
aws s3 --profile ${S3_PROFILE} cp ${BACKUP_FILE} s3://${BUCKET_NAME}/BlockChain/${INSTANCE_ID}/
echo "Wallet Backup file pushed to s3://${BUCKET_NAME}/BlockChain/${INSTANCE_ID}/${BACKUP_FILE}"
}

backup_wallet
#backup_blocks 

## E O F ##
