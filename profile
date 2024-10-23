# Load environment variables
source ~/.config/shell/environment.sh

# Load functions
source $XDG_CONFIG_HOME/shell/functions.sh

# Update path
source $XDG_CONFIG_HOME/shell/path.sh

# Load Homebrew shell environment
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv sh)"
fi

# Allow local customization
if [ -e $XDG_CONFIG_HOME/local/shell/profile ]; then
  source $XDG_CONFIG_HOME/local/shell/profile
fi
