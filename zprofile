# Load functions
source ~/.config/shell/functions.sh

# Update path
source ~/.config/shell/path.sh

# Allow local customization
if [ -e ~/.config/local/zsh/zprofile ]; then
    source ~/.config/local/zsh/zprofile
fi
