#!/bin/bash
#rm -Rf kernel/boot.img
#rm -Rf ramdisk
#rm -Rf boot.img-ramdisk.cpio.*
#./04-creat-package-CWM5.sh
#rm -Rf kernel/boot.img
#rm -Rf ramdisk
#rm -Rf boot.img-ramdisk.cpio.*
#./04-creat-package-RZR.sh
#rm -Rf kernel/boot.img
#rm -Rf ramdisk
#rm -Rf boot.img-ramdisk.cpio.*
#./04-creat-package-E3.sh
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.img-ramdisk.cpio.*
./04-creat-package-S5830i.sh
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.img-ramdisk.cpio.*
./04-creat-package-MODULES.sh
echo "ALL DONE";

sleep 5
