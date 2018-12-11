#!/bin/bash
sudo apt-get update
sudo apt-get autoclean
sudo mkdir /opt/bitnami/letsencrypt
cd /opt/bitnami/letsencrypt
sudo wget https://dl.eff.org/certbot-auto
sudo chmod a+x ./certbot-auto
sudo ./certbot-auto
