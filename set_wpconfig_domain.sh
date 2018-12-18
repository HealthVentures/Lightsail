#!/bin/bash
#
# Lightsail: Update wp_config file from IP to full domain name
#
echo "]]] Lightsail: Update wp_config file from IP to full domain name"
# Set Permissions
sudo chmod 664 /opt/bitnami/apps/wordpress/htdocs/wp-config.php
echo "...Updated wp_config permissions"
# Edit File
nano /opt/bitnami/apps/wordpress/htdocs/wp-config.php
# Replace with http://www.domain.com
# Later will have to do again for https if SSL not done first
echo "...Next Step: Restart Apache"