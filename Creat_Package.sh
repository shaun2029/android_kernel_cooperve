#!/bin/bash

if [ -d kernel-repack-MD5/CWM_kernel/system/etc/init.d ]; then
	echo "Have init.d folder";
else
	echo "Creat init.d folder";
	mkdir -p kernel-repack-MD5/CWM_kernel/system/etc/init.d
fi

if [ -d kernel-repack-MD5/CWM_kernel/system/lib/modules ]; then
	rm -Rf kernel-repack-MD5/CWM_kernel/system/lib/modules/*
	find ./common ./modules -name '*.ko' -exec mv -v {} kernel-repack-MD5/CWM_kernel/system/lib/modules \;
	mv kernel-repack-MD5/CWM_kernel/system/lib/modules/bcm4330.ko kernel-repack-MD5/CWM_kernel/system/lib/modules/dhd.ko
else
	mkdir -p kernel-repack-MD5/CWM_kernel/system/lib/modules
	find ./common ./modules -name '*.ko' -exec mv -v {} kernel-repack-MD5/CWM_kernel/system/lib/modules \;
	mv kernel-repack-MD5/CWM_kernel/system/lib/modules/bcm4330.ko kernel-repack-MD5/CWM_kernel/system/lib/modules/dhd.ko
fi

mv ./common/arch/arm/boot/zImage ./kernel-repack-MD5/zImage

if [ -f ./kernel-repack-MD5/zImage ] && [ "$(find ./kernel-repack-MD5/CWM_kernel/system/lib/modules/ -name *.ko)" ]; then
	cd kernel-repack-MD5 && ./04-creat-package.sh && cd ..
else
	echo 'Error - Compile Fail!!!'; sleep 5; exit
fi
