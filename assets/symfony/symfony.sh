#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing Symfony"
echo "================================================================================"

# Install Symfony
cd /var/www
composer create-project symfony/framework-standard-edition --prefer-dist
sudo mv framework-standard-edition/ /var/www/Symfony/

# MODIFY 000-default 
sudo : > /etc/apache2/sites-enabled/000-default
echo "<VirtualHost *:80>" > /etc/apache2/sites-enabled/000-default
echo "	ServerAdmin webmaster@localhost" >> /etc/apache2/sites-enabled/000-default
echo "" >> /etc/apache2/sites-enabled/000-default
echo "	DocumentRoot /var/www/Symfony/web" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory />" >> /etc/apache2/sites-enabled/000-default
echo "		Options FollowSymLinks" >> /etc/apache2/sites-enabled/000-default
echo "		AllowOverride All" >> /etc/apache2/sites-enabled/000-default
echo "	</Directory>" >> /etc/apache2/sites-enabled/000-default
echo "	<Directory /var/www/Symfony/web/>" >> /etc/apache2/sites-enabled/000-default
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
echo "        DocumentRoot /var/www/Symfony/web" >> /etc/apache2/sites-available/default
echo "        <Directory />" >> /etc/apache2/sites-available/default
echo "                Options FollowSymLinks" >> /etc/apache2/sites-available/default
echo "                AllowOverride All" >> /etc/apache2/sites-available/default
echo "        </Directory>" >> /etc/apache2/sites-available/default
echo "        <Directory /var/www/Symfony/web/>" >> /etc/apache2/sites-available/default
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

# Remove Localhost Requirement
echo '<?php' > /var/www/Symfony/web/app_dev.php
echo '' >> /var/www/Symfony/web/app_dev.php
echo 'use Symfony\Component\HttpFoundation\Request;' >> /var/www/Symfony/web/app_dev.php
echo "use Symfony\Component\Debug\Debug;" >> /var/www/Symfony/web/app_dev.php
echo '' >> /var/www/Symfony/web/app_dev.php
echo "// If you don't want to setup permissions the proper way, just uncomment the following PHP line" >> /var/www/Symfony/web/app_dev.php
echo "// read http://symfony.com/doc/current/book/installation.html#configuration-and-setup for more information" >> /var/www/Symfony/web/app_dev.php
echo "//umask(0000);" >> /var/www/Symfony/web/app_dev.php
echo "" >> /var/www/Symfony/web/app_dev.php
echo "\$loader = require_once __DIR__.'/../app/bootstrap.php.cache';" >> /var/www/Symfony/web/app_dev.php
echo "Debug::enable();" >> /var/www/Symfony/web/app_dev.php
echo "" >> /var/www/Symfony/web/app_dev.php
echo "require_once __DIR__.'/../app/AppKernel.php';" >> /var/www/Symfony/web/app_dev.php
echo "" >> /var/www/Symfony/web/app_dev.php
echo "\$kernel = new AppKernel('dev', true);" >> /var/www/Symfony/web/app_dev.php
echo "\$kernel->loadClassCache();" >> /var/www/Symfony/web/app_dev.php
echo "\$request = Request::createFromGlobals();" >> /var/www/Symfony/web/app_dev.php
echo "\$response = \$kernel->handle(\$request);" >> /var/www/Symfony/web/app_dev.php
echo "\$response->send();" >> /var/www/Symfony/web/app_dev.php
echo "\$kernel->terminate(\$request, \$response);" >> /var/www/Symfony/web/app_dev.php

