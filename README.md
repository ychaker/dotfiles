# Setup

## Clone Repo

```
cd ~
mkdir dev
cd dev
git clone git@github.com:ychaker/shell-files.git
```

## Remove Existing Files

```
rm ~/.gitconfig
rm ~/.zshrc
```

## Symlink Scripts

```
ln -s ~/dev/shell-files/bin ~/bin
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl
```

## Vim Config

```
ln -s ~/dev/shell-files/vim/.vimrc ~/.vimrc
ln -s ~/dev/shell-files/vim/.vim ~/.vim
```

## Git Config

```
ln -s ~/dev/shell-files/git/.gitconfig ~/.gitconfig
ln -s ~/dev/shell-files/git/.githelpers ~/.githelpers
```

## Zsh Config

Make sure the `zsh-git-prompt` tool is available:

```
cd ~/dev
git clone git@github.com:olivierverdier/zsh-git-prompt.git
```

```
ln -s ~/dev/shell-files/zsh/.zshrc ~/.zshrc
ln -s ~/dev/shell-files/zsh/themes/ychaker.zsh-theme ~/.oh-my-zsh/themes/ychaker.zsh-theme
ln -s ~/dev/shell-files/zsh/themes/ychaker-dark.zsh-theme ~/.oh-my-zsh/themes/ychaker-dark.zsh-theme
```

## Tmux Config

```
ln -s ~/dev/shell-files/tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
```

## Use the install script

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ychaker/shell-files/master/install.sh)"
```
