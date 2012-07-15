#!/bin/bash

echo '#Samsung' > /etc/udev/rules.d/99-android.rules
echo 'SUBSYSTEM=="usb", SYSFS{idVendor}=="04e8", MODE="0666"' >> /etc/udev/rules.d/99-android.rules
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="0005"' >> /etc/udev/rules.d/99-android.rules
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="04e8", ATTRS{idProduct}=="685e"' >> /etc/udev/rules.d/99-android.rules
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="04e8", ATTRS{idProduct}=="685d"' >> /etc/udev/rules.d/99-android.rules
echo 'TEST=="/var/run/ConsoleKit/database", \' >> /etc/udev/rules.d/99-android.rules
echo 'RUN+="udev-acl --action=$env{ACTION} --device=$env{DEVNAME}"' >> /etc/udev/rules.d/99-android.rules

chmod a+rx /etc/udev/rules.d/99-android.rules

