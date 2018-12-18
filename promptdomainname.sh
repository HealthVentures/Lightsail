#!/bin/bash

# Get user input test script

read -p "What is your baseline domain name :> " domainname
echo ""
echo "You entered $domainname"
echo ""

wwwdomainname="www.$domainname"

echo "Your domain with the www prefix is > $wwwdomainname"

 



