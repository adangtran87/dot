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

create_symlink() {
  if [ ! -h "$2" ]
  then
    echo "Creating symlink $1 to $2."
    ln -s "$1" "$2"
  else
    echo "Symlink already exists for $1."
  fi
}

copy_vim_colors() {
  if [[ -a "~/.vim/colors/solarized.vim" ]]; then
    cp ~/.dotfiles/submodules/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
    echo "Copying solarized.vim!"
  else
    echo "solarized.vim already exists!"

  fi
}

create_folder ~/.vim
create_folder ~/.vim/colors
copy_dir ~/.dotfiles/vim/bundle ~/.vim/bundle
copy_vim_colors
