# Load the oh-my-zsh library
antigen use oh-my-zsh

# Load syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

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

antigen apply
