# Shared interactive shell environment.
# Keep this file compatible with both Bash and Zsh.
#
# Purpose:
# - Provide a small set of XDG and editor defaults used by both Bash and Zsh
# - Ensure `$HOME/.local/bin` is on the PATH for user-installed tools
# - Source Nix profile scripts when available so `nix` and Nix-managed
#   tools are available in interactive shells.

export EDITOR="${EDITOR:-vi}"
export VISUAL="${VISUAL:-$EDITOR}"
export PAGER="${PAGER:-less}"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export MAMBA_ROOT_PREFIX="$XDG_DATA_HOME/micromamba"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) PATH="$HOME/.local/bin:$PATH" ;;
esac

# Nix installed in single-user mode.
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  # shellcheck disable=SC1091
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Nix installed using the multi-user daemon.
if [ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
  # shellcheck disable=SC1091
  . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
fi

if [ -r "$XDG_CONFIG_HOME/shell/aliases.sh" ]; then
  # shellcheck disable=SC1090
  . "$XDG_CONFIG_HOME/shell/aliases.sh"
fi

export PATH