#!/bin/sh
find ./common ./modules -name '.gitignore' -exec rm -Rf -v {} \;
find ./common ./modules -name '*' -exec chmod 755 -v {} \;
