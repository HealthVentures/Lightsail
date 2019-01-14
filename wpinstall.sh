#!/bin/bash
#
# REINSTALL WORDPRESS
#
clear
echo "]]] DOWNLOADING WORDPRESS..."
cd /opt/bitnami/apps/wordpress/htdocs/

# download wordpress
wget https://wordpress.org/latest.tar.gz

# extract wordpress
tar -xzvf latest.tar.gz 

# move files up one folder from extraction
cd wordpress
sudo mv -f * ../

# cleanup
cd ..
rm -rf wordpress
rm latest.tar.gz

echo "]]] SETTING OWNERSHIP..."

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/
# sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

echo "]]] SETTING PERMISSIONS..."

cd /opt/bitnami/apps/wordpress/htdocs/

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

echo "]]] WORDPRESS INSTALLED..."
ls -salt /opt/bitnami/apps/wordpress/htdocs

