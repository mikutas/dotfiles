function zsh_title_precmd() {
	local base=$(basename "$PWD")
	local dir=$(basename $(dirname "$PWD"))
	if [[ $(pwd) = "/" ]] then
		echo -ne "\033]0; $base \007"
	else
		echo -ne "\033]0; "$dir/$base" \007"
	fi
}
precmd_functions+=(zsh_title_precmd)

function zsh_title_preexec() {
	echo -ne "\e]0; "${(j:\n:)${(f)1}}" \a"
}
preexec_functions+=(zsh_title_preexec)
