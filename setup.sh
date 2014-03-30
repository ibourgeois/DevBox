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
	1)  cd assets/cakephp
		vagrant box add cakephp http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	2)  cd assets/codeigniter
		vagrant box add codeigniter http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	3)  cd assets/concrete5
		vagrant box add concrete5 http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	4)  cd assets/drupal
		vagrant box add drupal http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	5)  cd assets/joomla
		vagrant box add joomla http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	6)  cd assets/laravel
		vagrant box add laravel http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	7)  cd assets/phpbb
		vagrant box add phpbb http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	8)  cd assets/rubyonrails
		vagrant box add rubyonrails http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	9)  cd assets/silverstripe
		vagrant box add silverstripe http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	10) cd assets/symfony
		vagrant box add symfony http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	11) cd assets/wordpress
	    vagrant box add wordpress http://files.vagrantup.com/precise32.box --force
	    vagrant up 
	    vagrant ssh ;;
	12) cd assets/yii
		vagrant box add yii http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	13) cd assets/zend
		vagrant box add zend http://files.vagrantup.com/precise32.box --force
		vagrant up
		vagrant ssh ;;
	14) exit ;;
esac
