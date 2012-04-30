"" vundle specific
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"" original repos on github
Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'
Bundle 'thinca/vim-quickrun'
Bundle 'xolox/vim-session'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdcommenter'
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'vim-scripts/UltiSnips'
Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/vimproc' " need this as a dep for ghcmod-vim also, run make whenever updated
"Bundle 'eagletmt/ghcmod-vim' " code completion for haskell todo: add neocomplcache
Bundle 'ujihisa/neco-ghc'
"Bundle 'lukerandall/haskellmode-vim'
Bundle 'jelera/vim-gummybears-colorscheme'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'

"" vim-scripts repos
Bundle 'Color-Sampler-Pack'
Bundle 'LanguageTool'
Bundle 'ScrollColors'
Bundle 'CCTree'
Bundle 'guicolorscheme.vim'
" updated syntax file
Bundle 'haskell.vim'

"" general stuff
set nocompatible   " disable vi-compatibility
set encoding=utf-8 " necessary to show unicode glyphs
set showcmd        " display incomplete commands
set number         " turn line numbering on
set cursorline     " highlight the cursor line
set cursorcolumn   " highlight the cursor column
filetype plugin indent on " turn on filetype detection, filetype plugins, and autoindent

"" color stuffs
syntax on           " turn syntax highlighting on
set t_Co=256        " Explicitly tell vim that the terminal supports 256 colors
colorscheme lettuce " because we prefer a non default colorscheme

"" whitespace
set nowrap       " don't wrap lines
set tabstop=4    " tabs count as 4 spaces
set shiftwidth=4 " number of spaces to use in autoindent
set expandtab    " use spaces instead of tabs

set backspace=indent,eol,start " backspace through everything in insert mode

"" search
set hlsearch   " highlight matches
set incsearch  " incremental search
set ignorecase " ignore case in search pattern
set smartcase  " override ignorecase if there are uppercase letters in the search pattern

let g:languagetool_jar = '/usr/share/languagetool/LanguageTool.jar' " languagetool jar needs to be set

"" python
au FileType python set tabstop=4 shiftwidth=4 expandtab

"" ruby
au FileType ruby set tabstop=2 shiftwidth=2 expandtab

"" bash
au FileType bash set tabstop=2 shiftwidth=2 expandtab

nmap <F9> :QuickRun<cr> " for vim quickrun

let g:session_autoload = 'no' " don't autoload vim-session saves

set foldmethod=marker " use {{{ and }}} to specify a region, useful for large blocks of trivial functions

let g:neocomplcache_enable_at_startup = 1 " enable neocomplcache completion

" powerline stuff
set laststatus=2   " Always show the statusline

imap <c-c> <Esc> " trigger autoleave insert commands, normally ctrl+c doesn't do this
