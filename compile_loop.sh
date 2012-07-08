#!/bin/bash

#######################
# set value to 1 or 2 #
#######################

export compile=1

while [ $compile = '1' ]; do
	./compile_boot.img.sh
done

while [ $compile = '2' ]; do
	./compile_zImage.sh
done
