#!/bin/bash

if [ ${EUID:-${UID}} = 0 ]; then
  echo ""
else
  echo "sudo"
fi
