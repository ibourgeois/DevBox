#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Sentry"
echo "================================================================================"

# Install Sentry
cd /vagrant/laravel

# Add Sentry to the required packages in composer.json
sudo : > /vagrant/laravel/composer.json
echo '{' > /vagrant/laravel/composer.json
echo '	"name": "laravel/laravel",' >> /vagrant/laravel/composer.json
echo '	"description": "The Laravel Framework.",' >> /vagrant/laravel/composer.json
echo '	"keywords": ["framework", "laravel"],' >> /vagrant/laravel/composer.json
echo '	"license": "MIT",' >> /vagrant/laravel/composer.json
echo '	"require": {' >> /vagrant/laravel/composer.json
echo '		"laravel/framework": "4.1.*",' >> /vagrant/laravel/composer.json
echo '		"cartalyst/sentry": "2.1.*"' >> /vagrant/laravel/composer.json
echo '	},' >> /vagrant/laravel/composer.json
echo '	"autoload": {' >> /vagrant/laravel/composer.json
echo '		"classmap": [' >> /vagrant/laravel/composer.json
echo '			"app/commands",' >> /vagrant/laravel/composer.json
echo '			"app/controllers",' >> /vagrant/laravel/composer.json
echo '			"app/models",' >> /vagrant/laravel/composer.json
echo '			"app/database/migrations",' >> /vagrant/laravel/composer.json
echo '			"app/database/seeds",' >> /vagrant/laravel/composer.json
echo '			"app/tests/TestCase.php"' >> /vagrant/laravel/composer.json
echo '		]' >> /vagrant/laravel/composer.json
echo '	},' >> /vagrant/laravel/composer.json
echo '	"scripts": {' >> /vagrant/laravel/composer.json
echo '		"post-install-cmd": [' >> /vagrant/laravel/composer.json
echo '			"php artisan clear-compiled",' >> /vagrant/laravel/composer.json
echo '			"php artisan optimize"' >> /vagrant/laravel/composer.json
echo '		],' >> /vagrant/laravel/composer.json
echo '		"post-update-cmd": [' >> /vagrant/laravel/composer.json
echo '			"php artisan clear-compiled",' >> /vagrant/laravel/composer.json
echo '			"php artisan optimize"' >> /vagrant/laravel/composer.json
echo '		],' >> /vagrant/laravel/composer.json
echo '		"post-create-project-cmd": [' >> /vagrant/laravel/composer.json
echo '			"php artisan key:generate"' >> /vagrant/laravel/composer.json
echo '		]' >> /vagrant/laravel/composer.json
echo '	},' >> /vagrant/laravel/composer.json
echo '	"config": {' >> /vagrant/laravel/composer.json
echo '		"preferred-install": "dist"' >> /vagrant/laravel/composer.json
echo '	},' >> /vagrant/laravel/composer.json
echo '	"minimum-stability": "stable"' >> /vagrant/laravel/composer.json
echo '}' >> /vagrant/laravel/composer.json

# Run Composer Update to install Sentry
composer update

