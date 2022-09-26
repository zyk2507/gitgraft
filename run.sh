#! /bin/bash

sudo -E apt update
sudo -E apt install git coreutils -y

WORKDIR="$(pwd)"

git config --global user.email "example@example.com"
git config --gloabal user.name "example"

git clone ${REPO_ORIGIN} origin
git clone ${CHANGED_REPO} changed

sudo -E ./gitgraft.sh origin changed/${SUBDIR} -b ${BRANCH} -g -v
sudo -E ./gitgraft.sh origin changed/${SUBDIR} -g -v
