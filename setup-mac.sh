#!/bin/bash

set -e

# brew install alacritty stow ripgrep fzf fd jq tmux postgresql sqlite neovim ollama go
brew install stow ripgrep fzf fd jq tmux postgresql sqlite neovim ollama go

# Install rust 
curl https://sh.rustup.rs -sSf | sh -s -- -y
export PATH=$PATH:$HOME/.cargo/bin

# Install editor font
curl -L -o ~/Library/Fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip -u -d ~/Library/Fonts ~/Library/Fonts/JetBrainsMono.zip
rm ~/Library/Fonts/JetBrainsMono.zip

# Install Node.js
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
nvm use node

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install tree-sitter-cli for nvim
cargo install --locked tree-sitter-cli

# Setup zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc ~/.zshrc.bak
chsh -s $(which zsh)

# Sync dotfiles
mkdir -p ~/.local/bin
stow neovim alacritty zsh git tmux -t ~
