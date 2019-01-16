#!/bin/bash
#
# RESTORE SAVED WP FILES 
#
clear

cd /opt/bitnami/apps/wordpress/htdocs/

echo "]]] RESTORING DIVI THEME..."
cp -fr sav/themes/Divi wp-content/themes/

echo "]]] RESTORING PLUGINS..."
cp -fr sav/plugins/ wp-content/

echo "]]] RESTORING UPLOADS..."
cp -fr sav/uploads/ wp-content/

echo "]]] RESTORING WPCONFIG..."

cp sav/wp-config.php .

echo "]]] SETTING OWNERSHIP..."

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/wp-content
sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

echo "]]] SETTING PERMISSIONS..."

cd /opt/bitnami/apps/wordpress/htdocs/

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

chmod 660 wp-config.php

echo "]]] WORDPRESS SITE RESTORED..."
ls -salth /opt/bitnami/apps/wordpress/htdocs/

echo "]]] RESTART SERVICES ..."
sudo /opt/bitnami/ctlscript.sh restart







