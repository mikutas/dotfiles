. ~/.config/fish/aliases.fish
# PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH $PATH $HOME/.krew/bin
set -x GOPATH (go env GOPATH)
set -x PATH $GOPATH/bin $PATH
# https://jlk.fjfi.cvut.cz/arch/manpages/man/gpg-agent.1.html
set -x GPG_TTY (tty)
# fish-ghq
set -g GHQ_SELECTOR peco
# bobthefish
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 0
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_display_k8s_context yes
set -g theme_newline_cursor yes
set -g theme_show_exit_status yes
set -g theme_title_display_path no
set -g theme_title_display_process yes
# starship
#starship init fish | source
