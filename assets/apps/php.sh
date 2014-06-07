#!/usr/bin/env bash

clear 
echo "============================================================"
echo "Installing PHP"
echo "============================================================"

# Install PHP5
sudo apt-get install -y php5

# Install MCrypt
sudo apt-get install -y php5-mcrypt

# Install GD Library
sudo apt-get install -y php5-gd

# Install Imagemagick
sudo apt-get install -y imagemagick
