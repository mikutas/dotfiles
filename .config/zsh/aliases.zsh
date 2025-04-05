alias ll="ls -l"

# aqua
function aqua-setup() {
	curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.1/aqua-installer | bash -s -- -v v2.48.1
}

function aqua-sort() {
	yq e '.packages |= sort_by(.name)' -i aqua.yaml
}

# aws
# Macのみ
function awsprof() {
	env=$2
	if [[ -z "$2" ]] then
		read "env?env>"
	fi
	# $1で.envrcの位置を指定
	gsed -i "s/AWS_PROFILE=.*$/AWS_PROFILE=$env/" $1
}

function start-session() {
	read "target?target>"
	aws ssm start-session --target $target
}

# docker
function docker-image-rm() {
	local image=$(docker image ls | peco --select-1 --prompt='image>')
	if [[ $image = "" ]] then
		echo "Canceled."
	else
		local image_id=$(echo $image | sed 's/\s\{1,\}/ /g' | cut -d " " -f 3)
		if [[ $(uname) = "Darwin" ]] then
			local image_id=$(echo $image | gsed 's/\s\{1,\}/ /g' | cut -d " " -f 3)
		fi
		docker image rm $image_id
	fi
}

# eza
alias ls="eza"

# git
alias add="git add"
alias amend="git commit --amend"
alias commit="git commit"
alias fetch="git fetch"
alias fixup="git commit --amend --no-edit"
alias ghq-root="git config --global ghq.root ~/go/src"
alias gl="git log"
alias glo="git log --oneline"
alias pull="git pull --rebase --prune"
alias push="git push"
alias rebase="git rebase"
alias stash="git stash"
alias lg="lazygit"

# GitHub CLI
function gh-repo-fork() {
	gh repo fork
	local repo=$(basename $(pwd))
	git remote add mikutas git@github.com:mikutas/$repo
}

function gh-pr-merge() {
	local pr=$(gh pr list | peco --select-1)
	local num=$(echo $pr | cut -f 1)
	# $1に--rebaseなど適宜
	gh pr merge $num --delete-branch $1
	git pull --rebase --prune
}

function gh-ready-approve() {
	# 主に-l labelする用
	local pr=$(gh pr list $1 $2 | peco --select-1)
	local num=$(echo $pr | cut -f 1)
	if [ -z "$num" ]; then
		echo "Canceled."
		return 1
	fi
	gh pr ready $num
	gh pr review --approve $num
}

# go
function go-uninstall() {
	sudo rm -r /usr/local/go
}

function go-setup() {
	os=$(uname)
	#arch = $(uname -m)
	file=""
	if [[ $os = "Linux" ]] then
		file="go$1.linux-amd64.tar.gz"
	elif [[ $os = "Darwin" ]] then
		file="go$1.darwin-arm64.tar.gz"
	fi
	echo $file

	if [[ ! -e /tmp/$file ]]  then
			curl -o /tmp/$file -L https://go.dev/dl/$file
	else
		echo "tar.gz already exists"
	fi

	sudo tar -C /usr/local -xzf /tmp/$file
}

# kubectl
alias k="kubectl"
alias kd="kubectl describe"
alias kg="kubectl get"
alias ktx="kubectx"

# Linkerd
function l5d-setup() {
	curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | LINKERD2_VERSION=$1 sh
}

# Renovate
function renovate() {
	set -x
	args=$@
	docker run --rm -it -v $(pwd):/usr/src/app renovate/renovate:39.233.3 sh -c "curl -sfL https://direnv.net/install.sh | bash && direnv allow . && direnv exec . renovate $args"
}

function renovate-config-validator() {
	docker run --rm -it -v $(pwd):/usr/src/app renovate/renovate:39.233.3 sh -c "renovate-config-validator"
}

# Terraform
function tf() {
	if [ -z $1 ]; then
		echo "Subcommand required (plan/apply)"
		return 1
	fi
	if [ -z $2 ]; then
		echo "PR number required"
		return 1
	fi
	tfcmt -pr $2 $1 -- terraform $1
}
