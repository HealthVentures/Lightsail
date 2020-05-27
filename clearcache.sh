#!/bin/bash
#
cd /opt/bitnami/apps/wordpress/htdocs/
sudo du -shc wp-content/* | grep et-cache
cd wp-content
dt=`date '+%d/%m/%Y %H:%M:%S'`
echo "$dt"
sudo rm -rf et-cache
cd ~
