# History substring search (Up/Down arrows)
if [[ -f $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# fzf history search (Ctrl+R)
if command -v fzf &>/dev/null; then
  fzf-history-widget() {
    local selected=$(fc -rln 1 | fzf --height 40% --reverse --tac +s --tiebreak=index)
    if [[ -n "$selected" ]]; then
      BUFFER="$selected"
      CURSOR=$#BUFFER
      zle reset-prompt
    fi
  }
  zle -N fzf-history-widget
  bindkey '^R' fzf-history-widget
fi

# fzf shell integration
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi
