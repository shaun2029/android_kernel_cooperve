#!/bin/bash

if [ -f zImage ] && [ -f boot.img-kernel ]; then
	rm boot.img-kernel; clear; mv zImage boot.img-kernel; clear
else
	mv zImage boot.img-kernel; clear
fi

cd mkbootimg

if [ -f ../boot.img-ramdisk.cpio.gz ] && [ -f ../boot.img-kernel ]; then
	md5sum ../boot.img-kernel > md5
	echo './mkbootimg --kernel ../boot.img-kernel --kernelMD5 ' > run.sh
	dd if=md5 of=run.sh bs=1 seek=52 count=32
	echo ' --ramdisk ../boot.img-ramdisk.cpio.gz --base 0x81600000 -o ../boot.img' >> run.sh
fi

if [ -f ../boot.img-ramdisk.cpio.lzma ] && [ -f ../boot.img-kernel ]; then
	md5sum ../boot.img-kernel > md5
	echo './mkbootimg --kernel ../boot.img-kernel --kernelMD5 ' > run.sh
	dd if=md5 of=run.sh bs=1 seek=52 count=32
	echo ' --ramdisk ../boot.img-ramdisk.cpio.lzma --base 0x81600000 -o ../boot.img' >> run.sh
fi

if [ -f run.sh ] && [ -f md5 ]; then
	rm ../boot.img ../*-boot.img.tar ../*-boot.img-modules.zip; clear; sleep 5
	chmod +x run.sh mkbootimg && ./run.sh && rm run.sh md5
	cd ..
	tar -cvf PDA-boot.img.tar boot.img && mv boot.img CWM_kernel/ && cd CWM_kernel && zip -r ../CWM-boot.img-modules.zip . ;
	cd ..
	mv CWM-boot.img-modules.zip ../$(date +%Y%m%d-%H%M)-CWM-boot.img-modules.zip
	mv PDA-boot.img.tar ../$(date +%Y%m%d-%H%M)-PDA-boot.img.tar
	echo 'CWM-kernel-modules.zip <-> READY'
	echo 'PDA-boot.img.tar <-> READY'
else
	echo 'Error - Nothing Done!!!'
fi

sleep 5
