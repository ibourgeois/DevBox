#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing MySQL"
echo "================================================================================"

# Install MySQL
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server-5.5
sudo apt-get install -y php5-mysql

# Restart Apache
sudo service apache2 restart
