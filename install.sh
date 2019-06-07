#!/bin/bash

for fileName in .??*
do
    [[ "$fileName" == ".git" ]] && continue
    [[ "$fileName" == ".DS_Store" ]] && continue

    echo "link $fileName to ~/$fileName"
    ln -s $fileName "~/$fileName"
done
