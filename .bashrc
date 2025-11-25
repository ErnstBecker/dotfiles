[[ $- != *i* ]] && return

[ -f ~/.alias ] && source ~/.alias

eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

if command -v fzf >/dev/null 2>&1; then
	for fzf_path in /usr/share/fzf /usr/local/share/fzf; do
		if [ -f "$fzf_path/key-bindings.bash" ]; then
			source "$fzf_path/key-bindings.bash"
			source "$fzf_path/completion.bash"
			break
		fi
	done
fi

export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
[ -f "$ASDF_DATA_DIR/completions/asdf.bash" ] && source "$ASDF_DATA_DIR/completions/asdf.bash"

HISTFILE=~/.history
HISTSIZE=500
HISTFILESIZE=500
shopt -s histappend cmdhist
HISTCONTROL=ignoreboth:erasedups

PREEXEC_FILE="$HOME/.local/share/bash-preexec.sh"
if [ ! -f "$PREEXEC_FILE" ]; then
	mkdir -p "$(dirname "$PREEXEC_FILE")"
	command -v curl >/dev/null 2>&1 && curl -fsSL https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o "$PREEXEC_FILE"
	command -v wget >/dev/null 2>&1 && wget -q https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -O "$PREEXEC_FILE"
fi
[ -f "$PREEXEC_FILE" ] && source "$PREEXEC_FILE"

[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /etc/bash_completion ] && source /etc/bash_completion

COMPLETION_DIR="$HOME/.local/share/bash-completion/completions"
mkdir -p "$COMPLETION_DIR"
for f in "$COMPLETION_DIR"/*; do [ -r "$f" ] && source "$f"; done
