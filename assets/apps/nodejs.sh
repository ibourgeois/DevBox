#!/usr/bin/env bash

clear
echo "Installing Node.JS"

# Install Node.JS
git clone git://github.com/ry/node.git
cd node
./configure
make
sudo make install
