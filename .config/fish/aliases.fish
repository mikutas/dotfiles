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
function dcp -w 'docker-compose'
	docker-compose $argv;
end

function lzd -w 'lazydocker'
	lazydocker $argv;
end

# Kubernetes
function kubectl
	set KUBE1_15 ~/.asdf/installs/kubectl/1.15.12/bin/kubectl
	set KUBE1_16 ~/.asdf/installs/kubectl/1.16.15/bin/kubectl
	set KUBE1_17 ~/.asdf/installs/kubectl/1.17.17/bin/kubectl
	set KUBE1_18 ~/.asdf/installs/kubectl/1.18.18/bin/kubectl
	set KUBE1_19 ~/.asdf/installs/kubectl/1.19.10/bin/kubectl
	set KUBE1_20 ~/.asdf/installs/kubectl/1.20.6/bin/kubectl

	set VERSION ($KUBE1_20 version --short | tail -n 1 | sed -r "s/^Server Version: v([0-9].[0-9][0-9]).[0-9].*/\1/")

	if test (string match $VERSION "1.15")
		$KUBE1_15 $argv;
	else if test (string match $VERSION "1.16")
		$KUBE1_16 $argv;
	else if test (string match $VERSION "1.17")
		$KUBE1_17 $argv;
	else if test (string match $VERSION "1.18")
		$KUBE1_18 $argv;
	else if test (string match $VERSION "1.19")
		$KUBE1_19 $argv;
	else if test (string match $VERSION "1.20")
		$KUBE1_20 $argv;
	else
		echo "Debug: $VERSION"
	end
end

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
	curl -sL run.linkerd.io/install | env LINKERD2_VERSION=$argv sh
end

function l5d-board
	linkerd viz dashboard $argv;
end

# AWS
function mfad
	aws-mfa --profile dev $argv;
end

function mfap
	aws-mfa --profile prod $argv;
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
		echo "already exists"
	end
	sudo tar -C /usr/local -xzf /tmp/go$argv.linux-amd64.tar.gz
end
