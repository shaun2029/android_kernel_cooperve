#!/bin/bash

mkdir -p ramdisk/data
mkdir -p ramdisk/dev
mkdir -p ramdisk/lib/modules
mkdir -p ramdisk/proc
mkdir -p ramdisk/sys
mkdir -p ramdisk/system
mkdir -p ramdisk/tmp

cd ./ramdisk/ && rm ../boot.img-ramdisk.cpio.lzma; clear; sleep 5; find . | cpio -o -H newc | lzma > ../boot.img-ramdisk.cpio.lzma
