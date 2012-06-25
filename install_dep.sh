#!/bin/sh
xterm -title 'Install dependencies' -e "

sudo apt-get update && sudo apt-get upgrade

sudo apt-get install qt3-dev-tools g++ ia32-libs

sudo apt-get clean && sudo apt-get autoremove

echo 'Select <No> in next screen!!!'
echo 'hit <Enter> to continue'; read
sudo dpkg-reconfigure -plow dash

echo 'Evertyng Installed!!!'
echo 'Hit <Enter> to Close!!!'
read"
