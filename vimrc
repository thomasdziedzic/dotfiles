" vundle {{{

" disable to load vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'neowit/vim-force.com'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'SirVer/ultisnips'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-surround'

" dependency of vim-colorscheme-switcher
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'flazz/vim-colorschemes'

Plugin 'godlygeek/tabular'

Plugin 'majutsushi/tagbar'

" haskell tagbar support
Plugin 'bitc/lushtags'

Plugin 'dag/vim2hs'

" scala
Plugin 'derekwyatt/vim-scala'

" slim template for ruby & rails
Plugin 'slim-template/vim-slim'

" coerce variable naem to snake case or camel case
Plugin 'tpope/vim-abolish'

Plugin 'eagletmt/neco-ghc'
Plugin 'csexton/trailertrash.vim'
Plugin 'artnez/vim-wipeout'

Plugin 'kchmck/vim-coffee-script'

" dependency of coquille
Plugin 'def-lkb/vimbufsync'
" coq
Plugin 'trefis/coquille'
" idris
Plugin 'idris-hackers/idris-vim'

Plugin 'lervag/vimtex'

" search for words under the current cursor
Plugin 'dkprice/vim-easygrep'

" https://github.com/tpope/vim-eunuch
" Useful for :Move
Plugin 'tpope/vim-eunuch'

Plugin 'hashivim/vim-terraform'

call vundle#end()
filetype plugin indent on

" }}}

" tagbar {{{

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

nnoremap <f6> :TagbarToggle<cr>

" }}}

" search {{{

" ignore case when searching
set ignorecase

" smart ignore case searching
set smartcase

" incremental searching
set incsearch

set hlsearch

" }}}

" force.com {{{

let g:apex_backup_folder=expand("~/.apex/backup")
let g:apex_temp_folder=expand("~/.apex/temp")
let g:apex_deployment_error_log="gvim-deployment-error.log"
let g:apex_properties_folder=expand("~/.apex/login")
let g:apex_tooling_force_dot_com_path=expand("~/.apex/tooling-force.com.jar")
let g:apex_tooling_force_dot_com_java_params="-Xmx2g"
" api version 39.0 is winter 17
let g:apex_API_version="39.0"

autocmd! BufNewFile,BufRead *css.resource set filetype=css
autocmd! BufNewFile,BufRead *js.resource set filetype=javascript

" }}}

" YouCompleteMe {{{

" fix snipmate completion
let g:ycm_key_list_select_completion = ['<down>']

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" }}}

" NERDTree {{{

nmap <f5> :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '.*\-meta\.xml$']

" }}}

" other {{{

set number

syntax on

colorscheme molokai

set autoindent

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

autocmd Filetype sql setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

let mapleader = ','
let maplocalloader = '\\'

set cursorline
set cursorcolumn

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

set colorcolumn=81

set regexpengine=1

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2 " make backspace work like most other apps

" }}}

" ctrl p {{{

" ignore cabal dist folder
let g:ctrlp_custom_ignore = '\v[\/]dist$'

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

nnoremap <leader>el :rightbelow vsplit #<cr>

" highlight trailing whitespace as an error
nnoremap <leader>w :match Error /\v\s+$/<cr>
" clear previous highlight
nnoremap <leader>W :match<cr>

"start searching in \v mode
nnoremap / /\v
nnoremap ? ?\v

"stop hlsearch
nnoremap <leader>s :nohlsearch<cr>

"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" toggle numbers
nnoremap <leader>N :setlocal number!<cr>

" }}}

" vim2hs {{{
let g:haskell_conceal_enumerations = 0
" }}}

" haskell {{{
au FileType haskell setl sw=4 sts=4 et
au FileType cabal setl sw=4 sts=4 et
" }}}

" colorscheme switcher {{{

" we will set our own bindings
let g:colorscheme_switcher_define_mappings = 0

nnoremap <silent> <F7> :PrevColorScheme<CR>
nnoremap <silent> <F8> :NextColorScheme<CR>

" }}}

" coq {{{

" Maps Coquille commands to <F2> (Undo), <F3> (Next), <F4> (ToCursor)
au FileType coq call coquille#FNMapping()

let g:coquille_auto_move='true'
" }}}

" paste mode {{{
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" }}}

" python {{{
augroup python_bindings
    autocmd!

    autocmd FileType python nnoremap <buffer> <f12> :!python2 %<cr>
augroup END

"ignore python bytecode
set wildignore+=*.pyc
" }}}

" scala {{{

set wildignore+=*/target/*

" }}}

" spark {{{

set wildignore+=*/metastore_db/*,derby.log

" }}}

" encryption {{{

" the other cryptmethods are broken, see https://dgl.cx/2014/10/vim-blowfish
set cryptmethod=blowfish2

" }}}

" terraform {{{

" https://github.com/hashivim/vim-terraform#usage
" allow plugin to override indentation for terraform files
let g:terraform_align=1

" }}}

nnoremap gl :redraw!<cr>

nnoremap <leader>l :set list!<cr>
set listchars=tab:▸\ ,eol:¬
set list
nnoremap <leader>k :TrailerTrim<cr>:%s/\t/    /g<cr>

let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_keep_logfiles = 1
