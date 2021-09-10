# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

DOT_FILES=$HOME/.dotfiles

. $DOT_FILES/zshenv
. $DOT_FILES/alias
. $DOT_FILES/functions

# Used for work dotfiles - or anything extra.
EXTRA_DOT_FILES=$HOME/.env-specif-dots

if [[ -d $EXTRA_DOT_FILES ]]; then
    . $EXTRA_DOT_FILES/zshenv
    . $EXTRA_DOT_FILES/alias
    . $EXTRA_DOT_FILES/functions
fi

plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Correct colors
. $DOT_FILES/term-colors/gruvbox/gruvbox_256palette.sh

bindkey '\e/' history-incremental-pattern-search-backward

unsetopt BEEP

eval "$(starship init zsh)"