# Register the Sentry Service Provider
sudo : > /vagrant/laravel/app/config/app.php
echo "<?php" > /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "return array(" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Application Debug Mode" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| When your application is in debug mode, detailed error messages with" >> /vagrant/laravel/app/config/app.php
echo "	| stack traces will be shown on every error that occurs within your" >> /vagrant/laravel/app/config/app.php
echo "	| application. If disabled, a simple generic error page is shown." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'debug' => true," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Application URL" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| This URL is used by the console to properly generate URLs when using" >> /vagrant/laravel/app/config/app.php
echo "	| the Artisan command line tool. You should set this to the root of" >> /vagrant/laravel/app/config/app.php
echo "	| your application so that it is used when running Artisan tasks." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'url' => 'http://localhost'," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Application Timezone" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| Here you may specify the default timezone for your application, which" >> /vagrant/laravel/app/config/app.php
echo "	| will be used by the PHP date and date-time functions. We have gone" >> /vagrant/laravel/app/config/app.php
echo "	| ahead and set this to a sensible default for you out of the box." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'timezone' => 'UTC'," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Application Locale Configuration" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| The application locale determines the default locale that will be used" >> /vagrant/laravel/app/config/app.php
echo "	| by the translation service provider. You are free to set this value" >> /vagrant/laravel/app/config/app.php
echo "	| to any of the locales which will be supported by the application." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'locale' => 'en'," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Application Fallback Locale" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| The fallback locale determines the locale to use when the current one" >> /vagrant/laravel/app/config/app.php
echo "	| is not available. You may change the value to correspond to any of" >> /vagrant/laravel/app/config/app.php
echo "	| the language folders that are provided through your application." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'fallback_locale' => 'en'," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Encryption Key" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| This key is used by the Illuminate encrypter service and should be set" >> /vagrant/laravel/app/config/app.php
echo "	| to a random, 32 character string, otherwise these encrypted strings" >> /vagrant/laravel/app/config/app.php
echo "	| will not be safe. Please do this before deploying an application!" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'key' => ''," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Autoloaded Service Providers" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| The service providers listed here will be automatically loaded on the" >> /vagrant/laravel/app/config/app.php
echo "	| request to your application. Feel free to add your own services to" >> /vagrant/laravel/app/config/app.php
echo "	| this array to grant expanded functionality to your applications." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'providers' => array(" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Foundation\Providers\ArtisanServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Auth\AuthServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Cache\CacheServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Session\CommandsServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Foundation\Providers\ConsoleSupportServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Routing\ControllerServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Cookie\CookieServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Database\DatabaseServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Encryption\EncryptionServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Filesystem\FilesystemServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Hashing\HashServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Html\HtmlServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Log\LogServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Mail\MailServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Database\MigrationServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Pagination\PaginationServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Queue\QueueServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Redis\RedisServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Remote\RemoteServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Auth\Reminders\ReminderServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Database\SeedServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Session\SessionServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Translation\TranslationServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Validation\ValidationServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\View\ViewServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Illuminate\Workbench\WorkbenchServiceProvider'," >> /vagrant/laravel/app/config/app.php
echo "		'Cartalyst\Sentry\SentryServiceProvider'" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	)," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Service Provider Manifest" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| The service provider manifest is used by Laravel to lazy load service" >> /vagrant/laravel/app/config/app.php
echo "	| providers which are not needed for each request, as well to keep a" >> /vagrant/laravel/app/config/app.php
echo "	| list of all of the services. Here, you may set its storage spot." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'manifest' => storage_path().'/meta'," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	/*" >> /vagrant/laravel/app/config/app.php

