# zsh-autosuggestions
if [[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

  # Accept word from autosuggestion (Ctrl+Arrow Right)
  bindkey '^[^[[C' forward-word  # Option+Arrow Right
  bindkey '^[[1;5C' forward-word # Ctrl+Arrow Right (some terminals)
fi

# zsh-syntax-highlighting (MUST be last)
[[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
