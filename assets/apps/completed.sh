#!/usr/bin/env bash
clear
ip=$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
echo "================================================================================"
echo " Installation Has Completed"
echo "================================================================================"
echo " "
echo "  You can access your site by typing in the following address into your web"
echo "  browser:"
echo " "
echo "                          http://$ip"
echo " "
echo " "
echo "  If you have any questions/issues, please visit:"
echo "  http://github.com/ibourgeois/Vagrant"
echo " "
echo "  Thanks,"
echo "      Derek Bourgeois"
echo "      derek@ibourgeois.com"
echo "      http://ibourgeois.com"
echo " "
echo "================================================================================"
