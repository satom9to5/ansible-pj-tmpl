#!/bin/bash

set -e

[ `which` ] || yum install -y which
[ `which git` ] || yum install -y git

git clone https://github.com/satom9to5/ansible-pj-tmpl
cd ansible-pj-tmpl
git submodule init
git submodule update
