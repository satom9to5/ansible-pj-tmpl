#!/bin/bash

IS_PJ_SETUP=0
[ -n "$1" ] && IS_PJ_SETUP=1

if ! [ `which ansible` ]; then
  sudo sh $(cd $(dirname $0) && pwd)/ansible_install.sh
fi

ANSIBLE_BASE_DIR=/vagrant/ansible
#ANSIBLE_BASE_DIR=/vagrant_shared/github_myrepo/ansible-playbook

# ansible inventory file is disable of x permission.
# because permission of virtualbox shared folder is 777, copy inventory file to tmp directory.
mkdir -p /tmp/ansible
cp ${ANSIBLE_BASE_DIR}/localhost /tmp/ansible/localhost
chmod -x /tmp/ansible/localhost

echo "Running Ansible"
ansible-playbook -i /tmp/ansible/localhost ${ANSIBLE_BASE_DIR}/pj_setup.yml
ansible-playbook ${ANSIBLE_BASE_DIR}/docker.yml

if [ $IS_PJ_SETUP -gt 0 ]; then
  USERNAME=$(grep -P '^app_name:' ${ANSIBLE_BASE_DIR}/group_vars/localhost | awk '{ print $2 }')
  sudo -u ${USERNAME} ansible-playbook -i /tmp/ansible/localhost ${ANSIBLE_BASE_DIR}/local_user.yml
fi

# root user
ansible-playbook -i /tmp/ansible/localhost ${ANSIBLE_BASE_DIR}/local_user.yml
# by vagrant user
sudo -u vagrant ansible-playbook -i /tmp/ansible/localhost ${ANSIBLE_BASE_DIR}/local_user.yml

rm -f /tmp/ansible/localhost
