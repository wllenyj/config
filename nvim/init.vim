set jumpoptions=stack
set runtimepath^=~/.vim runtimepath+=~/.vim/plugin
let &packpath = &runtimepath
source ~/.vim/vimrc

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'dcampos/nvim-snippy'
  Plug 'dcampos/cmp-snippy'
  Plug 'tjdevries/lsp_extensions.nvim'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'dhananjaylatkar/cscope_maps.nvim'
  Plug 'vim-airline/vim-airline'
call plug#end()
  " Configure lsp
  " https://github.com/neovim/nvim-lspconfig#rust_analyzer


lua << EOF
    --vim.lsp.set_log_level("debug")
    require("cscope_maps").setup({
        disable_maps = false,
        skip_input_prompt = true,
        cscope = {
            skip_picker_for_single_result = true,
        }
    })
    local nvim_lsp = require'lspconfig'

  	-- Setup lspconfig.
	local function create_capabilities()
	  local capabilities = vim.lsp.protocol.make_client_capabilities()
	  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	  return capabilities
	end
    
    nvim_lsp.rust_analyzer.setup({
        on_attach=on_attach,
		capabilities = create_capabilities(),
        settings = {
            ["rust-analyzer"] = {
                --linkedProjects = {
                --    "out/default/rust-project.json",
                --    "Cargo.toml",
                --},
                --assist = {
                --    importGranularity = "module",
                --    importPrefix = "by_self",
                --},
                cargo = {
                    features = "all",
                },
                checkOnSave = {
                    features = "all",
                },
                --workspace = {
                --    symbol = {
                --        search = {
                --            limit = 10,
                --        }
                --    }
                --}
            }
        }
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- This will disable virtual text, like doing:
        -- let g:diagnostic_enable_virtual_text = 0
        virtual_text = false,
    
        -- This is similar to:
        -- let g:diagnostic_show_sign = 1
        -- To configure sign display,
        --  see: ":help vim.lsp.diagnostic.set_signs()"
        signs = true,
    
        -- This is similar to:
        -- "let g:diagnostic_insert_delay = 1"
        update_in_insert = false,
    	underline = false,
      }
    )

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local snippy = require("snippy")
    local cmp = require'cmp'

    cmp.setup({
  		completion = {
			completeopt = 'menu,menuone,noinsert',
  		},
  		preselect = cmp.PreselectMode.None,
    	snippet = {
    	  -- REQUIRED - you must specify a snippet engine
    	  expand = function(args)
    	    require('snippy').expand_snippet(args.body) -- For `snippy` users.
    	  end,
    	},
		mapping = {
      		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      		['<C-n>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      		['<C-e>'] = cmp.mapping({
      		  i = cmp.mapping.abort(),
      		  c = cmp.mapping.close(),
      		}),
			-- Enter
      		['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
      			if cmp.visible() then
      			  cmp.select_next_item()
      			elseif snippy.can_expand_or_advance() then
      			  snippy.expand_or_advance()
      			elseif has_words_before() then
      			  cmp.complete()
      			else
      			  fallback()
      			end
    		end, { "i", "s" }),

    		["<S-Tab>"] = cmp.mapping(function(fallback)
    		  if cmp.visible() then
    		    cmp.select_prev_item()
    		  elseif snippy.can_jump(-1) then
    		    snippy.previous()
    		  else
    		    fallback()
    		  end
    		end, { "i", "s" }),
	 	},
		reason = cmp.ContextReason.Manual,
		sources = cmp.config.sources({
    		  { name = 'nvim_lsp', priority = 80 },
    		  { name = 'snippy', priority = 10 }, -- For snippy users.
    		}, {
    		{ name = 'buffer', priority = 30 },
    	})
    })
EOF

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
