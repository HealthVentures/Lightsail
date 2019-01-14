#!/bin/bash
#
# REINSTALL WORDPRESS
#
cd /opt/bitnami/apps/wordpress/htdocs/

# download wordpress
clear
echo "]]] DOWNLOADING WORDPRESS..."
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz 
cd wordpress
sudo mv -f * ../
cd ..
rm -rf wordpress
rm latest.tar.gz

echo "]]] SETTING PERMISSIONS..."

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

echo "]]] SETTING PERMISSIONS/OWNERSHIP..."

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/wp-content
sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

clear
echo "]]] WORDPRESS INSTALLED..."
ll /opt/bitnami/apps/wordpress/htdocs

