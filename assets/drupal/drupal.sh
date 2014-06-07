#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing Drupal"
echo "================================================================================"

# Install Drupal
cd /var/www
wget  http://ftp.drupal.org/files/projects/drupal-7.28.tar.gz
sudo tar zxvf drupal-7.28.tar.gz 
sudo mv drupal-7.28/ /var/www/drupal

# Set Web Root to /var/www/drupal
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/drupal|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/drupal|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS drupal"
mysql -u root -e "GRANT ALL PRIVILEGES ON drupal.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
