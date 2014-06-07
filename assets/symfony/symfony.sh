#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing Symfony"
echo "================================================================================"

# Install Symfony
cd /var/www
cd /tmp && wget -O symfony.zip http://symfony.com/download?v=Symfony_Standard_Vendors_2.5.0.zip
sudo unzip symfony.zip
sudo mv /tmp/Symfony /var/www/symfony/

# Set Web Root to /var/www/symfony/web
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/symfony/web|' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's|DocumentRoot /var/www|DocumentRoot /var/www/symfony/web|' /etc/apache2/sites-available/000-default.conf

# Set up the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS symfony"
mysql -u root -e "GRANT ALL PRIVILEGES ON symfony.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'"

# Restart Apache
sudo service apache2 restart

# Remove Localhost Requirement
sudo sed -i '7 s|^|/*|' /var/www/symfony/web/config.php
sudo sed -i '13 s|}|}*/|' /var/www/symfony/web/config.php
sudo sed -i '12 s|^|/*|' /var/www/symfony/web/app_dev.php
sudo sed -i '18 s|}|}*/|' /var/www/symfony/web/app_dev.php

ip=$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

touch /vagrant/welcome.sh
echo "#!/usr/bin/env bash" > /vagrant/welcome.sh
echo "" >> /vagrant/welcome.sh
echo "xdg-open 'http://$ip/config.php'" >> /vagrant/welcome.sh
echo "gnome-open 'http://$ip/config.php'" >> /vagrant/welcome.sh
echo "open 'http://$ip/config.php'" >> /vagrant/welcome.sh

touch /vagrant/welcome.bat
echo "@echo off" > /vagrant/welcome.bat
echo "start http://$ip/config.php" >> /vagrant/welcome.bat


echo "============================================================"
echo " Installation Has Completed"
echo "============================================================"
echo " "
echo "  You can access your site by typing in the following "
echo "  address into your web browser:"
echo " "
echo "                  http://$ip"
echo " "
echo " "
echo "  If you have any questions/issues, please visit:"
echo "  https://github.com/TechFix/DevBox"
echo " "
echo "  Thanks,"
echo "      Derek Bourgeois"
echo "      derek@ibourgeois.com"
echo "      http://ibourgeois.com"
echo " "
echo "============================================================"
