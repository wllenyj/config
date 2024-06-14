" **********************************
"       Vim Compatible
" **********************************
set jumpoptions=stack
set runtimepath^=~/.vim runtimepath+=~/.vim/plugin
let &packpath = &runtimepath
source ~/.vim/vimrc


" **********************************
"       Lua Init 
" **********************************
lua require('init')


