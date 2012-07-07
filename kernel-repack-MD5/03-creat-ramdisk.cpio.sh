#!/bin/bash

if [ -d ramdisk ]; then
	cd ./ramdisk/ && rm ../boot.img-ramdisk.cpio; clear; sleep 5; find . | cpio -o -H newc > ../boot.img-ramdisk.cpio
else
	rm boot.img-ramdisk.cpio
	./02-decompress-ramdisk.sh
fi
