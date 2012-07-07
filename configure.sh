#!/bin/bash

mkdir logs; clear
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

cd ..
