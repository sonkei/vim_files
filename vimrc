" Pathogen Magic
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on

" options
set nocompatible
set backspace=indent,eol,start    " allow backspacing over auto indent
set hidden
set wildmenu
set showcmd
set hlsearch
set ruler
set cmdheight=2

set listchars=tab:»\ ,trail:·,nbsp:⎵,precedes:←,extends:→ sbr=↪

set number

set timeout
set timeoutlen=3000
set ttimeoutlen=50

set visualbell
set t_vb=

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


" colorscheme
if $TERM == 'linux'
  let &t_Co = 8
  color peachpuff
  set nolist
  set colorcolumn+=81
  hi ColorColumn  term=none cterm=none ctermbg=3
  hi CursorLine   term=none cterm=none ctermbg=none
else
  set t_Co=256
  color dotshare_term
endif

" Mappings
nnoremap <C-L> :nohl<CR><C-L>
