#!/bin/bash

rm -Rf ./Kernel_OutPut ./Modules_OutPut; mkdir logs; clear
mkdir ./Kernel_OutPut
mkdir -p ./Modules_OutPut/system/lib/modules

export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=arm-eabi-
export PATH=$(pwd)/toolchain/arm-eabi-4.4.3/bin:$PATH

cd common

if [ -f .config ]; then 
	make clean && make xconfig
else
	make mrproper && make bcm21553_cooperve_defconfig && make xconfig
fi

make silentoldconfig && make modules zImage CONFIG_DEBUG_SECTION_MISMATCH=y -j`grep processor /proc/cpuinfo | wc -l` 2>&1 | tee ../logs/$(date +%Y%m%d-%H%M)-make.log && find . ../modules -name '*.ko' -exec cp -v {} ../Modules_OutPut/system/lib/modules \;

cd ..

cp ./common/arch/arm/boot/zImage ./Kernel_OutPut/

if [ -f ./Kernel_OutPut/zImage ]; then
	echo 'Kernel and Modules Compiled and stored in folders ./Kernel_OutPut ./Modules_OutPut'
else
	echo 'Compile Fail'
fi

echo 'Hit <Enter> to continue!!!'; read
