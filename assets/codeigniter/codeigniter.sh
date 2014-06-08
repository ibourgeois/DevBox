#!/usr/bin/env bash
clear
echo "============================================================"
echo "Installing CodeIgniter"
echo "============================================================"

# Install CodeIgniter
cd /var/www
wget http://c303150.r50.cf1.rackcdn.com/CodeIgniter_2.2.0.zip
unzip CodeIgniter_2.2.0.zip
sudo mv /var/www/CodeIgniter_2.2.0 /var/www/codeigniter

# Set Web Root to /var/www/codeigniter
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/codeigniter|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/codeigniter|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS codeigniter"
mysql -u root -e "GRANT ALL PRIVILEGES ON codeigniter.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
