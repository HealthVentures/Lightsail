#!/bin/bash
# 
# Cleanup lightsail git clone folder after setup
#
echo "]]] CLEANUP GIT CLONE FILES POST INSTALLATION [[["
echo ""

cd ~/Lightsail

rm set_wp*
rm remov*
rm READ*
rm init*
rm test*

# Only leave restart_apache and renew_ssl
