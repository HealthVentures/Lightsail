#!/bin/bash

# Get user input test script

read -p "What is your baseline domain name :> " domainname
echo ""
echo "You entered $domainname"
echo ""

wwwdomainname="www.$domainname"

echo "Your domain with the www prefix is > $wwwdomainname"

# --- figure out how to pause better
read -p "Continue (y/n)? " -n 1 -r
if 
	[[ ! $REPLY =~ ^[Yy]$ ]]
then
	exit 1

eco "script continues because of yes"	

 



