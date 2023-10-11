inoremap <buffer> <expr> <bs> strpart(getline('.'), col('.')-2, 2) =~# '\v\(\)|""|''''|[]|\{\}|\<\>' ? "\<bs>\<del>" : "\<bs>"
inoremap <buffer> <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<right>" : "\'\'\<left>"

command! -buffer CmakeYcm normal! Go<cr>#Youcompleteme<cr>set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
