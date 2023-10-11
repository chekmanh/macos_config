" Sat 21 Sep 2019 01:27:03 PM UTC

let b:commentchar='" '

" not working with youcompleteme
" nnoremap <buffer> <F2> gg:r!date -u<cr>kddI""<esc>''

inoremap <buffer> <expr> <bs> strpart(getline('.'), col('.')-2, 2) =~# '\v\(\)|""|''''|[]|\{\}|\<\>' ? "\<bs>\<del>" : "\<bs>"

inoremap <buffer> " "
inoremap <buffer> <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<right>" : "\'\'\<left>"
inoremap <buffer> < <><left>
inoremap <buffer> <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<right>" : ">"
" vnoremap <buffer> < <esc>`<i<<esc>`><right>a><esc>
nmap d< di<va<p

nnoremap <buffer> <leader>W :Src<cr>

setlocal foldmethod=marker
