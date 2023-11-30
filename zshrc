# Load Zsh plugins
source ~/.config/zsh/plugins/antigen.zsh

# Load Zsh settings
source ~/.config/zsh/settings.zsh

# Allow local customization
if [ -e ~/.config/local/zsh/zshrc ]; then
    source ~/.config/local/zsh/zshrc
fi
