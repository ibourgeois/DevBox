#!/usr/bin/env bash

clear
echo "Installing Facebook PHP SDK"

# Install Facebook PHP SDK
cd /var/www
composer create-project facebook/php-sdk --prefer-dist
