if !has('nvim')
    augroup autoComplete_autocmd
        autocmd!
        function! s:SetYcmOptions()
            nnoremap <buffer> <leader>f :YcmCompleter FixIt<cr>
            nnoremap <buffer> <leader>? :YcmCompleter GetType<cr>
            nnoremap <buffer> <leader>m :YcmDiags<cr>
            nnoremap <buffer> <leader>h :YcmCompleter GetDoc<CR>
            nnoremap <buffer> <F2> :YcmCompleter GoToDeclaration<CR>
            nnoremap <buffer> <F3> :YcmCompleter GoToDefinition<CR>
            nnoremap <buffer> <F4> :YcmCompleter GoToInclude<cr>
            nnoremap <buffer> <F5> :let g:ycm_show_diagnostics_ui=!g:ycm_show_diagnostics_ui<cr>:YcmRestartServer<cr>:e<cr>
            if &ft=="haskell"
                nnoremap <buffer> <F6> :YcmForceCompileAndDiagnostics<cr>:silent exec "!ctags --fields=+l -R ./*"<cr>:redraw!<cr>
            elseif &ft=="python"
                nnoremap <buffer> <F6> :YcmForceCompileAndDiagnostics<cr>:silent exec "!ctags --fields=+l -R *.py"<cr>:redraw!<cr>
            else " clang
                nnoremap <buffer> <F6> :YcmForceCompileAndDiagnostics<cr>:silent exec "!ctags --fields=+l -R include/* src/*"<cr>:redraw!<cr>
            endif
        endfunction

        autocmd FileType cpp,hpp,c,h,haskell,js,html,python call <SID>SetYcmOptions()
    augroup END
endif

augroup vimrc_autocmd
    autocmd!
    autocmd BufNewFile,BufRead * if &ft=="" | set ft=tex | endif
    if !has('nvim')
        function! s:SetTerminalOptions()
            setlocal nospell
            setlocal nonumber
            setlocal norelativenumber
            command! -buffer TermResize call term_setsize(bufnr(), 20, 1)
        endfunction
        autocmd TerminalOpen * call <SID>SetTerminalOptions()
    endif
augroup END

" file specific
augroup file_specific_autocmd
    autocmd!
    autocmd BufRead *.sage
                \ set ft=python
augroup END
