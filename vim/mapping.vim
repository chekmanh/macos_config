" Remapping

let g:mapleader = "\<space>"      " useful to escape characters

nnoremap z! 1z=
nnoremap <cr> o

" nnoremap <c-e> <c-y>
" nnoremap <c-y> <c-e>
nnoremap qi :imapclear<cr>

" delete buffer from list
nnoremap <leader>d :bd<cr>
" write better patterns
nnoremap q/ q/i\v
" nice to disable
nnoremap <silent> <c-s> :set spell!<cr>
" do not know how to use Ex mode mode
nnoremap Q <nop>
nnoremap <leader> <nop>

" keep find in middle
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g; g;zz
nnoremap g, g,zz

" set very magic not possible, also would break plugins
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s/ s/\v
cnoremap g/ g/\v
cnoremap v/ v/\v

" jump to tag
inoremap <silent> \a <esc>/<++><cr>"_c4l
inoremap <silent> \a, <esc>/<++><cr>h"_c5l, 
inoremap <silent> \a- <esc>/<++><cr>h"_c5l-
inoremap <silent> \a. <esc>/<++><cr>h"_c5l.<esc>
inoremap <silent> \a<bs> <esc>/<++><cr>h5x
noremap <silent> \a <esc>/<++><cr>"_c4l
noremap <silent> \a, <esc>/<++><cr>h"_c5l, 
noremap <silent> \a- <esc>/<++><cr>h"_c5l-
noremap <silent> \a. <esc>/<++><cr>h"_c5l.<esc>
noremap <silent> \a<bs> <esc>/<++><cr>h5x

" find spelling error, not in normal mode
noremap <left> [s
noremap <right> ]s

" buffer switch
nnoremap <silent> <leader><tab> :bn<cr>

" new terminal or file explorer
nnoremap <leader>T :!osascript -e 'tell app "Terminal" to do script "cd %:p:h"' <cr><cr>
function! s:OpenTerminalBelow()
        set splitbelow!
        term ++rows=20
        set splitbelow!
endfunction
nnoremap <leader>t :call <SID>OpenTerminalBelow()<cr>

" Move within wrapped lines
vnoremap j gj
nnoremap j gj
vnoremap k gk
nnoremap k gk
vnoremap gj j
nnoremap gj j
vnoremap gk k
nnoremap gk k

" undo highlight
nnoremap <silent> <leader>n :nohl<cr>

" copy to clipboard
vnoremap <c-c> "+y
nnoremap <c-c> "+yy
" select pasted text
nnoremap gV `[v`]

" changing Focus in windows
" move Windows <c-w>J Capital
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" tags
nnoremap <silent> <leader><leader> :silent! exe "normal! \<c-]>"<cr>

" f/t char
noremap - ;

" save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>W :wa<cr>

nnoremap <leader>Q :wq<cr>

" to make <F1> actually helpful
nnoremap <F1> :h <c-r><c-w><cr>
" sometimes useful if Caps lock isn't Esc
inoremap jk <esc>
inoremap jj <cr><esc>kA
" expected behavior
nnoremap Y vg_y

" somehow necessary in st
nnoremap <ScrollWheelUp> <c-y>

" Jump into nested structure
onoremap i) :<c-u>exe "normal! /)\r:nohl\rvi("<cr>
onoremap a) :<c-u>exe "normal! /)\r:nohl\rva("<cr>
onoremap i} :<c-u>exe "normal! /}\r:nohl\rvi{"<cr>
onoremap a} :<c-u>exe "normal! /}\r:nohl\rva{"<cr>
onoremap i] :<c-u>exe "normal! /]\r:nohl\rvi["<cr>
onoremap a] :<c-u>exe "normal! /]\r:nohl\rva["<cr>
onoremap i> :<c-u>exe "normal! />\r:nohl\rvi<"<cr>
onoremap a> :<c-u>exe "normal! />\r:nohl\rva<"<cr>

" skip brackets
inoremap <c-l> <esc>:set noincsearch nohlsearch<cr>/[)}"'\]>]<cr>:set incsearch hlsearch|nohl<cr>a
" do not go right if on edge
inoremap <expr> <c-h> strpart(getline('.'), col('.')-1, 1) == "" ? "<esc>:set noincsearch nohlsearch<cr>?[[({\"'<]<cr>:set incsearch hlsearch|nohl<cr>i" : "<esc>:set noincsearch nohlsearch<cr>l?[[({\"'<]<cr>:set incsearch hlsearch|nohl<cr>i"

if !has('nvim')
    inoremap <expr> <esc>d getline(line('.')) =~# '\v^\s*$' ? "<esc>dd$" : "<esc>d"
endif

" auto-complete
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<right>" : "}"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<right>" : "\"\"\<left>"

" delete two brackets
inoremap <expr> <bs> strpart(getline('.'), col('.')-2, 2) =~# '\v\(\)|""|[]|\{\}' ? "\<bs>\<del>" : "\<bs>"

" surround in visual
vnoremap ( s(<c-r>")<esc>
vnoremap [ s[<c-r>"]<esc>
vnoremap { s{<c-r>"}<esc>
" respect registers
vnoremap "" s"<c-r>""<esc>
" respect marks
vnoremap '' s'<c-r>"'<esc>

" remove brackets in a repeatable way
nnoremap d" di"va"p
nnoremap d' di'va'p
nnoremap d( di(va(p
nnoremap d[ di[va[p
nnoremap d{ di{va{p

nnoremap ^ :e #<cr>
nnoremap <leader>e :Buffers<cr>
" Find hightlight group
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" is very magic comment in a generic way
if ! exists("b:commentchar")
    let b:commentchar="# "
endif
let g:commentmapv="getline(line('.')) =~# '^\\s*' . b:commentchar ?  \"<esc>'<<c-v>'>f x\" : \"<esc>'<<c-v>'>I<c-r>=b:commentchar<cr><esc>\""
let g:commentmapn="getline(line('.')) =~# '^\\s*' . b:commentchar ? '_vf x<esc>$' : 'I<c-r>=b:commentchar<cr><esc>$'"
exec "vnoremap <expr> <c-q> " . g:commentmapv
exec "nnoremap <expr> <c-q> " . g:commentmapn

" control direction to resize
nnoremap <left> <C-w><
nnoremap <right> <C-w>>
nnoremap <up> <C-w>+
nnoremap <down> <C-w>-

vnoremap <up> {
vnoremap <down> }

" easy navigate terminal
tnoremap <c-n> <c-w>NH