echo "<?php" > /var/www/Symfony/web/config.php
echo "if (!isset(\$_SERVER['HTTP_HOST'])) {" >> /var/www/Symfony/web/config.php
echo "    exit('This script cannot be run from the CLI. Run it from a browser.');" >> /var/www/Symfony/web/config.php
echo "}" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "require_once dirname(__FILE__).'/../app/SymfonyRequirements.php';" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "\$symfonyRequirements = new SymfonyRequirements();" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "\$majorProblems = \$symfonyRequirements->getFailedRequirements();" >> /var/www/Symfony/web/config.php
echo "\$minorProblems = \$symfonyRequirements->getFailedRecommendations();" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "?>" >> /var/www/Symfony/web/config.php
echo "<!DOCTYPE html>" >> /var/www/Symfony/web/config.php
echo "<html>" >> /var/www/Symfony/web/config.php
echo "    <head>" >> /var/www/Symfony/web/config.php
echo "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>" >> /var/www/Symfony/web/config.php
echo "        <meta name=\"robots\" content=\"noindex,nofollow\" />" >> /var/www/Symfony/web/config.php
echo "        <title>Symfony Configuration</title>" >> /var/www/Symfony/web/config.php
echo "        <link rel=\"stylesheet\" href=\"bundles/framework/css/structure.css\" media=\"all\" />" >> /var/www/Symfony/web/config.php
echo "        <link rel=\"stylesheet\" href=\"bundles/framework/css/body.css\" media=\"all\" />" >> /var/www/Symfony/web/config.php
echo "        <link rel=\"stylesheet\" href=\"bundles/sensiodistribution/webconfigurator/css/install.css\" media=\"all\" />" >> /var/www/Symfony/web/config.php
echo "    </head>" >> /var/www/Symfony/web/config.php
echo "    <body>" >> /var/www/Symfony/web/config.php
echo "        <div id=\"content\">" >> /var/www/Symfony/web/config.php
echo "            <div class=\"header clear-fix\">" >> /var/www/Symfony/web/config.php
echo "                <div class=\"header-logo\">" >> /var/www/Symfony/web/config.php
echo "                    <img src=\"bundles/framework/images/logo_symfony.png\" alt=\"Symfony\" />" >> /var/www/Symfony/web/config.php
echo "                </div>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                <div class=\"search\">" >> /var/www/Symfony/web/config.php
echo "                  <form method=\"get\" action=\"http://symfony.com/search\">" >> /var/www/Symfony/web/config.php
echo "                    <div class=\"form-row\">" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                      <label for=\"search-id\">" >> /var/www/Symfony/web/config.php
echo "                          <img src=\"bundles/framework/images/grey_magnifier.png\" alt=\"Search on Symfony website\" />" >> /var/www/Symfony/web/config.php
echo "                      </label>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                      <input name=\"q\" id=\"search-id\" type=\"search\" placeholder=\"Search on Symfony website\" />" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                      <button type=\"submit\" class=\"sf-button\">" >> /var/www/Symfony/web/config.php
echo "                          <span class=\"border-l\">" >> /var/www/Symfony/web/config.php
echo "                            <span class=\"border-r\">" >> /var/www/Symfony/web/config.php
echo "                                <span class=\"btn-bg\">OK</span>" >> /var/www/Symfony/web/config.php
echo "                            </span>" >> /var/www/Symfony/web/config.php
echo "                        </span>" >> /var/www/Symfony/web/config.php
echo "                      </button>" >> /var/www/Symfony/web/config.php
echo "                    </div>" >> /var/www/Symfony/web/config.php
echo "                   </form>" >> /var/www/Symfony/web/config.php
echo "                </div>" >> /var/www/Symfony/web/config.php
echo "            </div>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "            <div class=\"sf-reset\">" >> /var/www/Symfony/web/config.php
echo "                <div class=\"block\">" >> /var/www/Symfony/web/config.php
echo "                    <div class=\"symfony-block-content\">" >> /var/www/Symfony/web/config.php
echo "                        <h1 class=\"title\">Welcome!</h1>" >> /var/www/Symfony/web/config.php
echo "                        <p>Welcome to your new Symfony project.</p>" >> /var/www/Symfony/web/config.php
echo "                        <p>" >> /var/www/Symfony/web/config.php
echo "                            This script will guide you through the basic configuration of your project." >> /var/www/Symfony/web/config.php
echo "                            You can also do the same by editing the ‘<strong>app/config/parameters.yml</strong>’ file directly." >> /var/www/Symfony/web/config.php
echo "                        </p>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                        <?php if (count(\$majorProblems)): ?>" >> /var/www/Symfony/web/config.php
echo "                            <h2 class=\"ko\">Major problems</h2>" >> /var/www/Symfony/web/config.php
echo "                            <p>Major problems have been detected and <strong>must</strong> be fixed before continuing:</p>" >> /var/www/Symfony/web/config.php
echo "                            <ol>" >> /var/www/Symfony/web/config.php
echo "                                <?php foreach (\$majorProblems as \$problem): ?>" >> /var/www/Symfony/web/config.php
echo "                                    <li><?php echo \$problem->getHelpHtml() ?></li>" >> /var/www/Symfony/web/config.php
echo "                                <?php endforeach; ?>" >> /var/www/Symfony/web/config.php
echo "                            </ol>" >> /var/www/Symfony/web/config.php
echo "                        <?php endif; ?>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                        <?php if (count(\$minorProblems)): ?>" >> /var/www/Symfony/web/config.php
echo "                            <h2>Recommendations</h2>" >> /var/www/Symfony/web/config.php
echo "                            <p>" >> /var/www/Symfony/web/config.php
echo "                                <?php if (count(\$majorProblems)): ?>Additionally, to<?php else: ?>To<?php endif; ?> enhance your Symfony experience," >> /var/www/Symfony/web/config.php
echo "                                it’s recommended that you fix the following:" >> /var/www/Symfony/web/config.php
echo "                            </p>" >> /var/www/Symfony/web/config.php
echo "                            <ol>" >> /var/www/Symfony/web/config.php
echo "                                <?php foreach (\$minorProblems as \$problem): ?>" >> /var/www/Symfony/web/config.php
echo "                                    <li><?php echo \$problem->getHelpHtml() ?></li>" >> /var/www/Symfony/web/config.php
echo "                                <?php endforeach; ?>" >> /var/www/Symfony/web/config.php
echo "                            </ol>" >> /var/www/Symfony/web/config.php
echo "                        <?php endif; ?>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                        <?php if (\$symfonyRequirements->hasPhpIniConfigIssue()): ?>" >> /var/www/Symfony/web/config.php
echo "                            <p id=\"phpini\">*" >> /var/www/Symfony/web/config.php
echo "                                <?php if (\$symfonyRequirements->getPhpIniConfigPath()): ?>" >> /var/www/Symfony/web/config.php
echo "                                    Changes to the <strong>php.ini</strong> file must be done in \"<strong><?php echo \$symfonyRequirements->getPhpIniConfigPath() ?></strong>\"." >> /var/www/Symfony/web/config.php
echo "                                <?php else: ?>" >> /var/www/Symfony/web/config.php
echo "                                    To change settings, create a \"<strong>php.ini</strong>\"." >> /var/www/Symfony/web/config.php
echo "                                <?php endif; ?>" >> /var/www/Symfony/web/config.php
echo "                            </p>" >> /var/www/Symfony/web/config.php
echo "                        <?php endif; ?>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                        <?php if (!count(\$majorProblems) && !count(\$minorProblems)): ?>" >> /var/www/Symfony/web/config.php
echo "                            <p class=\"ok\">Your configuration looks good to run Symfony.</p>" >> /var/www/Symfony/web/config.php
echo "                        <?php endif; ?>" >> /var/www/Symfony/web/config.php
echo "" >> /var/www/Symfony/web/config.php
echo "                        <ul class=\"symfony-install-continue\">" >> /var/www/Symfony/web/config.php
echo "                            <?php if (!count(\$majorProblems)): ?>" >> /var/www/Symfony/web/config.php
echo "                                <li><a href=\"app_dev.php/_configurator/\">Configure your Symfony Application online</a></li>" >> /var/www/Symfony/web/config.php
echo "                                <li><a href=\"app_dev.php/\">Bypass configuration and go to the Welcome page</a></li>" >> /var/www/Symfony/web/config.php
echo "                            <?php endif; ?>" >> /var/www/Symfony/web/config.php
echo "                            <?php if (count(\$majorProblems) || count(\$minorProblems)): ?>" >> /var/www/Symfony/web/config.php
echo "                                <li><a href=\"config.php\">Re-check configuration</a></li>" >> /var/www/Symfony/web/config.php
echo "                            <?php endif; ?>" >> /var/www/Symfony/web/config.php
echo "                        </ul>" >> /var/www/Symfony/web/config.php
echo "                    </div>" >> /var/www/Symfony/web/config.php
echo "                </div>" >> /var/www/Symfony/web/config.php
echo "            </div>" >> /var/www/Symfony/web/config.php
echo "            <div class=\"version\">Symfony Standard Edition</div>" >> /var/www/Symfony/web/config.php
echo "        </div>" >> /var/www/Symfony/web/config.php
echo "    </body>" >> /var/www/Symfony/web/config.php
echo "</html>" >> /var/www/Symfony/web/config.php

# Set up the database
echo "CREATE DATABASE IF NOT EXISTS symfony" | mysql
echo "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'" | mysql
echo "GRANT ALL PRIVILEGES ON symfony.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'" | mysql

ifconfig
