#!/bin/bash

set -e

ANSIBLE_VERSION=2.1.0.0
ANSIBLE_FULLNAME=ansible-${ANSIBLE_VERSION}

[ `which` ] || yum install -y which
[ `which wget` ] || yum install -y wget
wget http://releases.ansible.com/ansible/${ANSIBLE_FULLNAME}.tar.gz -P /tmp/
tar xvzf /tmp/${ANSIBLE_FULLNAME}.tar.gz -C /tmp/
[ `which gcc` ] || yum install -y gcc
if [ ! `which pip` ]; then
    yum install -y epel-release 
    yum install -y python python-devel python-pip
    pip install --upgrade pip setuptools
fi
yum install -y libffi-devel openssl-devel 
pip install /tmp/${ANSIBLE_FULLNAME}
rm -rf /tmp/${ANSIBLE_FULLNAME}*