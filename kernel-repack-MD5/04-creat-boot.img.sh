#!/bin/bash

if [ -f zImage ] && [ -f boot.img-kernel ]; then
rm boot.img-kernel; clear; mv zImage boot.img-kernel; clear
else
mv zImage boot.img-kernel; clear
fi
cd mkbootimg
if [ -f ../boot.img-ramdisk.gz ] && [ -f ../boot.img-ramdisk.lzma ]; then
	echo 'Please!!! two ramdisk files are not supported!!!'
	echo 'hit <Enter> to close!!!'; read; exit
else
	if [ -f ../boot.img-ramdisk.gz ] && [ -f ../boot.img-kernel ]; then
		md5sum ../boot.img-kernel > md5
		echo './mkbootimg --kernel ../boot.img-kernel --kernelMD5 ' > run.sh
		dd if=md5 of=run.sh bs=1 seek=52 count=32
		echo ' --ramdisk ../boot.img-ramdisk.gz --base 0x81600000 -o ../boot.img' >> run.sh
	fi
	if [ -f ../boot.img-ramdisk.lzma ] && [ -f ../boot.img-kernel ]; then
		md5sum ../boot.img-kernel > md5
		echo './mkbootimg --kernel ../boot.img-kernel --kernelMD5 ' > run.sh
		dd if=md5 of=run.sh bs=1 seek=52 count=32
		echo ' --ramdisk ../boot.img-ramdisk.lzma --base 0x81600000 -o ../boot.img' >> run.sh
	fi
fi
if [ -f run.sh ] && [ -f md5 ]; then
	rm ../boot.img ../PDA-kernel.tar; clear; sleep 5
	chmod +x run.sh mkbootimg && ./run.sh && rm run.sh md5
	cd ..
	tar -cvf PDA-kernel.tar boot.img && rm boot.img-ramdisk.lzma boot.img-ramdisk.gz boot.img-kernel; clear
	echo 'PDA-kernel <-> READY'
else
	echo 'boot.img not created!!!'
fi
echo 'hit <Enter> to close!'; read
