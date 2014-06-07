#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Joomla"
echo "================================================================================"

# Install Joomla
cd /var/www
wget http://joomlacode.org/gf/download/frsrelease/19393/158832/Joomla_3.3.0-Stable-Full_Package.zip
sudo mkdir /var/www/joomla
sudo unzip -q Joomla_3.3.0-Stable-Full_Package.zip -d /var/www/joomla

# Set Web Root to /var/www/joomla
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/joomla|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/joomla|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS joomla"
mysql -u root -e "GRANT ALL PRIVILEGES ON joomla.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
