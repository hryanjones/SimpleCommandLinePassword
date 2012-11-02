#! /bin/bash
# depends on s3cmd and you having a bucket to save things to

#Bucket/keyprefix/to save passwords to

S3_BUCKET="hryanjones/PASSWORDS/"
LOCAL_DIR="~/.gnupg/PASSWORDS/"
S3CMD_CONFIG="~/.s3cfg-hryanjones"

echo "s3cmd -c $S3CMD_CONFIG sync $LOCAL_DIR s3://$S3_BUCKET"
