" Sun 15 Dec 2019 09:58:29 AM UTC

" comment
let b:commentchar='% '
let maplocalleader=";"

setlocal textwidth=1000                " when to wrap

" add LaTeX Words
set tags^=~/.vim/dictionary/tex.ycm
set formatoptions=crnlj1

" proper quotes in latex
inoremap <nowait> <buffer> ` ``'' <++><esc>T`i

" map default
inoremap <buffer> " "
vnoremap <buffer> ` s``<c-r>"''<esc>

inoremap <buffer> m( \left(\right)<left><left><left><left><left><left><left>

if !has('nvim')

    " compile
    function! VimtexCustomCompile()
        write
        if expand('%:t') == g:tex_main_file
            Silent VimtexStop
            VimtexCompile
        else
            Silent VimtexStop
            let l:wid = win_getid()
            exec "e " . g:tex_main_file
            VimtexCompile
            let l:wid2 = win_getid()
            call win_gotoid(l:wid)
            edit #
            call win_gotoid(l:wid2)
        endif
    endfunction
    command! -buffer LaTeXwrite call VimtexCustomCompile()
    command! -buffer LaTeXWrite call VimtexCustomCompile()
    nnoremap <buffer> <localleader>w :<c-u>call VimtexCustomCompile()<cr>

    nnoremap <buffer> <F5> :<c-u>call VimtexCustomCompile<cr>

    " Figure out later
    " command! -buffer LaTeXview silent write | VimtexCompileSS | VimtexView
    function! SynctexView()
        if expand('%:t') == g:tex_main_file
            cd %:p:h
            execute 'Silent !zathura ' . substitute(g:tex_main_file, ".tex$", ".pdf", "") . " &> /dev/null &"
        else
            let l:wid = win_getid()
            exec "e " . g:tex_main_file
            cd %:p:h
            execute 'Silent !zathura ' . substitute(g:tex_main_file, ".tex$", ".pdf", "") . " &> /dev/null &"
            let l:wid2 = win_getid()
            call win_gotoid(l:wid)
            edit #
            call win_gotoid(l:wid2)
        endif
    endfunction
    nnoremap <buffer> <localleader>v :<c-u>call SynctexView()<cr>

    if has("gui_running")
        let g:vimtex_view_method = 'skim'
        nnoremap <buffer> <localleader>v :<c-u>VimtexView<cr>
    endif

    " command! -buffer LaTeXclear VimtexClean
    command! -buffer LaTeXclear Silent !~/.local/shortcuts/latex_make C
    nnoremap <buffer> <localleader>c :w<cr>:!~/.local/shortcuts/latex_make "C"<cr>

    let g:custom_toc = vimtex#toc#new({
                \ 'show_help' : 0,
                \ 'mode' : 1,
                \})
    nnoremap <silent> <leader>E :call g:custom_toc.open()<cr>
    nnoremap <buffer> <leader>f <plug>(vimtex-view)

    command! -buffer LaTeXmake silent! write | silent! exe '!st -e $HOME/.local/shortcuts/latex_make ' . substitute(g:tex_main_file, ".tex$", "", "") . ' &> /dev/null &'


    " call the necessary command! -buffers
    nnoremap <buffer> <localleader> :LaTeX
    command! -buffer -nargs=1 LaTeXbeg normal! o<cr>\begin{<args>}<cr><cr>\end{<args>}<cr><esc>kkA
    command! -buffer -nargs=1 LaTeXse normal! o<cr>\section{<args>}<cr>
    command! -buffer -nargs=1 LaTeXsse normal! o<cr>\subsection{<args>}<cr>
    command! -buffer -nargs=1 LaTeXssse normal! o<cr>\subsubsection{<args>}<cr>

    " shortcuts
    " use package without jumping around
    command! -buffer -nargs=1 LaTeXup normal! mqHmwG?\v\\usepackage<cr>o\usepackage{<args>}<esc>:set nohlsearch<cr>'wzt'q

    let g:vimtex_mappings_override_existing=0
    let g:vimtex_view_automatic=0
    let g:vimtex_quickfix_mode=0
    " let g:vimtex_quickfix_method = 'pplatex'

    function! s:VimtexCustomError()
        if expand('%:t') == g:tex_main_file
            VimtexErrors
        else
            let l:wid = win_getid()
            exec "e " . g:tex_main_file
            VimtexErrors
            let l:wid2 = win_getid()
            call win_gotoid(l:wid)
            edit #
            call win_gotoid(l:wid2)
        endif
    endfunction
    nnoremap <buffer> <leader>m :call <SID>VimtexCustomError()<cr>

    " do i need that?
    command! -buffer LaTeXbta normal! o<cr>\begin{table}<cr>\centering<cr>\begin{tabular}<cr><++><cr>\end{tabular}<cr>\caption[\label{tab:<++>}<++>]{<++>}<cr>\end{table}<cr><esc>5kA{}<esc>il<right>
    command! -buffer LaTeXbfi normal! o<cr>\begin{figure}[htb]<cr>\centering<cr>\caption[<++>]{\label{fig:<++>}<++>}<cr>\end{figure}<cr><esc>4k
    " command! -buffer LaTeXbfi normal! o<cr>\begin{figure}[htb]<cr>\centering<cr>\caption[<++>]{\label{fig:<++>}<++>}<cr>\end{figure}<cr><esc>4k

    " listings
    " nnoremap <buffer> <localleader>ben o\begin{enumerate}<cr>\item <cr>\end{enumerate}<cr><cr><++><esc>kkkA
    command! -buffer LaTeXben normal! o\begin{enumerate}<cr>\item <cr>\end{enumerate}<cr><esc>kkA
    command! -buffer LaTeXbit normal! o\begin{itemize}<cr>\item <cr>\end{itemize}<cr><esc>kkA
    command! -buffer LaTeXbde normal! o\begin{description}<cr>\item []<cr>\end{description}<cr><esc>kkA

    command! -buffer LaTeXbfr normal! o<cr>\begin{frame}<cr>{}<cr>\end{frame}<cr><esc>kkf{a

    inoremap <buffer> <localleader>it <esc>o\item 
    function! s:LatexItem(...)
        if a:1 == ""
            exec "normal! o\\item "
        else
            exec "normal! o\\item [" . a:1 . "] "
        endif
    endfunction
    command! -buffer -nargs=* LaTeXit call <SID>LatexItem(<q-args>)

    " math
    command! -buffer LaTeXbma normal! o\begin{align*}<cr>\end{align*}<cr><esc>kk
    command! -buffer LaTeXma normal! o\begin{align*}<cr>\end{align*}<cr><esc>kk
    command! -buffer LaTeXbmc normal! o\begin{cases}<cr>\end{cases}<cr><esc>kk

    inoremap <buffer> <localleader>m $$ <++><esc>F$i
    inoremap <buffer> <localleader>f \frac{}{<++>} <++><esc>2F{a
    inoremap <buffer> <localleader>v \verb\|\| <++><esc>F\|i

    inoremap <buffer> <localleader>rf \cref{} <++><esc>F{a
    inoremap <buffer> <localleader>rr Routine~\ref{r:} <++><esc>F:a
    inoremap <buffer> <localleader>ci ~\cite{} <++><esc>F{a
    inoremap <buffer> <localleader>la \label{}<left>

    " change text-style
    inoremap <buffer> <localleader>tb \textbf{} <++><esc>T{i
    inoremap <buffer> <localleader>te \emph{} <++><esc>T{i
    inoremap <buffer> <localleader>tn \text{} <++><esc>T{i
    inoremap <buffer> <localleader>tr \textrm{} <++><esc>T{i
    inoremap <buffer> <localleader>ts \textsc{} <++><esc>T{i
    inoremap <buffer> <localleader>tt \texttt{} <++><esc>T{i

    vnoremap $ s$<c-r>"$<esc>

    omap <buffer> im <plug>(vimtex-i$)
    omap <buffer> am <plug>(vimtex-a$)
    omap <buffer> ii <plug>(vimtex-im)
    omap <buffer> ai <plug>(vimtex-am)
    xmap <buffer> im <plug>(vimtex-i$)
    xmap <buffer> am <plug>(vimtex-a$)
    xmap <buffer> ii <plug>(vimtex-im)
    xmap <buffer> ai <plug>(vimtex-am)

    if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
    endif

    let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
    if !exists("g:tex_main_file")
        let g:tex_main_file=substitute(argv(0), ".*\/", "" ,"")
        let b:vimtex_main = g:tex_main_file
    endif
    augroup vimrc_tex_autoopen
        autocmd!
        function! s:SetTexOptions()
            cd %:p:h
            argadd *.sty *.bib **/*.tex **/*.pgf **/*.tikz
        endfunction
        autocmd VimEnter *.tex call <SID>SetTexOptions()
    augroup END
    VimtexReloadState

    let g:vimtex_compiler_latexmk = {
                \ 'options' : [
                \   '-pdf',
                \   '-shell-escape',
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}

    command! -buffer -nargs=1 Vim let s:search=<q-args> |
                \ silent exec "vim! /\\v" . s:search . "/j ./**/*.{tex,sty,bib,tikz,pgf}" |
                \ copen |
                \ redraw! |
                \ exec "normal! /\\v" . s:search . "\<cr>"

    augroup VimTeX
      autocmd!
      autocmd BufReadPre *
            \ let b:vimtex_main = g:tex_main_file
    augroup END
endif
