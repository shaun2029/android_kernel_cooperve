#!/bin/bash

if [ -f /usr/bin/abootimg ]; then
	if [ -f boot.img ]; then
		abootimg -i boot.img && abootimg -x boot.img && rm bootimg.cfg
	else
		echo 'boot.img not exist, now using ori-boot.img'
		abootimg -i ori-boot.img && abootimg -x ori-boot.img && rm bootimg.cfg
	fi
else
	echo 'need install abootimg, whait install and run this again!'; sleep 5
	sudo apt-get install abootimg
fi
echo 'hit <Enter> to close!!!'; read
