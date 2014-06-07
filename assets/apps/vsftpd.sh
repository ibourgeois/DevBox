#!/usr/bin/env bash

clear
echo "============================================================"
echo "Installing VSFTPD"
echo "============================================================"

#Install VSFTPD
sudo apt-get install -y vsftpd

# Modify VSFTPD.CONF
sudo sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf

# Restart VSFTPD
sudo service vsftpd restart
