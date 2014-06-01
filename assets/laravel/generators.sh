#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Generators"
echo "================================================================================"

# Install Generators
cd /var/www/laravel

# Add Generators to the required packages in composer.json
# "way/generators": "2.*"

# Run Composer Update to install Generators
# php composer update --dev

# Register the Generators Service Provider
# 'Way\Generators\GeneratorsServiceProvider',
