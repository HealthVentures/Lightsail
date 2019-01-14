#!/bin/bash
#
# CLEAN WORDPRESS FOLDER
#
cd /opt/bitnami/apps/wordpress/htdocs/

# remove files
echo "]]] REMOVING OLD WORDPRESS FILES..."
sudo rm -rf wp*
rm xmlrpc.php 
sudo rm -rf readm*
sudo rm -f license.txt index.php .ht*
clear
echo "]]] WORDPRESS CLEANED"
ls -salt /opt/bitnami/apps/wordpress/htdocs/
