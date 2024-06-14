if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x CLICOLOR 1
set -x LSCOLORS GxFxCxDxBxegedabagaced

set -x EDITOR /opt/homebrew/bin/nvim
set -x PATH $PATH $HOME/bin /opt/homebrew/opt/binutils/bin $HOME/.cargo/bin
eval "$(/opt/homebrew/bin/brew shellenv fish)"

alias ls='ls --color=auto'
alias ll='ls -al'

atuin init fish | source
