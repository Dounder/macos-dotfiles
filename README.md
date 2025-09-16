# Dotfiles for macOS

This repository contains my personal dotfiles for macOS, including configuration files for various tools and shells to set up a consistent development environment.

## Table of Contents

- [Dotfiles for macOS](#dotfiles-for-macos)
  - [Table of Contents](#table-of-contents)
  - [What's Included](#whats-included)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [LazyDocker (optional)](#lazydocker-optional)
  - [Fast Node Manager (fnm)](#fast-node-manager-fnm)
  - [ZSH plugins](#zsh-plugins)
  - [Custom Fonts](#custom-fonts)
  - [License](#license)

## What's Included

- `.zshrc` - Zsh shell configuration with aliases, functions, and environment setup
- `git-alias.bash` - Script to configure Git aliases globally
- `aerospace.toml` - Configuration file for the Aerospace tiling window manager
- `LICENSE` - MIT License
- `README.md` - Project documentation

[Back to Table of Contents](#table-of-contents)

## Prerequisites

- macOS
- Zsh (usually pre-installed on macOS)
- Git

[Back to Table of Contents](#table-of-contents)

## Installation

1. Clone this repository to your home directory:

```bash
   git clone https://github.com/dounder/macos-dotfiles.git ~/.dotfiles
```

2. Backup your existing dotfiles (optional but recommended):

```bash
   mv ~/.zshrc ~/.zshrc.backup
   mv ~/.config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml.backup 2>/dev/null || true
```

3. Create symlinks to the dotfiles:

```bash
   ln -s ~/.dotfiles/.zshrc ~/.zshrc
   mkdir -p ~/.config/aerospace
   ln -s ~/.dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
```

4. Set up Git aliases:

```bash
   chmod +x ~/.dotfiles/git-alias.bash
   bash ~/.dotfiles/git-alias.bash
```

5. Reload your shell:

```bash
   source ~/.zshrc
```

[Back to Table of Contents](#table-of-contents)

## LazyDocker (optional)

To install LazyDocker, follow these steps:

1. Install LazyDocker using Homebrew:

```bash
   brew install lazydocker
```

2. Run LazyDocker:

```bash
   lazydocker
```

[Back to Table of Contents](#table-of-contents)

## Fast Node Manager (fnm)

**fnm** is a fast and simple Node.js version manager. Follow these steps to install and configure it:

1. Install fnm:

```bash
   curl -fsSL https://fnm.vercel.app/install | bash
```

2. Enable shell completions for fnm:

```bash
   fnm completions --shell $SHELL
```

3. Restart your terminal or source your shell configuration file (e.g., `.zshrc` or `.bashrc`).

4. Use fnm to install and manage Node.js versions. For example:

```bash
   fnm install 24  # Install Node.js v24
   fnm use 24      # Use Node.js v24
   fnm default 24  # Set Node.js v24 as the default version
```

[Back to Table of Contents](#table-of-contents)

## ZSH plugins

This setup uses [Oh My Zsh](https://ohmyz.sh/) to manage Zsh configuration and plugins. The following plugins are included:

1. Run the following commands to clone the plugins in parallel:

   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions & \
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting & \
   git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
   ```

2. Add the plugins to your `.zshrc` file:

   ```bash
   plugins=(zsh-autosuggestions zsh-syntax-highlighting you-should-use)
   ```

[Back to Table of Contents](#table-of-contents)

## Custom Fonts

Download and install the following fonts:

1. **[FiraCode](https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip)**
2. **[MesloLGS NF](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)**
3. **[FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip)**

[Back to Table of Contents](#table-of-contents)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[Back to Table of Contents](#table-of-contents)
