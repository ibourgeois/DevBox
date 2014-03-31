#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing Apache"
echo "================================================================================"

# Install Apache2
sudo apt-get install -y apache2
sudo apt-get install -y apache2-utils

# Remove /var/www default
rm -rf /var/www

# Symlink /vagrant to /var/www
ln -fs /vagrant /var/www
cd /var/www

# Enable mod_rewrite
sudo a2enmod rewrite

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
sudo echo "if [ \"\${APACHE_CONFDIR##/etc/apache2-}\" != \"\${APACHE_CONFDIR}\" ] ; then" >> /etc/apache2/envvars
sudo echo " SUFFIX=\"-\${APACHE_CONFDIR##/etc/apache2-}\"" >> /etc/apache2/envvars
sudo echo "else" >> /etc/apache2/envvars
sudo echo " SUFFIX=" >> /etc/apache2/envvars
sudo echo "fi" >> /etc/apache2/envvars
sudo echo "" >> /etc/apache2/envvars
sudo echo "# Since there is no sane way to get the parsed apache2 config in scripts, some" >> /etc/apache2/envvars
sudo echo "# settings are defined via environment variables and then used in apache2ctl," >> /etc/apache2/envvars
sudo echo "# /etc/init.d/apache2, /etc/logrotate.d/apache2, etc." >> /etc/apache2/envvars
sudo echo "export APACHE_RUN_USER=vagrant" >> /etc/apache2/envvars
sudo echo "export APACHE_RUN_GROUP=vagrant" >> /etc/apache2/envvars
sudo echo "export APACHE_PID_FILE=/var/run/apache2\$SUFFIX.pid" >> /etc/apache2/envvars
sudo echo "export APACHE_RUN_DIR=/var/run/apache2\$SUFFIX" >> /etc/apache2/envvars
sudo echo "export APACHE_LOCK_DIR=/var/lock/apache2\$SUFFIX" >> /etc/apache2/envvars
sudo echo "# Only /var/log/apache2 is handled by /etc/logrotate.d/apache2." >> /etc/apache2/envvars
sudo echo "export APACHE_LOG_DIR=/var/log/apache2\$SUFFIX" >> /etc/apache2/envvars
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

# Restart Apache
sudo service apache2 restart
