chr() { printf '%b' "\\x$(printf '%x' "$1")"; }
ord() { printf '%d\n' "'$1"; }

# Change directory when exiting Yazi; clean up even if Yazi fails.
y() {
  local tmp cwd result
  tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return
  command yazi "$@" --cwd-file="$tmp"
  result=$?
  cwd="$(cat -- "$tmp")"
  command rm -f -- "$tmp"
  (( result == 0 )) || return "$result"
  if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
    builtin cd -- "$cwd"
  fi
}

# Keep one ripgrep/fzf search implementation; do not leak helper variables.
rfv() {
  local rg_prefix='rg --column --line-number --no-heading --color=always --smart-case --'
  fzf --ansi --disabled --query "$*" \
    --bind "start:reload:$rg_prefix {q} || true" \
    --bind "change:reload:sleep 0.1; $rg_prefix {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'enter:become(${EDITOR:-vim} {1} +{2})'
}
