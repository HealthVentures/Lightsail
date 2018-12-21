#!/bin/bash
#
# LIGHTSAIL MULTISITE PREP
#
# DOCS: 
# https://docs.bitnami.com/aws/apps/wordpress-multisite/
# https://docs.bitnami.com/aws/apps/wordpress-multisite/configuration/configure-wordpress-multisite/
#
echo "]]] Lightsail Multisite Prep [[["
echo ""

echo "... Turn of Bitnami Banner"
cd /opt/bitnami/apps/wordpress
sudo ./bnconfig — disable_banner 1


echo ""
read -p "What is your baseline domain name? :> " domainname
echo ""

# wwwdomainname="www.$domainname"

echo "... Update Bitnami domain name"
sudo ./bnconfig --machine_hostname $domainname

echo "... Turn off Bitnami auto IP reset on reboot"
sudo mv bnconfig bnconfig.disabled

echo "... Restarting Apache"
sudo /opt/bitnami/ctlscript.sh restart apache

echo "... Next install SSL"

# multiblog ssl doc
# https://docs.bitnami.com/aws/apps/wordpress-multisite/administration/use-different-ssl-certificates/

echo "... Also update wp_config domain names"
