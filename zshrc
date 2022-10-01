export ZSH="/home/snpefk/.oh-my-zsh"

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_STATE_HOME="$HOME"/.local/state

export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANDROID_HOME="$ANDROID_USER_HOME"/sdk
export ANDROID_AVD_HOME="$ANDROID_USER_HOME"/avd

export GROOVY_HOME="/usr/share/groovy/"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

ZSH_THEME=""
ENABLE_CORRECTION="false"

plugins=(
  git
  pip
  virtualenvwrapper
  rust
  docker
  colored-man-pages
  kubectl
  gradle-completion
  aws
)

source $ZSH/oh-my-zsh.sh
source $HOME/.config/lf/icons.sh

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
alias rg="rg -p --hidden --smart-case"
alias lg="lazygit"
alias py3="python3"
alias idea="intellij-idea-ultimate-edition"

# glab shortcuts
alias gmv="glab mr view --web"
alias gmu="glab mr update -a f.tolstonozhenko --reviewer=s.akentev,alek.s.krylov"

# jira shortcuts 
alias ji="jira issue"
alias jic="jira issue create"
alias jil='jira issue list -a$(jira me) --order-by status --reverse -s~Closed --paginate 10'

bindkey '^[e' edit-command-line

# starship
eval "$(starship init zsh)"

# fast navigation through zoxide
eval "$(zoxide init zsh)"
eval "$(glab completion -s zsh)"

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


export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_DATA_HOME"/cabal
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export K9SCONFIG="$XDG_CONFIG_HOME"/k9s
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PYLINTHOME="${XDG_CACHE_HOME}"/pylint
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
# export HISTFILE="$XDG_STATE_HOME"/zsh/history
export WINEPREFIX="$XDG_DATA_HOME"/wine
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export GOPATH="$XDG_DATA_HOME"/go

export PATH="$GOPATH/bin:$PATH"

# Jira utils 
jira_start_work () {
	jira issue assign $1 $(jira me)
	jira issue move $1 "Open"
	jira issue move $1 "In Progress"
}

