#!/bin/bash
DEBUG=${DEBUG:=0}
[ $DEBUG = '1' ] && echo "debug mode"

((DEBUG)) && echo $0
HERE=$(readlink -f $0)
((DEBUG)) && echo $HERE
CUR_PATH=$(cd $(dirname $HERE) && pwd)
((DEBUG)) && echo $CUR_PATH


if ! command -v cargo &> /dev/null; then
    if ! command -v curl &> /dev/null; then
        echo "❌ 未检测到 curl 命令，请先安装 curl"
        exit 1
    else
        echo "✅ 开始安装rust..."
        echo "----------------------------------------"

        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	source $HOME/.bashrc
    fi
fi


if ! command -v zellij &> /dev/null; then
    echo "----------------------------------------"
    echo "✅ 开始安装 zellij..."
    cargo install --locked zellij || exit 1
fi

if [[ ! -d $HOME/.config/zellij ]]; then
    ln -s $CUR_PATH/zellij $HOME/.config/zellij
else
    echo 'exist .config/zellij'
fi

if ! command -v rg &> /dev/null; then
    echo "----------------------------------------"
    echo "✅ 开始安装 ripgrep..."
    cargo install ripgrep || exit 1
fi

if ! command -v atuin &> /dev/null; then
    echo "----------------------------------------"
    echo "✅ 开始安装 atuin..."
    cargo install atuin || exit 1
fi


grep "bash/prompt.sh" $HOME/.bashrc >>/dev/null
if [[ $? != 0 ]]; then
	echo -e "\nsource $CUR_PATH/bash/prompt.sh" >>$HOME/.bashrc
fi

source $HOME/.bashrc

if [[ ! -d $HOME/.vim ]]; then
	ln -s $CUR_PATH/vim $HOME/.vim
fi

#if [[ ! -d $HOME/.screenrc ]]; then
#	ln -s $CUR_PATH/bash/screenrc $HOME/.screenrc
#fi

if [[ ! -d $HOME/.config/fish ]]; then
	ln -s $CUR_PATH/fish $HOME/.config/fish
else
	echo 'exist .config/fish'
fi

if [[ ! -d $HOME/.config/tmux ]]; then
	ln -s $CUR_PATH/tmux $HOME/.config/tmux
else
	echo 'exist .config/tmux dir'
fi

if [[ ! -d $HOME/.config/nvim ]]; then
	#mkdir $HOME/.config/nvim
	ln -s $CUR_PATH/nvim $HOME/.config/nvim
else
	echo 'exist .config/nvim'
fi

if [[ ! -d $HOME/.config/gitui ]]; then
	ln -s $CUR_PATH/gitui $HOME/.config/gitui
else
	echo 'exist .config/gitui'
fi