# Register the Sentry Alias
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	| Class Aliases" >> /vagrant/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	| This array of class aliases will be registered when this application" >> /vagrant/laravel/app/config/app.php
echo "	| is started. However, feel free to register as many as you wish as" >> /vagrant/laravel/app/config/app.php
echo "	| the aliases are "lazy" loaded so they don't hinder performance." >> /vagrant/laravel/app/config/app.php
echo "	|" >> /vagrant/laravel/app/config/app.php
echo "	*/" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "	'aliases' => array(" >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo "		'App'             => 'Illuminate\Support\Facades\App'," >> /vagrant/laravel/app/config/app.php
echo "		'Artisan'         => 'Illuminate\Support\Facades\Artisan'," >> /vagrant/laravel/app/config/app.php
echo "		'Auth'            => 'Illuminate\Support\Facades\Auth'," >> /vagrant/laravel/app/config/app.php
echo "		'Blade'           => 'Illuminate\Support\Facades\Blade'," >> /vagrant/laravel/app/config/app.php
echo "		'Cache'           => 'Illuminate\Support\Facades\Cache'," >> /vagrant/laravel/app/config/app.php
echo "		'ClassLoader'     => 'Illuminate\Support\ClassLoader'," >> /vagrant/laravel/app/config/app.php
echo "		'Config'          => 'Illuminate\Support\Facades\Config'," >> /vagrant/laravel/app/config/app.php
echo "		'Controller'      => 'Illuminate\Routing\Controller'," >> /vagrant/laravel/app/config/app.php
echo "		'Cookie'          => 'Illuminate\Support\Facades\Cookie'," >> /vagrant/laravel/app/config/app.php
echo "		'Crypt'           => 'Illuminate\Support\Facades\Crypt'," >> /vagrant/laravel/app/config/app.php
echo "		'DB'              => 'Illuminate\Support\Facades\DB'," >> /vagrant/laravel/app/config/app.php
echo "		'Eloquent'        => 'Illuminate\Database\Eloquent\Model'," >> /vagrant/laravel/app/config/app.php
echo "		'Event'           => 'Illuminate\Support\Facades\Event'," >> /vagrant/laravel/app/config/app.php
echo "		'File'            => 'Illuminate\Support\Facades\File'," >> /vagrant/laravel/app/config/app.php
echo "		'Form'            => 'Illuminate\Support\Facades\Form'," >> /vagrant/laravel/app/config/app.php
echo "		'Hash'            => 'Illuminate\Support\Facades\Hash'," >> /vagrant/laravel/app/config/app.php
echo "		'HTML'            => 'Illuminate\Support\Facades\HTML'," >> /vagrant/laravel/app/config/app.php
echo "		'Input'           => 'Illuminate\Support\Facades\Input'," >> /vagrant/laravel/app/config/app.php
echo "		'Lang'            => 'Illuminate\Support\Facades\Lang'," >> /vagrant/laravel/app/config/app.php
echo "		'Log'             => 'Illuminate\Support\Facades\Log'," >> /vagrant/laravel/app/config/app.php
echo "		'Mail'            => 'Illuminate\Support\Facades\Mail'," >> /vagrant/laravel/app/config/app.php
echo "		'Paginator'       => 'Illuminate\Support\Facades\Paginator'," >> /vagrant/laravel/app/config/app.php
echo "		'Password'        => 'Illuminate\Support\Facades\Password'," >> /vagrant/laravel/app/config/app.php
echo "		'Queue'           => 'Illuminate\Support\Facades\Queue'," >> /vagrant/laravel/app/config/app.php
echo "		'Redirect'        => 'Illuminate\Support\Facades\Redirect'," >> /vagrant/laravel/app/config/app.php
echo "		'Redis'           => 'Illuminate\Support\Facades\Redis'," >> /vagrant/laravel/app/config/app.php
echo "		'Request'         => 'Illuminate\Support\Facades\Request'," >> /vagrant/laravel/app/config/app.php
echo "		'Response'        => 'Illuminate\Support\Facades\Response'," >> /vagrant/laravel/app/config/app.php
echo "		'Route'           => 'Illuminate\Support\Facades\Route'," >> /vagrant/laravel/app/config/app.php
echo "		'Schema'          => 'Illuminate\Support\Facades\Schema'," >> /vagrant/laravel/app/config/app.php
echo "		'Seeder'          => 'Illuminate\Database\Seeder'," >> /vagrant/laravel/app/config/app.php
echo "		'Session'         => 'Illuminate\Support\Facades\Session'," >> /vagrant/laravel/app/config/app.php
echo "		'SSH'             => 'Illuminate\Support\Facades\SSH'," >> /vagrant/laravel/app/config/app.php
echo "		'Str'             => 'Illuminate\Support\Str'," >> /vagrant/laravel/app/config/app.php
echo "		'URL'             => 'Illuminate\Support\Facades\URL'," >> /vagrant/laravel/app/config/app.php
echo "		'Validator'       => 'Illuminate\Support\Facades\Validator'," >> /vagrant/laravel/app/config/app.php
echo "		'View'            => 'Illuminate\Support\Facades\View'," >> /vagrant/laravel/app/config/app.php
echo "		'Sentry' 		  => 'Cartalyst\Sentry\Facades\Laravel\Sentry'" >> /vagrant/laravel/app/config/app.php
echo "		" >> /vagrant/laravel/app/config/app.php
echo "	)," >> /vagrant/laravel/app/config/app.php
echo "" >> /vagrant/laravel/app/config/app.php
echo ");" >> /vagrant/laravel/app/config/app.php

# Generate new App Key for laravel
cd /vagrant/laravel
php artisan key:generate

# Run Migrations
php artisan migrate --package=cartalyst/sentry

# Publish the Sentry Package
php artisan config:publish cartalyst/sentry
