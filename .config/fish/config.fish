. ~/.config/fish/aliases.fish
# Personal access tokens
. ~/.config/fish/github.fish
# PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.krew/bin $PATH
set -x PATH ~/.asdf/shims $PATH
set -x PATH /usr/local/go/bin $PATH
set -x GOPATH (go env GOPATH)
set -x PATH $GOPATH/bin $PATH
set -x PATH /usr/local/kubebuilder/bin $PATH
# kubectl diff
set -x KUBECTL_EXTERNAL_DIFF colordiff
# https://jlk.fjfi.cvut.cz/arch/manpages/man/gpg-agent.1.html
set -x GPG_TTY (tty)
# fish-ghq
set -g GHQ_SELECTOR peco
# prompt
set -g fish_prompt_pwd_dir_length 0
# bobthefish
set -g theme_display_date no
set -g theme_project_dir_length 0
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_display_k8s_context yes
set -g theme_newline_cursor yes
set -g theme_show_exit_status yes
# starship
starship init fish | source

function fish_title
	set base (basename (pwd))
	set dir (basename (dirname (pwd)))
	if test $dir = "/";
		echo $base
	else
		echo "$dir/$base"
	end
end

# No configuration is needed if you’re using Homebrew’s fish. Friendly!
# If your fish is from somewhere else, add the following to your ~/.config/fish/config.fish:
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/takumi/google-cloud-sdk/path.fish.inc' ]; . '/home/takumi/google-cloud-sdk/path.fish.inc'; end
