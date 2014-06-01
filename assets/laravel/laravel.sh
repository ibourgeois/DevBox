#!/usr/bin/env bash
clear
echo "================================================================================"
echo "Installing Laravel"
echo "================================================================================"

# Install Laravel
cd /var/www
composer create-project laravel/laravel --prefer-dist

# MODIFY 000-default 
sudo : > /etc/apache2/sites-enabled/000-default
echo "<VirtualHost *:80>" > /etc/apache2/sites-enabled/000-default
echo "	ServerAdmin webmaster@localhost" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	DocumentRoot /var/www/laravel/public" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory />" >> /etc/apache2/sites-enabled/000-default
echo "		Options FollowSymLinks" >> /etc/apache2/sites-enabled/000-default
echo "		AllowOverride All" >> /etc/apache2/sites-enabled/000-default
echo "	</Directory>" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory /var/www/laravel/public/>" >> /etc/apache2/sites-enabled/000-default
echo "		Options Indexes FollowSymLinks MultiViews" >> /etc/apache2/sites-enabled/000-default
echo "		AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo "		Order allow,deny" >> /etc/apache2/sites-enabled/000-default
echo "		allow from all" >> /etc/apache2/sites-enabled/000-default
echo "	</Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory \"/usr/lib/cgi-bin\">" >> /etc/apache2/sites-enabled/000-default
echo "		AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo "		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-enabled/000-default
echo "		Order allow,deny" >> /etc/apache2/sites-enabled/000-default
echo "		Allow from all" >> /etc/apache2/sites-enabled/000-default
echo "	</Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	ErrorLog \${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	# Possible values include: debug, info, notice, warn, error, crit," >> /etc/apache2/sites-enabled/000-default
echo "	# alert, emerg." >> /etc/apache2/sites-enabled/000-default
echo "	LogLevel warn" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	CustomLog \${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "    Alias /doc/ \"/usr/share/doc/\"" >> /etc/apache2/sites-enabled/000-default
echo "    <Directory \"/usr/share/doc/\">" >> /etc/apache2/sites-enabled/000-default
echo "        Options Indexes MultiViews FollowSymLinks" >> /etc/apache2/sites-enabled/000-default
echo "        AllowOverride None" >> /etc/apache2/sites-enabled/000-default
echo "        Order deny,allow" >> /etc/apache2/sites-enabled/000-default
echo "        Deny from all" >> /etc/apache2/sites-enabled/000-default
echo "        Allow from 127.0.0.0/255.0.0.0 ::1/128" >> /etc/apache2/sites-enabled/000-default
echo "    </Directory>" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "</VirtualHost>" >> /etc/apache2/sites-enabled/000-default

# Modify default
sudo : > /etc/apache2/sites-available/default
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/default
echo "        ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/default
echo "" >> /etc/apache2/sites-available/default
echo "        DocumentRoot /var/www/laravel/public" >> /etc/apache2/sites-available/default
echo "        <Directory />" >> /etc/apache2/sites-available/default
echo "                Options FollowSymLinks" >> /etc/apache2/sites-available/default
echo "                AllowOverride All" >> /etc/apache2/sites-available/default
echo "        </Directory>" >> /etc/apache2/sites-available/default
echo "        <Directory /var/www/laravel/public/>" >> /etc/apache2/sites-available/default
echo "                Options Indexes FollowSymLinks MultiViews" >> /etc/apache2/sites-available/default
echo "                AllowOverride All" >> /etc/apache2/sites-available/default
echo "                Order allow,deny" >> /etc/apache2/sites-available/default
echo "                allow from all" >> /etc/apache2/sites-available/default
echo "        </Directory>" >> /etc/apache2/sites-available/default
echo "" >> /etc/apache2/sites-available/default
echo "        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-available/default
echo "        <Directory \"/usr/lib/cgi-bin\">" >> /etc/apache2/sites-available/default
echo "                AllowOverride All" >> /etc/apache2/sites-available/default
echo "                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-available/default
echo "                Order allow,deny" >> /etc/apache2/sites-available/default
echo "                Allow from all" >> /etc/apache2/sites-available/default
echo "        </Directory>" >> /etc/apache2/sites-available/default
echo "" >> /etc/apache2/sites-available/default
echo "        ErrorLog /error.log" >> /etc/apache2/sites-available/default
echo "" >> /etc/apache2/sites-available/default
echo "        # Possible values include: debug, info, notice, warn, error, crit," >> /etc/apache2/sites-available/default
echo "        # alert, emerg." >> /etc/apache2/sites-available/default
echo "        LogLevel warn" >> /etc/apache2/sites-available/default
echo "" >> /etc/apache2/sites-available/default
echo "        CustomLog /access.log combined" >> /etc/apache2/sites-available/default
echo "" >> /etc/apache2/sites-available/default
echo "    Alias /doc/ \"/usr/share/doc/\"" >> /etc/apache2/sites-available/default
echo "    <Directory \"/usr/share/doc/\">" >> /etc/apache2/sites-available/default
echo "        Options Indexes MultiViews FollowSymLinks" >> /etc/apache2/sites-available/default
echo "        AllowOverride All" >> /etc/apache2/sites-available/default
echo "        Order deny,allow" >> /etc/apache2/sites-available/default
echo "        Deny from all" >> /etc/apache2/sites-available/default
echo "        Allow from 127.0.0.0/255.0.0.0 ::1/128" >> /etc/apache2/sites-available/default
echo "    </Directory>" >> /etc/apache2/sites-available/default
echo "" >> /etc/apache2/sites-available/default
echo "</VirtualHost>" >> /etc/apache2/sites-available/default

# Restart Apache
sudo service apache2 restart

# Set up the database
echo "CREATE DATABASE IF NOT EXISTS laravel" | mysql
echo "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'" | mysql
echo "GRANT ALL PRIVILEGES ON laravel.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'" | mysql

# Configure the Database Settings for Laravel
sudo : > /vagrant/laravel/app/config/database.php
echo "<?php" > /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "return array(" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	/*" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	| PDO Fetch Style" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	| By default, database results will be returned as instances of the PHP" >> /vagrant/laravel/app/config/database.php
echo "	| stdClass object; however, you may desire to retrieve records in an" >> /vagrant/laravel/app/config/database.php
echo "	| array format for simplicity. Here you can tweak the fetch style." >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	*/" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	'fetch' => PDO::FETCH_CLASS," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	/*" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	| Default Database Connection Name" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	| Here you may specify which of the database connections below you wish" >> /vagrant/laravel/app/config/database.php
echo "	| to use as your default connection for all database work. Of course" >> /vagrant/laravel/app/config/database.php
echo "	| you may use many connections at once using the Database library." >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	*/" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	'default' => 'mysql'," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	/*" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	| Database Connections" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	| Here are each of the database connections setup for your application." >> /vagrant/laravel/app/config/database.php
echo "	| Of course, examples of configuring each database platform that is" >> /vagrant/laravel/app/config/database.php
echo "	| supported by Laravel is shown below to make development simple." >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	| All database work in Laravel is done through the PHP PDO facilities" >> /vagrant/laravel/app/config/database.php
echo "	| so make sure you have the driver for your particular database of" >> /vagrant/laravel/app/config/database.php
echo "	| choice installed on your machine before you begin development." >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	*/" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	'connections' => array(" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "		'sqlite' => array(" >> /vagrant/laravel/app/config/database.php
echo "			'driver'   => 'sqlite'," >> /vagrant/laravel/app/config/database.php
echo "			'database' => __DIR__.'/../database/production.sqlite'," >> /vagrant/laravel/app/config/database.php
echo "			'prefix'   => ''," >> /vagrant/laravel/app/config/database.php
echo "		)," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "		'mysql' => array(" >> /vagrant/laravel/app/config/database.php
echo "			'driver'    => 'mysql'," >> /vagrant/laravel/app/config/database.php
echo "			'host'      => 'localhost'," >> /vagrant/laravel/app/config/database.php
echo "			'database'  => 'laravel'," >> /vagrant/laravel/app/config/database.php
echo "			'username'  => 'vagrant'," >> /vagrant/laravel/app/config/database.php
echo "			'password'  => 'vagrant'," >> /vagrant/laravel/app/config/database.php
echo "			'charset'   => 'utf8'," >> /vagrant/laravel/app/config/database.php
echo "			'collation' => 'utf8_unicode_ci'," >> /vagrant/laravel/app/config/database.php
echo "			'prefix'    => ''," >> /vagrant/laravel/app/config/database.php
echo "		)," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "		'pgsql' => array(" >> /vagrant/laravel/app/config/database.php
echo "			'driver'   => 'pgsql'," >> /vagrant/laravel/app/config/database.php
echo "			'host'     => 'localhost'," >> /vagrant/laravel/app/config/database.php
echo "			'database' => 'database'," >> /vagrant/laravel/app/config/database.php
echo "			'username' => 'root'," >> /vagrant/laravel/app/config/database.php
echo "			'password' => ''," >> /vagrant/laravel/app/config/database.php
echo "			'charset'  => 'utf8'," >> /vagrant/laravel/app/config/database.php
echo "			'prefix'   => ''," >> /vagrant/laravel/app/config/database.php
echo "			'schema'   => 'public'," >> /vagrant/laravel/app/config/database.php
echo "		)," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "		'sqlsrv' => array(" >> /vagrant/laravel/app/config/database.php
echo "			'driver'   => 'sqlsrv'," >> /vagrant/laravel/app/config/database.php
echo "			'host'     => 'localhost'," >> /vagrant/laravel/app/config/database.php
echo "			'database' => 'database'," >> /vagrant/laravel/app/config/database.php
echo "			'username' => 'root'," >> /vagrant/laravel/app/config/database.php
echo "			'password' => ''," >> /vagrant/laravel/app/config/database.php
echo "			'prefix'   => ''," >> /vagrant/laravel/app/config/database.php
echo "		)," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	)," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	/*" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	| Migration Repository Table" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	| This table keeps track of all the migrations that have already run for" >> /vagrant/laravel/app/config/database.php
echo "	| your application. Using this information, we can determine which of" >> /vagrant/laravel/app/config/database.php
echo "	| the migrations on disk haven't actually been run in the database." >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	*/" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	'migrations' => 'migrations'," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	/*" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	| Redis Databases" >> /vagrant/laravel/app/config/database.php
echo "	|--------------------------------------------------------------------------" >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	| Redis is an open source, fast, and advanced key-value store that also" >> /vagrant/laravel/app/config/database.php
echo "	| provides a richer set of commands than a typical key-value systems" >> /vagrant/laravel/app/config/database.php
echo "	| such as APC or Memcached. Laravel makes it easy to dig right in." >> /vagrant/laravel/app/config/database.php
echo "	|" >> /vagrant/laravel/app/config/database.php
echo "	*/" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	'redis' => array(" >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "		'cluster' => false," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "		'default' => array(" >> /vagrant/laravel/app/config/database.php
echo "			'host'     => '127.0.0.1'," >> /vagrant/laravel/app/config/database.php
echo "			'port'     => 6379," >> /vagrant/laravel/app/config/database.php
echo "			'database' => 0," >> /vagrant/laravel/app/config/database.php
echo "		)," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo "	)," >> /vagrant/laravel/app/config/database.php
echo "" >> /vagrant/laravel/app/config/database.php
echo ");" >> /vagrant/laravel/app/config/database.php

# Install the Migration table in the database
cd /vagrant/laravel
php artisan migrate:install
