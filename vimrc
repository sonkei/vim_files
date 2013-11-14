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
Bundle "tpope/vim-surround"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-sleuth"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-liquid"

Bundle "jnwhiteh/vim-golang"
Bundle "mileszs/ack.vim"
Bundle "Shougo/vimproc.vim"
Bundle "Shougo/unite.vim"
Bundle "bling/vim-airline"
Bundle "Valloric/YouCompleteMe"
Bundle "Yggdroot/indentLine"
Bundle 'airblade/vim-gitgutter'
Bundle "jiangmiao/auto-pairs"
Bundle "sunaku/vim-ruby-minitest"
Bundle 'thoughtbot/vim-rspec'
Bundle 'Keithbsmiley/rspec.vim'
Bundle "vim-ruby/vim-ruby"
Bundle "cvincent/vim-vroom"
Bundle "benmills/vimux"
Bundle "scrooloose/syntastic"
Bundle "moll/vim-node"
Bundle "groenewege/vim-less"
Bundle "hail2u/vim-css3-syntax"
Bundle "othree/html5.vim"
Bundle "chriskempson/base16-vim"
Bundle "digitaltoad/vim-jade"
Bundle "nono/vim-handlebars"
Bundle "cakebaker/scss-syntax.vim"
"Bundle "othree/javascript-libraries-syntax.vim"
Bundle "pangloss/vim-javascript"
Bundle "jelera/vim-javascript-syntax"
Bundle "kchmck/vim-coffee-script"
" }}}

" options {{{
filetype plugin indent on
set backspace=indent,eol,start    " allow backspacing over auto indent
set hidden
set wildmode=list:longest,full
set wildignore=*.swp
set encoding=utf-8
set hlsearch!
set incsearch
set lazyredraw
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

" AUTOCMDS {{{
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec filetype=rspec
autocmd FileType python set sw=4 sts=4 et

autocmd! BufRead,BufNewFile *.sass setfiletype sass
autocmd! BufRead,BufNewFile *.scss setfiletype scss

autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
" }}}

" colors{{{
let &t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace

set background=dark
color base16-tomorrow
"color base16-default
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
"map <leader>gv :CtrlPClearCache<cr>:CtrlP app/views<cr>
"map <leader>gc :CtrlPClearCache<cr>:CtrlP app/controllers<cr>
"map <leader>gm :CtrlPClearCache<cr>:CtrlP app/models<cr>
"map <leader>gh :CtrlPClearCache<cr>:CtrlP app/helpers<cr>
"map <leader>gl :CtrlPClearCache<cr>:CtrlP lib<cr>
"map <leader>gp :CtrlPClearCache<cr>:CtrlP public<cr>
"map <leader>gs :CtrlPClearCache<cr>:CtrlP public/stylesheets/sass<cr>
"map <leader>gf :CtrlPClearCache<cr>:CtrlP features<cr>

"let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules|vendor\/ruby|_vendor\/bundle)$'
" }}}

" unite.vim {{{
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_source_file_rec_max_cache_files = 1000

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'node_modules',
      \ 'vendor\/ruby',
      \ 'vendor\/rbx'
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-P> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
nnoremap <silent> <Space>a :Unite grep:.<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
"}}}

" window swap {{{
" <CTRL>-w m : mark first window
" <CTRL>-w m : swap with that window
let s:markedWinNum = -1

function! MarkWindowSwap()
    let s:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe s:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

function! WindowSwapping()
    if s:markedWinNum == -1
        call MarkWindowSwap()
    else
        call DoWindowSwap()
        let s:markedWinNum = -1
    endif
endfunction

nnoremap <C-w>m :call WindowSwapping()<CR>
" }}}
"}}}

" Airline settings {{{
let g:airline_theme='tomorrow'
let g:airline_enable_syntastic=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_paste_symbol = 'ρ'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_enable_branch=1
"}}}

" selecta {{{
function! SelectaIdentifier()
  " Yank the word under the cursor into the z register
  normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  call SelectaCommand("find * -type f", "-s " . @z, ":e")
endfunction
nnoremap <c-g> :call SelectaIdentifier()<cr>

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent! exec a:vim_command . " " . system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
  endtry
  redraw!
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type d -name ruby -name tmp -prune -o -type f", "", ":e")<cr>
" }}}

let g:used_javascript_libs = 'underscore'
let g:vroom_use_vimux = 1
let g:vroom_clear_screen = 1

let g:ycm_collect_identifiers_from_tags_files = 1

set shell=bash
