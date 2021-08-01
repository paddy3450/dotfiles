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

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                        
  autocmd VimEnter * PlugInstall                                                                                                      
endif

call plug#begin('~/.vim/plugged')
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	Plug 'neovim/nvim-lspconfig'
	
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
	nmap <unique> <c-r> <Plug>NetrwRefresh
" Splits open on the right and bottom
	set splitbelow splitright
" Split navigation keys
	nnoremap <C-h> <C-w><C-h>
	nnoremap <C-j> <C-w><C-j>
	nnoremap <C-k> <C-w><C-k>
	nnoremap <C-l> <C-w><C-l>
" Telescope
	nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
	nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
	nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
	nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Other remapping
	nnoremap <leader>e :Lexplor<CR>
	nnoremap <leader>o :only<CR>
	nnoremap <leader>q :q<CR>
	nnoremap <leader>w :w<CR>
	nnoremap <leader>s :nohl<CR>
	nnoremap <leader>f :find 
	nnoremap <leader>nn :set number! relativenumber!<CR>
	nnoremap <leader>nu :set number!<CR>
	nnoremap <leader>nr :set relativenumber!<CR>
	nnoremap <leader>tt :sp<CR>:term<CR>:set nonumber norelativenumber<CR>i
	nnoremap <leader>go :Goyo <CR>
	nnoremap <leader>m @
	tnoremap <C-w>h <C-\><C-n><C-w>h
	tnoremap <C-w>j <C-\><C-n><C-w>j
	tnoremap <C-w>k <C-\><C-n><C-w>k
	tnoremap <C-w>l <C-\><C-n><C-w>l
