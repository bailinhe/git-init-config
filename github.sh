#!/bin/bash

idf=$1

cat <<- EOF >> ~/.ssh/config
Host github.com
  HostName github.com
  User git
  IdentityFile $idf
EOF