if [[ -z "$XDG_RUNTIME_DIR" ]]; then
	export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

# Aliases and Keybindings
[ -f ~/.alias ] && source ~/.alias

# starship, zoxide, fzf
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
eval "$(fzf --bash)"

# History
HISTFILE=~/.history
HISTSIZE=500
HISTFILESIZE=500
HISTCONTROL=erasedups:ignoredups:ignorespace
shopt -s histappend

# asdf (all plugins + shims)
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
if [ -f "${ASDF_DATA_DIR}/completions/asdf.bash" ]; then
  . "${ASDF_DATA_DIR}/completions/asdf.bash"
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
