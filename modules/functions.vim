"----------------------------------------
"-------------functions.vim--------------
"----------------------------------------
"----------------------------------------
"ghlights - hl match under cursor differently from Search
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

" viminfo - save cursor position
autocmd BufReadPost * call SetCursorPosition()
fu! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfu

" rename current file (stolen from grb)
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

" window swap
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
