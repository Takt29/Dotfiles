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
git config --global include.path ~/.gitconfig_global

# setup brew

touch ${SCRIPT_DIR}/.brewfile/${HOST}.brewfile
ln -s ${SCRIPT_DIR}/.brewfile/${HOST}.brewfile ~/.brewfile/.Brewfile

if ! [ -x "$(command -v brew)" ]; then
    echo "install brew"
    set +x
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    set -x
fi

brew install rcmdnk/file/brew-file
brew file install

eval "$(/usr/libexec/path_helper)"

# setup emacs

cd ~/.emacs.d/
cask upgrade
cask install
cd -

# setup nvm

mkdir -p ~/.nvm
nvm install --lts --latest-npm
nvm alias default "lts/*"

# setup BasicTex

sudo tlmgr update --self --all
sudo tlmgr paper a4
sudo tlmgr install collection-langjapanese
sudo tlmgr install fvextra ifplatform xstring framed titlesec dingbat mdframed needspace minted pdftexcmds
sudo tlmgr install zref catchfile

# setup xpdf

mkdir -p /usr/local/share/xpdf
wget https://dl.xpdfreader.com/xpdf-japanese.tar.gz -O /usr/local/share/xpdf/xpdf-japanese.tar.gz
tar -xvf /usr/local/share/xpdf/xpdf-japanese.tar.gz -C /usr/local/share/xpdf/
mv /usr/local/share/xpdf/xpdf-japanese /usr/local/share/xpdf/japanese
