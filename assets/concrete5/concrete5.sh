#!/usr/bin/env bash
clear
echo "============================================================"
echo "Installing Concrete5"
echo "============================================================"

# Install Concrete5
cd /var/www
wget --trust-server-names http://www.concrete5.org/download_file/-/view/66159/8497/ -O concrete5.zip
sudo unzip concrete5.zip
sudo mv concrete5.6.3.1 concrete5

# Set Web Root to /var/www/concrete5
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/concrete5|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/concrete5|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS concrete5"
mysql -u root -e "GRANT ALL PRIVILEGES ON concrete5.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
