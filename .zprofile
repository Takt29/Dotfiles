# Locale
export LC_ALL=en_US.UTF-8

# Editor
export EDITOR="nano"

# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Homebrew
if [ -e /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
else
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Volta
if type volta > /dev/null 2>&1; then
    export PATH="$HOME/.volta/bin:$PATH"
fi

# for local customize
if [[ -e ~/.zprofile.local ]]; then
    source ~/.zprofile.local
fi
