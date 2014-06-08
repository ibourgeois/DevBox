#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing Yii"
echo "================================================================================"

# Install Yii
cd /var/www
wget https://github.com/yiisoft/yii/releases/download/1.1.14/yii-1.1.14.f0fee9.tar.gz
tar zxvf yii-1.1.14.f0fee9.tar.gz
sudo mv yii-1.1.14.f0fee9/ /var/www/yii

# Set Web Root to /var/www/yii
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/yii|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/yii|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS yii"
mysql -u root -e "GRANT ALL PRIVILEGES ON yii.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
