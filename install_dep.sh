#!/bin/bash

sudo apt-get update && sudo apt-get upgrade && \
if [ "$(uname -m)" = "x86_64" ]; then
	sudo apt-get install gnupg openjdk-6-jdk flex bison gperf libsdl1.2-dev perl sparse \
	original-awk libesd0-dev build-essential dpkg-cross qt3-dev-tools lzma gzip zip curl \
	libncurses5-dev zlib1g-dev ia32-libs lib32z1-dev lib32ncurses5-dev gcc-multilib g++-multilib
else
	sudo apt-get install gnupg openjdk-6-jdk flex bison gperf libsdl1.2-dev perl sparse \
	original-awk libesd0-dev build-essential dpkg-cross qt3-dev-tools lzma gzip zip curl \
	libncurses5-dev zlib1g-dev
fi

sudo apt-get clean && sudo apt-get autoremove && echo '' > apt-ok

if [ -f apt-ok ]; then
	rm apt-ok
	echo 'Select <No> in next screen!!!'
	echo 'hit <Enter> to continue'; read
	sudo dpkg-reconfigure -plow dash
	
	echo 'Select "armel" as cross compilation system in next screen!!!'
	echo 'hit <Enter> to continue'; read
	sudo dpkg-reconfigure dpkg-cross
else
	echo 'apt-gat	- FAIL'; sleep 5; exit
fi

if [ -d ~/toolchain ]; then
	cd ~/toolchain && git pull https://github.com/RafaelBaugis/toolchain
else
	cd ~ && git clone https://github.com/RafaelBaugis/toolchain
fi

echo 'Evertyng Installed!!!'
echo 'Hit <Enter> to Close!!!'
read
