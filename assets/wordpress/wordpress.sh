#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing WordPress"
echo "================================================================================"

# Install WordPress
cd /var/www
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

# Set Web Root to /var/www/wordpress
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/wordpress|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/wordpress|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
