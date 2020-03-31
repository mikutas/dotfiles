# Defined in - @ line 0
function add --description 'alias add=git add'
	git add $argv;
end
# Defined in - @ line 0
function commit --description 'alias commit=git commit'
	git commit $argv;
end
# Defined in - @ line 0
function dcp --description 'alias dcp docker-compose'
	docker-compose  $argv;
end
# Defined in - @ line 0
function fixup --description 'alias fixup=git commit --amend --no-edit'
	git commit --amend --no-edit $argv;
end
# Defined in - @ line 0
function gl --description 'alias gl=git log'
	git log $argv;
end
# Defined in - @ line 0
function k --description 'alias k=kubectl'
	kubectl  $argv;
end
# Defined in - @ line 0
function kd --description 'alias kd kubectl describe'
	kubectl describe $argv;
end
# Defined in - @ line 0
function kg --description 'alias kg kubectl get'
	kubectl get $argv;
end
# Defined in - @ line 0
function ktx --description 'alias ktx=kubectx'
	kubectx  $argv;
end
# Defined in - @ line 0
function lg --description 'alias lg=lazygit'
	lazygit  $argv;
end
# Defined in - @ line 0
function ls --description 'alias ls exa'
	exa  $argv;
end
# Defined in - @ line 0
function lzd --description 'alias lzd=lazydocker'
	lazydocker  $argv;
end
# Defined in - @ line 0
function mfad --description 'alias mfad aws-mfa --profile dev'
	aws-mfa --profile dev $argv;
end
# Defined in - @ line 0
function mfap --description 'alias mfap aws-mfa --profile prod'
	aws-mfa --profile prod $argv;
end
# Defined in - @ line 0
function push --description 'alias push=git push'
	git push $argv;
end
# Defined in - @ line 0
function rebase --description 'alias rebase git rebase'
	git rebase $argv;
end
# Defined in - @ line 0
function stash --description 'alias stash git stash'
	git stash $argv;
end
