#!/usr/bin/env bash

clear

echo "======================================"
echo "Which Platform Do You Want To Install?"
echo "======================================"
echo "1  - CakePHP"
echo "2  - CodeIgniter"
echo "3  - Concrete 5"
echo "4  - Drupal"
echo "5  - Joomla"
echo "6  - Laravel"
echo "7  - phpBB"
echo "8  - Ruby on Rails"
echo "9  - SilverStripe"
echo "10 - Symfony"
echo "11 - WordPress"
echo "12 - Yii"
echo "13 - Zend"
echo "14 - Exit"
echo "======================================"
echo "Enter your selection (1-14): \c"

read choice

case "$choice" in
	1)  cd ${0%/*}/assets/cakephp
		vagrant box add cakephp http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	2)  cd ${0%/*}/assets/codeigniter
		vagrant box add codeigniter http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	3)  cd ${0%/*}/assets/concrete5
		vagrant box add concrete5 http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	4)  cd ${0%/*}/assets/drupal
		vagrant box add drupal http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	5)  cd ${0%/*}/assets/joomla
		vagrant box add joomla http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	6)  cd ${0%/*}/assets/laravel
		vagrant box add laravel http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	7)  cd ${0%/*}/assets/phpbb
		vagrant box add phpbb http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	8)  cd ${0%/*}/assets/rubyonrails
		vagrant box add rubyonrails http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	9)  cd ${0%/*}/assets/silverstripe
		vagrant box add silverstripe http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	10) cd ${0%/*}/assets/symfony
		vagrant box add symfony http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	11) cd ${0%/*}/assets/wordpress
	    vagrant box add wordpress http://files.vagrantup.com/precise32.box --force
	    vagrant up 
	    vagrant ssh ;;
	12) cd ${0%/*}/assets/yii
		vagrant box add yii http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	13) cd ${0%/*}/assets/zend
		vagrant box add zend http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	14) exit ;;
esac
