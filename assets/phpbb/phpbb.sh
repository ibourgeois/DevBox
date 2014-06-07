#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing phpBB 3"
echo "================================================================================"

# Install pbpBB 3
cd /var/www
wget https://www.phpbb.com/files/release/phpBB-3.0.12.zip
sudo unzip phpBB-3.0.12.zip
sudo mv phpBB3/ /var/www/phpbb

# Set Web Root to /var/www/phpbb
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/phpbb|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/phpbb|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS phpbb"
mysql -u root -e "GRANT ALL PRIVILEGES ON phpbb.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
