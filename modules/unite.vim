"----------------------------------------
"---------------unite.vim----------------
"----------------------------------------
"----------------------------------------

nnoremap <C-P> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
nnoremap <silent> <Space>a :Unite grep:.<cr>

let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 20
let g:unite_source_file_rec_max_cache_files = 1000
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
let g:unite_matcher_fuzzy_max_input_length = 1/0 " infinity

call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source(
      \ 'file_rec,file_rec/async,file_mru,file,buffer', 'matchers',
      \ ['matcher_fuzzy'])
call unite#custom#source(
      \ 'file', 'matchers',
      \ ['matcher_fuzzy', 'matcher_hide_hidden_files'])
call unite#custom#source(
      \ 'file_rec/async,file_mru', 'converters',
      \ ['converter_file_directory'])
call unite#custom_source(
      \'file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'node_modules',
      \ 'vendor\/ruby',
      \ 'vendor\/rbx',
      \ 'tmp\/',
      \ 'vendor\/',
      \ '_cache\/'
      \ ], '\|'))


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
