# Load Zsh plugins
source ~/.zsh/plugins/antigen.zsh

# Load Zsh settings
source ~/.zsh/settings.zsh

# Include local customization
if [ -e ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
