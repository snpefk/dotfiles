(( $+commands[starship] )) && eval "$(starship init zsh)"
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
# Initialize try's directory-changing shell function only on its first use.
if (( $+commands[try] )); then
  try() {
    local _dotfiles_try_init _dotfiles_try_loader="${functions[try]}"
    _dotfiles_try_init="$(command try init "$HOME/code/wrk")" || return
    eval "$_dotfiles_try_init" || return
    if [[ "${functions[try]}" == "$_dotfiles_try_loader" ]]; then
      print -u2 'try: initialization did not define its shell function'
      return 1
    fi
    try "$@"
  }
fi

# Defer Python hooks until a virtualenvwrapper command/completion is first used.
if (( $+commands[virtualenvwrapper.sh] && $+commands[python3] )); then
  export WORKON_HOME="${WORKON_HOME:-$HOME/.virtualenvs}"
  export VIRTUALENVWRAPPER_PYTHON="${VIRTUALENVWRAPPER_PYTHON:-${commands[python3]}}"
  export VIRTUALENVWRAPPER_SCRIPT="${VIRTUALENVWRAPPER_SCRIPT:-${commands[virtualenvwrapper.sh]}}"
  if (( $+commands[virtualenvwrapper_lazy.sh] )); then
    source "${commands[virtualenvwrapper_lazy.sh]}"
  else
    # Older installations may not ship the optional lazy loader.
    source "$VIRTUALENVWRAPPER_SCRIPT"
  fi
fi

# Retain SDKMAN's installed/current JDK rather than hardcoding JAVA_HOME.
[[ -r "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
[[ -r "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
