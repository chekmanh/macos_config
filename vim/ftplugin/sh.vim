"" Fri 04 Oct 2019 03:09:39 PM UTC

let b:commentchar="# "

nnoremap <buffer> ; :normal! mqA;<esc>`q
inoremap <buffer> <expr> <bs> strpart(getline('.'), col('.')-2, 2) =~# '\v\(\)|""|''''|[]|\{\}|\<\>' ? "\<bs>\<del>" : "\<bs>"
inoremap <buffer> <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<right>" : "\'\'\<left>"

vnoremap <buffer> [[ <esc>`<i[[ <esc>`><right>a<right> ]]<esc> 
inoremap <buffer> [[ [[  ]]<left><left><left>
vnoremap <buffer> $$ <esc>`>a)<esc>`<i$(<esc>
""inoreabbrev <buffer>  [[ [[      ]]<left><left><left>
