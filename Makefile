SHELL := /usr/bin/env bash

.PHONY: bootstrap system home stow micromamba oh-my-zsh update check unlink

bootstrap:
	./scripts/bootstrap

system:
	./scripts/install-system-packages

home:
	nix --extra-experimental-features "nix-command flakes" \
		run home-manager/master -- \
		switch --flake ".#$${USER}" --backup-extension hm-backup

stow:
	./scripts/link-dotfiles

micromamba:
	./scripts/install-micromamba

oh-my-zsh:
	./scripts/install-oh-my-zsh

update:
	nix flake update
	nix --extra-experimental-features "nix-command flakes" \
		run home-manager/master -- \
		switch --flake ".#$${USER}"

update-micromamba:
	micromamba self-update

check:
	shellcheck scripts/* \
		stow/shell/.bashrc \
		stow/shell/.config/shell/*.sh
	nix flake check

unlink:
	cd stow && stow --target="$$HOME" --delete shell git tmux