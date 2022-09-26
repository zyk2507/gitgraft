#! /bin/bash

sudo -E apt update
sudo -E apt install git coreutils diffstat -y
wget https://gist.githubusercontent.com/Victrid/58d13520f3c00d954656de1c8e777faf/raw/6ca4942592b2012b6ced660e06a8fce5c43c54f3/gitgraft.sh
WORKDIR="$(pwd)"

git config --global user.email "example@example.com"
git config --global user.name "example"

git clone ${REPO_ORIGIN} origin
git clone ${CHANGED_REPO} changed

sudo -E ./gitgraft.sh origin changed/${SUBDIR} -b ${BRANCH} -g -v
