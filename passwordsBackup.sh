#! /bin/bash

BASE_DIR="`ls -d ~/.gnupg`"
BUCKET="hryanjones"

echo "zipping the $BASE_DIR directory to the file ${BASE_DIR}.zip"
zip -r ${BASE_DIR}.zip $BASE_DIR

#echo "encrypting the passwords backup -- probably good to use home password"
#gpg -c ${BASE_DIR}.zip

echo "storing ${BASE_DIR}.zip in S3 in the bucket $BUCKET"
s3cmd put ${BASE_DIR}.zip s3://${BUCKET}/

