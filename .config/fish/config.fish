. ~/.config/fish/aliases.fish
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH $PATH $HOME/.krew/bin
set -x GOPATH (go env GOPATH)
set -x PATH $GOPATH/bin $PATH
set GHQ_SELECTOR peco
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 0
set -g theme_display_git_master_branch yes
set -g theme_display_k8s_context yes
set -g theme_title_display_process yes
set -g theme_newline_cursor yes
