/*
  home/packages.nix

  Lists the packages that Home Manager should install for the user's environment. 
  This file is evaluated by the Nix flake (see `flake.nix`) and should only contain declarative package selections. 
  Use `pkgs.<name>` or plain identifiers for common packages provided by `nixpkgs`.
*/

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    bat
    unzip
    zip
    jq
    tree
    ripgrep
    fd
    fzf
    shellcheck
    htop
    starship
    direnv
    nix-direnv
    uv
    eza           # modern ls replacement
    zoxide        # smarter cd
    dust          # disk usage viewer
    duf           # df replacement
    procs         # ps replacement
    bottom        # top/htop alternative
    tldr          # simplified man pages
    pay-respects  # corrects previous console command
    delta         # git diff replacement
    cmake
    ninja
    meson
    just
    pandoc
    quarto
    glow
    vale
    texliveFull
    typst
    lazygit
    git-lfs
    tig
    gh
    mise
    ];

  programs.home-manager.enable = true;
}