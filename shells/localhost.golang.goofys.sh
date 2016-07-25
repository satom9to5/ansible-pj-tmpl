#!/bin/sh

PLAYBOOK_DIR=$(cd $(dirname $0) && pwd)"/../"

S3_BUCKET=$1
S3_PATH=$2

if [ -z "${S3_BUCKET}" -o -z "${S3_PATH}" ]; then
  echo "bucket or path is empty."
  exit 1
fi

/usr/bin/ansible-playbook \
  -e goofys_s3_bucket=${S3_BUCKET} \
  -e goofys_s3_path=${S3_PATH} \
  -e goofys_fstab="{{ true | bool }}" \
  ${PLAYBOOK_DIR}localhost.golang.goofys.yml
