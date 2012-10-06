#!/bin/bash

rm k-ok r-ok

if [ -f zImage ] && [ -f boot.img-kernel ]; then
	rm boot.img-kernel; mv zImage boot.img-kernel; clear
	test boot.img-kernel && touch k-ok
else
	mv zImage boot.img-kernel; clear
	test boot.img-kernel && touch k-ok
fi

if [ -f boot.img-ramdisk.cpio.gz ] || [ -f boot.img-ramdisk.cpio.gz ]; then
	if [ -f boot.img-ramdisk.cpio.gz ] && [ -f boot.img-ramdisk.cpio.gz ]; then
		echo "TWO RAMDISK NOT SOPPORTED!";
		sleep 5; exit
	fi
	test boot.img-ramdisk.cpio.gz && echo "RAMDISK in cpio.gz	- Good!"; touch r-ok
	test boot.img-ramdisk.cpio.lzma && echo "RAMDISK in cpio.lzma	- Good!"; touch r-ok
else
	if [ -d ramdisk ]; then
		echo "CREATING RAMDISK";
		./03-compress-ramdisk.lzma.sh
		test boot.img-ramdisk.cpio.lzma && echo "RAMDISK	- OK"; touch r-ok
	else
		echo "Wont rave ramdisk files and folder!";
		sleep 5; exit
	fi
fi

if [ -f k-ok ] && [ -f r-ok ]; then
	rm k-ok r-ok
	echo "Kernel and RAMDISK - OK";
else
	rm k-ok r-ok
	echo "Kernel or RAMDISK - Faill"; sleep 5; exit
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
	mv CWM-boot.img-modules.zip ../$(cat ../common/.version)-CWM-boot.img-modules.zip && 	echo "$(cat ../common/.version)-CWM-kernel-modules.zip <-> READY"
	mv PDA-boot.img.tar ../$(cat ../common/.version)-PDA-boot.img.tar && echo "$(cat ../common/.version)-PDA-boot.img.tar <-> READY"
else
	echo "boot.img creation - Faill"; sleep 5; exit
fi

echo "ALL DONE";

sleep 5
