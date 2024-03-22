#!/bin/bash

# Clean up old unnecessary files or symlinks
rm -f ~/.vimrc ~/.gvimrc ~/.vimrc.bundles; rm -rf ~/.vim

# Clone directly into ~/.vim
git clone git@github:braintreeps/vim_dotfiles ~/.vim

ln -sf "$PWD/.vimrc.bundles.local" "$HOME/.vimrc.bundles.local"
ln -sf "$PWD/.vimrc_local" "$HOME/.vimrc_local"

~/.vim/activate.sh

# echo "Installing Seeing is Believing"
# gem install seeing_is_believing

vim  +PlugInstall +PlugUpdate +PlugClean +qall
nvim +PlugInstall +PlugUpdate +PlugClean +qall
