#!/bin/zsh -f
# Run with: zsh -fi tests/zsh-fzf.zsh
setopt errexit nounset pipefail

repo=${0:A:h:h}
fixture=$(mktemp -d "${TMPDIR:-/tmp}/dotfiles-zsh-test.XXXXXX")
trap 'command rm -rf -- "$fixture"' EXIT
mkdir -p "$fixture/bin" "$fixture/omz/custom/plugins/zsh-vi-mode"

# Minimal fzf output: exercise initialization and binding installation, not fzf UI.
cat > "$fixture/bin/fzf" <<'EOF'
#!/bin/sh
[ "$1" = --zsh ] || exit 1
cat <<'ZSH'
fzf-file-widget() { :; }
fzf-history-widget() { :; }
fzf-cd-widget() { :; }
zle -N fzf-file-widget
zle -N fzf-history-widget
zle -N fzf-cd-widget
bindkey -M viins '^T' fzf-file-widget
bindkey -M viins '^R' fzf-history-widget
bindkey -M viins '^[c' fzf-cd-widget
ZSH
EOF
chmod +x "$fixture/bin/fzf"

cat > "$fixture/omz/oh-my-zsh.sh" <<'EOF'
if (( ${plugins[(Ie)zsh-vi-mode]} )); then
  zvm_init() {
    # Reproduce zsh-vi-mode's dynamically scoped local array.
    local commands=("${zvm_after_init_commands[@]}") cmd
    bindkey -v
    for cmd in "${commands[@]}"; do
      eval "$cmd"
    done
  }
  [[ $test_mode != synchronous ]] || zvm_init
fi
EOF

for test_mode in deferred synchronous no-vi-mode; do
  (
    export ZSH="$fixture/omz"
    export ZSH_CUSTOM="$ZSH/custom"
    path=("$fixture/bin" $path)
    if [[ $test_mode == no-vi-mode ]]; then
      command rm -- "$ZSH_CUSTOM/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
    else
      : > "$ZSH_CUSTOM/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
    fi
    source "$repo/dot_config/zsh/shell.zsh"
    [[ $test_mode != deferred ]] || zvm_init
    for key widget in '^R' fzf-history-widget '^T' fzf-file-widget '^[c' fzf-cd-widget; do
      if [[ $(bindkey -M viins "$key") != *" $widget" ]]; then
        print -u2 -- "FAIL: $test_mode: $key is not bound to $widget"
        exit 1
      fi
    done
    print -- "PASS: $test_mode"
  )
done
