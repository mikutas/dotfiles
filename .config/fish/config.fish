. ~/.config/fish/aliases.fish
# Personal access tokens
. ~/.config/fish/github.fish
# PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.krew/bin $PATH
set -x PATH /usr/local/go/bin $PATH
set -x GOPATH (go env GOPATH)
set -x PATH $GOPATH/bin $PATH
set -x PATH /usr/local/kubebuilder/bin $PATH
set -x PATH ~/.linkerd2/bin $PATH
# kubectl diff
set -x KUBECTL_EXTERNAL_DIFF colordiff
# https://github.com/instrumenta/kubernetes-json-schema/issues/26
set -x KUBEVAL_SCHEMA_LOCATION https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master
# https://jlk.fjfi.cvut.cz/arch/manpages/man/gpg-agent.1.html
set -x GPG_TTY (tty)
# https://github.com/99designs/aws-vault
set -x AWS_VAULT_BACKEND pass
set -x AWS_SESSION_TOKEN_TTL 10h
# fish-ghq
set -g GHQ_SELECTOR peco

function fish_title
	set base (basename (pwd))
	set dir (basename (dirname (pwd)))
	if test $dir = "/";
		set title $base
	else
		set title "$dir/$base"
	end
	#echo "$argv[1] | $title"
	if test "$argv[1]" != "";
		echo $argv
	else
		echo $title
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

# https://asdf-vm.com/#/core-manage-asdf
source ~/.asdf/asdf.fish
# https://aquaproj.github.io/docs/tutorial-basics/quick-start
set -x PATH $HOME/.local/share/aquaproj-aqua/bin $PATH
set -x PATH ~/.asdf/installs/(cat ~/.tool-versions | rg nodejs | sed -e 's/\s/\//')/bin $PATH

# starship
starship init fish | source
