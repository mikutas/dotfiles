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
	git remote add tkms0106 git@github.com:tkms0106/$repo
end

# exa
function ls
	exa $argv;
	if test $status -ne 0;
		/usr/bin/ls $argv;
	end
end

# Docker
function lzd -w 'lazydocker'
	lazydocker $argv;
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

# Bitwarden
function bw-install
	if not ls /tmp/bw-linux-$argv.zip
		wget -P /tmp https://github.com/bitwarden/cli/releases/download/v$argv/bw-linux-$argv.zip
	else
		echo "bw-linux-$argv.zip already exists"
	end
	unzip /tmp/bw-linux-$argv.zip -d /tmp
	chmod +x /tmp/bw
	sudo mv /tmp/bw /usr/local/bin
end

# starship
function starship-install
	curl -fsSL https://starship.rs/install.sh | bash
end
