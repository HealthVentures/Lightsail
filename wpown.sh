#!/bin/bash
#
# REFRESH WORDPRESS PERMISSIONS/OWNERSHIP 
#
clear

echo "]]] SET PERMISSIONS..."

cd /opt/bitnami/apps/wordpress/htdocs/

sudo chown -R bitnami:daemon *

sudo find . -type d -exec chmod 0755 {} \;
sudo find . -type f -exec chmod 0644 {} \;

# sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content

# this was suggested to do after getting a plugin activated if denied first a plus to enable it to be more persmissive then minus after getting to work
# sudo chmod g-w /opt/bitnami/apps/wordpress/htdocs/wp-config.php

echo "]]] SECURE WPCONFIG..."

chmod 640 wp-config.php

echo "]]] RESTART SERVICES..."

sudo /opt/bitnami/ctlscript.sh restart







