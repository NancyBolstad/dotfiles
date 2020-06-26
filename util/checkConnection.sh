#!/bin/bash

if ping -c 1 google.com
  then
  echo "It appears you have a working internet connection"
fi