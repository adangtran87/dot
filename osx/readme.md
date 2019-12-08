# OSX Bring up Guide
Bringing up a brand new Mac.

## Initial Install
* homebrew
  * `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* [Iterm2](https://iterm2.com/downloads.html)
* Dropbox (for database)
* [keepassx](https://www.keepassx.org/downloads)
* dotfiles
  ```
  git clone git@github.com:adangtran87/dot.git ~/.dotfiles
  cd ~/.dotfiles
  ./setup.sh
  ```
* vim plugins
  ```
  vim
  :PluginInstall
  ```
* ssh keys
  ```
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  ssh-add - K ~/.ssh/id_rsa
  
  # In ~/.ssh/config
  Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
  ```
* Change screenshots directory (Catalina)
  ```
  CMD+SHIFT+5 -> options
  ```
* [Karabiner-Elements](https://pqrs.org/osx/karabiner/)
  * caps to ctrl/esc

## Secondary Install
* [Discord](https://discordapp.com/download)
* `brew cask install xld`
* 
