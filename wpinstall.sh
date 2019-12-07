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

echo "]]] SET PERMISSIONS..."

cd /opt/bitnami/apps/wordpress/htdocs/

sudo chown -R bitnami:daemon *

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

echo "]]] SECURE WPCONFIG..."

sudo chmod 640 wp-config.php

echo "]]] WORDPRESS INSTALLED..."

ls -salth /opt/bitnami/apps/wordpress/htdocs

echo "]]] RESTART SERVICES ..."

sudo /opt/bitnami/ctlscript.sh restart

echo "]]] DONE ..."


