# Load environment variables
source ~/.config/shell/environment.sh

# Set Zsh directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Load Homebrew shell environment
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# Allow local customization
if [ -e $XDG_CONFIG_HOME/local/zsh/zshenv ]; then
  source $XDG_CONFIG_HOME/local/zsh/zshenv
fi
