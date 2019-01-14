#!/bin/bash
#
# CLEAN WORDPRESS FOLDER
#
clear
echo "]]] REMOVING WORDPRESS FILES..."

cd /opt/bitnami/apps/wordpress/htdocs/

# remove files
sudo rm -rf wp*
rm xmlrpc.php 
sudo rm -rf readm*
sudo rm -f license.txt index.php .ht*
echo "]]] WORDPRESS CLEANED"
ls /opt/bitnami/apps/wordpress/htdocs/
echo ""
ls