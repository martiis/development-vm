#!/bin/bash

echo "Updating box ..."
sudo apt-get -qq update
sudo apt-get -y -qq upgrade

if [ ! -x /usr/bin/git ]; then
    echo "Installing git ..."
    sudo apt-get -y -qq install git-core
fi

if [ ! -x /usr/bin/python ]; then
    echo "Installing python ..."
    sudo apt-get -y -qq install python python-dev
fi
