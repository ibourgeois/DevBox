#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Sentry"
echo "================================================================================"

# Install Sentry
cd /var/www/laravel

# Add Sentry to the required packages in composer.json
sudo : > /var/www/laravel/composer.json
echo '{' > /var/www/laravel/composer.json
echo '	"name": "laravel/laravel",' >> /var/www/laravel/composer.json
echo '	"description": "The Laravel Framework.",' >> /var/www/laravel/composer.json
echo '	"keywords": ["framework", "laravel"],' >> /var/www/laravel/composer.json
echo '	"license": "MIT",' >> /var/www/laravel/composer.json
echo '	"require": {' >> /var/www/laravel/composer.json
echo '		"laravel/framework": "4.1.*",' >> /var/www/laravel/composer.json
echo '		"cartalyst/sentry": "2.1.*",' >> /var/www/laravel/composer.json
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

# Run Composer Update to install Sentry
php composer update

# Register the Sentry Service Provider
sudo : > /var/www/laravel/app/config/app.php
echo "<?php" > /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "return array(" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Application Debug Mode" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| When your application is in debug mode, detailed error messages with" >> /var/www/laravel/app/config/app.php
echo "	| stack traces will be shown on every error that occurs within your" >> /var/www/laravel/app/config/app.php
echo "	| application. If disabled, a simple generic error page is shown." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'debug' => true," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Application URL" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| This URL is used by the console to properly generate URLs when using" >> /var/www/laravel/app/config/app.php
echo "	| the Artisan command line tool. You should set this to the root of" >> /var/www/laravel/app/config/app.php
echo "	| your application so that it is used when running Artisan tasks." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'url' => 'http://localhost'," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Application Timezone" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| Here you may specify the default timezone for your application, which" >> /var/www/laravel/app/config/app.php
echo "	| will be used by the PHP date and date-time functions. We have gone" >> /var/www/laravel/app/config/app.php
echo "	| ahead and set this to a sensible default for you out of the box." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'timezone' => 'UTC'," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Application Locale Configuration" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| The application locale determines the default locale that will be used" >> /var/www/laravel/app/config/app.php
echo "	| by the translation service provider. You are free to set this value" >> /var/www/laravel/app/config/app.php
echo "	| to any of the locales which will be supported by the application." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'locale' => 'en'," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Application Fallback Locale" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| The fallback locale determines the locale to use when the current one" >> /var/www/laravel/app/config/app.php
echo "	| is not available. You may change the value to correspond to any of" >> /var/www/laravel/app/config/app.php
echo "	| the language folders that are provided through your application." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'fallback_locale' => 'en'," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Encryption Key" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| This key is used by the Illuminate encrypter service and should be set" >> /var/www/laravel/app/config/app.php
echo "	| to a random, 32 character string, otherwise these encrypted strings" >> /var/www/laravel/app/config/app.php
echo "	| will not be safe. Please do this before deploying an application!" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'key' => ''," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Autoloaded Service Providers" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| The service providers listed here will be automatically loaded on the" >> /var/www/laravel/app/config/app.php
echo "	| request to your application. Feel free to add your own services to" >> /var/www/laravel/app/config/app.php
echo "	| this array to grant expanded functionality to your applications." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'providers' => array(" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Foundation\Providers\ArtisanServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Auth\AuthServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Cache\CacheServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Session\CommandsServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Foundation\Providers\ConsoleSupportServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Routing\ControllerServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Cookie\CookieServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Database\DatabaseServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Encryption\EncryptionServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Filesystem\FilesystemServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Hashing\HashServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Html\HtmlServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Log\LogServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Mail\MailServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Database\MigrationServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Pagination\PaginationServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Queue\QueueServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Redis\RedisServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Remote\RemoteServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Auth\Reminders\ReminderServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Database\SeedServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Session\SessionServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Translation\TranslationServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Validation\ValidationServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\View\ViewServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Illuminate\Workbench\WorkbenchServiceProvider'," >> /var/www/laravel/app/config/app.php
echo "		'Cartalyst\Sentry\SentryServiceProvider'" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	)," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Service Provider Manifest" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| The service provider manifest is used by Laravel to lazy load service" >> /var/www/laravel/app/config/app.php
echo "	| providers which are not needed for each request, as well to keep a" >> /var/www/laravel/app/config/app.php
echo "	| list of all of the services. Here, you may set its storage spot." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'manifest' => storage_path().'/meta'," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	/*" >> /var/www/laravel/app/config/app.php

