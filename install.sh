#!/bin/bash
DEBUG=${DEBUG:=0}
[ $DEBUG = '1' ] && echo "debug mode"

((DEBUG)) && echo $0
HERE=$(readlink -f $0)
((DEBUG)) && echo $HERE
CUR_PATH=$(cd $(dirname $HERE) && pwd)
((DEBUG)) && echo $CUR_PATH

grep "bash/prompt.sh" $HOME/.bashrc >> /dev/null
if [[ $? != 0 ]]; then
    echo -e "\nsource $CUR_PATH/bash/prompt.sh" >> $HOME/.bashrc
fi

source $HOME/.bashrc

if [[ ! -d $HOME/.vim ]]; then
    ln -s $CUR_PATH/vim $HOME/.vim
fi

if [[ ! -d $HOME/.screenrc ]]; then
    ln -s $CUR_PATH/bash/screenrc $HOME/.screenrc
fi

if [[ ! -d $HOME/.tmux.conf ]]; then
    ln -s $CUR_PATH/bash/tmux.conf $HOME/.tmux.conf
fi

