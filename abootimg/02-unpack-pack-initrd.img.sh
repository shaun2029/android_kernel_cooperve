#!/bin/bash
if [ -f initrd.img ]; then
	abootimg-unpack-initrd && rm initrd.img
else
	abootimg-pack-initrd && rm -Rf ramdisk
fi