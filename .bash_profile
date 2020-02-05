source ~/.bashrc

# Locale
export LC_ALL=en_US.UTF-8

# Editor
export EDITOR="nano"

# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# Nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=$HOME/.nodebrew
export NODE_BINARY=$HOME/.nodebrew/current/bin/node

# Nano
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
