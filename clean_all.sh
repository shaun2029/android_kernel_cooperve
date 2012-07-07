#!/bin/bash

rm -Rf ./logs/ ./kernel-repack-MD5/*-kernel.* ./kernel-repack-MD5/boot.im* ./kernel-repack-MD5/zImage ./kernel-repack-MD5/kernel ./kernel-repack-MD5/ramdisk; clear
rm -Rf ./kernel-repack-MD5/CWM_kernel/boot.img ./kernel-repack-MD5/CWM_kernel/system/lib/modules/*.ko; clear

export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=arm-eabi-
export PATH=$(pwd)/toolchain/arm-eabi-4.4.3/bin:$PATH

cd common

make mrproper
echo 'compilations and configurations clear!!!'; sleep 5
