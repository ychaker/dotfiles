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
git clone https://github.com/ychaker/shell-files.git

[ -e ~/.gitconfig ] && rm ~/.gitconfig
[ -e ~/.zshrc ] && rm ~/.zshrc

ln -s ~/dev/shell-files/bin ~/bin

ln -s ~/dev/shell-files/vim/.vimrc ~/.vimrc
ln -s ~/dev/shell-files/vim/.vim ~/.vim

ln -s ~/dev/shell-files/git/.gitconfig ~/.gitconfig
ln -s ~/dev/shell-files/git/.githelpers ~/.githelpers

ln -s ~/dev/shell-files/zsh/.zshrc ~/.zshrc
ln -s ~/dev/shell-files/zsh/themes/ychaker.zsh-theme ~/.oh-my-zsh/themes/ychaker.zsh-theme
ln -s ~/dev/shell-files/zsh/themes/ychaker-dark.zsh-theme ~/.oh-my-zsh/themes/ychaker-dark.zsh-theme

ln -s ~/dev/shell-files/tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
