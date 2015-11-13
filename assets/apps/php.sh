#!/usr/bin/env bash

clear 
echo "============================================================"
echo "Installing PHP"
echo "============================================================"

# Install PHP5
sudo apt-get install -y php5

# Install MCrypt
sudo apt-get install -y php5-mcrypt
sudo php5enmod mcrypt


# Install GD Library
sudo apt-get install -y php5-gd

# Install Imagemagick
sudo apt-get install -y imagemagick

# Install PHP Add-ons
sudo apt-get install -y php5-json php5-mysqlnd

# PHP.ini Date.Time
sudo sed -i 's|;date.timezone =|date.timezone = "America/New_York"|' /etc/php5/apache2/php.ini
sudo sed -i 's|;date.timezone =|date.timezone = "America/New_York"|' /etc/php5/cli/php.ini
