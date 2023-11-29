# Load functions
source ~/.shell/functions.sh

# Update path
source ~/.shell/path.sh

# Load plugins
source ~/.shell/plugins/chruby.sh

# Load Zsh plugins
source ~/.zsh/plugins/direnv.zsh

# Include local customization
if [ -e ~/.zprofile_local ]; then
    source ~/.zprofile_local
fi
