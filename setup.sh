#!/usr/bin/env bash

# Update Ubuntu
sudo apt-get update

# Install Vim
sudo apt-get install -y vim

#Install VSFTPD
sudo apt-get install -y vsftpd

#Install Apache2
sudo apt-get install -y apache2

# Remove /var/www default
rm -rf /var/www

# Symlink /vagrant to /var/www
ln -fs /vagrant /var/www
cd /var/www

# Install PHP5
sudo apt-get install -y php5

# Enable mod_rewrite
sudo a2enmod rewrite

# Restart apache
sudo service apache2 restart

# Install MySQL 
export DEBIAN_FRONTEND=noninteractive
# Install MySQL quietly
apt-get -q -y install mysql-server-5.5

# Allow PHP to connect to MySQL
sudo apt-get install -y php5-mysql

# Install PHP cURL
sudo apt-get install -y php5-curl

# Install mcrypt for PHP
sudo apt-get install -y php5-mcrypt

# Install cURL
sudo apt-get install -y curl

# Install Git
sudo apt-get install git-core

# Restart apache
sudo service apache2 restart

# Install Composer
curl -s https://getcomposer.org/installer | php

# Make Composer available globally
sudo mv composer.phar /usr/local/bin/composer

# Install Laravel
composer create-project laravel/laravel --prefer-dist

# Modify VSFTPD.CONF 
sudo : > /etc/vsftpd.conf
echo "listen=YES" > /etc/vsftpd.conf
echo "anonymous_enable=NO" >> /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd.conf
echo "dirmessage_enable=YES" >> /etc/vsftpd.conf
echo "use_localtime=YES" >> /etc/vsftpd.conf
echo "xferlog_enable=YES" >> /etc/vsftpd.conf
echo "connect_from_port_20=YES" >> /etc/vsftpd.conf
echo "secure_chroot_dir=/var/run/vsftpd/empty" >> /etc/vsftpd.conf
echo "pam_service_name=vsftpd" >> /etc/vsftpd.conf
echo "rsa_cert_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd.conf

# Restart VSFTPD
sudo service vsftpd restart

# MODIFY 000-default 
sudo : > /etc/apache2/sites-enabled/000-default
echo "<VirtualHost *:80>" > /etc/apache2/sites-enabled/000-default
echo "	ServerAdmin webmaster@localhost" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	DocumentRoot /var/www/laravel/public" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory />" >> /etc/apache2/sites-enabled/000-default
echo "		Options FollowSymLinks" >> /etc/apache2/sites-enabled/000-default
echo "		AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo "	</Directory>" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory /var/www/laravel/public/>" >> /etc/apache2/sites-enabled/000-default
echo "		Options Indexes FollowSymLinks MultiViews" >> /etc/apache2/sites-enabled/000-default
echo "		AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo "		Order allow,deny" >> /etc/apache2/sites-enabled/000-default
echo "		allow from all" >> /etc/apache2/sites-enabled/000-default
echo "	</Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory \"/usr/lib/cgi-bin\">" >> /etc/apache2/sites-enabled/000-default
echo "		AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo "		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-enabled/000-default
echo "		Order allow,deny" >> /etc/apache2/sites-enabled/000-default
echo "		Allow from all" >> /etc/apache2/sites-enabled/000-default
echo "	</Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	# Possible values include: debug, info, notice, warn, error, crit," >> /etc/apache2/sites-enabled/000-default
echo "	# alert, emerg." >> /etc/apache2/sites-enabled/000-default
echo "	LogLevel warn" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "    Alias /doc/ \"/usr/share/doc/\"" >> /etc/apache2/sites-enabled/000-default
echo "    <Directory \"/usr/share/doc/\">" >> /etc/apache2/sites-enabled/000-default
echo "        Options Indexes MultiViews FollowSymLinks" >> /etc/apache2/sites-enabled/000-default
echo "        AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo "        Order deny,allow" >> /etc/apache2/sites-enabled/000-default
echo "        Deny from all" >> /etc/apache2/sites-enabled/000-default
echo "        Allow from 127.0.0.0/255.0.0.0 ::1/128" >> /etc/apache2/sites-enabled/000-default
echo "    </Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "</VirtualHost>" >> /etc/apache2/sites-enabled/000-default

