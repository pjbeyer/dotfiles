# Load environment variables
source ~/.config/shell/environment.sh

# Allow local customization
if [ -e ~/.config/local/zsh/zshenv ]; then
    source ~/.config/local/zsh/zshenv
fi
