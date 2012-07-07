#!/bin/bash

rm -Rf ./kernel-repack-MD5/zImage ./kernel-repack-MD5/kernel ./kernel-repack-MD5/CWM_kernel/system/lib/modules/*.ko; clear
mkdir logs; clear

export ARCH=arm
export SUBARCH=arm
export LOCALVERSION="-45"
export CROSS_COMPILE=arm-eabi-
export PATH=$(pwd)/toolchain/arm-eabi-4.4.3/bin:$PATH

if [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.gz ] || [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.lzma ]; then
	if [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.gz ] && [ -f kernel-repack-MD5/boot.img-ramdisk.cpio.lzma ]; then
		echo 'two ramdisk files era not supported!!!'; sleep 5; exit
	fi
	echo 'have ramdisk'; sleep 5
else
	cd kernel-repack-MD5/ && ./03-compress-ramdisk.gz.sh; rm boot.img-kernel; cd ..
fi

cd common

if [ -f .config ]; then 
	make clean
else
	cd .. && ./configure.sh && cd common
fi

make silentoldconfig && make modules zImage CONFIG_DEBUG_SECTION_MISMATCH=y -j`grep processor /proc/cpuinfo | wc -l` 2>&1 | tee ../logs/$(date +%Y%m%d-%H%M)-make.log && find . ../modules -name '*.ko' -exec cp -v {} ../kernel-repack-MD5/CWM_kernel/system/lib/modules \;

cd ..

cp ./common/arch/arm/boot/zImage ./kernel-repack-MD5/kernel

if [ -f ./kernel-repack-MD5/kernel ]; then
	cd kernel-repack-MD5 && ./04-creat-package.sh && cd ..
else
	echo 'Compile Fail'
fi

sleep 5
