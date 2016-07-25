#!/bin/sh

PLAYBOOK_DIR=$(cd $(dirname $0) && pwd)"/../"

S3_BUCKET=$1
S3_PATH=$2
MOUNT_UID=
MOUNT_GID=
GOOFYS_GOPATH=${GOPATH}

while getopts ":u:g:p:" OPT
do
  case "${OPT}" in
    u)
      MOUNT_UID=${OPTARG}
      ;;
    g)
      MOUNT_GID=${OPTARG}
      ;;
    p)
      GOOFYS_GOPATH=${OPTARG}
      ;;
    :|\?)
      echo "error"
      echo $OPTARG
      exit 1
      ;;
  esac
done

shift $(expr ${OPTIND} - 1)
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
  -e goofys_mount_uid=${MOUNT_UID} \
  -e goofys_mount_gid=${MOUNT_GID} \
  -e goofys_gopath=${GOOFYS_GOPATH} \
  ${PLAYBOOK_DIR}localhost.golang.goofys.yml
