#!/bin/bash
echo "...Get SSL Certificate for Domain"
sudo ./certbot-auto certonly --webroot -w /opt/bitnami/apps/wordpress/htdocs/ -d www.lindaarnold.org -d lindaarnold.org
echo "...Rename existing keys to .old"
mv /opt/bitnami/apache2/conf/server.key /opt/bitnami/apache2/conf/serverkey.old
mv /opt/bitnami/apache2/conf/server.crt /opt/bitnami/apache2/conf/servercrt.old
echo "...Create symlink to Domain SSL keys"
sudo ln -s/etc/letsencrypt/live/www.lindaarnold.org/fullchain.pem /opt/bitnami/apache2/conf/server.crt
sudo ln -s/etc/letsencrypt/live/lindaarnold.org/privkey.pem /opt/bitnami/apache2/conf/server.key
echo "...Next Step: Update wp_config for https prefix"
echo "...Next Step: Restart Apache"
