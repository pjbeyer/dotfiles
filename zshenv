# Load environment variables
source ~/.config/shell/environment.sh

# Set Zsh directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Allow local customization
if [ -e $XDG_CONFIG_HOME/local/zsh/zshenv ]; then
    source $XDG_CONFIG_HOME/local/zsh/zshenv
fi
