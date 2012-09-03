#!/bin/bash
touch clean && ./Compile.sh
git add .
git commit -a && touch commit
if [ -f commit ]; then
	git push -u origin master && rm commit
fi
echo 'hit <Enter> to close!!!'; read
