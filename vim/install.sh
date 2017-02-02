#!/usr/bin/env bash

# Check if folder exists, if it doesn't create folder.
create_folder() {
  if [ ! -d "$1" ]
  then
    echo "Creating $1 directory"
    mkdir "$1"
  else
    echo "$1 already exists!"
  fi
}

copy_dir() {
  if [ ! -d "$2" ]
  then
    echo "Copying $1 to $2."
    cp -R "$1" "$2"
  else
    echo "$2 already exists! Not copying."
  fi
}

install_vundle() {

  if [[ -d ~/.vim/bundle/Vundle.vim ]]; then
    echo "Vundle.vim already exists!"
  else
    echo "Cloning Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
}

copy_vim_colors() {
  if [[ ! -f ~/.vim/colors/solarized.vim ]]; then
    cp ~/.dotfiles/submodules/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
    echo "Copying solarized.vim!"
  else
    echo "solarized.vim already exists!"

  fi
}

create_folder ~/.vim
create_folder ~/.vim/colors
#copy_dir ~/.dotfiles/vim/bundle ~/.vim/bundle
install_vundle
copy_vim_colors
