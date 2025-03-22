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

if [[ -e ~/.zprofile.local ]]; then
    source ~/.zprofile.local
fi
