#!/bin/bash

read -p "Continue (y/n)? " -n 1 -r
if 
	[[ ! $REPLY =~ ^[Yy]$ ]]
then
	exit 1

eco "script continues because of yes"	

 



