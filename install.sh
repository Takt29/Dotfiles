#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for fileName in .??*
do
    [[ "$fileName" == ".git" ]] && continue
    [[ "$fileName" == ".DS_Store" ]] && continue

    echo "link $fileName to ~/$fileName"
    ln -s $SCRIPT_DIR/$fileName ~/
done

set -x
git config --global core.excludesfile ~/.gitignore_global
