#!/bin/bash

if [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.gz ] || [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.lzma ]; then
	if [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.gz ] && [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.lzma ]; then
		echo 'two ramdisk files era not supported!!!'; sleep 5; exit
	fi
	echo 'have ramdisk'; sleep 5
else
	cd kernel-repack-MD5/ && ./03-compress-ramdisk.lzma.sh; rm boot.img-kernel; cd ..
fi

if [ -d kernel-repack-MD5/CWM_kernel/system/lib/modules ]; then
	rm -Rf kernel-repack-MD5/CWM_kernel/system/lib/modules/*
	cp precompiled-modules/*.ko kernel-repack-MD5/CWM_kernel/system/lib/modules
	find ./common ./modules -name '*.ko' -exec mv -v {} kernel-repack-MD5/CWM_kernel/system/lib/modules \;
else
	mkdir -p kernel-repack-MD5/CWM_kernel/system/lib/modules
	cp precompiled-modules/*.ko kernel-repack-MD5/CWM_kernel/system/lib/modules
	find ./common ./modules -name '*.ko' -exec mv -v {} kernel-repack-MD5/CWM_kernel/system/lib/modules \;
fi

mv ./common/arch/arm/boot/zImage ./kernel-repack-MD5/zImage

if [ -f ./kernel-repack-MD5/zImage ] && [ "$(find ./kernel-repack-MD5/CWM_kernel/system/lib/modules/ -name *.ko)" ]; then
	cd kernel-repack-MD5 && ./04-creat-package.sh && cd ..
else
	echo 'Error - Compile Fail!!!'; sleep 5; exit
fi
