# ZSH Preinstall
# Install oh-my-zsh if it doesn't exist
OHMYZSH=~/.oh-my-zsh
ZSHRC=~/.zshrc

if [ ! -d "$OHMYZSH" ]; then
  echo "Installing Oh My ZSH"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "Oh My ZSH already installed"
fi

if [ ! -L "$ZSHRC" ]; then
  echo ".zshrc not symlinked, moving so we can symlink"
  mv "$ZSHRC" "~/.zshrc.default"
fi

# Symlink will occur with the rest of the files
