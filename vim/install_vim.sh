#!/bin/bash

DOTVIM="$HOME/.vim"
JQUERY=12107

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
        git pull origin master
        cd ..
    else
        echo "Cloning repo for $repo"
        git clone git://github.com/$gh_user/$repo.git
    fi
}

echo "Creating .vim folders if necessary"
mkdir -p $DOTVIM/{autoload,bundle}
cd $DOTVIM/bundle/

tpope_repos=(rails haml git cucumber fugitive surround unimpaired abolish repeat markdown endwise)

for r in ${tpope_repos[*]}; do
	repo="vim-$r"
    get_repo "tpope" $repo
done

echo "Installing NERDTree"
get_repo "scrooloose" "nerdtree"

echo "Installing Syntastic"
get_repo "scrooloose" "syntastic"

echo "Installing NERDCommenter"
get_repo "jc00ke" "nerdcommenter"

echo "Installing snipMate"
get_repo "msanders" "snipmate.vim"

echo "Installing vim-ruby"
get_repo "vim-ruby" "vim-ruby"

echo "Installing vim-ruby-debugger"
get_repo "astashov" "vim-ruby-debugger"

echo "Installing mustache.vim"
get_repo "jc00ke" "mustache.vim"

echo "Installing taglist.vim"
get_repo "jc00ke" "taglist.vim"

echo "Installing ack.vim"
get_repo "mileszs" "ack.vim"

echo "Installing supertab"
get_repo "tsaleh" "vim-supertab"

echo "Installing vim-indent-object"
get_repo "michaeljsmith", "vim-indent-object"

echo "Installing jQuery"
mkdir -p jquery/syntax
wget -c -O jquery/syntax/jquery.vim http://www.vim.org/scripts/download_script.php?src_id=$JQUERY

cd $DOTVIM/autoload
echo "Fetching latest pathogen.vim"
rm pathogen.vim
wget http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim

echo "Checking to see if pathogen has already been added to .vimrc"
pathogen_cmd="call pathogen#runtime_append_all_bundles()"
contains=`grep "$pathogen_cmd" ~/.vimrc | wc -l`

if [ $contains == 0 ]
then
	echo "Hasn't been added, adding now."
	echo "$pathogen_cmd" >> ~/.vimrc
else
	echo "It was already added. Good to go"
fi

echo "Installing Command T plugin"
ct=`curl -s https://wincent.com/products/command-t | grep releases | head -1 | cut -d\" -f2`
cd /tmp
vba=$( echo "$ct" | ruby -ruri -e 'puts File.basename(gets.chomp)' )
wget $ct


echo ""
echo ""
echo "***********************************************************"
echo "Vim will start then, then :so %"
echo "When the script is done it'll compile the ruby extension"
echo "***********************************************************"
sleep 3
vim /tmp/$vba
sleep 3
cd ~/.vim/ruby/command-t
ruby extconf.rb
make
