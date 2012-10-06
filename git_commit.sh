#!/bin/bash
touch clean && ./Compile.sh
find ./common ./modules -name '.gitignore' -exec rm -Rf -v {} \;
find ./common ./modules ! -uid '1000' -exec chown 1000.1000 -v {} \;
find ./common ./modules ! -perm '0755' -exec chmod 0755 -v {} \;
git add .
git commit -a && touch commit
if [ -f commit ]; then
	git push -u origin master && rm commit
fi
echo 'hit <Enter> to close!!!'; read
