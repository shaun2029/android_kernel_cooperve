#!/bin/bash

export loop=0

while [ $loop=0 ]; do
	./compile.sh
	cd kernel-repack-MD5
	./04-creat-boot.img.sh
	mv CWM-kernel.zip ../../$(date +%Y%m%d-%H%M)-CWM-kernel.zip
	mv PDA-kernel.tar ../../$(date +%Y%m%d-%H%M)-PDA-kernel.tar
	cd ..
done
	
