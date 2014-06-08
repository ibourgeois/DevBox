#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing Zend"
echo "================================================================================"

# Install Zend
sudo apt-get install -y phpunit
sudo apt-get install -y php5-xdebug
sudo apt-get install -y zend-framework-bin 
cd /var/www
zf create project zend
sudo cp -a /usr/share/php/libzend-framework-php/Zend/ /var/www/zend/library/

# Set Web Root to /var/www/zend/public
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/zend/public|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/zend/public|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS zend"
mysql -u root -e "GRANT ALL PRIVILEGES ON zend.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
