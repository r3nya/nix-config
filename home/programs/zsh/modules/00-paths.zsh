# Homebrew
if [[ -e /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# User paths
path+=(~/.bin)
path+=(~/.local/bin)
path+=(/usr/local/sbin)

# OrbStack
path+=(~/.orbstack/bin)

# Android SDK
if [[ -n "$ANDROID_HOME" ]]; then
  path+=("$ANDROID_HOME/emulator")
  path+=("$ANDROID_HOME/platform-tools")
fi

# Antigravity
path+=(~/.antigravity/antigravity/bin)

# asdf
path=("${ASDF_DATA_DIR:-$HOME/.asdf}/shims" $path)
