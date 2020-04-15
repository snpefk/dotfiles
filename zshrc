export ZSH="/home/snpefk/.oh-my-zsh"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export ANDROID_SDK_ROOT="~/Android/Sdk"

ZSH_THEME=""
ENABLE_CORRECTION="true"

plugins=(
  git
  cargo
  pip
  virtualenvwrapper
  rust
  docker
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
   export EDITOR='nvim'
else
   export EDITOR='vim'
fi

# aliases
alias copy='xclip -selection clipboard'
alias ls='exa --group-directories-first --icons -l'
alias tree="exa --group-directories-first --icons -lT"
alias rm='rm -r'
alias dup='alacritty --working-directory $( pwd ) &' 

eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
