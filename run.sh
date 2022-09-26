#! /bin/bash

sudo -E apt update
sudo -E apt install git coreutils diffstat -y

WORKDIR="$(pwd)"

git config --global user.email "example@example.com"
git config --global user.name "example"

git clone ${REPO_ORIGIN} origin
git clone ${CHANGED_REPO} changed

sudo -E ./gitgraft.sh origin changed/${SUBDIR} -b ${BRANCH} -g -v
sudo -E ./gitgraft.sh origin changed/${SUBDIR} -g -v
