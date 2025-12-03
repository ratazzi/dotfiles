# dotfiles

My personal dotfiles for macOS development environment.

## Quick Start

Set up your Mac in one command using [Hola](https://github.com/ratazzi/hola):

```bash
# Install Hola
curl -fsSL https://hola.ac/install | bash

# Bootstrap from this dotfiles repo
./hola apply --github ratazzi/dotfiles
```

That's it! Hola will:
- Clone this dotfiles repository to `~/.dotfiles`
- Install packages from `Brewfile` via Homebrew
- Install tools from `mise.toml` and pin versions
- Create symlinks for dotfiles to your home directory
- Run optional provisioning scripts (if exists)

## What's Included

- **Brewfile**: Homebrew packages and casks
- **mise.toml**: Development tools with version pinning
- **dotfiles/**: Configuration files (`.zshrc`, `.gitconfig`, etc.)
- **.config/hola/provision.rb**: Advanced provisioning scripts (optional)

## Manual Installation

If you prefer to do it step by step:

```bash
# 1. Clone the repository
git clone https://github.com/ratazzi/dotfiles.git ~/.dotfiles

# 2. Run apply from the local directory
hola apply
```

## Update

Pull the latest changes and re-apply:

```bash
cd ~/.dotfiles
git pull
hola apply
```

Hola is idempotent - safe to run multiple times.

## More Information

- [Hola Documentation](https://github.com/ratazzi/hola)
- [Homebrew](https://brew.sh)
- [mise](https://mise.jdx.dev)
