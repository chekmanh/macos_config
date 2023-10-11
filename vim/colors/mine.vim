" Author:      Chek-Manh Loi
" Last Change: Mon 24 Jun 06:40:37 UTC 2019

" ONLY for terminal
" use "darkblue" for gvim

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "mine"

"" YouCompleteMe
"" in normal mode highlighting the error
highlight YcmErrorSection   ctermfg=1         ctermbg=0
"" the whole line
highlight YcmErrorLine      ctermfg=none      ctermfg=none
"" only the sign
highlight YcmErrorSign      ctermfg=1         ctermbg=none
"" implicit definition of function
highlight YcmWarningSection ctermfg=1         ctermbg=none
highlight YcmWarningLine    ctermfg=1         ctermfg=none
highlight YcmWarningSign    ctermfg=1         ctermbg=none

highlight Function      ctermfg=186         ctermbg=none

highlight ColorColumn       ctermfg=141       ctermbg=232

"" set spell!
hi SpellBad     cterm=NONE ctermfg=9    ctermbg=NONE gui=NONE guifg=#C95F5F guibg=NONE
hi SpellCap     cterm=NONE ctermfg=9    ctermbg=NONE gui=NONE guifg=#F07D30 guibg=NONE
hi SpellLocal   cterm=NONE ctermfg=9    ctermbg=NONE gui=NONE guifg=#73BA25 guibg=NONE
hi SpellRare    cterm=NONE ctermfg=9    ctermbg=NONE gui=NONE guifg=#EAC06E guibg=NONE
"" Text Background empty
highlight Normal	    ctermfg=187   ctermbg=NONE
"" wrong commands
highlight ErrorMsg	    ctermfg=black     ctermbg=darkred
"" visual mode
highlight Visual	    ctermfg=31        ctermbg=0          cterm=reverse
highlight VisualNOS	    ctermfg=159       ctermbg=fg         cterm=reverse,underline
highlight Todo		    ctermfg=red       ctermbg=darkblue
"" search
highlight Search	    ctermfg=182       ctermbg=31         cterm=underline
highlight IncSearch         ctermfg=160       ctermbg=51         cterm=underline

highlight SpecialKey	    ctermfg=red
highlight Directory 	    ctermfg=cyan
highlight Title		    ctermfg=magenta   cterm=bold
highlight WarningMsg	    ctermfg=red
highlight WildMenu	    ctermfg=230       ctermbg=black
"" which mode
highlight ModeMsg	    ctermfg=159
highlight MoreMsg	    ctermfg=darkgreen ctermfg=darkgreen
highlight Question	    ctermfg=green
highlight NonText	    ctermfg=darkblue

"" and wild menu
highlight StatusLine	    ctermfg=darkgrey        ctermbg=white
"" statusline specific
highlight Slred             ctermfg=red        ctermbg=darkgrey
""highlight Slblue             ctermfg=darkgrey       ctermbg=

"" unfocused statusline
highlight StatusLineNC	    ctermfg=darkgrey     ctermbg=grey
highlight VertSplit	    ctermfg=black     ctermbg=gray

"" Fold
highlight Folded            ctermfg=15
highlight FoldColumn        ctermfg=9



highlight LineNr            ctermfg=34
highlight cursorLineNr      ctermfg=34

"" empty line
highlight DiffDelete        ctermfg=red       ctermbg=000
"" line too much
highlight DiffAdd           ctermfg=red       ctermbg=000
"" whole different line
highlight DiffChange        cterm=bold ctermfg=red       ctermbg=000
"" different character
highlight DiffText          cterm=bold ctermfg=red       ctermbg=lightblue
highlight DiffThis          cterm=bold ctermfg=red       ctermbg=000

highlight Cursor            ctermfg=black     ctermbg=yellow
highlight lCursor           ctermfg=black     ctermbg=white


highlight Comment           ctermfg=blue
"" numbers
highlight Constant          ctermfg=113
"" sql from
highlight Special           ctermfg=brown
"" Variables
highlight Identifier        ctermfg=69
"" highlight
highlight Statement         ctermfg=217
highlight PreProc           ctermfg=magenta
"" public int TYPE
highlight type              ctermfg=77
highlight Underlined        ctermfg=red
"" highlight Ignore            ctermfg=000       ctermbg=000
