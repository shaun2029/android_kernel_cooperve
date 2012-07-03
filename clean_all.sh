#!/bin/bash

rm -Rf ./Kernel_OutPut/ ./Modules_OutPut/ ./logs/ ./kernel-repack-MD5/PDA-kernel.tar ./kernel-repack-MD5/boot.im* ./kernel-repack-MD5/ramdisk/; clear

export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=arm-eabi-
export PATH=$(pwd)/toolchain/arm-eabi-4.4.3/bin:$PATH

cd common

make distclean
find . ./ -name '.*' -exec rm -Rf {} \;
find . ../modules -name '.*' -exec rm -Rf {} \;
echo 'compilations and configurations clear!!!'; sleep 5
