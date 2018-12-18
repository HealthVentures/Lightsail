#!/bin/bash
echo "...Get SSL Certificate for Domain"

read -p "What is your baseline domain name? :> " domainname
echo ""

wwwdomainname="www.$domainname"

echo "We will proceed to install the certificate with:"
echo "$domainname and $wwwdomainname"

read -p "Continue (y/n)? " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1

# CONTINUE TO INSTALL CERT

sudo ./certbot-auto certonly --webroot -w /opt/bitnami/apps/wordpress/htdocs/ -d $wwwdomainname -d $domainname
echo "...Rename existing keys to .old"
mv /opt/bitnami/apache2/conf/server.key /opt/bitnami/apache2/conf/serverkey.old
mv /opt/bitnami/apache2/conf/server.crt /opt/bitnami/apache2/conf/servercrt.old
echo "...Create symlink to Domain SSL keys"
sudo ln -s/etc/letsencrypt/live/$wwwdomainname/fullchain.pem /opt/bitnami/apache2/conf/server.crt
sudo ln -s/etc/letsencrypt/live/$wwwdomainname/privkey.pem /opt/bitnami/apache2/conf/server.key
echo "...Next Step: Update wp_config for https prefix"
echo "...Next Step: Restart Apache"