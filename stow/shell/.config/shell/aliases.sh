## aliases.sh

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'

alias pipx='uv tool'

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
fi

# Nixpkgs installs fd under the expected "fd" executable name.
if command -v fd >/dev/null 2>&1; then
  alias find-files='fd'
fi

if command -v rg >/dev/null 2>&1; then
  alias search='rg'
fi

# micromamba
alias mm="micromamba"
alias mma="micromamba activate"
alias mmd="micromamba deactivate"
alias mml="micromamba env list"
alias mmc="micromamba create -n"

# print path
alias path='echo -e ${PATH//:/\\n}'