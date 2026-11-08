(( $+commands[starship] )) && eval "$(starship init zsh)"
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
(( $+commands[try] )) && eval "$(try init "$HOME/code/wrk")"

# Support the existing virtualenvwrapper workflow on either laptop, if installed.
if (( $+commands[virtualenvwrapper.sh] && $+commands[python3] )); then
  export WORKON_HOME="${WORKON_HOME:-$HOME/.virtualenvs}"
  export VIRTUALENVWRAPPER_PYTHON="${VIRTUALENVWRAPPER_PYTHON:-${commands[python3]}}"
  source "${commands[virtualenvwrapper.sh]}"
fi

# Retain SDKMAN's installed/current JDK rather than hardcoding JAVA_HOME.
[[ -r "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
[[ -r "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
