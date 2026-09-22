## .bashrc

case $- in
  *i*) ;;
  *) return ;;
esac

if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/shell/common.sh" ]]; then
  # shellcheck disable=SC1091
  source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/common.sh"
fi

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000

shopt -s histappend
shopt -s checkwinsize

if command -v fzf >/dev/null 2>&1; then
  if [[ -r "${XDG_DATA_HOME:-$HOME/.local/share}/fzf/shell/key-bindings.bash" ]]; then
    source "${XDG_DATA_HOME:-$HOME/.local/share}/fzf/shell/key-bindings.bash"
  fi
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

if command -v pay-respects >/dev/null 2>&1; then
  eval "$(pay-respects bash --alias)"
fi
export _PR_AI_DISABLE=1

if command -v gh >/dev/null 2>&1; then
  eval "$(gh completion -s bash)"
fi

if command -v micromamba >/dev/null 2>&1; then
  eval "$(micromamba shell hook --shell bash)"
fi

PS1='\u@\h:\w\$ '