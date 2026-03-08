# Custom keybindings

# Ctrl+S: Prepend/remove sudo from current command
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}
zle -N sudo-command-line
bindkey '^S' sudo-command-line

# Ctrl+Q: Push current line to buffer (save for later)
# Allows you to save current command, run another command, then restore it
bindkey '^Q' push-line-or-edit
