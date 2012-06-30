#!/bin/bash

cd ./ramdisk/ && rm ../boot.img-ramdisk.lzma; clear; sleep 5; find . | cpio -o -H newc | lzma > ../boot.img-ramdisk.lzma
