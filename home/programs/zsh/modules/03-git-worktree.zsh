#
# Git Worktree Aliases & Functions
#

# Help
function gwh() {
  cat <<'EOF'
Git Worktree Commands:
  gwa   Add worktree (interactive)
  gwl   List worktrees
  gwr   Remove worktree (interactive)
  gwp   Prune stale worktree info
  gwcd  cd to worktree (fzf)
EOF
}

# Simple aliases
alias gwl='git worktree list'
alias gwp='git worktree prune'

# Interactive: cd to worktree
function gwcd() {
  local worktree
  worktree=$(git worktree list | fzf --height 40% --reverse | awk '{print $1}')
  [[ -n "$worktree" ]] && cd "$worktree"
}

# Interactive: remove worktree
function gwr() {
  local worktree
  worktree=$(git worktree list | fzf --height 40% --reverse | awk '{print $1}')
  if [[ -n "$worktree" ]]; then
    echo "Remove worktree: $worktree? [y/N] "
    read -q && git worktree remove "$worktree"
    echo
  fi
}

# Interactive: add worktree
function gwa() {
  local base_branch new_branch dirname repo_root
  repo_root=$(git rev-parse --show-toplevel) || return

  # Select base branch
  base_branch=$(git branch -a --format='%(refname:short)' | fzf --height 40% --reverse --prompt="Base branch: ")
  [[ -z "$base_branch" ]] && return
  base_branch=${base_branch#remotes/origin/}

  # Prompt for new branch name
  vared -p "New branch: " new_branch
  [[ -z "$new_branch" ]] && return

  # Directory defaults to project-branch (sanitized)
  local repo_name=$(basename "$repo_root")
  dirname="${repo_name}-${new_branch//\//-}"
  vared -p "Directory name: " dirname
  [[ -z "$dirname" ]] && return

  git worktree add -b "$new_branch" "${repo_root}/../${dirname}" "$base_branch" && cd "${repo_root}/../${dirname}"
}
