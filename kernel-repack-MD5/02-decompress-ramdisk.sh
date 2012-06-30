#!/bin/bash

if [ -f ./ramdisk/default.prop ] || [ -f ./ramdisk/init* ]; then
	echo 'please dele directory ./ramdisk/'; sleep 5; exit
else
	rm -Rf ./ramdisk/; clear; sleep 5
	if [ -f boot.img-ramdisk.gz ] && [ -f boot.img-ramdisk.lzma ]; then
		echo 'Please!!! two ramdisk files are not extracted!!!'
		echo 'hit <Enter> to close!!!'; read; exit
	else
		if [ -f boot.img-ramdisk.gz ]; then
			mkdir ramdisk && cd ramdisk && gzip -dc ../boot.img-ramdisk.gz | cpio -i; strings fsr.ko | grep vermagic; cd ..
			rm boot.img-ramdisk.gz
		fi
		if [ -f boot.img-ramdisk.lzma ]; then
			mkdir ramdisk && cd ramdisk && lzma -dc ../boot.img-ramdisk.lzma | cpio -i; strings fsr.ko | grep vermagic; cd ..
			rm boot.img-ramdisk.lzma
		fi
	fi
fi
echo 'hit <Enter> to close!!!'; read
