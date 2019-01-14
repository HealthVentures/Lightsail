#!/bin/bash
#
# RESTORE SAVED WP FILES 
#
cd /opt/bitnami/apps/wordpress/htdocs/

echo "]]] RESTORING DIVI THEME..."
cp -fr sav/themes/Divi wp-content/themes/

echo "]]] RESTORING PLUGINS..."
cp -fr sav/plugins/ wp-content/

echo "]]] RESTORING UPLOADS..."
cp sav/uploads/ wp-content/

echo "]]] RESTORING WPCONFIG..."

cp sav/wp-config.php .

echo "]]] SETTING PERMISSIONS..."

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

echo "]]] SETTING OWNERSHIP..."

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/wp-content
sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

chmod 600 wp-config.php

echo "]]] DONE..."





