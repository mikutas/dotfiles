# aqua
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

# fisher
function fisher-install
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

function gl -w 'git log'
	git log $argv;
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

function pull -w 'git pull --rebase --prune'
	git pull --rebase --prune
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

function go-install
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
function l5d-install
	curl -sL https://run.linkerd.io/install | env LINKERD2_VERSION=$argv sh
end

function l5d-board
	linkerd viz dashboard $argv;
end

# todoist
function todo -w 'todoist sync && todoist list --filter "(overdue | today)"'
	todoist sync && todoist list --filter "(overdue | today)";
end
