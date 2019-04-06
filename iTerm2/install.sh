SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
PROFILE=$SCRIPTPATH/profile
ITERM2_PROFILE=~/Library/Application\ Support/iTerm2/DynamicProfiles/profile

if [ "$(uname)" != "Darwin" ]; then
  echo "Not OSX so exit"
  exit 0
fi

# Remove iTerm2 profile if it exists
if [ ! -L "$ITERM2_PROFILE" ]; then
  echo "Symlinking $PROFILE $ITERM2_PROFILE"
  ln -s $PROFILE "$ITERM2_PROFILE"
else
  echo "$ITERM2_PROFILE exists. Do not remove"
fi
