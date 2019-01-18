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

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/wp-content
sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content


# this was suggested to do after getting a plugin activated if denied first a plus to enable it to be more persmissive then minus after getting to work
# sudo chmod g-w /opt/bitnami/apps/wordpress/htdocs/wp-config.php

echo "]]] SETTING PERMISSIONS..."

cd /opt/bitnami/apps/wordpress/htdocs/

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

sudo chmod 640 wp-config.php

echo "]]] WORDPRESS INSTALLED..."
ls -salth /opt/bitnami/apps/wordpress/htdocs

echo "]]] RESTART SERVICES ..."
sudo /opt/bitnami/ctlscript.sh restart

echo "]]] DONE ..."


