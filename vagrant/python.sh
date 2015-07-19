#!/bin/bash

echo "Updating box ..."
sudo apt-get update > /dev/null
sudo apt-get upgrade -y > /dev/null

if [ ! -x /usr/bin/git ]; then
    echo "Installing git ..."
    sudo apt-get -y install git-core > /dev/null
fi

if [ ! -x /usr/bin/python ]; then
    echo "Installing python ..."
    sudo apt-get -y install python > /dev/null
fi
