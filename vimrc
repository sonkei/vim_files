"----------------------------------------
"------------------VIMRC-----------------
"--------------initial-setup-------------
"----------------------------------------

" Pathogen Magic {{{
call pathogen#infect()
syntax on
filetype off
filetype plugin indent on
"}}}

" options {{{
set nocompatible
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
set cmdheight=1
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

"}}}

" colors{{{
let &t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
"color Tomorrow-Night
color base16-tomorrow
"color base16-default
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
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gs :CtrlP public/stylesheets/sass<cr>
map <leader>gf :CtrlP features<cr>
" }}}
"}}}

" Rspec matching {{{
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function
"}}}

" Powerline theme settings {{{
"let g:Powerline_theme="skwp"
"let g:Powerline_colorscheme='skwp'
"}}}

set shell=bash
