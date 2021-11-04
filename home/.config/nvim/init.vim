" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                        
  autocmd VimEnter * PlugInstall                                                                                                      
endif

call plug#begin('~/.vim/plugged')
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" LSP and autocoplete
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
	
	Plug 'sirver/ultisnips'
	    let g:UltiSnipsExpandTrigger = '<tab>'
	    let g:UltiSnipsJumpForwardTrigger = '<tab>'
	    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	    let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

	Plug 'lervag/vimtex'
	    let g:tex_flavor='latex'
	    let g:vimtex_view_method='zathura'
	    let g:vimtex_quickfix_mode=0

	Plug 'KeitaNakamura/tex-conceal.vim'
	    set conceallevel=1
	    let g:tex_conceal='abdmg'
	    hi Conceal ctermbg=none

	Plug 'junegunn/goyo.vim'
		let g:goyo_width=100
	Plug 'jalvesaq/Nvim-R'
	Plug 'stevearc/vim-arduino'
		let g:arduino_cmd = '/usr/bin/arduino'
		let g:arduino_dir = '/usr/share/arduino'
		let g:arduino_home_dir = '~/Arduino'
		let g:arduino_use_cli = 1  " this will always use arduino-cli
call plug#end()

" Some basics:
	set nocompatible
	filetype on 
	syntax on
	set encoding=utf-8
	set number relativenumber
	set backspace=indent,eol,start
	set swapfile
	let mapleader = " "
	let maplocalleader = " "
"search
	set ignorecase
	set hlsearch
	set incsearch
	set smartcase
	set path+=.,**
	set wildmenu
	set wildmode=longest,list,full
	set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd
	map <F5> :setlocal spell!<CR>
	set spelllang=en_gb
	command! MakeTags !ctags -R .
" netrw
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
	let g:netrw_browse_split = 4
	let g:netrw_altv = 1
	let g:netrw_winsize = 25
" Splits
	set splitbelow splitright
	nnoremap <C-h> <C-w><C-h>
	nnoremap <C-j> <C-w><C-j>
	nnoremap <C-k> <C-w><C-k>
	nnoremap <C-l> <C-w><C-l>
	tnoremap <C-w>h <C-\><C-n><C-w>h
	tnoremap <C-w>j <C-\><C-n><C-w>j
	tnoremap <C-w>k <C-\><C-n><C-w>k
	tnoremap <C-w>l <C-\><C-n><C-w>l
	nnoremap <Leader>+ :vertical resize +5<CR>
	nnoremap <Leader>- :vertical resize -5<CR>
	nnoremap <Leader>zz :resize 100<CR>:vertical resize 1000<CR>
" Telescope
	nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
	nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
	nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
	nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Overrides of default keyfunction remaps
	vnoremap < <gv
	vnoremap > >gv
" Other remapping
	nnoremap <leader>conf :tabnew ~/.config/nvim/init.vim<CR>
	nnoremap <leader>vs :source $MYVIMRC<CR>
	nnoremap <leader>ee :Lexplor<CR>
	nnoremap <leader>o :only<CR>
	nnoremap <leader>q :q<CR>
	nnoremap <leader>w :w<CR>
	nnoremap <leader>s :nohl<CR>
	nnoremap <leader>f :find 
	nnoremap <leader>b :buffers<CR>
	nnoremap <leader>nn :set number! relativenumber!<CR>
	nnoremap <leader>nu :set number!<CR>
	nnoremap <leader>nr :set relativenumber!<CR>
	nnoremap <leader>tt :sp<CR>:term<CR>:set nonumber norelativenumber<CR>i
	nnoremap <leader>go :Goyo <CR>
	nnoremap <leader>m @
	nnoremap <leader>dws :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR> " remove trailing white space
	nmap <leader>lst  <Plug>(toggle-lsp-diag)
	nmap <leader>lsd <Plug>(toggle-lsp-diag-default)
	nmap <leader>lsf <Plug>(toggle-lsp-diag-off)
	nmap <leader>lso <Plug>(toggle-lsp-diag-on)

lua << EOF
require'toggle_lsp_diagnostics'.init()
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
local servers = { 'r_language_server', 'pyright', 'ccls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
