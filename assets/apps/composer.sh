#!/usr/bin/env bash

clear
echo "============================================================"
echo "Installing Composer"
echo "============================================================"

# Install Composer
cd /var/www
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
