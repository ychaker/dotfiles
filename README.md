# Setup

## Clone Repo

```
cd ~
mkdir dev
cd dev
git clone git@github.com:ychaker/dotfiles.git
```

## Remove Existing Files

```
rm ~/.gitconfig
rm ~/.zshrc
```

## Symlink Scripts

```
ln -s ~/dev/dotfiles/bin ~/bin
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl
```

## Vim Config

```
vim/install_vim.sh
```

## Git Config

```
ln -s ~/dev/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dev/dotfiles/git/.githelpers ~/.githelpers
```

## Zsh Config

Make sure the `zsh-git-prompt` tool is available:

```
cd ~/dev
git clone git@github.com:olivierverdier/zsh-git-prompt.git
```

```
ln -s ~/dev/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/zsh/themes/ychaker.zsh-theme ~/.oh-my-zsh/themes/ychaker.zsh-theme
ln -s ~/dev/dotfiles/zsh/themes/ychaker-dark.zsh-theme ~/.oh-my-zsh/themes/ychaker-dark.zsh-theme
```

## Tmux Config

```
ln -s ~/dev/dotfiles/tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
```

## Themes (not included in the install script)

### Alfred

```
git clone https://github.com/dracula/alfred
```

### Sublime

```
Install Package Control
cmd+shift+p
Package Control: Install Package
Dracula Color Scheme
cmd+shift+p
UI: Select Color Scheme
Dracula
```

### iTerm

```
git clone https://github.com/dracula/iterm.git
```

## Use the install script

```
source <(curl -s https://raw.githubusercontent.com/ychaker/dotfiles/main/install.sh)
```

Run the above command to install everything at once.
When you are prompted for the password, enter your system's password (eg. if you're running it in a Vagrant instance, the password would be `vagrant`).
Once `oh-my-zsh` installs, it spawns a new subprocess that you need to `exit` from to let the script continue running.
