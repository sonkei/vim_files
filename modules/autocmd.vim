"----------------------------------------
"-------------autocmds.vim---------------
"----------------------------------------
"----------------------------------------

autocmd FileType ruby,haml,eruby,yaml,javascript,cucumber set ai sw=2 sts=2 et
autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec filetype=rspec
autocmd FileType haskell set sw=4 sts=4 et
autocmd FileType sass,scss,css,less,html set sw=4 sts=4 et
autocmd FileType python setl sw=4 ts=4 sts=4 et
autocmd FileType ruby setl sw=2 ts=2 sts=2 et

autocmd! BufRead,BufNewFile *.sass setfiletype sass
autocmd! BufRead,BufNewFile *.scss setfiletype scss

autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
