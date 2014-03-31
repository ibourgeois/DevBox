#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing Facebook PHP SDK"
echo "================================================================================"

# Install Facebook PHP SDK
cd /var/www
composer create-project facebook/php-sdk --prefer-dist
