#!/bin/bash

ANSIBLE_VERSION=2.0.1.0
ANSIBLE_FULLNAME=ansible-${ANSIBLE_VERSION}

wget http://releases.ansible.com/ansible/${ANSIBLE_FULLNAME}.tar.gz -P /tmp/
tar xvzf /tmp/${ANSIBLE_FULLNAME}.tar.gz -C /tmp/
[ `which pip` ] || yum install -y python-pip
pip install /tmp/${ANSIBLE_FULLNAME}
rm -rf /tmp/${ANSIBLE_FULLNAME}*
