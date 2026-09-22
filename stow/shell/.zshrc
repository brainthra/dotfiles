## .zshrc
## Zsh interactive shell configuration for the user. This file primarily
## sources shared shell settings from `stow/shell/.config/shell/common.sh`
## and configures Oh My Zsh, history behavior, and prompt integrations.

if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/shell/common.sh" ]]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/common.sh"
else
  print -u2 "Common shell configuration not found. Run scripts/link-dotfiles."
fi

export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  sudo
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
  dirhistory
  uv
)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
else
  print -u2 "Oh My Zsh is not installed. Run scripts/install-oh-my-zsh."
fi

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

mkdir -p "${HISTFILE:h}"

setopt append_history
setopt hist_ignore_all_dups
setopt share_history

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v pay-respects >/dev/null 2>&1; then
  eval "$(pay-respects zsh --alias)"
fi
export _PR_AI_DISABLE=1

if command -v gh >/dev/null 2>&1; then
  eval "$(gh completion -s zsh)"
fi

if command -v micromamba >/dev/null 2>&1; then
  eval "$(micromamba shell hook --shell zsh)"
fi

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi