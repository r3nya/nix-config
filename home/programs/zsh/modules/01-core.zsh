autoload -U colors && colors
setopt PROMPT_SUBST

#
# Completion System (zprezto-inspired)
#

# Load and initialize completion system with caching
autoload -Uz compinit
_comp_cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
_comp_path="$_comp_cache_dir/zcompdump"

# Regenerate cache only if older than 20 hours for faster startup
if [[ $_comp_path(#qNmh-20) ]]; then
  # -C (skip function check) implies -i (skip security check)
  compinit -C -d "$_comp_path"
else
  mkdir -p "$_comp_cache_dir"
  compinit -i -d "$_comp_path"
fi
unset _comp_cache_dir _comp_path

# Completion options
setopt COMPLETE_IN_WORD    # Complete from both ends of a word
setopt ALWAYS_TO_END       # Move cursor to end of completed word
setopt PATH_DIRS           # Perform path search even on command names with slashes
setopt AUTO_MENU           # Show completion menu on successive tab press
setopt AUTO_LIST           # Automatically list choices on ambiguous completion
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add trailing slash
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry
unsetopt FLOW_CONTROL      # Disable start/stop characters (Ctrl+S/Ctrl+Q)

# Use caching for slow completions (apt, dpkg, etc)
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Case-insensitive (all), partial-word, and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe with colors
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' squeeze-slashes true

#
# History (zprezto-inspired)
#

HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zsh_history}"
HISTSIZE=50000
SAVEHIST=50000

setopt BANG_HIST                 # Treat '!' specially during expansion
setopt EXTENDED_HISTORY          # Write format: ':start:elapsed;command'
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate event first when trimming
setopt HIST_IGNORE_DUPS          # Do not record event just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded event if new is duplicate
setopt HIST_FIND_NO_DUPS         # Do not display previously found event
setopt HIST_IGNORE_SPACE         # Do not record event starting with space
setopt HIST_SAVE_NO_DUPS         # Do not write duplicate event to history file
setopt HIST_VERIFY               # Review before executing history expansion

#
# General Options (zprezto-inspired)
#

setopt COMBINING_CHARS      # Combine zero-length punctuation with base character
setopt INTERACTIVE_COMMENTS # Enable comments in interactive shell
setopt RC_QUOTES            # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
unsetopt MAIL_WARNING       # Don't print warning if mail file accessed

# Jobs
setopt LONG_LIST_JOBS       # List jobs in long format by default
setopt NOTIFY               # Report status of background jobs immediately
unsetopt BG_NICE            # Don't run all background jobs at lower priority
unsetopt HUP                # Don't kill jobs on shell exit
unsetopt CHECK_JOBS         # Don't report on jobs when shell exit
