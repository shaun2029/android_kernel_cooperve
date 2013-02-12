#!/bin/bash

export CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
export CC="$CROSS_COMPILE"gcc
export CXX="$CROSS_COMPILE"g++
export ARCH=arm
echo "Listing cross compiler"; sleep 1
ls -l $CROSS_COMPILE*
echo "hit <Enter> to continue or <Ctrl + C> to cancel." && sleep 1 && read

cd common

echo "Ready to compile? Hit <Enter> to Continue or <Ctrl>+<C> to Cancel!";
sleep 1 && read
echo $(date +%Y%m%d%H%M) > .version
make CONFIG_DEBUG_SECTION_MISMATCH=y -j`grep processor /proc/cpuinfo | wc -l`
