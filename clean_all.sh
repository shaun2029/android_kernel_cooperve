#!/bin/bash
xterm -title 'Clean all' -e "

rm -Rf ./Kernel_OutPut/ ./Modules_OutPut/ ./logs/ ./kernel-repack-MD5/PDA-kernel.tar ./kernel-repack-MD5/boot.im* ./kernel-repack-MD5/ramdisk/; clear

# SET ARCHTETURE
export ARCH=arm

# SET CROSS_COMPILE prefix-
#export CROSS_COMPILE=arm-linux-gnueabi-
export CROSS_COMPILE=arm-eabi-

# PATH TO CROSS_COMPILER BINARY FOLDER
export PATH=$PATH:/usr/bin
export PATH=$PATH:$PWD/toolchain/arm-eabi-4.4.3/bin

cd common
make distclean; echo 'compilations and configurations clear!!!'; sleep 5"
