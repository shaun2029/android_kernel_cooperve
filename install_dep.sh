#!/bin/sh
xterm -title 'Install dependencies' -e "

sudo apt-get update && sudo apt-get upgrade

if [ '$(uname -m)' = 'x86_64' ]; then
	sudo apt-get install gnupg openjdk-6-jdk flex bison gperf libsdl1.2-dev perl sparse \
	original-awk libesd0-dev libwxgtk2.6-dev build-essential dpkg-cross qt3-dev-tools lzma \
	gzip zip curl libncurses5-dev zlib1g-dev ia32-libs lib32z1-dev lib32ncurses5-dev \
	gcc-multilib g++-multilib binutils-arm-linux-gnueabi cpp-4.4-arm-linux-gnueabi \
	gobjc++-4.4-arm-linux-gnueabi gobjc-4.4-arm-linux-gnueabi gcc-4.4-arm-linux-gnueabi \
	g++-4.4-arm-linux-gnueabi gcc-4.4-arm-linux-gnueabi-base libstdc++6-4.4-dev-armel-cross \
	libobjc2-armel-cross libgomp1-armel-cross libgcc1-armel-cross libc6-dev-armel-cross \
	libc6-armel-cross libgcc1-armel-cross libc6-dev-armel-cross libstdc++6-armel-cross
else
	sudo apt-get install gnupg openjdk-6-jdk flex bison gperf libsdl1.2-dev perl sparse \
	original-awk libesd0-dev libwxgtk2.6-dev build-essential dpkg-cross qt3-dev-tools lzma \
	gzip zip curl libncurses5-dev zlib1g-dev binutils-arm-linux-gnueabi cpp-4.4-arm-linux-gnueabi \
	gobjc++-4.4-arm-linux-gnueabi gobjc-4.4-arm-linux-gnueabi gcc-4.4-arm-linux-gnueabi \
	g++-4.4-arm-linux-gnueabi gcc-4.4-arm-linux-gnueabi-base libstdc++6-4.4-dev-armel-cross \
	libobjc2-armel-cross libgomp1-armel-cross libgcc1-armel-cross libc6-dev-armel-cross \
	libc6-armel-cross libgcc1-armel-cross libc6-dev-armel-cross libstdc++6-armel-cross
fi

sudo apt-get clean && sudo apt-get autoremove

if [ -f /usr/bin/arm-linux-gnueabi-gcc-4.4 ]; then
	if [ -f /usr/bin/arm-linux-gnueabi-gcc ]; then
		sudo rm /usr/bin/arm-linux-gnueabi-gcc && sudo ln /usr/bin/arm-linux-gnueabi-gcc-4.4 /usr/bin/arm-linux-gnueabi-gcc
	else
		sudo ln /usr/bin/arm-linux-gnueabi-gcc-4.4 /usr/bin/arm-linux-gnueabi-gcc
	fi
else
	echo 'arm-linux-gnueabi-gcc-4.4 not installed!!!'
fi

if [ -f /usr/bin/arm-linux-gnueabi-gcov-4.4 ]; then
	if [ -f /usr/bin/arm-linux-gnueabi-gcov ]; then
		sudo rm /usr/bin/arm-linux-gnueabi-gcov && sudo ln /usr/bin/arm-linux-gnueabi-gcov-4.4 /usr/bin/arm-linux-gnueabi-gcov
	else
		sudo ln /usr/bin/arm-linux-gnueabi-gcov-4.4 /usr/bin/arm-linux-gnueabi-gcov
	fi
else
	echo 'arm-linux-gnueabi-gcov-4.4 not installed!!!'
fi

if [ -f /usr/bin/arm-linux-gnueabi-cpp-4.4 ]; then
	if [ -f /usr/bin/arm-linux-gnueabi-cpp ]; then
		sudo rm /usr/bin/arm-linux-gnueabi-cpp && sudo ln /usr/bin/arm-linux-gnueabi-cpp-4.4 /usr/bin/arm-linux-gnueabi-cpp
	else
		sudo ln /usr/bin/arm-linux-gnueabi-cpp-4.4 /usr/bin/arm-linux-gnueabi-cpp
	fi
else
	echo 'arm-linux-gnueabi-cpp-4.4 not installed!!!'
fi

if [ -f /usr/bin/arm-linux-gnueabi-g++-4.4 ]; then
	if [ -f /usr/bin/arm-linux-gnueabi-g++ ]; then
		sudo rm /usr/bin/arm-linux-gnueabi-g++ && sudo ln /usr/bin/arm-linux-gnueabi-g++-4.4 /usr/bin/arm-linux-gnueabi-g++
	else
		sudo ln /usr/bin/arm-linux-gnueabi-g++-4.4 /usr/bin/arm-linux-gnueabi-g++
	fi
else
	echo 'arm-linux-gnueabi-g++-4.4 not installed!!!'
fi

echo 'Select <No> in next screen!!!'
echo 'hit <Enter> to continue'; read
sudo dpkg-reconfigure -plow dash

echo 'Select "armel" as cross compilation system in next screen!!!'
echo 'hit <Enter> to continue'; read
sudo dpkg-reconfigure dpkg-cross

echo 'Evertyng Installed!!!'
echo 'Hit <Enter> to Close!!!'
read"
