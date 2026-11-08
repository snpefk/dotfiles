export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
export LANG="${LANG:-en_US.UTF-8}"
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"

# Keep macOS/tool defaults; do not relocate Cargo, Docker, AWS, or GnuPG data.
typeset -U path PATH
path=("$HOME/.local/bin" $path)
path+=("$ANDROID_HOME/cmdline-tools/latest/bin" "$ANDROID_HOME/platform-tools")
[[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

if [[ -n "$SSH_CONNECTION" ]] || (( ! $+commands[nvim] )); then
  export EDITOR=vim
else
  export EDITOR=nvim
fi
export VISUAL="$EDITOR"
