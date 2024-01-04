# Load Zsh plugins
source $ZDOTDIR/plugins/antigen.zsh

# Load Zsh settings
source $ZDOTDIR/settings.zsh

# Load shell plugins
source $XDG_CONFIG_HOME/shell/plugins/homebrew-file.sh

# Allow local customization
if [ -e $XDG_CONFIG_HOME/local/zsh/zshrc ]; then
    source $XDG_CONFIG_HOME/local/zsh/zshrc
fi
