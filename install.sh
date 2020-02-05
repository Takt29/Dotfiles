#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# link dotfiles

for fileName in .??*
do
    [[ $fileName =~ \~$ ]] && continue
    [[ $fileName == ".git" ]] && continue
    [[ $fileName == ".gitignore" ]] && continue
    [[ $fileName == ".DS_Store" ]] && continue

    echo "link $fileName to ~/$fileName"
    ln -s $SCRIPT_DIR/$fileName ~/
done

source ~/.zprofile ~/.zshrc

set -x

# link other files
mkdir -p ~/Library/KeyBindings
ln -s $SCRIPT_DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/

# setup git

git config --global core.excludesfile ~/.gitignore_global

# setup brew

if ! [ -x "$(command -v git)" ]; then
    echo "install brew"
    set +x
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    set -x
fi

brew install rcmdnk/file/brew-file
brew file install

# setup emacs

cd ~/.emacs.d/
cask upgrade
cask install

# setup nodebrew

nodebrew setup
nodebrew install stable
nodebrew use stable
npm update -g npm

# setup BasicTex

sudo tlmgr update --self --all
sudo tlmgr paper a4
sudo tlmgr install collection-langjapanese
sudo tlmgr install fvextra ifplatform xstring framed titlesec dingbat mdframed needspace minted pdftexcmds
