. ~/.config/fish/aliases.fish

set -x AQUA_GLOBAL_CONFIG ~/aqua.yaml

# PATH
# https://aquaproj.github.io/docs/tutorial-basics/quick-start
fish_add_path ~/.local/share/aquaproj-aqua/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths
fish_add_path ~/.local/bin
fish_add_path ~/.krew/bin
fish_add_path /usr/local/go/bin
set -x GOPATH (go env GOPATH)
fish_add_path $GOPATH/bin
fish_add_path ~/.linkerd2/bin

# https://github.com/instrumenta/kubernetes-json-schema/issues/26
set -x KUBEVAL_SCHEMA_LOCATION https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master

# https://jlk.fjfi.cvut.cz/arch/manpages/man/gpg-agent.1.html
set -x GPG_TTY (tty)

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

fish_add_path ~/.asdf/installs/(cat ~/.tool-versions | rg nodejs | sed -e 's/\s/\//')/bin

# https://direnv.net/docs/hook.html#fish
direnv hook fish | source

# starship
starship init fish | source
