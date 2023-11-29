# Load functions
source ~/.config/shell/functions.sh

# Update path
source ~/.config/shell/path.sh

# Allow local customization
if [ -e ~/.config/zsh/zprofile ]; then
    source ~/.config/zsh/zprofile
fi
