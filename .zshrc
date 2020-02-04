# case-insensitive

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# open file to use GUI ver. Emacs

function emacs() {
    /usr/local/bin/emacs $@ &
}

# show branch name
# https://qiita.com/reireias/items/60ee9934fb1f5d94f125#prompt

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_} '$RPROMPT

# compile

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
