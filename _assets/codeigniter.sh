#!/usr/bin/env bash

# MODIFY 000-default
sudo : > /etc/apache2/sites-enabled/000-default
echo "<VirtualHost *:80>" > /etc/apache2/sites-enabled/000-default
echo " ServerAdmin webmaster@localhost" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo " DocumentRoot /var/www/codeigniter" >> /etc/apache2/sites-enabled/000-default
echo " <Directory />" >> /etc/apache2/sites-enabled/000-default
echo " Options FollowSymLinks" >> /etc/apache2/sites-enabled/000-default
echo " AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo " </Directory>" >> /etc/apache2/sites-enabled/000-default
echo " <Directory /var/www/codeigniter/>" >> /etc/apache2/sites-enabled/000-default
echo " Options Indexes FollowSymLinks MultiViews" >> /etc/apache2/sites-enabled/000-default
echo " AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo " Order allow,deny" >> /etc/apache2/sites-enabled/000-default
echo " allow from all" >> /etc/apache2/sites-enabled/000-default
echo " </Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo " ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-enabled/000-default
echo " <Directory \"/usr/lib/cgi-bin\">" >> /etc/apache2/sites-enabled/000-default
echo " AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo " Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-enabled/000-default
echo " Order allow,deny" >> /etc/apache2/sites-enabled/000-default
echo " Allow from all" >> /etc/apache2/sites-enabled/000-default
echo " </Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo " ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo " # Possible values include: debug, info, notice, warn, error, crit," >> /etc/apache2/sites-enabled/000-default
echo " # alert, emerg." >> /etc/apache2/sites-enabled/000-default
echo " LogLevel warn" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo " CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo " Alias /doc/ \"/usr/share/doc/\"" >> /etc/apache2/sites-enabled/000-default
echo " <Directory \"/usr/share/doc/\">" >> /etc/apache2/sites-enabled/000-default
echo " Options Indexes MultiViews FollowSymLinks" >> /etc/apache2/sites-enabled/000-default
echo " AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo " Order deny,allow" >> /etc/apache2/sites-enabled/000-default
echo " Deny from all" >> /etc/apache2/sites-enabled/000-default
echo " Allow from 127.0.0.0/255.0.0.0 ::1/128" >> /etc/apache2/sites-enabled/000-default
echo " </Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "</VirtualHost>" >> /etc/apache2/sites-enabled/000-default

# Restart Apache
sudo service apache2 restart

# Set up the database
echo "CREATE DATABASE IF NOT EXISTS codeigniter" | mysql
echo "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'" | mysql
echo "GRANT ALL PRIVILEGES ON codeigniter.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'" | mysql

# Install CodeIgniter
cd /var/www
wget http://ellislab.com/asset/ci_download_files/reactor/CodeIgniter_2.1.2.zip
unzip CodeIgniter_2.1.2.zip
sudo mv /var/www/CodeIgniter_2.1.2 /var/www/codeigniter
