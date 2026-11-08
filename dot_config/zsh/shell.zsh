ZSH_THEME=""
DISABLE_AUTO_TITLE=true
ENABLE_CORRECTION=false
zstyle ':omz:update' mode disabled

# Do not fail startup when optional/custom plugins are not installed.
plugins=()
for plugin in brew git pip rust docker colored-man-pages kubectl zsh-vi-mode gradle-completion; do
  if [[ -r "${ZSH_CUSTOM:-$ZSH/custom}/plugins/$plugin/$plugin.plugin.zsh" ||
        -r "$ZSH/plugins/$plugin/$plugin.plugin.zsh" ]]; then
    plugins+=("$plugin")
  fi
done
unset plugin

# Register before Oh My Zsh so synchronous and deferred vi-mode both work.
_dotfiles_fzf_init() {
  if (( $+commands[fzf] )); then
    source <(fzf --zsh)
  fi
}
if (( ${plugins[(Ie)zsh-vi-mode]} )); then
  typeset -ga zvm_after_init_commands
  (( ${zvm_after_init_commands[(Ie)_dotfiles_fzf_init]} )) ||
    zvm_after_init_commands+=(_dotfiles_fzf_init)
fi

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
else
  autoload -Uz compinit
  compinit
fi
if (( ! ${plugins[(Ie)zsh-vi-mode]} )); then
  _dotfiles_fzf_init
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY
