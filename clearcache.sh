#!/bin/bash
#
cd /opt/bitnami/apps/wordpress/htdocs/
sudo du -shc wp-content/* | grep et-cache
cd wp-content
sudo rm -rf et-cache
cd ~
