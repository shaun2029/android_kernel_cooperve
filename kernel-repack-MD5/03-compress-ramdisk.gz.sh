#!/bin/bash

cd ./ramdisk/ && rm ../boot.img-ramdisk.gz; clear; sleep 5; find . | cpio -o -H newc | gzip > ../boot.img-ramdisk.gz
