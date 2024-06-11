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


" **********************************
"       Global Config
" **********************************
let g:bufExplorerShowRelativePath=1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
  
augroup rust
  " Avoid showing extra messages when using completion
  set shortmess+=c

  let g:rustfmt_options = '--edition=2021'
  
  "let g:completion_enable_auto_popup = 0
  " Trigger completion with <tab>
  " found in :help completion
  "function! s:check_back_space() abort
  "    let col = col('.') - 1
  "    return !col || getline('.')[col - 1]  =~ '\s'
  "endfunction
  "
  "inoremap <silent><expr> <TAB>
  "  \ pumvisible() ? "\<C-n>" :
  "  \ <SID>check_back_space() ? "\<TAB>" :
  "  \ completion#trigger_completion()
  
  " Visualize diagnostics
  "let g:diagnostic_enable_virtual_text = 0
  ""let g:diagnostic_auto_popup_while_jump = 0
  "let g:diagnostic_trimmed_virtual_text = '40'
  "" Don't show diagnostics while in insert mode
  "let g:diagnostic_insert_delay = 1
  "let g:diagnostic_enable_underline = 0
  
  " have a fixed column for the diagnostics to appear in
  " this removes the jitter when warnings/errors flow in
  set signcolumn=yes
  
  " Set updatetime for CursorHold
  " 300ms of no cursor movement to trigger CursorHold
  set updatetime=300
  " Show diagnostic popup on cursor hover
  "autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
  autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="line", focusable=false})
  
  " Goto previous/next diagnostic warning/error
  nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
  nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

  set signcolumn=yes 

  "autocmd!
  autocmd BufNewFile,BufRead *.rs setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd BufReadPost *.rs setlocal filetype=rust

  " LSP:  Code navigation shortcuts
  autocmd FileType rust nnoremap <silent> gd	   <cmd>lua vim.lsp.buf.definition()<CR>
  autocmd FileType rust nnoremap <silent><buffer> <leader>v :vsplit<CR> <cmd>lua vim.lsp.buf.definition()<CR>
  autocmd FileType rust nnoremap <silent><buffer> <leader>s :split<CR> <cmd>lua vim.lsp.buf.definition()<CR>
  "nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
  "nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> gt   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> gs    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gw    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <silent> gc    <cmd>lua vim.lsp.buf.declaration()<CR>

  " LanguageClient
  "au FileType rust nmap gm <Plug>(lcn-menu)
  "au FileType rust nmap gd <Plug>(lcn-definition)
  "au FileType rust nmap gt <Plug>(lcn-type-definition)
  "au FileType rust nmap gr <Plug>(lcn-references)
  "au FileType rust nmap gi <Plug>(lcn-implementation)
  ""nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  ""nnoremap <silent><buffer> <leader>v :vsplit<CR>:call LanguageClient#textDocument_definition()<CR>
  "nnoremap <silent> <leader>v :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>

  " Racer
  ""au FileType rust nmap <leader>v <Plug>(rust-def-split)
  ""au FileType rust nmap <leader>v <Plug>(rust-def-vertical)
  ""au FileType rust nmap <leader>gd <Plug>(rust-doc)
  ""autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
augroup END
