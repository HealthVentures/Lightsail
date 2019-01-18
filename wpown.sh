#!/bin/bash
#
# REFRESH WORDPRESS PERMISSIONS/OWNERSHIP 
#
clear

cd /opt/bitnami/apps/wordpress/htdocs/

echo "]]] SETTING OWNERSHIP..."

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/wp-content
sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

echo "]]] SETTING PERMISSIONS..."

cd /opt/bitnami/apps/wordpress/htdocs/

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

chmod 640 wp-config.php

echo "]]] SETTING PERMISSIONS..."

sudo /opt/bitnami/ctlscript.sh restart







