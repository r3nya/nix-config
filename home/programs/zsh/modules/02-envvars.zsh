# Java versions (set defaults, override in secrets.zsh if needed)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8 2>/dev/null)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11 2>/dev/null)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17 2>/dev/null)

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk

# GPG Agent
export GPG_TTY=$TTY
