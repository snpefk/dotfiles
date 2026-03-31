export ZSH="/home/snpefk/.oh-my-zsh"

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_STATE_HOME="$HOME"/.local/state

export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANDROID_HOME="$ANDROID_USER_HOME"/sdk
export ANDROID_AVD_HOME="$ANDROID_USER_HOME"/avd

export GROOVY_HOME="/usr/share/groovy/"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk/"
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
alias speedtest="speedtest-go"

# glab shortcuts
alias gmv="glab mr view --web"
alias grv="glab repo view --web"
alias gmc="glab mr create -a f.tolstonozhenko --reviewer=and.tkachenko,t.yubzaev --push --fill --fill-commit-body"
alias gmcs="glab_mr_create_with_title_from_last_commit"
alias gmm="glab mr merge --when-pipeline-succeeds --rebase --yes"

glab_mr_create_with_title_from_last_commit () {
	gmc -t"$(git log -1 --pretty=%B)"
}

# jira shortcuts 
alias ji="jira issue"
alias jic="jira issue create"
alias jim="jira_issue_move_current" 
alias jicb="jira issue create -tBug"
alias jime="jira issue list -a$(jira me) --order-by status --reverse --paginate 10 -q\"status not in (Done, Released, Closed)\""
alias jsw="jira_start_work"
alias jivc="jira_issue_view_current"
alias jinj="jira issue list -l inject -q\"status not in (Done, Released)\""
alias jbck="jira_search_backlog"
alias jisrch="jira_search"

bindkey '^[e' edit-command-line

# starship
eval "$(starship init zsh)"
# fast navigation through zoxide
eval "$(zoxide init zsh)"
# glab autocomplete
eval "$(glab completion -s zsh)"

# kubernates autocomplete
source <(kubectl completion zsh) 

# fzf 
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
export WINEPREFIX="$XDG_DATA_HOME"/wine
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export GOPATH="$XDG_DATA_HOME"/go

export PATH="$GOPATH/bin:$PATH"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

path+=("$CARGO_HOME/bin")

# Jira utils 
jira_start_work () {
	jira issue assign $1 $(jira me)
	jira issue move $1 "Open"
	jira issue move $1 "In Progress"
}

jira_issue_view_current() { 
	jira issue view $(git branch --show-current) --plain 
}

jira_search_backlog () { 
	jira issue list -sBacklog -q"text ~ $1" 
}

jira_search () { 
	jira issue list -q"text ~ $1"
}

jira_issue_move_current () { 
	jira issue move $(git branch --show-current)
}
