#!/bin/bash

read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "yaaa";
  echo "more statements";
  echo "and even more stuff to do";
else
  echo "booo";	
fi
