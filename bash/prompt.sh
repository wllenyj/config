#!/bin/bash

function pprom2 {
ret_num=$?

# regular colors
local K="\[\033[0;30m\]"  # black
local R="\[\033[0;31m\]"  # red
local G="\[\033[0;32m\]"  # green
local Y="\[\033[0;33m\]"  # yellow
local B="\[\033[0;34m\]"  # blue
local M="\[\033[0;35m\]"  # magenta
local C="\[\033[0;36m\]"  # cyan
local W="\[\033[0;37m\]"  # white

local NONE="\[\033[0m\]"     # none

# emphasized (bolded) colors
local EMK="\[\033[1;30m\]"
local EMR="\[\033[1;31m\]"
local EMG="\[\033[1;32m\]"
local EMY="\[\033[1;33m\]"
local EMB="\[\033[1;34m\]"
local EMM="\[\033[1;35m\]"
local EMC="\[\033[1;36m\]"
local EMW="\[\033[1;37m\]"


case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

if [ "x$SSH_CONNECTION" != x ]; then
  LOCAL_IP=`echo "$SSH_CONNECTION" | awk '{print $3}'`
elif [ "x$SSH3_CONNECTION" != "x" ]; then
  LOCAL_IP=`echo "$SSH_CONNECTION" | awk '{print $3}'`
elif [ "x$SSH2_CONNETCION" != x ]; then
  LOCAL_IP=`echo "$SSH2_CONNECTION" | awk '{print $3}'`
else
  LOCAL_IP=`/sbin/ifconfig | grep -w 'inet' | grep -v '127.0.0.1' | grep -v '172\.' | awk '{print $2}'`
fi
  
LOCAL_IP=${LOCAL_IP:=`hostname`}

# user color
if [ $UID -eq "0" ]; then 
  UC=$EMR # root's color
  suffix='#'
else
  UC=$G
  suffix='$'
fi
#if [[ $(id -u) -eq 0 ]]; then
#  UC=$LIGHT_RED
#else
#  UC='\[\e[0m\]\[\e[0;92m\]'
#fi



PS1="tty:[$EMC\l$NONE] \
jobs:[$EMC\j$NONE] \
cwd:[$UC\u$NONE@$G$LOCAL_IP$NONE:$EMC\w$NONE]\n\
`date +%H:%M` [\`if [ \$ret_num != 0 ]; then echo \"$EMR$ret_num$NONE\"; else echo \"$EMG$ret_num$NONE\"; fi\`] \$ "

}

PROMPT_COMMAND=pprom2
