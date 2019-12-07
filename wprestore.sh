#!/bin/bash
#
# RESTORE SAVED WP FILES 
#
clear

cd /opt/bitnami/apps/wordpress/htdocs/

echo "]]] RESTORE DIVI THEME..."
cp -fr sav/themes/ wp-content/

echo "]]] RESTORE PLUGINS..."
cp -fr sav/plugins/ wp-content/

echo "]]] RESTORE UPLOADS..."
cp -fr sav/uploads/ wp-content/

echo "]]] RESTORE WPCONFIG..."

cp sav/wp-config.php .

echo "]]] SET PERMISSIONS..."

cd /opt/bitnami/apps/wordpress/htdocs/

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/wp-content

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

echo "]]] SECURE WPCONFIG..."

chmod 640 wp-config.php

echo "]]] WORDPRESS SITE RESTORED..."
ls -salth /opt/bitnami/apps/wordpress/htdocs/

echo "]]] RESTART SERVICES ..."
sudo /opt/bitnami/ctlscript.sh restart







