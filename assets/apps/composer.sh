#!/usr/bin/env bash

clear
echo "Installing Composer"

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
