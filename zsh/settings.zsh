# Load the oh-my-zsh library
antigen use oh-my-zsh

# Load bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git

# Load syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Load gitignore template bundle
antigen bundle voronkovich/gitignore.plugin.zsh

# Load OS-specific bundles
case `uname` in
  Darwin)
    # macOS bundles
    antigen bundle osx
  ;;
  Linux)
    # Linux bundles
  ;;
esac

# Load theme
# antigen theme robbyrussell

antigen apply
