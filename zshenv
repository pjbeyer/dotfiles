
# Load environment variables
source ~/.shell/environment.sh

# Include local customization
if [ -e ~/.zshenv_local ]; then
    source ~/.zshenv_local
fi
