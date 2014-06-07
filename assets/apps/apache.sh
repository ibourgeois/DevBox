#!/usr/bin/env bash

clear
echo "============================================================"
echo "Installing Apache"
echo "============================================================"

# Install Apache2
sudo apt-get install -y apache2
sudo apt-get install -y apache2-utils

# Remove /var/www default
sudo rm -rf /var/www
sudo ln -fs /vagrant /var/www
cd /var/www

# Enable mod_rewrite
sudo a2enmod rewrite

# Restart Apache
sudo service apache2 restart

# EDIT USER & GROUP IN ENVVARS
sudo sed -i 's/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
sudo sed -i 's/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars

# Set Web Root to /var/www
sudo sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www|' /etc/apache2/sites-available/000-default.conf

# Apache AllowOverride All
sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf

# GIVE VAGRANT OWNERSHIP
sudo chown vagrant:vagrant /var/lock/apache2

# Restart Apache
sudo service apache2 restart
