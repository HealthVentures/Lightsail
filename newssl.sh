#!/bin/bash

# #########################
# --- bash script to install Bitnami SSL Certbot
# --- 2021-01-13 Wednesday 10:40 AM 
# --- https://docs.bitnami.com/general/how-to/understand-bncert/
# #########################

wget -O bncert-linux-x64.run https://downloads.bitnami.com/files/bncert/latest/bncert-linux-x64.run
sudo mkdir /opt/bitnami/bncert
sudo mv bncert-linux-x64.run /opt/bitnami/bncert/
sudo chmod +x /opt/bitnami/bncert/bncert-linux-x64.run
sudo ln -s /opt/bitnami/bncert/bncert-linux-x64.run /opt/bitnami/bncert-tool

# --- now run
read -p "Press enter to setup new SSL certificate:"

sudo /opt/bitnami/bncert-tool
