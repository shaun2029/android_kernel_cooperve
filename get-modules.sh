#!/bin/bash
mkdir ~/Modules; clear
find ./common ./modules -name '*.ko' -exec cp -v {} ~/Modules \;
mkdir ~/Kernel
find ./common -name 'zImage' -exec cp -v {} ~/Kernel \;
