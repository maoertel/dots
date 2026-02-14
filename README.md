# dots

My dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

## What's included

| File/Directory | Description |
|----------------|-------------|
| `.aerospace.toml` | AeroSpace window manager |
| `.claude/` | Claude Code config — commands, rules, review (symlinked to source repos) |
| `.gitconfig` | Git configuration |
| `.gitignore` | Local gitignore |
| `.gitignore_global` | Global gitignore |
| `.oh-my-zsh/custom/` | Custom oh-my-zsh aliases |
| `.tmux.conf` | tmux configuration |
| `.zprofile` | Zsh login shell profile |
| `.zshenv` | Zsh environment variables |
| `.zshrc` | Zsh shell configuration (template) |
| `.config/alacritty/` | Alacritty terminal |
| `.config/gh/` | GitHub CLI |
| `.config/hazelnut/` | Hazelnut file organizer rules |
| `.config/karabiner/` | Karabiner-Elements key mappings |
| `.config/nvim/` | Neovim configuration (lazy.nvim) |
| `.config/thefuck/` | thefuck settings |

## Setup on a new machine

### One-liner

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply maoertel
```

This will:
1. Install chezmoi (if not present)
2. Clone this repo
3. Apply the dotfiles to your home directory

### Manual setup

```bash
# Install chezmoi (macOS)
brew install chezmoi

# Initialize and apply
chezmoi init maoertel
chezmoi apply
```

## Prerequisites

These dotfiles assume you have the following installed:

- [oh-my-zsh](https://ohmyz.sh/) - not managed by chezmoi, install separately
- [tmux](https://github.com/tmux/tmux) + [tpm](https://github.com/tmux-plugins/tpm) - plugins installed via tpm
- [Neovim](https://neovim.io/) 0.11+ (plugins managed by [lazy.nvim](https://github.com/folke/lazy.nvim))
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) (macOS window manager)
- [Alacritty](https://alacritty.org/)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
- [Claude Code](https://claude.ai/code) (config symlinks to [maoertel/claude](https://github.com/maoertel/claude))

## Common commands

```bash
# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Add a new file to tracking
chezmoi add ~/.some-config

# Edit a tracked file
chezmoi edit ~/.some-config

# Pull latest and apply
chezmoi update
```
