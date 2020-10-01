# Git
function add --description 'alias add=git add'
	git add $argv;
end

function amend --description 'alias amend=git commit --amend'
	git commit --amend $argv;
end

function commit --description 'alias commit=git commit'
	git commit $argv;
end

function fetch --description 'alias fetch=git fetch'
	git fetch $argv;
end

function fixup --description 'alias fixup=git commit --amend --no-edit'
	git commit --amend --no-edit $argv;
end

function gl --description 'alias gl=git log'
	git log $argv;
end

function push --description 'alias push=git push'
	git push $argv;
end

function rebase --description 'alias rebase git rebase'
	git rebase $argv;
end

function stash --description 'alias stash git stash'
	git stash $argv;
end

function pull --description 'alias pull git pull'
	git pull --rebase --prune
end

function lg --description 'alias lg=lazygit'
	lazygit $argv;
end

# exa
function ls --description 'alias ls exa'
	exa $argv;
	if test $status -ne 0;
		/usr/bin/ls $argv;
	end
end

# Docker
function dcp --description 'alias dcp docker-compose'
	docker-compose $argv;
end

function lzd --description 'alias lzd=lazydocker'
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

function k --description 'alias k=kubectl'
	kubectl $argv;
end

function kd --description 'alias kd kubectl describe'
	k describe $argv;
end

function kg --description 'alias kg kubectl get'
	k get $argv;
end

function ktx --description 'alias ktx=kubectx'
	kubectx  $argv;
end

# AWS
function mfad --description 'alias mfad aws-mfa --profile dev'
	aws-mfa --profile dev $argv;
end

function mfap --description 'alias mfap aws-mfa --profile prod'
	aws-mfa --profile prod $argv;
end

# todoist
function todo --description 'alias todo todoist sync && todoist list --filter "(overdue | today)"'
	todoist sync && todoist list --filter "(overdue | today)";
end
