#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Generators"
echo "================================================================================"

# Install Generators
cd /var/www/laravel

# Add Generators to the required packages in composer.json
sudo : > /var/www/laravel/composer.json
echo '{' > /var/www/laravel/composer.json
echo '	"name": "laravel/laravel",' >> /var/www/laravel/composer.json
echo '	"description": "The Laravel Framework.",' >> /var/www/laravel/composer.json
echo '	"keywords": ["framework", "laravel"],' >> /var/www/laravel/composer.json
echo '	"license": "MIT",' >> /var/www/laravel/composer.json
echo '	"require": {' >> /var/www/laravel/composer.json
echo '		"laravel/framework": "4.1.*",' >> /var/www/laravel/composer.json
echo '		"cartalyst/sentry": "2.1.*",' >> /var/www/laravel/composer.json
echo '		"way/generators": "2.*"' >> /var/www/laravel/composer.json
echo '	},' >> /var/www/laravel/composer.json
echo '	"autoload": {' >> /var/www/laravel/composer.json
echo '		"classmap": [' >> /var/www/laravel/composer.json
echo '			"app/commands",' >> /var/www/laravel/composer.json
echo '			"app/controllers",' >> /var/www/laravel/composer.json
echo '			"app/models",' >> /var/www/laravel/composer.json
echo '			"app/database/migrations",' >> /var/www/laravel/composer.json
echo '			"app/database/seeds",' >> /var/www/laravel/composer.json
echo '			"app/tests/TestCase.php"' >> /var/www/laravel/composer.json
echo '		]' >> /var/www/laravel/composer.json
echo '	},' >> /var/www/laravel/composer.json
echo '	"scripts": {' >> /var/www/laravel/composer.json
echo '		"post-install-cmd": [' >> /var/www/laravel/composer.json
echo '			"php artisan clear-compiled",' >> /var/www/laravel/composer.json
echo '			"php artisan optimize"' >> /var/www/laravel/composer.json
echo '		],' >> /var/www/laravel/composer.json
echo '		"post-update-cmd": [' >> /var/www/laravel/composer.json
echo '			"php artisan clear-compiled",' >> /var/www/laravel/composer.json
echo '			"php artisan optimize"' >> /var/www/laravel/composer.json
echo '		],' >> /var/www/laravel/composer.json
echo '		"post-create-project-cmd": [' >> /var/www/laravel/composer.json
echo '			"php artisan key:generate"' >> /var/www/laravel/composer.json
echo '		]' >> /var/www/laravel/composer.json
echo '	},' >> /var/www/laravel/composer.json
echo '	"config": {' >> /var/www/laravel/composer.json
echo '		"preferred-install": "dist"' >> /var/www/laravel/composer.json
echo '	},' >> /var/www/laravel/composer.json
echo '	"minimum-stability": "stable"' >> /var/www/laravel/composer.json
echo '}' >> /var/www/laravel/composer.json

# Run Composer Update to install Generators
cd /var/www/laravel
php composer update --dev

# Register the Generators Service Provider
# 'Way\Generators\GeneratorsServiceProvider',
