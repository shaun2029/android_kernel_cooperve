#!/bin/bash
touch clean && ./Compile.sh
find ./common ./modules -name '.gitignore' -exec rm -Rf -v {} \;
find ./common ./modules -name '*' -exec chown 1000.1000 -v {} \;
find ./common ./modules -name '*' -exec chmod 755 -v {} \;
git add .
git commit -a && touch commit
if [ -f commit ]; then
	git push -u origin master && rm commit
fi
echo 'hit <Enter> to close!!!'; read
