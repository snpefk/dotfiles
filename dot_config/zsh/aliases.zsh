if (( $+commands[eza] )); then
  alias ls='eza -l --group-directories-first --icons'
  alias ll='eza -l --group-directories-first --icons'
fi
alias copy='pbcopy'
alias paste='pbpaste'
alias py3='python3'
alias gw='./gradlew'
alias lg='lazygit'
alias lzd='lazydocker'
alias lf='yazi'
alias oc='opencode'
alias mv='mv -i'
alias ic='cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs"'
(( $+commands[nvim] )) && alias vi='nvim'
(( $+commands[watch] )) && alias watch='watch -c'
# Leave macOS `open` and `rm` unchanged.
