" Vim color file - neverland-ansi_bg.vim
" Eyes are sober, this is the plan
"
" This colorscheme uses ANSI colors for the background due to the extended
" colors not providing a dark enough grey.
" This means that it'll look awful if you happen to have i.e pink defined as
" your 'grey/black' color. Mine is #121212.
"
" This issue can be solved by changing, for example, color index 232 to the
" desired shade. This can be accomplished with colorcoke [1], can be made
" persistent with my rxvt-unicode fork [2], and can be visually represented with
" rgbterm [3].
"
" 1: https://github.com/trapd00r/colorcoke
" 2: https://github.com/trapd00r/rxvt-unicode
" 3: https://github.com/trapd00r/rgbterm
"
" Author: Magnus Woldrich <m@japh.se>

set background=dark
hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="neverland-ansi_bg"

if &t_Co > 255
   hi Normal          ctermfg=195 ctermbg=232 cterm=none
   set background=dark

   hi Boolean         ctermfg=135 ctermbg=232 cterm=bold
   hi Character       ctermfg=143 ctermbg=232 cterm=none
   hi Number          ctermfg=033 ctermbg=232 cterm=bold
   hi String          ctermfg=143 ctermbg=232 cterm=none
   hi Conditional     ctermfg=196 ctermbg=232 cterm=bold
   hi Constant        ctermfg=106 ctermbg=232 cterm=bold
   hi Cursor          ctermfg=150 ctermbg=220 cterm=bold
   hi Debug           ctermfg=225 ctermbg=232 cterm=bold
   hi Define          ctermfg=081 ctermbg=232 cterm=none
   hi Delimiter       ctermfg=241 ctermbg=232 cterm=none

   hi DiffAdd         ctermfg=254 ctermbg=024 cterm=bold
   hi DiffChange      ctermfg=181 ctermbg=239 cterm=none
   hi DiffDelete      ctermfg=162 ctermbg=053 cterm=none
   hi DiffText        ctermfg=250 ctermbg=102 cterm=bold

   hi Directory       ctermfg=118 ctermbg=232 cterm=none
   hi Error           ctermfg=219 ctermbg=089 cterm=none
   hi ErrorMsg        ctermfg=160 ctermbg=234 cterm=italic
   hi Exception       ctermfg=118 ctermbg=232 cterm=bold
   hi Float           ctermfg=135 ctermbg=232 cterm=bold
   hi FoldColumn      ctermfg=67  ctermbg=232 cterm=none
   hi Folded          ctermfg=241 ctermbg=234 cterm=bold
   hi Function        ctermfg=33  ctermbg=232 cterm=bold " sub laleh 
   hi Identifier      ctermfg=148 ctermbg=232 cterm=none " $laleh
   hi Ignore          ctermfg=244 ctermbg=232 cterm=none
   hi IncSearch       ctermfg=052 ctermbg=045 cterm=reverse

   hi Keyword         ctermfg=111 ctermbg=232 cterm=none
   hi Label           ctermfg=226 ctermbg=232 cterm=bold
   hi Macro           ctermfg=193 ctermbg=232 cterm=none
   hi SpecialKey      ctermfg=081 ctermbg=232 cterm=none

   hi MatchParen      ctermfg=196 ctermbg=234 cterm=bold
   hi ModeMsg         ctermfg=215 ctermbg=234 cterm=italic
   hi MoreMsg         ctermfg=215 ctermbg=232 cterm=none
   hi Operator        ctermfg=197 ctermbg=232 cterm=bold " defined, eq

   " complete menu
   hi Pmenu           ctermfg=137 ctermbg=232 cterm=none
   hi PmenuSel        ctermfg=196 ctermbg=233 cterm=bold
   hi PmenuSbar       ctermfg=232 ctermbg=232 cterm=none
   hi PmenuThumb      ctermfg=137 ctermbg=234 cterm=none

   hi PreCondit       ctermfg=118 ctermbg=232 cterm=none
   hi PreProc         ctermfg=218 ctermbg=232 cterm=none
   hi Question        ctermfg=081 ctermbg=232 cterm=italic
   hi Repeat          ctermfg=161 ctermbg=232 cterm=none
   hi Search          ctermfg=045 ctermbg=017 cterm=none

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=234 cterm=none
   hi SpecialChar     ctermfg=161 ctermbg=232 cterm=none
   hi SpecialComment  ctermfg=245 ctermbg=232 cterm=italic
   hi Special         ctermfg=172 ctermbg=232 cterm=bold  " \n, /laleh/
   hi SpecialKey      ctermfg=245 ctermbg=232 cterm=none

   hi SpellBad        ctermfg=196 ctermbg=232 cterm=bold
   hi SpellCap        ctermfg=094 ctermbg=232 cterm=bold
   hi SpellRare       ctermfg=096 ctermbg=232 cterm=bold
   hi SpellLocal      ctermfg=124 ctermbg=232 cterm=bold

   hi Statement       ctermfg=202 ctermbg=232 cterm=none
   hi StatusLine      ctermfg=197 ctermbg=232 cterm=none
   hi StatusLineNC    ctermfg=232 ctermbg=100 cterm=none
   hi StorageClass    ctermfg=208 ctermbg=232 cterm=none
   hi Structure       ctermfg=081 ctermbg=232 cterm=none
   hi Tag             ctermfg=161 ctermbg=232 cterm=none
   hi Title           ctermfg=202 ctermbg=232 cterm=bold
   hi Todo            ctermfg=160 ctermbg=232 cterm=bold

   hi Typedef         ctermfg=081 ctermbg=232 cterm=none
   hi Type            ctermfg=166 ctermbg=232 cterm=none
   hi Underlined      ctermfg=106 ctermbg=232 cterm=none

   hi VertSplit       ctermfg=244 ctermbg=232 cterm=bold
   hi VisualNOS       ctermfg=232 ctermbg=238 cterm=none
   hi Visual          ctermfg=085 ctermbg=234 cterm=none
   hi WarningMsg      ctermfg=21  ctermbg=238 cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=016 cterm=none

   hi Comment         ctermfg=137 ctermbg=232 cterm=italic
   hi ColorColumn     ctermfg=232 ctermbg=234 cterm=none
   hi CursorLine                  ctermbg=234 cterm=none
   hi CursorColumn    ctermfg=232 ctermbg=232 cterm=none
   hi LineNr          ctermfg=241 ctermbg=232 cterm=none
   hi NonText         ctermfg=232 ctermbg=232 cterm=none

   hi TabLine         ctermfg=100 ctermbg=232 cterm=none
   hi TabLineFill     ctermfg=232 ctermbg=232 cterm=none
   hi TabLineSel      ctermfg=220 ctermbg=234 cterm=none
end
