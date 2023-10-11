"" Mon  8 Jul 16:09:07 UTC 2019
execute 'source ' . g:my_vim_folder . 'ftplugin/c.vim'

""practical
inoremap <buffer> sout System.out.println();<left><left>
inoremap <buffer> souf System.out.printf("%s%n", );<left><left><esc>f)hhhhhi

""start of the file
cnoremap <buffer> initmain <esc>ipublic class <c-r>%<esc>xxxxxa {<cr><cr>public static void main (String[] args) {<cr><bs>}<cr><cr><bs>}<esc>kkkg_

setlocal nospell
