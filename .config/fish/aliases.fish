# aqua
# go required
function aqua-setup
	curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v1.1.2/aqua-installer | bash -s -- -v v1.25.0
end
# 古いパッケージを削除するために全パッケージを削除して再インストール
function aqua-clean
	rm -r ~/.local/share/aquaproj-aqua/pkgs
	aqua i
end

# binの削除のみ（パッケージは残る）
function aqua-rm
	rm ~/.local/share/aquaproj-aqua/bin/$argv[1]
end

# asdf
# https://asdf-vm.com/guide/getting-started.html#_2-download-asdf
function asdf-setup
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
	mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

function asdfc # asdf check update
	echo "checking" $argv[1]
	if colordiff (asdf list $argv[1] | tail -n 1 | sed -e "s/^\s\s//" | psub) (asdf list-all $argv[1] | tail -n 1 | psub)
		echo "=>latest"
	end
end

function asdfc-all
	if test (count $argv) -lt 2
		set plugins (asdf plugin list)
	else
		set plugins (asdf plugin list | rg -v "$argv[1]")
	end
	for plugin in $plugins
		asdfc $plugin
	end
end

function asdf-install
	asdf install $argv[1] $argv[2]
	asdf global $argv[1] $argv[2]
end

# exa
function ls
	exa $argv;
	if test $status -ne 0;
		/usr/bin/ls $argv;
	end
end

# fisher https://github.com/jorgebucaran/fisher
function fisher-setup
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Git
function add -w 'git add'
	git add $argv;
end

function amend -w 'git commit --amend'
	git commit --amend $argv;
end

function commit
	git commit $argv;
end

function fetch -w 'git fetch'
	git fetch $argv;
end

function fixup -w 'git commit --amend --no-edit'
	git commit --amend --no-edit $argv;
end

function ghq-root
	git config --global ghq.root ~/go/src
end

function gl -w 'git log'
	git log $argv;
end

function glo -w 'git log --oneline'
	git log --oneline $argv;
end

function pull -w 'git pull --rebase --prune'
	git pull --rebase --prune
end

function push -w 'git push'
	git push $argv;
end

function rebase -w 'git rebase'
	git rebase $argv;
end

function stash -w 'git stash'
	git stash $argv;
end

function lg -w 'lazygit'
	lazygit $argv;
end

# GitHub
function gh-repo-fork
	gh repo fork
	set repo (basename (pwd))
	git remote add mikutas git@github.com:mikutas/$repo
end

# go
function go-uninstall
	sudo rm -r /usr/local/go
end

function go-setup
	if not ls /tmp/go$argv.linux-amd64.tar.gz
		wget -P /tmp https://golang.org/dl/go$argv.linux-amd64.tar.gz
	else
		echo "go$argv.linux-amd64.tar.gz already exists"
	end
	sudo tar -C /usr/local -xzf /tmp/go$argv.linux-amd64.tar.gz
end

# Kubernetes
function k -w 'kubectl'
	kubectl $argv;
end

function kd -w 'kubectl describe'
	k describe $argv;
end

function kg -w 'kubectl get'
	k get $argv;
end

function ktx -w 'kubectx'
	kubectx  $argv;
end

# Linkerd
function l5d-setup
	curl -sL https://run.linkerd.io/install | env LINKERD2_VERSION=$argv sh
end

function l5d-board
	linkerd viz dashboard $argv;
end

# Renovate
function renovate
	if ls ./.envrc
		docker run --rm -it -v (pwd):/tmp renovate/renovate:34.48.3-slim sh -c "curl -sfL https://direnv.net/install.sh | bash && cd /tmp && direnv allow . && direnv exec . renovate $argv"
	else
		docker run --rm -it -v (pwd):/tmp renovate/renovate:34.48.3-slim sh -c "renovate $argv"
	end
    rm -rf renovate/
end

function renovate-config-validator
	docker run --rm -it -v (pwd):/tmp renovate/renovate:34.48.3-slim sh -c "cd /tmp && renovate-config-validator"
end

# todoist
function todo -w 'todoist sync && todoist list --filter "(overdue | today)"'
	todoist sync && todoist list --filter "(overdue | today)";
end
