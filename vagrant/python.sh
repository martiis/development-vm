#!/bin/bash

echo " [Shell script] Updating box ..."
sudo apt-get -qq update
sudo apt-get -y -qq upgrade

if [ ! -x /usr/bin/git ]; then
    echo " [Shell script] Installing git ..."
    sudo apt-get -y -qq install git-core
fi

if [ ! -x /usr/bin/python ]; then
    echo " [Shell script] Installing python ..."
    sudo apt-get -y -qq install python python-dev
fi
