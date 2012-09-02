#!/bin/sh
sudo apt-get install netpbm
ppmquant 224 logo_bcm2157_clut224.ppm > logo_custom_224.ppm
sleep 1
rm logo_bcm2157_clut224.ppm
sleep 1
pnmnoraw logo_custom_224.ppm > logo_bcm2157_clut224.ppm
sleep 1
rm logo_custom_224.ppm