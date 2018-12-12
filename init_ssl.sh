#!/bin/bash
#
# Lightsail: Setup CertBot for SSL Install
# TEST NEW COMMENT FOR GITHUB
#
echo "]]] Lightsail: Setup CertBot for SSL Install"
echo "...Update Apt-Get"
sudo apt-get update
echo "...Autoclean"
sudo apt-get autoclean
echo "...MkDir LetsEncrypt"
sudo mkdir /opt/bitnami/letsencrypt
cd /opt/bitnami/letsencrypt
echo "...WGet CertBot"
sudo wget https://dl.eff.org/certbot-auto
echo "...Set CertBot Executable"
sudo chmod a+x ./certbot-auto
echo "...RunCertBot"
sudo ./certbot-auto
echo "...Query DomainName"
# how to request name and store in variable?
# var1=base domain
# var2='www.'+basedomain
exit
# how to use variable?
echo "...Get SSL Certificate for Domain"
sudo ./certbot-auto certonly --webroot -w /opt/bitnami/apps/wordpress/htdocs/ -d www.example.com -d example.com
echo "...Rename existing keys to .old"
mv /opt/bitnami/apache2/conf/server.key /opt/bitnami/apache2/conf/serverkey.old
mv /opt/bitnami/apache2/conf/server.crt /opt/bitnami/apache2/conf/servercrt.old
echo "...Create symlink to Domain SSL keys"
sudo ln -s/etc/letsencrypt/live/[DOMAIN]/fullchain.pem /opt/bitnami/apache2/conf/server.crt
sudo ln -s/etc/letsencrypt/live/[DOMAIN]/privkey.pem /opt/bitnami/apache2/conf/server.key
echo "...Next Step: Restart Apache"
