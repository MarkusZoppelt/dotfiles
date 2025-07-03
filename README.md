# Dotfiles

Minimal dotfiles for zsh, tmux, neovim, and Hyprland with essential development tooling.

## Prerequisites

- git
- [homebrew](https://brew.sh) (on macOS)
- curl (for downloading SSH keys)

## Installation

    git clone https://github.com/MarkusZoppelt/dotfiles.git ~/.dotfiles
    ~/.dotfiles/install.sh

The installer will:
- Create symlinks to the dotfiles
- Install Homebrew packages (macOS only)
- Download my SSH keys from GitHub
- Set up local bin directory for custom scripts


## Broader System Setup

- **NixOS**: For my NixOS / nix-darwin system configuration, see [`MarkusZoppelt/nix`](https://github.com/MarkusZoppelt/nix)
- **Ubuntu bootstrap**: A higher-level end-to-end machine setup of a zero-to-dev box can be found at [`MarkusZoppelt/dev`](https://github.com/MarkusZoppelt/dev)
