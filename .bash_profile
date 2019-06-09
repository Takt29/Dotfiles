source ~/.bashrc

# Editor
export EDITOR="nano"

# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
export NODE_BINARY=$HOME/.nodebrew/current/bin/node

# Nano
export PATH="/usr/local/opt/ncurses/bin:$PATH"
