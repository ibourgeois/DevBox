@ECHO OFF
CLS
TITLE Vagrant DevBox
COLOR 4F

:MENU
CLS
ECHO.
ECHO             ******************************************************
ECHO             *              DevBox v1.0 - Main Menu               *
ECHO             ******************************************************
ECHO             *                                                    *
ECHO             *   [1]  CakePHP                                     *
ECHO             *   [2]  CodeIgniter                                 *
ECHO             *   [3]  Concrete5                                   *
ECHO             *   [4]  Drupal                                      *
ECHO             *   [5]  Joomla                                      *
ECHO             *   [6]  Laravel                                     *
ECHO             *   [7]  phpBB                                       *
ECHO             *   [8]  Ruby on Rails                               *
ECHO             *   [9]  SilverStripe                                *
ECHO             *   [10] Symfony                                     *
ECHO             *   [11] WordPress                                   *
ECHO             *   [12] Yii                                         *
ECHO             *   [13] Zend                                        * 
ECHO             *   [14] Exit                                        *
ECHO             *                                                    *
ECHO             ******************************************************
ECHO.
:CHOICE
SET /P C=.           *    Enter your selection (1-14): 
IF  '%C%'=='1' GOTO :CAKEPHP
IF  '%C%'=='2' GOTO :CODEIGNITER
IF  '%C%'=='3' GOTO :CONCRETE5
IF  '%C%'=='4' GOTO :DRUPAL
IF  '%C%'=='5' GOTO :JOOMLA
IF  '%C%'=='6' GOTO :LARAVEL
IF  '%C%'=='7' GOTO :PHPBB
IF  '%C%'=='8' GOTO :RUBYONRAILS
IF  '%C%'=='9' GOTO :SILVERSTRIPE
IF  '%C%'=='10' GOTO :SYMFONY
IF  '%C%'=='11' GOTO :WORDPRESS
IF  '%C%'=='12' GOTO :YII
IF  '%C%'=='13' GOTO :ZEND
IF  '%C%'=='14' GOTO :EOF
PAUSE



:CAKEPHP
CLS
cd %CD%\assets\cakephp
vagrant box add cakephp http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:CODEIGNITER
CLS
cd %CD%\assets\codeigniter
vagrant box add codeigniter http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:CONCRETE5
CLS
cd %CD%\assets\concrete5
vagrant box add concrete5 http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:DRUPAL
CLS
cd %CD%\assets\drupal
vagrant box add drupal http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:JOOMLA
CLS
cd %CD%\assets\joomla
vagrant box add joomla http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:LARAVEL
CLS
cd %CD%\assets\laravel
vagrant box add laravel http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:PHPBB
CLS
cd %CD%\assets\phpbb
vagrant box add phpbb http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:RUBYONRAILS
CLS
cd %CD%\assets\rubyonrails
vagrant box add rubyonrails http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:SILVERSTRIPE
CLS
cd %CD%\assets\silverstripe
vagrant box add silverstripe http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:SYMFONY
CLS
cd %CD%\assets\symfony
vagrant box add symfony http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:WORDPRESS
CLS
cd %CD%\assets\wordpress
vagrant box add wordpress http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:YII
CLS
cd %CD%\assets\yii
vagrant box add yii http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:ZEND
CLS
cd %CD%\assets\zend
vagrant box add zend http://files.vagrantup.com/precise32.box --force
vagrant up
vagrant ssh
GOTO :EOF

:EOF
EXIT
