#!/bin/bash
#
# Lightsail: Autorenew Certbot SSL
#
echo "]]] Lightsail: Autorenew Certbot SSL"
#
echo "...Update Apt-Get"
sudo apt-get update
echo "...Autoclean"
sudo apt-get autoclean
cd /opt/bitnami/letsencrypt
echo "...Certbot Autorenew"
sudo ./certbot-auto renew
echo "...Restarting Apache"
sudo /opt/bitnami/ctlscript.sh restart apache