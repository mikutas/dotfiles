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
function dl-kubectl
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$argv/bin/linux/amd64/kubectl
	chmod +x ./kubectl
end

function k --description 'alias k=kubectl'
	kubectl $argv;
end

function k14 --description 'alias k=kubectl'
	kubectl_v1.14.9 $argv;
end

function k16 --description 'alias k=kubectl'
	kubectl_v1.16.11 $argv;
end

function k18 --description 'alias k=kubectl'
	kubectl_v1.18.4 $argv;
end

function kd --description 'alias kd kubectl describe'
	kubectl describe $argv;
end

function kg --description 'alias kg kubectl get'
	kubectl get $argv;
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
