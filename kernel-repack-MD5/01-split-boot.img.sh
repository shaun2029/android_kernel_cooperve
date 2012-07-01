#!/bin/bash

if [ -f ./boot.img ]; then
	echo 'now split boot.img'; sleep 5
else
	echo 'boot.img not exist, now use ori-boot.img'; sleep 5
	cp ori-boot.img boot.img
fi
cd mkbootimg
if [ -f ../boot.img ]; then
	rm ../boot.img-ramdisk.gz ../boot.img-ramdisk.lzma ../boot.img-kernel; clear; sleep 5
else
	echo 'cant read file'; sleep 5; exit
fi
perl split_bootimg.pl ../boot.img && rm ../boot.img; echo 'hit <Enter> to continue'; read
mv boot.img-kernel ../
gzip -t -v boot.img-ramdisk.gz && mv boot.img-ramdisk.gz ../; clear
lzma -t -v boot.img-ramdisk.gz && mv boot.img-ramdisk.gz ../boot.img-ramdisk.lzma; clear

