#!/bin/bash
xterm -title 'Configure to Compile Modules and Kernel' -e "

rm -Rf ./Kernel_OutPut ./Modules_OutPut; mkdir logs; clear
mkdir ./Kernel_OutPut
mkdir -p ./Modules_OutPut/system/lib/modules

if [ -f /usr/bin/arm-linux-gnueabi-gcc ] && [ -f /usr/bin/arm-linux-gnueabi-gcov ] && [ -f /usr/bin/arm-linux-gnueabi-g++ ] && [ -f /usr/bin/arm-linux-gnueabi-cpp ]; then
	export CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
else
	export CROSS_COMPILE=$PWD/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
fi

export ARCH=arm
export CCOMPILER=$CROSS_COMPILE

cd common

if [ -f .config ]; then
	make clean 
else
	make distclean && make bcm21553_cooperve_defconfig
fi

make xconfig && make silentoldconfig && make modules CONFIG_DEBUG_SECTION_MISMATCH=y -j`grep processor /proc/cpuinfo | wc -l` 2>&1 | tee ../logs/$(date +%Y%m%d-%H%M)-make-modules.log

find . ../modules -name '*.ko' -exec cp -v {} ../Modules_OutPut/system/lib/modules \;
echo 'Modules Compiled and stored in folder ./Modules_OutPut'; echo 'Hit <Enter> to compile Kernel'; read

make clean && make zImage CONFIG_DEBUG_SECTION_MISMATCH=y -j`grep processor /proc/cpuinfo | wc -l` 2>&1 | tee ../logs/$(date +%Y%m%d-%H%M)-make-kernel.log

cd ..

cp ./common/arch/arm/boot/zImage ./Kernel_OutPut/

if [ -f ./Kernel_OutPut/zImage ]; then
	echo 'Kernel Compiled and stored in folder ./Kernel_OutPut'
else
	echo 'Compile Fail'
fi
echo 'Hit <Enter> to continue!!!'; read"
