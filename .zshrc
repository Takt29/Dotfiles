# input

setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす
setopt noautoremoveslash # 最後のスラッシュを自動的に削除しない

# display

setopt print_exit_value # 戻り値が 0 以外の場合終了コードを表示

# history

setopt hist_no_store        # historyコマンドは履歴に登録しない

# auto complete

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

setopt auto_param_slash  # ディレクトリ名の補完で末尾に/を自動的に付加
setopt auto_pushd # cd -[tab]で過去のディレクトリにひとっ飛びできるようにする

# key binding

setopt ignoreeof #Ctrl-Dでシェルからログアウトしない
bindkey -e # emacsライク

# customize prompto

local BLUE=$'%{\e[34m%}'
PROMPT="%(?.%F{117}.%F{124})%n@%m:%c %# %f"

## show branch name
## https://qiita.com/reireias/items/60ee9934fb1f5d94f125#prompt

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=' ${vcs_info_msg_0_}'$RPROMPT