# Restart Apache
sudo service apache2 restart

# EDIT USER & GROUP IN ENVVARS
sudo : > /etc/apache2/envvars
sudo echo "# envvars - default environment variables for apache2ctl" > /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "# this won't be correct after changing uid" >> /etc/apache2/envvars
sudo echo "unset HOME" >> /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "# for supporting multiple apache2 instances" >> /etc/apache2/envvars
sudo echo "if [ \"${APACHE_CONFDIR##/etc/apache2-}\" != \"${APACHE_CONFDIR}\" ] ; then" >> /etc/apache2/envvars
sudo echo "	SUFFIX=\"-${APACHE_CONFDIR##/etc/apache2-}\"" >> /etc/apache2/envvars
sudo echo "else" >> /etc/apache2/envvars
sudo echo "	SUFFIX=" >> /etc/apache2/envvars
sudo echo "fi" >> /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "# Since there is no sane way to get the parsed apache2 config in scripts, some" >> /etc/apache2/envvars
sudo echo "# settings are defined via environment variables and then used in apache2ctl," >> /etc/apache2/envvars
sudo echo "# /etc/init.d/apache2, /etc/logrotate.d/apache2, etc." >> /etc/apache2/envvars
sudo echo "export APACHE_RUN_USER=vagrant" >> /etc/apache2/envvars
sudo echo "export APACHE_RUN_GROUP=vagrant" >> /etc/apache2/envvars
sudo echo "export APACHE_PID_FILE=/var/run/apache2$SUFFIX.pid" >> /etc/apache2/envvars
sudo echo "export APACHE_RUN_DIR=/var/run/apache2$SUFFIX" >> /etc/apache2/envvars
sudo echo "export APACHE_LOCK_DIR=/var/lock/apache2$SUFFIX" >> /etc/apache2/envvars
sudo echo "# Only /var/log/apache2 is handled by /etc/logrotate.d/apache2." >> /etc/apache2/envvars
sudo echo "export APACHE_LOG_DIR=/var/log/apache2$SUFFIX" >> /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "## The locale used by some modules like mod_dav" >> /etc/apache2/envvars
sudo echo "export LANG=C" >> /etc/apache2/envvars
sudo echo "## Uncomment the following line to use the system default locale instead:" >> /etc/apache2/envvars
sudo echo "#. /etc/default/locale" >> /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "export LANG" >> /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "## The command to get the status for 'apache2ctl status'." >> /etc/apache2/envvars
sudo echo "## Some packages providing 'www-browser' need '--dump' instead of '-dump'." >> /etc/apache2/envvars
sudo echo "#export APACHE_LYNX='www-browser -dump'" >> /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "## If you need a higher file descriptor limit, uncomment and adjust the" >> /etc/apache2/envvars
sudo echo "## following line (default is 8192):" >> /etc/apache2/envvars
sudo echo "#APACHE_ULIMIT_MAX_FILES='ulimit -n 65536'" >> /etc/apache2/envvars


# GIVE VAGRANT OWNERSHIP
sudo chown vagrant:vagrant /var/lock/apache2

# Restart apache
sudo service apache2 restart

cd /var/www

# Set up the database
echo "CREATE DATABASE IF NOT EXISTS laravel" | mysql
echo "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY ''" | mysql
echo "GRANT ALL PRIVILEGES ON laravel.* TO 'vagrant'@'localhost' IDENTIFIED BY ''" | mysql
# Run artisan migrate to setup the database and schema, then seed it
php artisan migrate --env=development
php artisan db:seed --env=development
