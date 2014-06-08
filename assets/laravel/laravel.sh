#!/usr/bin/env bash
clear
echo "============================================================"
echo "Installing Laravel"
echo "============================================================"

# Install Laravel
cd /var/www
composer create-project laravel/laravel --prefer-dist

# Set Web Root to /var/www/laravel/public
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/laravel/public|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/laravel/public|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS laravel"
mysql -u root -e "GRANT ALL PRIVILEGES ON laravel.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart

# Configure the Database Settings for Laravel
sudo sed -i "s|'database'  => 'forge',|'database'  => 'laravel',|g" /vagrant/laravel/app/config/database.php
sudo sed -i "s|'username'  => 'forge',|'username'  => 'vagrant',|g" /vagrant/laravel/app/config/database.php
sudo sed -i "s|'password'  => '',|'password'  => 'vagrant',|g" /vagrant/laravel/app/config/database.php

# Install the Migration table in the database
cd /var/www/laravel
php artisan migrate:install
