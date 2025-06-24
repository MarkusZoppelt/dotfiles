# Dotfiles

A modular, minimal setup with zsh, tmux, [neovim](https://neovim.io), Hyprland, and essential tooling for a productive development environment.

## Features

- **Shell**: Zsh with autosuggestions, history management, custom aliases, and visual prompt feedback
- **Terminal Multiplexer**: Tmux with custom key bindings and theming
- **Editor**: Neovim with Lazy.nvim plugin manager and LSP support
- **Window Manager**: Hyprland (Wayland compositor) with custom keybindings and theming
- **Status Bar**: Waybar with system monitoring and workspace indicators
- **Version Control**: Git with sensible defaults and aliases
- **Security**: YubiKey agent integration for SSH authentication
- **Smart Integration**: Conditional loading of tools (1Password CLI, fzf, direnv) based on availability

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

## Configuration

### Customization

- **Zsh**: Edit `.zshrc` for shell customization
- **Tmux**: Modify `.tmux.conf` for terminal multiplexer settings
- **Neovim**: Configure plugins in `config/nvim/lua/plugins/`
- **Hyprland**: Adjust window manager settings in `config/hypr/hyprland.conf`
- **Waybar**: Customize status bar in `config/waybar/config.jsonc` and `config/waybar/style.css`
- **Git**: Adjust settings in `.gitconfig`

## Included Tools

The Brewfile includes essential development tools:
- **Languages**: Go, Node.js, Rust
- **CLI Tools**: fd, fzf, ripgrep, jq, btop
- **Development**: lazygit, gh (GitHub CLI), direnv
- **Security**: age, yubikey-agent
- **Wayland/Linux**: Hyprland, Waybar (for Linux desktop environments)
- **Applications**: Ghostty terminal, Signal, Spotify

## System Provisioning

For end-to-end machine setup, see the higher-level bootstrap in [`MarkusZoppelt/dev`](https://github.com/MarkusZoppelt/dev).

## License

MIT License - see [LICENSE](LICENSE) file for details.
