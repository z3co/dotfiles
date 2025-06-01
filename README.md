# Dotfiles for Arch Linux

This repository contains my personal dotfiles and configuration files, optimized for use with [z3co/dev-env](https://github.com/z3co/dev-env) and GNU Stow.

## What's Included

- Shell configuration (`zshrc`, etc.)
- Neovim setup and plugins
- Tmux configuration
- Wayland compositors (Hyprland, Waybar, Wofi, etc.)
- Kanata keyboard remapping configs
- Other desktop and CLI tool configurations

## Structure

Each configuration is stored in a separate directory, making it easy to manage with GNU Stow.  
Example:
```
.
├── nvim
├── zshrc
├── tmux
├── waybar
├── hyprland
├── kanata
└── ...
```

## Usage

The recommended way to use these dotfiles is with the [z3co/dev-env](https://github.com/z3co/dev-env) setup scripts.

1. **Clone using dev-env (automated):**
   - Set `REPO_URL` in your `dev-env/packages.conf` to this repo.
   - Add folders you want stowed to `CONFIG_LIST`.
   - Run the stow script from dev-env:
     ```bash
     ./stow-dotfiles.sh
     ```

2. **Manual usage with GNU Stow:**
   ```bash
   git clone https://github.com/z3co/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   stow zshrc nvim tmux # Add other configs as needed
   ```

## Customizing

- Add or remove configuration folders as needed.
- For Kanata, place your config in the `kanata` directory.
- For new tools, create a directory matching the config's name.

## Credits

Inspired by community best practices and other dotfiles collections.
