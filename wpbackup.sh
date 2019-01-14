#!/bin/bash
#
# SAVE WORDPRESS THEMES, PLUGINS AND UPLOADS
#
cd /opt/bitnami/apps/wordpress/htdocs/

# create folder to save files
mkdir sav

# copy wp files to save directory preserve/recurse
cp wp-config.php sav/
cp -pr wp-content/plugins sav/
cp -pr wp-content/themes sav/
cp -pr wp-content/uploads sav/

