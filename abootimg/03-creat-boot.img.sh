#!/bin/bash
xterm -title 'Creat boot.img' -e "
if [ -f /usr/bin/abootimg ]; then
	if [ -f config.cfg ] && [ -f zImage ] && [ -f initrd.img ]; then
		rm boot.img PDA-kernel.tar; clear; sleep 5
		abootimg --create boot.img -f config.cfg -k zImage -r initrd.img && tar -cvf PDA-kernel.tar boot.img
	else
		echo 'Error!!! need 3 files (zImage) (initrd.img) (config.cfg)'
	fi
else
	echo 'need install abootimg, whait install and run this again!!!'; sleep 5
	sudo apt-get install abootimg
fi
echo 'Hit <Enter> to close!!!'; read"