"" Sun 22 Dec 2019 07:14:49 PM UTC

let g:ycm_global_ycm_extra_conf = g:my_vim_folder . 'plugged/ycm_extra_conf_py.py'

let b:commentchar="# "

inoremap <buffer> <expr> <bs> strpart(getline('.'), col('.')-2, 2) =~# '\v\(\)|""|''''|[]|\{\}' ? "\<bs>\<del>" : "\<bs>"
inoremap <buffer> <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<right>" : "\'\'\<left>"

nnoremap <buffer> ; :normal! mqA:<esc>`q
inoremap <buffer> ; <esc>A:<cr>
iabbrev <buffer> r return
nnoremap <buffer> <leader>fi ofor i in range():<left><left>
nnoremap <buffer> <leader>fj ofor j in range():<left><left>
nnoremap <buffer> <leader>fk ofor k in range():<left><left>
nnoremap <buffer> <leader>ft ofor x in <++>:<esc>Fxs

nnoremap <buffer> <leader>try otry:<cr><cr><bs>except Exception as e:<cr><up><up><tab>

nnoremap <buffer> <leader>if oif :<left>
nnoremap <buffer> <leader>ei oelif :<left>
nnoremap <buffer> <leader>el oelse:<cr>

nnoremap <buffer> <leader>c o"""<cr>"""<esc>O

let b:next='\v%$\|^\s*(class\|def\|async def)>'
let b:prev='\v^\s*(class\|def\|async def)>'

function! s:Python_jump(mode, motion, flags, count, ...) range
    let l:startofline = (a:0 >= 1) ? a:1 : 1

    if a:mode == 'x'
        normal! gv
    endif

    if l:startofline == 1
        normal! 0
    endif

    let cnt = a:count
    mark '
    while cnt > 0
        call search(a:motion, a:flags)
        let cnt = cnt - 1
    endwhile

    if l:startofline == 1
        normal! ^
    endif
endfun

execute "nnoremap <silent> <buffer> <leader>j :call <SID>Python_jump('n', '". b:next."', 'W', v:count1)<cr>"
execute "nnoremap <silent> <buffer> <leader>k :call <SID>Python_jump('n', '". b:prev."', 'Wb', v:count1)<cr>"
