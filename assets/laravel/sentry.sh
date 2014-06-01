#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Sentry"
echo "================================================================================"

# Install Sentry
cd /var/www/laravel


# Add Sentry to the required packages in composer.json
# "cartalyst/sentry": "2.1.*"

# Run Composer Update to install Sentry
# php composer update

# Register the Sentry Service Provider
#'Cartalyst\Sentry\SentryServiceProvider',

# Register the Sentry Alias
# 'Sentry' => 'Cartalyst\Sentry\Facades\Laravel\Sentry',

# Run Migrations
# php artisan migrate --package=cartalyst/sentry

# Publish the Sentry Package
# php artisan config:publish cartalyst/sentry

