if has("gui_running")
    set background=dark
    colorscheme gruvbox
    set guioptions=ge
    exec "vnoremap <expr> <c-/> " . g:commentmapv
    exec "nnoremap <expr> <c-/> " . g:commentmapn
    set guifont=DejaVu\ Sans\ Mono\ 12

    nnoremap <M-S-Up> :silent! let &guifont = substitute(
                \ &guifont,
                \ '\d\+',
                \ '\=eval(submatch(0)+1)',
                \ '')<CR>

    nnoremap <M-S-Down> :silent! let &guifont = substitute(
                \ &guifont,
                \ '\d\+',
                \ '\=eval(submatch(0)-1)',
                \ '')<CR>

else
    colorscheme mine              " ~/.vim/colors
endif

nohl                                             " no highlight after reload
