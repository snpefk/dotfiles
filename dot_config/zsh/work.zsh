# Work-profile shell additions. Deployed only when profile = "work".
# Credentials belong in ~/.config/secrets or ~/.zshrc.work.local, never here.

typeset -U path PATH
[[ -d "$HOME/.opencode/bin" ]] && path=("$HOME/.opencode/bin" $path)
[[ -n "$HOMEBREW_PREFIX" && -d "$HOMEBREW_PREFIX/opt/node@22/bin" ]] &&
  path=("$HOMEBREW_PREFIX/opt/node@22/bin" $path)

[[ -r "$HOME/.config/secrets" ]] && source "$HOME/.config/secrets"

# Resolve the global npm prefix statically: calling `npm root -g` costs ~200ms.
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  _dotfiles_mbxcli="$HOMEBREW_PREFIX/lib/node_modules/@mapbox/mbxcli/bin/mapbox.sh"
  [[ -r "$_dotfiles_mbxcli" ]] && source "$_dotfiles_mbxcli"
  unset _dotfiles_mbxcli
fi

alias gbsc='git branch --show-current'
(( $+commands[jira] )) && alias jict='jira issue create -tTask'
