" Sat 21 Sep 2019 01:27:03 PM UTC;
" op movement
let g:ycm_global_ycm_extra_conf = g:my_vim_folder . 'plugged/ycm_extra_conf_c.py'

" handle lambda correctly
setlocal cindent
setlocal cino=j1

command! -nargs=1 -buffer Grep silent exec "grep! -sir " . shellescape(<q-args>) . " ./include/* ./src/*" | copen | redraw!
command! -nargs=1 -buffer Vim silent exec "vim! /\\v" . <q-args> . "/j ./src/**/* ./include/**/*" | copen | redraw!

onoremap <buffer> i= :<c-u>exe "normal! 0/=.*;\\|return\r:nohl\rwvt;"<cr>
" onoremap <buffer> i= :<c-u>exe "normal! 0/=.*;\\|return\r:nohl\rWvt;"<cr>

" stay where you where
nnoremap <buffer> ; :normal! mqA;<esc>`q

" might get annoying later
inoremap <buffer> ; <esc>:normal! mqA;<esc>`q

inoremap <buffer> <expr> <bs> strpart(getline('.'), col('.')-2, 2) =~# '\v\(\)|""|''''|[]|\{\}' ? "\<bs>\<del>" : "\<bs>"
inoremap <buffer> <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<right>" : "\'\'\<left>"

iabbrev r return

let b:commentchar='// '

nnoremap <buffer> <leader>( A {<cr>}<esc>k

nnoremap <buffer> <leader>fi ofor(int i = ; i < <++>; i++) {<cr><++><cr>}<esc>kkf;i
nnoremap <buffer> <leader>fj ofor(int j = ; j < <++>; j++) {<cr><++><cr>}<esc>kkf;i
nnoremap <buffer> <leader>fk ofor(int k = ; k < <++>; k++) {<cr><++><cr>}<esc>kkf;i
nnoremap <buffer> <leader>ft ofor(const auto& x : <++>) {<cr><++><cr>}<esc>kkfxs

nnoremap <buffer> <leader>sc oswitch() {<cr>}<esc>Ocase <++>:<cr>break;<cr><bs>case <++>:<cr>break;<esc>o<bs>case <++>:<cr>break;<esc>odefault:<cr><++>;<cr>break;<esc>9-f)i

nnoremap <buffer> <leader>hl owhile() {<cr><++><cr>}<esc>--f)i
nnoremap <buffer> <leader>try otry {<cr>} catch(int <++>)<cr>{<cr><++><cr>}<esc>2-O

nnoremap <buffer> <leader>if oif () {<cr><++><cr>}<esc>--f)i
nnoremap <buffer> <leader>ei jA else if () {<cr><++><cr>}<esc>--f)i
nnoremap <buffer> <leader>el jA else {<cr>}<esc>O

vnoremap * s/*<c-r>"*/<esc>
set path+=../include/

" nnoremap <buffer> <leader>( o{<cr>}<esc>k
" 
" nnoremap <buffer> <leader>fi ofor(int i = ; i < <++>; i++)<cr>{<cr><++><cr>}<esc>kkkf;i
" nnoremap <buffer> <leader>fj ofor(int j = ; j < <++>; j++)<cr>{<cr><++><cr>}<esc>kkkf;i
" nnoremap <buffer> <leader>fk ofor(int k = ; k < <++>; k++)<cr>{<cr><++><cr>}<esc>kkkf;i
" nnoremap <buffer> <leader>ft ofor(const auto& x : <++>)<cr>{<cr><++><cr>}<esc>kkkfxs
" 
" nnoremap <buffer> <leader>sc oswitch()<cr>{<cr>}<esc>Ocase <++>:<cr>break;<cr><bs>case <++>:<cr>break;<esc>o<bs>case <++>:<cr>break;<esc>odefault:<cr><++>;<cr>break;<esc>10-f)i
" 
" nnoremap <buffer> <leader>hl owhile()<cr>{<cr><++><cr>}<esc>---f)i
" nnoremap <buffer> <leader>try otry<cr>{<cr>} catch(int <++>)<cr>{<cr><++><cr>}<esc>3-O
" 
" nnoremap <buffer> <leader>if oif ()<cr>{<cr><++><cr>}<esc>---f)i
" nnoremap <buffer> <leader>ei jA else if ()<cr>{<cr><++><cr>}<esc>---f)i
" nnoremap <buffer> <leader>el jA else<cr>{<cr>}<esc>O
