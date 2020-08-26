""" Patrick Wallace ~/.vimrc

" Some basics:
	set nocompatible
	filetype on 
	syntax on
	set encoding=utf-8
	set number relativenumber
	set backspace=indent,eol,start
	set noswapfile
	let mapleader = " "
	let maplocalleader = " "

"Plugins
	"install Vim plug if not already installed
	if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

call plug#begin()
	Plug 'sirver/ultisnips'
	    let g:UltiSnipsExpandTrigger = '<tab>'
	    let g:UltiSnipsJumpForwardTrigger = '<tab>'
	    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

	Plug 'lervag/vimtex'
	    let g:tex_flavor='latex'
	    let g:vimtex_view_method='zathura'
	    let g:vimtex_quickfix_mode=0

	Plug 'KeitaNakamura/tex-conceal.vim'
	    set conceallevel=1
	    let g:tex_conceal='abdmg'
	    hi Conceal ctermbg=none
call plug#end()


"search
	set ic
	set hlsearch
	set incsearch
	set smartcase

" file search for all subfolders
	set path+=**
" Display all matching files when tab completing
	set wildmenu

	" NOW WE CAN
	" - Hit tab to :find by partial match
	" - Use * to make it fuzzy

" Enable autocompletion:
	set wildmode=longest,list,full

	" HIGHLIGHTS
	" - ^x^n for JUST this file
	" - ^x^f for filenames (works with our path trick!)
	" - ^x^] for tags only
	" - ^n for anything specified by the 'complete' option

	" NOW WE CAN
	" - Use ^n and ^p to go back and forth in the suggestion list


" spell checking
	map <F5> :setlocal spell!<CR>
	set spelllang=en_gb
	" ]s and [s next and previous error, z= suggestions zg add to
	" dictionary zug remove from dictionary

" TAG JUMPING

" Create the `tags` file (may need to install ctags first)
	command! MakeTags !ctags -R .

	" NOW WE CAN
	" - Use ^] to jump to tag under cursor
	" - Use g^] for ambiguous tags
	" - Use ^t to jump back up the tag stack


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

" Other remapping
	nnoremap <leader>e :Lexplor<CR>
	nnoremap <leader>o :only<CR>
	nnoremap <leader>q :q<CR>
	nnoremap <leader>w :w<CR>
	nnoremap <leader>s :nohl<CR>
