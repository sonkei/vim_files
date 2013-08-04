"----------------------------------------
"------------------VIMRC-----------------
"--------------initial-setup-------------
"----------------------------------------

" vundle {{{
set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" packages
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-sensible"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-sleuth"

Bundle "altercation/vim-colors-solarized"
Bundle "moll/vim-node"
Bundle "groenewege/vim-less"
Bundle "mattn/gist-vim"
Bundle "kchmck/vim-coffee-script"
Bundle "hail2u/vim-css3-syntax"
Bundle "othree/html5.vim"
Bundle "vim-ruby/vim-ruby"
Bundle "myusuf3/numbers.vim"
Bundle "chriskempson/base16-vim"
Bundle "jiangmiao/auto-pairs"
Bundle "chriskempson/vim-tomorrow-theme"
Bundle "skalnik/vim-vroom"
Bundle "jpalardy/vim-slime"
Bundle "mileszs/ack.vim"
Bundle "pangloss/vim-javascript"
Bundle "nono/vim-handlebars"
Bundle "digitaltoad/vim-jade"
Bundle "bling/vim-airline"
Bundle "juvenn/mustache.vim"
Bundle "kien/ctrlp.vim"
Bundle "Valloric/YouCompleteMe"
Bundle "elixir-lang/vim-elixir"
Bundle "Yggdroot/indentLine"
" }}}

" options {{{
filetype plugin indent on
set backspace=indent,eol,start    " allow backspacing over auto indent
set hidden
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp
set showcmd
set encoding=utf-8
set hlsearch!
set incsearch
set lazyredraw
set magic
set ruler
set t_Co=256
set textwidth=80
set title
set ttyfast
set cmdheight=2
set winwidth=81

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

set foldmethod=marker
set foldcolumn=1

set autoindent
set autoread
set autochdir

set showmatch
set cursorline

set clipboard=unnamed

"" Tabs (use spaces)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showtabline=1

" Indent if we're at the beginning of a line. Else, do completion.
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

" langauge specific tab spacing
au FileType python setl sw=4 ts=4 sts=4 et
au FileType ruby setl sw=2 ts=2 sts=2 et

"}}}

" colors{{{
let &t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace

set background=light
"color Tomorrow-Night
color base16-tomorrow
"color base16-eighties
"color Tomorrow
"color solarized
"set guifont=Inconsolata:h16
"color base16-ocean
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
map <silent> <Leader>rt :!bundle list --paths=true \| xargs ctags --exclude=.git --exclude=log -R *<CR><CR>

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

" FUNCTIONS {{{

"ghlights - hl match under cursor differently from Search {{{
fu! HL_Search_Cword()
  let s:old_cpo = &cpo
  set cpo&vim

  if exists('b:search_cword_item')
    try
      call matchdelete(b:search_cword_item)
    catch /^Vim\%((\a\+\)\=:E/ " ignore E802,E803
    endtry
  endif

  " :silent !printf '\e]12;\#242424\a'
  hi Search       ctermfg=233 ctermfg=106 cterm=bold
  "hi Search       ctermfg=106 ctermbg=233 cterm=bold
  hi search_cword ctermfg=085 ctermbg=234 cterm=bold

  let b:search_cword_item = matchadd('search_cword', (&ic ? '\c' : '') . '\%#' . @/, 1)

  let &cpo = s:old_cpo
endfu
"}}}

" viminfo - save cursor position {{{
autocmd BufReadPost * call SetCursorPosition()
fu! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfu
"}}}

" rename current file (stolen from grb) {{{
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
"}}}

" ctrl p (adjusted commandt from grb) {{{
map <leader>gv :CtrlPClearCache<cr>:CtrlP app/views<cr>
map <leader>gc :CtrlPClearCache<cr>:CtrlP app/controllers<cr>
map <leader>gm :CtrlPClearCache<cr>:CtrlP app/models<cr>
map <leader>gh :CtrlPClearCache<cr>:CtrlP app/helpers<cr>
map <leader>gl :CtrlPClearCache<cr>:CtrlP lib<cr>
map <leader>gp :CtrlPClearCache<cr>:CtrlP public<cr>
map <leader>gs :CtrlPClearCache<cr>:CtrlP public/stylesheets/sass<cr>
map <leader>gf :CtrlPClearCache<cr>:CtrlP features<cr>

let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules|vendor\/ruby)$'
" }}}
"}}}

" Rspec matching {{{
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function
"}}}

" Airline settings {{{
let g:airline_theme='wombat'
let g:airline_left_sep = ''
let g:airline_right_sep = '◀'
let g:airline_paste_symbol = 'ρ'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_enable_branch=1
"}}}


set shell=bash
