""" Patrck Wallace ~/.vimrc

" Some basics:
	set nocompatible
	filetype on 
	syntax on
	set encoding=utf-8
	set number relativenumber
	set backspace=indent,eol,start
	set noswapfile
	let mapleader = " "

"search
	set ic
	set hlsearch
	set incsearch
	set smartcase

" file search for all subfolders
	set path+=**
" Display all matching files when tab completeing
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

" Other remappings
	nnoremap <leader>e :Lexplor<CR>
	nnoremap <leader>o :only<CR>
	nnoremap <leader>q :q<CR>

"
"	autocmd BufRead,BufNewFile *.tex set filetype=tex
"
"" Navigating with guides
"	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
"	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
"	map <leader><leader> <Esc>/<++><Enter>"_c4l
"
""""LATEX
"	" Word count:
"	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
"	" Code snippets
"	autocmd FileType tex inoremap \fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
"	autocmd FileType tex inoremap \fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
"	autocmd FileType tex inoremap \exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
"	autocmd FileType tex inoremap \em \emph{}<++><Esc>T{i
"	autocmd FileType tex inoremap \bf \textbf{}<++><Esc>T{i
"	autocmd FileType tex inoremap \it \textit{}<++><Esc>T{i
"	autocmd FileType tex inoremap \ct \textcite{}<++><Esc>T{i
"	autocmd FileType tex inoremap \cp \parencite{}<++><Esc>T{i
"	autocmd FileType tex inoremap \glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
"	autocmd FileType tex inoremap \x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
"	autocmd FileType tex inoremap \ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
"	autocmd FileType tex inoremap \ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
"	autocmd FileType tex inoremap \li <Enter>\item<Space>
"	autocmd FileType tex inoremap \ref \ref{}<Space><++><Esc>T{i
"	autocmd FileType tex inoremap \tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
"	autocmd FileType tex inoremap \ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
"	autocmd FileType tex inoremap \can \cand{}<Tab><++><Esc>T{i
"	autocmd FileType tex inoremap \con \const{}<Tab><++><Esc>T{i
"	autocmd FileType tex inoremap \v \vio{}<Tab><++><Esc>T{i
"	autocmd FileType tex inoremap \a \href{}{<++>}<Space><++><Esc>2T{i
"	autocmd FileType tex inoremap \sc \textsc{}<Space><++><Esc>T{i
"	autocmd FileType tex inoremap \chap \chapter{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap \sec \section{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap \ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap \sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap \st <Esc>F{i*<Esc>f}i
"	autocmd FileType tex inoremap \beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
"	autocmd FileType tex inoremap \up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
"	autocmd FileType tex nnoremap \up /usepackage<Enter>o\usepackage{}<Esc>i
"	autocmd FileType tex inoremap \tt \texttt{}<Space><++><Esc>T{i
"	autocmd FileType tex inoremap \bt {\blindtext}
"	autocmd FileType tex inoremap \nu $\varnothing$
"	autocmd FileType tex inoremap \col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"	autocmd FileType tex inoremap \rn (\ref{})<++><Esc>F}i
