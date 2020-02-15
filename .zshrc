PATH=~/opt:~/code/depot_tools:$PATH

export ZSH="/home/snpefk/.oh-my-zsh"

ZSH_THEME=""
ENABLE_CORRECTION="true"

plugins=(
  git
  cargo
  pip
  virtualenvwrapper
  rust
)

source $ZSH/oh-my-zsh.sh
source $HOME/.config/lf/icons.sh

# User configuration
# Pure config
fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
prompt pure

# aliases
alias copy='xclip -selection clipboard'
alias ls='exa --group-directories-first --icons -lh'
alias rm='rm -r'
