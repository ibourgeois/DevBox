#!/usr/bin/env bash

clear

echo "============================================================"
echo "Installing CakePHP"
echo "============================================================"

# Install CakePHP
cd /var/www
wget https://github.com/cakephp/cakephp/zipball/2.3.9
sudo unzip 2.3.9
sudo mv cakephp-cakephp-4b9e390 cakephp
cd /var/www
git init
sudo git submodule add https://github.com/cakephp/debug_kit.git cakephp/app/Plugin/DebugKit

# Set Web Root to /var/www/cakephp
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/cakephp|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/cakephp|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS cakephp"
mysql -u root -e "GRANT ALL PRIVILEGES ON cakephp.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
