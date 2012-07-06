#!/bin/bash

mkdir logs; clear
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=arm-eabi-
export PATH=$(pwd)/toolchain/arm-eabi-4.4.3/bin:$PATH

cd common

if [ -f .config ]; then 
	make clean
else
	cd .. && ./configure.sh && cd common
fi

make silentoldconfig && make modules zImage CONFIG_DEBUG_SECTION_MISMATCH=y -j`grep processor /proc/cpuinfo | wc -l` 2>&1 | tee ../logs/$(date +%Y%m%d-%H%M)-make.log && find . ../modules -name '*.ko' -exec cp -v {} ../kernel-repack-MD5/CWM_kernel/system/lib/modules \;

cd ..

cp ./common/arch/arm/boot/zImage ./kernel-repack-MD5/

if [ -f ./kernel-repack-MD5/zImage ]; then
	echo 'Kernel and Modules Compiled and stored in folders ./kernel-repack-MD5'
else
	echo 'Compile Fail'
fi

sleep 5
