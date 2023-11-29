# Load functions
source ~/.config/shell/functions.sh

# Update path
source ~/.config/shell/path.sh

# Load plugins
source ~/.config/shell/plugins/chruby.sh

# Load Zsh plugins
source ~/.config/zsh/plugins/direnv.zsh

# Allow local customization
if [ -e ~/.config/zsh/zprofile ]; then
    source ~/.config/zsh/zprofile
fi
