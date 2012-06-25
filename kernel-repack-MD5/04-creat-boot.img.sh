#!/bin/sh
xterm -title 'MERGE RANDISK AND zImage TO boot.img' -e "
if [ -f zImage ] && [ boot.img-kernel ]; then
	rm boot.img-kernel; clear; mv zImage boot.img-kernel; clear
else
	mv zImage boot.img-kernel; clear
fi
cd mkbootimg
if [ -f ../boot.img-ramdisk.gz ] && [ -f ../boot.img-kernel ]; then
	rm md5 md5out
	md5sum ../boot.img-kernel > md5
	dd if=md5 of=md5out bs=1 seek=0 count=32
	rm ../boot.img ../PDA-kernel.tar; clear; sleep 5
	./mkbootimg --kernel ../boot.img-kernel --kernelMD5 'cat md5out' --ramdisk ../boot.img-ramdisk.gz --base 0x81600000 -o ../boot.img
else
	echo 'cant read files'; sleep 5; exit
fi
cd ..
tar -cvf PDA-kernel.tar boot.img
echo 'READY'
echo ''
echo 'PDA-kernel.tar'
echo 'READY'
echo 'hit <Enter> to close!'; read"
