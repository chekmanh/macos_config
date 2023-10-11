if !has('nvim')
    if empty(glob(g:my_vim_folder.'autoload/plug.vim'))
        exec "silent !curl -fLo ".g:my_vim_folder."/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    function! BuildYCM(info)
        if a:info.status == 'installed' || a:info.force
            !./install.py --clang-completer
        endif
    endfunction

    set nocompatible

    let &runtimepath.=',' . g:my_vim_folder
    call plug#begin(g:my_vim_folder . 'plugged')
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " for c and c++ don't try coc
    Plug 'luochen1990/rainbow'                                    " Brackets
    Plug 'mbbill/undotree'                                        " undo
    " Plug 'derekwyatt/vim-fswitch'                                 " cpp and hpp file
    Plug 'lervag/vimtex' , { 'for': ['tex'] }                     " some funny things for latex
    " Plug 'octol/vim-cpp-enhanced-highlight'                       " Not sure keep or not
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }           " fzf in vim
    Plug 'junegunn/fzf.vim'
    " Plug 'Ron89/thesaurus_query.vim'                              " better English
    " Plug 'rhysd/vim-grammarous'                                   " Grammar
    " Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell'] }      " Haskell default config
    " Plug 'alx741/vim-hindent', { 'for': ['haskell'] }             " Haskell indent
    " Plug 'dense-analysis/ale'                                     " useful feature
    " Plug 'tpope/vim-fugitive'                                     " useful feature
    " Plug 'Yggdroot/indentLine', { 'for': ['c', 'cpp', 'haskell', 'java', 'python'] }
    call plug#end()
    let &runtimepath.=',' . g:my_vim_folder . '/after'
endif
