#!/bin/bash

DOTVIM="$HOME/.vim"

if [ ! -e `which git` ]
then
  echo "You need git. Try running install_git"
  exit 0
fi

if [ ! -d $DOTVIM ]
then
  mkdir $DOTVIM
fi

get_repo() {
    gh_user=$1
    repo=$2
    echo "Checking $repo"
    if [ -d "$DOTVIM/bundle/$repo/" ]
    then
        echo "Pulling latest from $repo"
        cd $DOTVIM/bundle/$repo
        git submodule update --init
        cd ..
    else
        echo "Cloning repo for $repo"
        git submodule add https://github.com/$gh_user/$repo.git
    fi
}

echo "Installing Seeing is Believing"
gem install seeing_is_believing

echo "Creating .vim folders if necessary"
mkdir -p $DOTVIM/{autoload,bundle}
cd $DOTVIM
git init
cd $DOTVIM/bundle/

tpope_repos=(rails git cucumber fugitive surround unimpaired abolish repeat markdown endwise)

for r in ${tpope_repos[*]}; do
	repo="vim-$r"
    get_repo "tpope" $repo
done

echo "Installing NERDTree"
get_repo "scrooloose" "nerdtree"

echo "Installing Syntastic"
get_repo "scrooloose" "syntastic"

echo "Installing NERDCommenter"
get_repo "scrooloose" "nerdcommenter"

echo "Installing snipMate"
get_repo "msanders" "snipmate.vim"

echo "Installing vim-ruby"
get_repo "vim-ruby" "vim-ruby"

echo "Installing taglist.vim"
get_repo "jc00ke" "taglist.vim"

echo "Installing ack.vim"
get_repo "mileszs" "ack.vim"

echo "Installing supertab"
get_repo "ervandew" "supertab"

echo "Installing vim-indent-object"
get_repo "michaeljsmith" "vim-indent-object"

cd $DOTVIM/autoload
echo "Fetching latest pathogen.vim"
rm pathogen.vim
wget http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim

echo "Checking to see if pathogen has already been added to .vimrc"
pathogen_cmd="execute pathogen#infect()"
contains=`grep "$pathogen_cmd" ~/.vimrc | wc -l`

if [ $contains -eq 0 ]
then
	echo "Hasn't been added, adding now."
	echo "$pathogen_cmd" >> ~/.vimrc
else
	echo "It was already added. Good to go"
fi

cd $HOME
