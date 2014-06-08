#!/usr/bin/env bash

clear
echo "============================================================"
echo "Installing phpMyAdmin"
echo "============================================================"

# Install phpMyAdmin
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -q -y phpmyadmin
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password vagrant' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password vagrant' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password vagrant' | debconf-set-selections
