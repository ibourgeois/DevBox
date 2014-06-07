#!/usr/bin/env bash

clear

ip=$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

touch /vagrant/welcome.sh
echo "#!/usr/bin/env bash" > /vagrant/welcome.sh
echo "" >> /vagrant/welcome.sh
echo "xdg-open 'http://$ip'" >> /vagrant/welcome.sh
echo "gnome-open 'http://$ip'" >> /vagrant/welcome.sh
echo "open 'http://$ip'" >> /vagrant/welcome.sh

touch /vagrant/welcome.bat
echo "@echo off" > /vagrant/welcome.bat
echo "start http://$ip" >> /vagrant/welcome.bat


echo "============================================================"
echo " Installation Has Completed"
echo "============================================================"
echo " "
echo "  You can access your site by typing in the following "
echo "  address into your web browser:"
echo " "
echo "                  http://$ip"
echo " "
echo " "
echo "  If you have any questions/issues, please visit:"
echo "  https://github.com/TechFix/DevBox"
echo " "
echo "  Thanks,"
echo "      Derek Bourgeois"
echo "      derek@ibourgeois.com"
echo "      http://ibourgeois.com"
echo " "
echo "============================================================"
