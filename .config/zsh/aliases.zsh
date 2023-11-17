alias ll="ls -l"

# asdf
function aqua-setup() {
	curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.2.0/aqua-installer | bash -s -- -v v2.17.3
}

# docker
function docker-image-rm() {
	local image=$(docker image ls | peco --select-1 --prompt='image>')
	if [[ $image = "" ]] then
		echo "Canceled."
	else
		local image_id=$(echo $image | sed 's/\s\{1,\}/ /g' | cut -d " " -f 3)
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
	gh pr merge $num -r -d
}

# go
function go-uninstall() {
	sudo rm -r /usr/local/go
}

function go-setup() {
	if [[ $(ls /tmp/go$1.linux-amd64.tar.gz) = *"No such file or directory"* ]]  then
		wget -P /tmp https://go.dev/dl/go$1.linux-amd64.tar.gz
	else
		echo "go$1.linux-amd64.tar.gz already exists"
	fi
	sudo tar -C /usr/local -xzf /tmp/go$1.linux-amd64.tar.gz
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
	docker run --rm -it -v $(pwd):/tmp renovate/renovate:35.2.0-slim sh -c "curl -sfL https://direnv.net/install.sh | bash && cd /tmp && direnv allow . && direnv exec . renovate $1"
}

function renovate-config-validator() {
	docker run --rm -it -v $(pwd):/tmp renovate/renovate:35.2.0-slim sh -c "cd /tmp && renovate-config-validator"
}
