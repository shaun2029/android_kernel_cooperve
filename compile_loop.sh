#!/bin/bash

export loop=4

while [ "$loop >= 1" ]; do
	./compile_boot.img.sh
	loop=loop-1
done


