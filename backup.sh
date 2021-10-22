#!/bin/bash
## Script to Backup Crypto Data to S3 Bucket ##

BUCKET_NAME="ltnm-backups"
S3_PROFILE="ltnm-backups"

DATA_DIR="/home/LTNM/Data/NodeData"
BACKUP_FILE="$(ec2metadata --instance-id).NodeData.tgz"

tar -cvzf ${BACKUP_FILE} ${DATA_DIR}
aws s3 --profile ${S3_PROFILE} cp ${BACKUP_FILE} s3://${BUCKET_NAME}/BlockChain/$(ec2metadata --instance-id)/

## E O F ##
