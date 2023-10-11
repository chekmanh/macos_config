" commands

command! Src write | exec "source " . expand('$MYVIMRC') 
            \| if ! empty(glob(g:my_vim_folder . "ftplugin/" . &ft . ".vim")) 
            \| exec "so " . g:my_vim_folder . "ftplugin/" . &ft .".vim" | endif

command! Erc exec "badd" . g:my_vim_folder . "vimrc" 
            \| exec "lcd " . g:my_vim_folder 
            \| exec "argadd" . g:my_vim_folder . "*.vim" 
            \| if ! empty(glob(g:my_vim_folder . "ftplugin/" . &ft . ".vim")) 
            \| exec "argadd" . g:my_vim_folder . "ftplugin/" . &ft . ".vim" 
            \| endif 
            \| exec "Buffers"

" undotree is nice
command! Ud UndotreeToggle

" hpp and cpp
command! Fs FSHere
command! Fsb exec "normal! :FSSplitBelow\<cr>z20\<cr>"
command! Fsr FSSplitRight

" change dir to buffer dir, silent! Terminal tries to change dir
command! Lcd lcd %:p:h
command! Cd cd %:p:h

command! Cp normal! mqggVG"+Y`q

" diff
command! Diff windo diffthis
command! Diffoff windo diffoff

command! Rw ThesaurusQueryReplaceCurrentWord


" very nice
command! -bang Qa quitall<bang>
command! -bang Q quit<bang>
command! -bang W write<bang>

command! -bang -nargs=1 Mksession exec "mksession<bang> ~/.local/share/vim/sessions/<args>"

" use qargs for greo?
" how to ./**/*.(tex|bib|sty)?
" command! -nargs=1 Grep silent exec "grep! -si " . shellescape(<q-args>) . " ./*" | copen | redraw!
command! -nargs=1 Vim let s:search=<q-args> 
            \| silent exec "vim! /\\v" . s:search . "/j ./*" 
            \| copen 
            \| redraw! 
            \| exec "normal! /\\v" . s:search . "\<cr>"

" silent commands break the window
command! -bang -nargs=+ Silent exe 'silent<bang> <args>' | redraw!

" export pdfs
command! PdfExport hardcopy > %:p.ps | Silent !epspdf %:p.ps ; rm %:p.ps 

command! ReformatFile exec "normal! mqHmw" 
            \| exec "normal! gg=G" 
            \| exec "normal! 'wzt`q" 
            \| write
nnoremap <nowait> <leader>R :<c-u>ReformatFile<cr>

command! ReformatLocal exec "normal! mqHmw" 
            \| exec "normal! 'q" 
            \| exec "normal! {v}=" 
            \| exec "normal! 'wzt`q" 
            \| write
nnoremap <nowait> <leader>r :<c-u>ReformatLocal<cr>

function! s:QuitWithoutError()
    try
        quit
    catch /^Vim\%((\a\+)\)\=:E173:/
        quitall
    catch /^Vim\%((\a\+)\)\=:E37:/
        echo "no write"
    endtry
endfunction
nnoremap <leader>q :<c-u>call <SID>QuitWithoutError()<cr>


function! Sum(number)
    let g:S = g:S + a:number
    return a:number
endfunction
command! SumNumbers let g:S=0 
            \| %s/\d\+/\=Sum(submatch(0))/g 
            \| echo g:S 
            \| undo
