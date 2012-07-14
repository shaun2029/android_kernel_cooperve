#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-bcm21553-eabi-
export PATH=~/toolchain/arm-bcm21553-eabi/bin:$PATH

cd common

if [ -f .config ]; then 
	make clean && make xconfig
else
	make mrproper && make bcm21553_cooperve_defconfig && make xconfig
fi

cd ..
