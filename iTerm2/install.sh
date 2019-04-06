SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
PROFILE=$SCRIPTPATH/profile
ITERM2_PROFILE=~/Library/Application\ Support/iTerm2/DynamicProfiles/profile

if [ ["$OSTYPE" != "darwin"*] ]; then
  exit 0
fi

# Remove iTerm2 profile if it exists
if [ [ -f $ITERM2_PROFILE ] ]; then
  echo "Removing $ITERM2_PROFILE"
  rm -f "$ITERM2_PROFILE"
fi

# Create symlink to profile
echo "Symlinking $PROFILE $ITERM2_PROFILE"
ln -s $PROFILE "$ITERM2_PROFILE"