# Register the Sentry Alias
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	| Class Aliases" >> /var/www/laravel/app/config/app.php
echo "	|--------------------------------------------------------------------------" >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	| This array of class aliases will be registered when this application" >> /var/www/laravel/app/config/app.php
echo "	| is started. However, feel free to register as many as you wish as" >> /var/www/laravel/app/config/app.php
echo "	| the aliases are "lazy" loaded so they don't hinder performance." >> /var/www/laravel/app/config/app.php
echo "	|" >> /var/www/laravel/app/config/app.php
echo "	*/" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "	'aliases' => array(" >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo "		'App'             => 'Illuminate\Support\Facades\App'," >> /var/www/laravel/app/config/app.php
echo "		'Artisan'         => 'Illuminate\Support\Facades\Artisan'," >> /var/www/laravel/app/config/app.php
echo "		'Auth'            => 'Illuminate\Support\Facades\Auth'," >> /var/www/laravel/app/config/app.php
echo "		'Blade'           => 'Illuminate\Support\Facades\Blade'," >> /var/www/laravel/app/config/app.php
echo "		'Cache'           => 'Illuminate\Support\Facades\Cache'," >> /var/www/laravel/app/config/app.php
echo "		'ClassLoader'     => 'Illuminate\Support\ClassLoader'," >> /var/www/laravel/app/config/app.php
echo "		'Config'          => 'Illuminate\Support\Facades\Config'," >> /var/www/laravel/app/config/app.php
echo "		'Controller'      => 'Illuminate\Routing\Controller'," >> /var/www/laravel/app/config/app.php
echo "		'Cookie'          => 'Illuminate\Support\Facades\Cookie'," >> /var/www/laravel/app/config/app.php
echo "		'Crypt'           => 'Illuminate\Support\Facades\Crypt'," >> /var/www/laravel/app/config/app.php
echo "		'DB'              => 'Illuminate\Support\Facades\DB'," >> /var/www/laravel/app/config/app.php
echo "		'Eloquent'        => 'Illuminate\Database\Eloquent\Model'," >> /var/www/laravel/app/config/app.php
echo "		'Event'           => 'Illuminate\Support\Facades\Event'," >> /var/www/laravel/app/config/app.php
echo "		'File'            => 'Illuminate\Support\Facades\File'," >> /var/www/laravel/app/config/app.php
echo "		'Form'            => 'Illuminate\Support\Facades\Form'," >> /var/www/laravel/app/config/app.php
echo "		'Hash'            => 'Illuminate\Support\Facades\Hash'," >> /var/www/laravel/app/config/app.php
echo "		'HTML'            => 'Illuminate\Support\Facades\HTML'," >> /var/www/laravel/app/config/app.php
echo "		'Input'           => 'Illuminate\Support\Facades\Input'," >> /var/www/laravel/app/config/app.php
echo "		'Lang'            => 'Illuminate\Support\Facades\Lang'," >> /var/www/laravel/app/config/app.php
echo "		'Log'             => 'Illuminate\Support\Facades\Log'," >> /var/www/laravel/app/config/app.php
echo "		'Mail'            => 'Illuminate\Support\Facades\Mail'," >> /var/www/laravel/app/config/app.php
echo "		'Paginator'       => 'Illuminate\Support\Facades\Paginator'," >> /var/www/laravel/app/config/app.php
echo "		'Password'        => 'Illuminate\Support\Facades\Password'," >> /var/www/laravel/app/config/app.php
echo "		'Queue'           => 'Illuminate\Support\Facades\Queue'," >> /var/www/laravel/app/config/app.php
echo "		'Redirect'        => 'Illuminate\Support\Facades\Redirect'," >> /var/www/laravel/app/config/app.php
echo "		'Redis'           => 'Illuminate\Support\Facades\Redis'," >> /var/www/laravel/app/config/app.php
echo "		'Request'         => 'Illuminate\Support\Facades\Request'," >> /var/www/laravel/app/config/app.php
echo "		'Response'        => 'Illuminate\Support\Facades\Response'," >> /var/www/laravel/app/config/app.php
echo "		'Route'           => 'Illuminate\Support\Facades\Route'," >> /var/www/laravel/app/config/app.php
echo "		'Schema'          => 'Illuminate\Support\Facades\Schema'," >> /var/www/laravel/app/config/app.php
echo "		'Seeder'          => 'Illuminate\Database\Seeder'," >> /var/www/laravel/app/config/app.php
echo "		'Session'         => 'Illuminate\Support\Facades\Session'," >> /var/www/laravel/app/config/app.php
echo "		'SSH'             => 'Illuminate\Support\Facades\SSH'," >> /var/www/laravel/app/config/app.php
echo "		'Str'             => 'Illuminate\Support\Str'," >> /var/www/laravel/app/config/app.php
echo "		'URL'             => 'Illuminate\Support\Facades\URL'," >> /var/www/laravel/app/config/app.php
echo "		'Validator'       => 'Illuminate\Support\Facades\Validator'," >> /var/www/laravel/app/config/app.php
echo "		'View'            => 'Illuminate\Support\Facades\View'," >> /var/www/laravel/app/config/app.php
echo "		'Sentry' 		      => 'Cartalyst\Sentry\Facades\Laravel\Sentry'" >> /var/www/laravel/app/config/app.php
echo "		" >> /var/www/laravel/app/config/app.php
echo "	)," >> /var/www/laravel/app/config/app.php
echo "" >> /var/www/laravel/app/config/app.php
echo ");" >> /var/www/laravel/app/config/app.php

# Generate new App Key for laravel
cd /var/www/laravel
php artisan key:generate


# Run Migrations
php artisan migrate --package=cartalyst/sentry

# Publish the Sentry Package
php artisan config:publish cartalyst/sentry










# Generate new App Key for laravel
cd /var/www/laravel
php artisan key:generate
