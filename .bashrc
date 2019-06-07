# open file to use GUI ver. Emacs

function emacs() {
    for item in $@; do
        if [ -e $item ]; then
            if [ -d $item ]; then
                echo "$item is a directory."
            else
                open -a "Emacs" $item
            fi
        else
            touch $item
            open -a "Emacs" $item
        fi
    done
}

# show branch name

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
function promps {
    local  GREEN="\[\e[32m\]"
    local  WHITE="\[\e[00m\]"
    PS1="\h:\W${GREEN}\$(parse_git_branch)${WHITE}\$ "
}
promps

alias emacscli=/usr/bin/emacs

GCC_OPTION="-DLOCAL"
GXX_OPTION="-std=c++14 -DLOCAL"
GCCXX_DEBUG_OPTION="-O0 -g -fsanitize=undefined -fsanitize=address -Wall"
GCCXX_STACKSIZE_OPTION="-Wl,-stack_size,0x100000000"

alias gcc="g++ ${GCC_OPTION}"
alias g++="g++ ${GXX_OPTION}"
alias gcc_debug="gcc ${GCC_OPTION} ${GCCXX_DEBUG_OPTION}"
alias g++_debug="g++ ${GXX_OPTION} ${GCCXX_DEBUG_OPTION}"
alias gcc_large="gcc ${GCC_OPTION} ${GCCXX_STACKSIZE_OPTION}"
alias g++_large="g++ ${GXX_OPTION} ${GCCXX_STACKSIZE_OPTION}"

alias join_pdf="/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py"
alias git_pull_submodule='git submodule foreach git pull origin master'
