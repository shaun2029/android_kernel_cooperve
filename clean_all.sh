#!/bin/bash

rm -Rf ./Kernel_OutPut/ ./Modules_OutPut/ ./logs/ ./kernel-repack-MD5/PDA-kernel.tar ./kernel-repack-MD5/boot.im* ./kernel-repack-MD5/ramdisk/; clear

export ARCH=arm
export CROSS_COMPILE=$PWD/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
export CCOMPILER=$CROSS_COMPILE

cd common

make distclean; echo 'compilations and configurations clear!!!'; sleep 5
