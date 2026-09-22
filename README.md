# Dotfiles

Personal Linux workstation setup managed with Nix, Home Manager, GNU Stow, and a small collection of shell scripts.

## What is included

- System packages installed with `apt`.
- Development and command-line tools installed with Home Manager.
- Shell, Git, Starship, direnv, Lazygit, tig, and mise configuration linked into `$HOME` with Stow.
- Oh My Zsh with autosuggestions and syntax highlighting.
- Micromamba installed under `$HOME/.local`.
- Git LFS enabled after bootstrapping.

## Requirements

The automated bootstrap currently targets:

- Debian or Ubuntu with `apt-get` and passwordless/interactive `sudo` access.
- `x86_64-linux`.
- A local user named `username`.

The username and architecture are defined in [`flake.nix`](flake.nix). 
Change them before using this repository for another machine or account.

## Installation

Clone the repository, enter it, and run the full bootstrap:

```sh
git clone <repository-url> ~/dotfiles
cd ~/dotfiles
make bootstrap
```

The bootstrap installs system prerequisites and Nix, applies the Home Manager configuration, installs Oh My Zsh and Micromamba, links the dotfiles, and runs `git lfs install`. 
It may ask for your `sudo` password. 
Open a new shell if the Nix installer reports that Nix is not yet available, then rerun `make bootstrap`.

The script does not change the login shell automatically. After it completes,
run:

```sh
chsh -s "$(command -v zsh)"
```

Log out and back in for the change to take effect.

## Make targets

Run these from the repository root:

| Target | Purpose |
| --- | --- |
| `make bootstrap` | Run the complete setup. |
| `make system` | Install required `apt` packages. |
| `make home` | Apply the Home Manager configuration. |
| `make stow` | Link the repository's dotfiles into `$HOME`. |
| `make oh-my-zsh` | Install or update Oh My Zsh and its plugins. |
| `make micromamba` | Install Micromamba if it is missing. |
| `make update` | Update flake inputs and apply Home Manager. |
| `make update-micromamba` | Update an existing Micromamba installation. |
| `make check` | Run ShellCheck and `nix flake check`. |
| `make unlink` | Remove the older Stow package links listed by the target. |

## Dotfile backups

Before Stow creates a link, `scripts/link-dotfiles` moves an existing regular
file out of the way. Backups are stored in `$HOME/.pre-dot`. Existing symbolic
links are left in place and restowed.

## Layout

```text
home/       Home Manager package configuration
scripts/    Bootstrap and installation scripts
stow/       Files managed by GNU Stow
flake.nix   Nix and Home Manager configuration
Makefile    Common setup and maintenance commands
tools.md    Installed tools and future additions
```

## Updating

Review changes to the flake inputs, then run:

```sh
make update
```

Run the checks before committing changes:

```sh
make check
```
