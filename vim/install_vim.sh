#!/bin/bash

# Clean up old unnecessary files or symlinks
rm -f ~/.vimrc ~/.gvimrc ~/.vimrc.bundles; rm -rf ~/.vim

# Clone directly into ~/.vim
git clone git@github:braintreeps/vim_dotfiles ~/.vim

~/.vim/activate.sh

# echo "Installing Seeing is Believing"
# gem install seeing_is_believing

ln -sf "$PWD/.vimrc.bundles.local" "$HOME/.vimrc.bundles.local"
ln -sf "$PWD/.vimrc_local" "$HOME/.vimrc_local"

vim  +PlugInstall +PlugUpdate +PlugClear +qall
nvim +PlugInstall +PlugUpdate +PlugClear +qall
