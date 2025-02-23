# XDG Base Directory Specification
launchctl setenv XDG_CONFIG_HOME ~/.config
launchctl setenv XDG_BIN_HOME ~/.local/bin
launchctl setenv XDG_DATA_HOME ~/.local/share
launchctl setenv XDG_STATE_HOME ~/.local/state
launchctl setenv XDG_CACHE_HOME ~/.cache

# Allow local customization
if [ -e $XDG_CONFIG_HOME/local/launchd/environment.sh ]; then
  source $XDG_CONFIG_HOME/local/launchd/environment.sh
fi
