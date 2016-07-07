#!/bin/bash

set -e

SUDO_COMMAND=sudo

[ `which` ] || ${SUDO_COMMAND} yum install -y which
[ `which git` ] || ${SUDO_COMMAND} yum install -y git

git clone git@github.com:satom9to5/ansible-pj-tmpl.git
cd ansible-pj-tmpl
git submodule init
git submodule update
