#!/usr/bin/env bash

clear
echo "============================================================"
echo "Installing MySQL"
echo "============================================================"

# Install MySQL
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server-5.5
sudo apt-get install -y php5-mysql

# Allow Remote Connections
sudo sed -i '47 s|127.0.0.1|0.0.0.0|' /etc/mysql/my.cnf
sudo service mysql restart
mysql -u root -e "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"
mysql -u root -e "CREATE USER 'vagrant'@'%' IDENTIFIED BY 'vagrant'"
mysql -u root -e "GRANT ALL ON *.* TO 'vagrant'@'localhost'"
mysql -u root -e "GRANT ALL ON *.* TO 'vagrant'@'%'"

# Restart Apache
sudo service apache2 restart
