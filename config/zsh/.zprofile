# Load functions
source $XDG_CONFIG_HOME/shell/functions.sh

# Update path
source $XDG_CONFIG_HOME/shell/path.sh

# Allow local customization
if [ -e $XDG_CONFIG_HOME/local/zsh/zprofile ]; then
    source $XDG_CONFIG_HOME/local/zsh/zprofile
fi
