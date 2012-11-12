#!/bin/sh
sudo apt-get install netpbm
ppmquant 224 logo_rafael_clut224.ppm > logo_custom_224.ppm
sleep 1
rm logo_rafael_clut224.ppm
sleep 1
pnmnoraw logo_custom_224.ppm > logo_rafael_clut224.ppm
sleep 1
rm logo_custom_224.ppm