if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x CLICOLOR 1
set -x LSCOLORS GxFxCxDxBxegedabagaced

set -x EDITOR /home/lixiang/soft/nvim-linux-x86_64/bin/nvim

set -x PATH $PATH $HOME/bin $HOME/.local/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/soft/nvim-linux-x86_64/bin

#export RUSTUP_DIST_SERVER="https://rsproxy.cn"
#export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
set -x RUSTUP_DIST_SERVER https://rsproxy.cn
set -x RUSTUP_UPDATE_ROOT https://rsproxy.cn/rustup

alias ls='ls --color=auto'
alias ll='ls -al'
alias fda='fd -H -I -g'
alias rga='rg --no-ignore'

atuin init fish | source
