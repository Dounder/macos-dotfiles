# Dotfiles for macOS

This repository contains my personal dotfiles for macOS, including configuration files for various tools and shells to set up a consistent development environment.

## What's Included

- `.zshrc` - Zsh shell configuration

## Prerequisites

- macOS
- Zsh (usually pre-installed on macOS)
- Git

## Installation

1. Clone this repository to your home directory:

```bash
   git clone https://github.com/dounder/macos-dotfiles.git ~/.dotfiles
```

2. Backup your existing dotfiles (optional but recommended):

```bash
   mv ~/.zshrc ~/.zshrc.backup
```

3. Create symlinks to the dotfiles:

```bash
   ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

4. Reload your shell:

```bash
   source ~/.zshrc
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
