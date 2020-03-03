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
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# aliases
alias copy='xclip -selection clipboard'
alias ls='exa --group-directories-first --icons -lh'
alias rm='rm -r'
alias vi='nvim'
