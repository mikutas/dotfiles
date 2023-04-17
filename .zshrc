for file in $(ls ~/.config/zsh)
do
	source ~/.config/zsh/$file
done

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

autoload -U compinit && compinit
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# https://aquaproj.github.io/docs/reference/config/#environment-variables
export AQUA_GLOBAL_CONFIG=$HOME/aqua.yaml
# https://aquaproj.github.io/docs/reference/use-aqua-with-other-tools
# PATH内の優先度が下がるように早くexportする
export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH

export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/sbin:$PATH
export PATH=/usr/local/go/bin:$PATH
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.krew/bin:$PATH
export PATH=$HOME/.linkerd2/bin:$PATH

# https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
. "$HOME/.asdf/asdf.sh"

# https://github.com/instrumenta/kubernetes-json-schema/issues/26
export KUBEVAL_SCHEMA_LOCATION=https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master

# https://jlk.fjfi.cvut.cz/arch/manpages/man/gpg-agent.1.html
export GPG_TTY=$(tty)

# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

# https://starship.rs/guide/#%F0%9F%9A%80-installation
eval "$(starship init zsh)"

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#packages
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#using-packages
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
