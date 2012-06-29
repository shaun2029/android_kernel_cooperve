#!/bin/bash
xterm -title 'Clean all' -e "

rm -Rf ./Kernel_OutPut/ ./Modules_OutPut/ ./logs/ ./kernel-repack-MD5/PDA-kernel.tar ./kernel-repack-MD5/boot.im* ./kernel-repack-MD5/ramdisk/; clear

if [ -f /usr/bin/arm-linux-gnueabi-gcc ] && [ -f /usr/bin/arm-linux-gnueabi-gcov ] && [ -f /usr/bin/arm-linux-gnueabi-g++ ] && [ -f /usr/bin/arm-linux-gnueabi-cpp ]; then
	export CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
else
	export CROSS_COMPILE=$PWD/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
fi

export ARCH=arm
export CCOMPILER=$CROSS_COMPILE

cd common

make distclean; echo 'compilations and configurations clear!!!'; sleep 5"
