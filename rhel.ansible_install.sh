#!/bin/bash

set -e

ANSIBLE_VERSION=2.1.0.0
ANSIBLE_FULLNAME=ansible-${ANSIBLE_VERSION}

SHELL_DIR=$(cd $(dirname $0) && pwd)

SUDO=$(${SHELL_DIR}/sudo_check.sh)

[ `which` ] || ${SUDO} yum install -y which
[ `which wget` ] || ${SUDO} yum install -y wget
wget http://releases.ansible.com/ansible/${ANSIBLE_FULLNAME}.tar.gz -P /tmp/
tar xvzf /tmp/${ANSIBLE_FULLNAME}.tar.gz -C /tmp/
[ `which gcc` ] || ${SUDO} yum install -y gcc
if [ ! `which pip` ]; then
    ${SUDO} yum install -y epel-release 
    ${SUDO} yum install -y python python-devel python-pip
    ${SUDO} pip install --upgrade pip setuptools
fi
${SUDO} yum install -y libffi-devel openssl-devel 
pip install /tmp/${ANSIBLE_FULLNAME}
rm -rf /tmp/${ANSIBLE_FULLNAME}*
