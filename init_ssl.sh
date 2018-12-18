#!/bin/bash
#
# Lightsail: Setup CertBot for SSL Install
#
echo "]]] Lightsail: Setup CertBot for SSL Install"
echo ""
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

#!/bin/bash
echo "...Get SSL Certificate for Domain"
echo ""

read -p "What is your baseline domain name? :> " domainname
echo ""

wwwdomainname="www.$domainname"

echo "... Installing certificate for:"
echo "... $domainname and $wwwdomainname"
echo ""

# --- figure out how to pause better
# read -p "Continue (y/n)? " -n 1 -r
# if [[ ! $REPLY =~ ^[Yy]$ ]]
# then
#    exit 1

# CONTINUE TO INSTALL CERT

echo "...Get SSL Certificate for Domain"
cd /opt/bitnami/letsencrypt
sudo ./certbot-auto certonly --webroot -w /opt/bitnami/apps/wordpress/htdocs/ -d $wwwdomainname -d $domainname

echo "...Rename existing keys to .old"
mv /opt/bitnami/apache2/conf/server.key /opt/bitnami/apache2/conf/serverkey.old
mv /opt/bitnami/apache2/conf/server.crt /opt/bitnami/apache2/conf/servercrt.old

echo "...Create symlink to Domain SSL keys"
sudo ln -s /etc/letsencrypt/live/$wwwdomainname/fullchain.pem /opt/bitnami/apache2/conf/server.crt
sudo ln -s /etc/letsencrypt/live/$wwwdomainname/privkey.pem /opt/bitnami/apache2/conf/server.key

echo ""
echo "...Next Step: Update wp_config for https prefix"
echo "...Next Step: Restart Apache"

