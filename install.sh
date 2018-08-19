#!/bin/bash

install_git() {
  local platform=$1

  if [[ $platform == 'osx' ]]; then
    brew install git
  elif [[ $platform == 'linux' ]]; then
    sudo apt-get -y install git
  fi
}

install_zsh() {
  local platform=$1

  if [[ $platform == 'osx' ]]; then
    brew install zsh zsh-completions
  elif [[ $platform == 'linux' ]]; then
    sudo apt-get -y install zsh
  fi

  chsh -s $(which zsh)
}

install_tmux() {
  local platform=$1

  if [[ $platform == 'osx' ]]; then
    brew install reattach-to-user-namespace
    brew install tmux
  elif [[ $platform == 'linux' ]]; then
    sudo apt-get -y install tmux
  fi
}

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
fi

install_git $platform
install_zsh $platform
install_tmux $platform

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/dev
cd ~/dev

git clone https://github.com/olivierverdier/zsh-git-prompt.git
git clone https://github.com/ychaker/dotfiles.git

[ -e ~/.gitconfig ] && rm ~/.gitconfig
[ -e ~/.zshrc ] && rm ~/.zshrc

ln -s ~/dev/dotfiles/bin ~/bin

ln -s ~/dev/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dev/dotfiles/vim/.vim ~/.vim

ln -s ~/dev/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dev/dotfiles/git/.githelpers ~/.githelpers

ln -s ~/dev/dotfiles/ssh/config ~/.ssh/config

ln -s ~/dev/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/zsh/themes/ychaker.zsh-theme ~/.oh-my-zsh/themes/ychaker.zsh-theme
ln -s ~/dev/dotfiles/zsh/themes/ychaker-dark.zsh-theme ~/.oh-my-zsh/themes/ychaker-dark.zsh-theme

ln -s ~/dev/dotfiles/tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
