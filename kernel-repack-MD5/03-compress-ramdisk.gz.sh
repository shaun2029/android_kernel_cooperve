#!/bin/bash
if [ -d ramdisk ]; then
	cd ./ramdisk/ && rm ../boot.img-ramdisk.cpio.gz; clear; sleep 5; find . | cpio -o -H newc | gzip > ../boot.img-ramdisk.cpio.gz
else
	./02-decompress-ramdisk.sh && cd ./ramdisk/ && rm ../boot.img-ramdisk.cpio.gz; clear; sleep 5; find . | cpio -o -H newc | gzip > ../boot.img-ramdisk.cpio.gz
fi
