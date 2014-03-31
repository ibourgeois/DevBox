#!/usr/bin/env bash

clear
echo "================================================================================"
echo "Installing ACL"
echo "================================================================================"

# Install ACL
sudo apt-get install -y acl


echo "# /etc/fstab: static file system information." > /etc/fstab
echo "#" >> /etc/fstab
echo "# Use 'blkid' to print the universally unique identifier for a" >> /etc/fstab
echo "# device; this may be used with UUID= as a more robust way to name devices" >> /etc/fstab
echo "# that works even if disks are added and removed. See fstab(5)." >> /etc/fstab
echo "#" >> /etc/fstab
echo "# <file system> <mount point>   <type>  <options>       <dump>  <pass>" >> /etc/fstab
echo "proc            /proc           proc    nodev,noexec,nosuid 0       0" >> /etc/fstab
echo "/dev/mapper/precise32-root /               ext4    errors=remount-ro 0       1" >> /etc/fstab
echo "# /boot was on /dev/sda1 during installation" >> /etc/fstab
echo "UUID=e5b55f42-321d-4de0-b9d5-38f4a8fa17ee /boot           ext2    defaults,acl        0       2" >> /etc/fstab
echo "/dev/mapper/precise32-swap_1 none            swap    sw              0       0" >> /etc/fstab

sudo mount -o remount /boot
