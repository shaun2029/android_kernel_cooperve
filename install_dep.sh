#!/bin/sh
xterm -title 'Install dependencies' -e "

#sudo apt-get update && sudo apt-get upgrade

sudo apt-get install \
lzma gzip \
binutils-arm-linux-gnueabi \
cpp-4.4-arm-linux-gnueabi \
dpkg-cross \
gobjc++-4.4-arm-linux-gnueabi \
gobjc-4.4-arm-linux-gnueabi \
gcc-4.4-arm-linux-gnueabi \
g++-4.4-arm-linux-gnueabi \
gcc-4.4-arm-linux-gnueabi-base \
ia32-libs \
libstdc++6-4.4-dbg-armel-cross \
libstdc++6-4.4-dev-armel-cross \
libobjc2-armel-cross \
libgomp1-armel-cross \
libgcc1-armel-cross \
libc6-dev-armel-cross \
libc6-armel-cross \
libgcc1-armel-cross \
libc6-dev-armel-cross \
libc6-dbg-armel-cross \
libstdc++6-armel-cross \
qt3-dev-tools


sudo apt-get clean && sudo apt-get autoremove

sudo ln /usr/bin/arm-linux-gnueabi-gcc-4.4 /usr/bin/arm-linux-gnueabi-gcc
sudo ln /usr/bin/arm-linux-gnueabi-gcov-4.4 /usr/bin/arm-linux-gnueabi-gcov
sudo ln /usr/bin/arm-linux-gnueabi-cpp-4.4 /usr/bin/arm-linux-gnueabi-cpp
sudo ln /usr/bin/arm-linux-gnueabi-g++-4.4 /usr/bin/arm-linux-gnueabi-g++

echo 'Select <No> in next screen!!!'
echo 'hit <Enter> to continue'; read
sudo dpkg-reconfigure -plow dash

echo 'Select "armel" as cross compilation system in next screen!!!'
echo 'hit <Enter> to continue'; read
sudo dpkg-reconfigure dpkg-cross

echo 'Evertyng Installed!!!'
echo 'Hit <Enter> to Close!!!'
read"
