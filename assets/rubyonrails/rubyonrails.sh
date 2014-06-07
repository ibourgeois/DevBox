#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Ruby on Rails"
echo "================================================================================"

# Install Ruby on Rails
sudo apt-get install -y ruby-full build-essential
sudo apt-get install -y apache2-prefork-dev
sudo apt-get install -y rubygems
sudo apt-get install -y libmysql-ruby 
sudo apt-get install -y rails
sudo gem install passenger
sudo apt-get install -y apache2-dev 
cd /var/www
rails new rubyonrails

# Set Web Root to /var/www/rubyonrails/public
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/rubyonrails/public|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/rubyonrails/public|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS rubyonrails"
mysql -u root -e "GRANT ALL PRIVILEGES ON rubyonrails.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart
