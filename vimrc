" Pathogen Magic
call pathogen#infect()
syntax on
filetype off
filetype plugin indent on

" options
set nocompatible
set backspace=indent,eol,start    " allow backspacing over auto indent
set hidden
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp
set showcmd
set encoding=utf-8
set hlsearch
set incsearch
set lazyredraw
set magic
set ruler
set t_Co=256
set textwidth=80
set title
set ttyfast
set cmdheight=2

set nobackup
set nocscopeverbose
set noequalalways
set noerrorbells
set nostartofline
set noswapfile
set nowritebackup
set nowrap

set numberwidth=2
set list!
set listchars=trail:-,tab:>-,eol:¬,nbsp:%,extends:>,precedes:<
set dy+=lastline
set dy+=uhex
set number

set timeout
set timeoutlen=3000
set ttimeoutlen=50

set visualbell t_vb=

set laststatus=2

set modeline
set modelines=2

set ignorecase
set smartcase

set autoindent
set autoread
set autochdir

"" Tabs (use spaces)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nomore

if $TERM == 'linux'
  let &t_Co=8
  color peachpuff
else
  color dotshare_term
endif

"Mappings
let mapleader = ';' "mapleader to ;


nnoremap <C-L> :nohl<CR><C-L>

" Line numbers
:au InsertEnter * :set number
:au InsertLeave * :set relativenumber
