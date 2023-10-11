let maplocalleader=";"

let b:md_file=argv(0)
setlocal textwidth=1000                " when to wrap

function! s:Markdown_compile()
    write
    execute "Silent !pandoc " . b:md_file .  " -f markdown -o" . substitute(b:md_file, ".md$", "_pandoc_.pdf", "") . " &> /dev/null &"
endfunction

nnoremap <buffer> <localleader>W :<c-u>call <SID>Markdown_compile()<cr>
nnoremap <buffer> <localleader>w :<c-u>call <SID>Markdown_compile()<cr>

function! s:Markdown_view()
    execute "Silent !zathura " . substitute(b:md_file, ".md$", "_pandoc_.pdf", "") . " &> /dev/null &"
endfunction
nnoremap <buffer> <localleader>v :<c-u>call <SID>Markdown_view()<cr>
