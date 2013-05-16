" vundle {{{

" disable to load vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'git://repo.or.cz/vcscommand.git'
Bundle 'neowit/vim-force.com'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'

" dependencies for snipmate along with snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle 'garbas/vim-snipmate'

" can't compile this on the linode machine since it doesn't contain enough ram
" to compile it -.-, hopefully the upgrade to 1gb will make this compileable
Bundle 'Valloric/YouCompleteMe'

" }}}

" search {{{

" ignore case when searching
set ignorecase

" smart ignore case searching
set smartcase

" incremental searching
set incsearch

" }}}

" force.com {{{

let g:apex_backup_folder="/home/thomas-dziedzic/.apex/backup"
let g:apex_temp_folder="/home/thomas-dziedzic/.apex/temp"
let g:apex_deployment_error_log="gvim-deployment-error.log"
let g:apex_properties_folder="/home/thomas-dziedzic/.apex/login"

" }}}

" snipmate {{{

" snipmate's tab doesn't work well with youcompleteme
"let g:UltiSnipsExpandTrigger = '<c-l>'
"let g:UltiSnipsJumpForwardTrigger = '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"let g:UltiSnipsListSnippets = '<c-m>'

" }}}

" NERDTree {{{

nmap <f6> :NERDTreeToggle<cr>

" }}}

" other {{{

filetype plugin indent on

set number

syntax on

set autoindent

set shiftwidth=4
set softtabstop=4
set tabstop=4

autocmd FileType python setlocal expandtab
autocmd FileType apexcode setlocal noexpandtab

let mapleader = ','
let maplocalloader = '\\'

" }}}

" Learning vimscript THE HARD way {{{

" ch 4 ex 1 / ch 5 ex 1 / ch 6
" convert the current word to uppercase in insert mode
"inoremap <leader><c-u> <esc>maT veUl`ali

" ch 4 ex 2 / ch 5 ex 1 / ch 6
" convert the current word to uppercase in normal mode
"nnoremap <leader><c-u> <esc>maT veUl`a

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"put double quotes around the current word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" ch 9 ex 1
"put single quotes around the current word
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

"ch 9 ex 2
" put double quotes around the current selection
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>l
" put single quotes around the current selection
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>l

" ch 9 ex 3
"nnoremap H 0
" ch 9 ex 4
"nnoremap L $

" RIP arrow keys
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" make jk in insert mode escape to normal mode
inoremap jk <esc>
inoremap <esc> <nop>

" ch 15 useful paran operations
" in next/last (
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" around next/last (
onoremap an( :<c-u>normal! f(v%<cr>
onoremap al( :<c-u>normal! F)v%<cr>

" in next/last {
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

" around next/last {
onoremap an{ :<c-u>normal! f{v%<cr>
onoremap al{ :<c-u>normal! F}v%<cr>

" markdown stuff from ch 16
augroup filetype_markdown
	autocmd!

	autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

	autocmd FileType markdown onoremap <buffer> ish :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown onoremap <buffer> ash :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

" always display the statusline
set laststatus=2

"set statusline=%f         " Path to the file
"set statusline+=\ -\      " Separator
"set statusline+=FileType: " Label
"set statusline+=%y        " Filetype of the file
"set statusline+=%l    " Current line
"set statusline+=/    " Separator
"set statusline+=%L   " Total lines

" vim file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker foldlevelstart=0
augroup END
" }}}

" }}}
