#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing SilverStripe"
echo "================================================================================"

# Install SilverStripe
cd /tmp && wget -O SilverStripe-cms-v3.1.5.tar.gz http://www.silverstripe.org/assets/releases/SilverStripe-cms-v3.1.5.tar.gz
sudo tar -xzvf SilverStripe-cms-v3.1.5.tar.gz -C /var/www/
sudo mv /var/www/SilverStripe-cms-v3.1.5 /var/www/silverstripe

# Set Web Root to /var/www/silverstripe
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/silverstripe|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/silverstripe|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS silverstripe"
mysql -u root -e "GRANT ALL PRIVILEGES ON silverstripe.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
