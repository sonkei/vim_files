"----------------------------------------
"---------------vundle.vim---------------
"----------------------------------------
"----------------------------------------

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
Bundle "tpope/vim-sleuth"

Bundle "eagletmt/neco-ghc"
Bundle "eagletmt/ghcmod-vim"
Bundle "dag/vim2hs"

Bundle "chriskempson/vim-tomorrow-theme"
Bundle "jonathanfilip/vim-lucius"
Bundle "kchmck/vim-coffee-script"
Bundle "Shougo/neocomplcache.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "mileszs/ack.vim"
Bundle "Shougo/vimproc.vim"
Bundle "Shougo/unite.vim"
Bundle "bling/vim-airline"
Bundle "Yggdroot/indentLine"
Bundle 'airblade/vim-gitgutter'
Bundle "jiangmiao/auto-pairs"
Bundle "sunaku/vim-ruby-minitest"
Bundle 'thoughtbot/vim-rspec'
Bundle 'Keithbsmiley/rspec.vim'
Bundle "vim-ruby/vim-ruby"
Bundle "cvincent/vim-vroom"
Bundle "benmills/vimux"
Bundle "jpalardy/vim-slime"
Bundle "scrooloose/syntastic"
Bundle "moll/vim-node"
Bundle "hail2u/vim-css3-syntax"
Bundle "othree/html5.vim"
Bundle "chriskempson/base16-vim"
Bundle "digitaltoad/vim-jade"
Bundle "nono/vim-handlebars"
Bundle "pangloss/vim-javascript"
Bundle "cakebaker/scss-syntax.vim"
Bundle "jelera/vim-javascript-syntax"
Bundle "marijnh/tern_for_vim"
Bundle "wavded/vim-stylus"
