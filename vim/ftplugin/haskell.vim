"" Sun 15 Dec 2019 09:57:59 AM UTC

let b:commentchar='-- '
let g:ycm_global_ycm_extra_conf = g:my_vim_folder . 'plugged/ycm_extra_conf_hs.py'

nnoremap <buffer> <leader>t :exe "normal! :term ++rows=20 ghci " . expand("%") . "\r"<cr>

setlocal nospell

command! -buffer Re call Hindent()
