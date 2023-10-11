execute 'source ' . g:my_vim_folder . 'ftplugin/c.vim'

nnoremap <leader>co ostd::cout <<  << std::endl;<esc>13hi
nnoremap <buffer> <leader>try otry {<cr>} catch(std::exception& e) {<cr>std::cout << e.what() << std::endl;<cr><++><cr>}<esc>2-O

inoremap <buffer> ^^ ivarp::fixed_pow<>(<++>)<esc>2F<a

augroup hpp_autocmd
    autocmd!
    autocmd BufNewFile *.hpp call NewHppFile()
augroup END

function NewHppFile()

    call append(0, expand("%"))
    call append(1, "")
    call append(2, "")
    call append(3,expand("%"))

endfunction
