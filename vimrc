"----------------------------------------
"------------------VIMRC-----------------
"--------------initial-setup-------------
"----------------------------------------

if !exists('s:loaded_my_vimrc')
  so ~/.vim/modules/vundles.vim
  so ~/.vim/modules/functions.vim
  so ~/.vim/modules/unite.vim
  so ~/.vim/modules/selecta.vim
  so ~/.vim/modules/autocmd.vim
endif

" options {{{
filetype plugin indent on
set backspace=indent,eol,start    " allow backspacing over auto indent
set hidden
set wildmode=list:longest,full
set wildignore=*.swp
set encoding=utf-8
set hlsearch!
set incsearch
set magic
set t_Co=256
set textwidth=80
set title
set ttyfast
set cmdheight=2
set winwidth=81
set fillchars=diff:·

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
set relativenumber

set timeout
set timeoutlen=3000
set ttimeoutlen=50

set visualbell t_vb=

set laststatus=2

set modeline
set modelines=2

set ignorecase
set smartcase

set foldmethod=marker
set foldcolumn=1
set nofoldenable

set noautochdir

set cursorline

set clipboard=unnamed

"" Tabs (use spaces)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showtabline=1

" Indent if we're at the beginning of a line. Else, do completion.
set omnifunc=syntaxcomplete#Complete
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

set nomore

" slime settings
let g:slime_target = "tmux"
"}}}

" colors{{{
let &t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
color base16-tomorrow
"color base16-solarized
set background=dark
"}}}

" Highlight characters past 80c {{{
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
"}}}

"Mappings {{{
let mapleader = ',' "mapleader to ,

"noremap <silent><Leader>/ :nohls<CR>
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" CTAGS
map <silent> <Leader>rt :!bundle list --paths=true \| xargs ctags --fields=+l --exclude=.git --exclude=log -R *<CR><CR>

" Sane split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remove trailing whitespaces
map <Leader><Space> :%s/\s\+$//g<CR>

" Unmap arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"}}}

" Airline settings {{{
let g:airline_theme='ubaryd'
let g:airline_enable_syntastic=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_paste_symbol = 'ρ'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_enable_branch=1
"}}}

let g:vroom_use_vimux = 1
let g:vroom_clear_screen = 1
let g:haskell_conceal_wide = 1

" neocomplcache settings {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"}}}

set shell=bash
