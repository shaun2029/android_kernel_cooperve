#!/bin/bash

sudo apt-get update && \
if [ "$(uname -m)" = "x86_64" ]; then
	sudo apt-get install gnupg openjdk-6-jdk flex bison gperf libsdl1.2-dev perl sparse \
	original-awk libesd0-dev build-essential dpkg-cross qt3-dev-tools lzop lzma gzip zip curl \
	libncurses5-dev zlib1g-dev ia32-libs lib32z1-dev lib32ncurses5-dev gcc-multilib \
	g++-multilib gettext texinfo git-core gcc-arm-4.4-linux-gnueabi && touch apt-ok
else
	sudo apt-get install gnupg openjdk-6-jdk flex bison gperf libsdl1.2-dev perl sparse \
	original-awk libesd0-dev build-essential dpkg-cross qt3-dev-tools lzop lzma gzip zip curl \
	libncurses5-dev zlib1g-dev gettext texinfo git-core gcc-4.4-arm-linux-gnueabi && touch apt-ok
fi

sudo ln -s /usr/bin/arm-linux-gnueabi-cpp-4.4 /usr/bin/arm-linux-gnueabi-cpp
sudo ln -s /usr/bin/arm-linux-gnueabi-gcc-4.4 /usr/bin/arm-linux-gnueabi-gcc
sudo ln -s /usr/bin/arm-linux-gnueabi-gcov-4.4 /usr/bin/arm-linux-gnueabi-gcov

if [ -f apt-ok ]; then
	rm apt-ok
	echo 'System	- Up-dated';
else
	echo 'apt-get update	- FAIL'; sleep 5; exit
fi

sudo apt-get clean && sudo apt-get autoremove && touch clean

if [ -f clean ]; then
	rm clean
	echo 'System	- Clean';
else
	echo 'apt-get clean	- Fail'; sleep 5; exit
fi
