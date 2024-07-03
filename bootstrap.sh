#!/bin/bash

echo "Installing Oh My Posh..."
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

echo "Installing config..."
stow -t $HOME .

echo "Installing Tmux plugin Manager..."
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

echo "Finished!"
echo "Remember to change the .gitconfig signingKey!"
echo "Remember to install plugins with Ctrl<Space> + I!"
