export ZSH="/home/snpefk/.oh-my-zsh"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/"
export ANDROID_SDK_ROOT="/home/snpefk/.android/sdk"
export ANDROID_AVD_HOME="/home/snpefk/.android/avd"
export GROOVY_HOME="/usr/share/groovy/"
export CALIBRE_USE_DARK_PALETTE=1

ZSH_THEME=""
ENABLE_CORRECTION="true"

plugins=(
  git
  cargo
  pip
  virtualenvwrapper
  rust
  docker
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
source $HOME/.config/lf/icons.sh

# User configuration
# Pure config
# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

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
alias open='xdg-open'
alias glow="glow -p"
alias icat="kitty +kitten icat"
alias ghv="gh repo view -w"
alias rg="rg -p"
alias lg="lazygit"
alias py3="python3"

bindkey '^[e' edit-command-line

# starship
eval "$(starship init zsh)"

# fast navigation through zoxide
eval "$(zoxide init zsh)"

# kubernates autocomplete
source <(kubectl completion zsh) 

# fzf 
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function iplot {
	cat << EOF | gnuplot
	set terminal pngcairo enhanced font 'Fira Sans,10'
    set autoscale
    set samples 1000
    set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#fdf6e3" behind
    set output '|kitty +kitten icat --stdin yes'
    plot $@
    set output '/dev/null'
EOF
}

