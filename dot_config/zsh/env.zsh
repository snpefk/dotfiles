export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
export LANG="${LANG:-en_US.UTF-8}"
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"

# Preserve this Mac's Java 8 shortcut without changing SDKMAN's active JDK.
if [[ -z "${JDK_18:-}" && -d "$SDKMAN_DIR/candidates/java/8.0.402-amzn" ]]; then
  export JDK_18="$SDKMAN_DIR/candidates/java/8.0.402-amzn"
fi

# Add Homebrew Qt 5 to CMake's search path without discarding existing entries.
if [[ -n "$HOMEBREW_PREFIX" && -d "$HOMEBREW_PREFIX/opt/qt@5" ]]; then
  case ":${CMAKE_PREFIX_PATH:-}:" in
    *":$HOMEBREW_PREFIX/opt/qt@5:"*) ;;
    *) export CMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH:+$CMAKE_PREFIX_PATH:}$HOMEBREW_PREFIX/opt/qt@5" ;;
  esac
fi

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
