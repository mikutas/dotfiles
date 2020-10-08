# Git
function add
	git add $argv;
end

function amend
	git commit --amend $argv;
end

function commit
	git commit $argv;
end

function fetch
	git fetch $argv;
end

function fixup
	git commit --amend --no-edit $argv;
end

function gl
	git log $argv;
end

function push
	git push $argv;
end

function rebase
	git rebase $argv;
end

function stash
	git stash $argv;
end

function pull
	git pull --rebase --prune
end

function lg
	lazygit $argv;
end

# exa
function ls
	exa $argv;
	if test $status -ne 0;
		/usr/bin/ls $argv;
	end
end

# Docker
function dcp
	docker-compose $argv;
end

function lzd
	lazydocker $argv;
end

# Kubernetes
function kubectl
	set KUBE1_15 ~/.asdf/installs/kubectl/1.15.12/bin/kubectl
	set KUBE1_16 ~/.asdf/installs/kubectl/1.16.15/bin/kubectl
	set KUBE1_17 ~/.asdf/installs/kubectl/1.17.12/bin/kubectl
	set KUBE1_18 ~/.asdf/installs/kubectl/1.18.9/bin/kubectl

	set KUBE_CURRENT_CONTEXT ($KUBE1_18 config current-context)

	if test (string match "*dev-20200513" $KUBE_CURRENT_CONTEXT);
		$KUBE1_17 $argv;
	else if test (string match "*prod-20200707" $KUBE_CURRENT_CONTEXT);
		$KUBE1_16 $argv;
	else if test (string match "*dev" $KUBE_CURRENT_CONTEXT);
		$KUBE1_16 $argv;
	else if test (string match "*prod" $KUBE_CURRENT_CONTEXT);
		$KUBE1_15 $argv;
	else if test $KUBE_CURRENT_CONTEXT = "sandbox";
		$KUBE1_17 $argv;
	else
		$KUBE1_18 $argv;
	end
end

function k
	kubectl $argv;
end

function kd
	k describe $argv;
end

function kg
	k get $argv;
end

function ktx
	kubectx  $argv;
end

# AWS
function mfad
	aws-mfa --profile dev $argv;
end

function mfap
	aws-mfa --profile prod $argv;
end

# todoist
function todo
	todoist sync && todoist list --filter "(overdue | today)";
end
