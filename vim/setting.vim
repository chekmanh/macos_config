filetype plugin indent on
syntax enable                   " syntax highlighting

" set virtualedit=all             " edit tables
set tags+=../tags,../../tags    " jump around in files

set iskeyword-=:

set formatoptions=crnljM1

set lazyredraw                  " don't redraw for macros
set spell                       " sometimes is annoying
set spelllang=en_us             " English
set spelllang+=de_20            " 20 for new German
set spelllang+=cjk              " Chinese
let &spellfile=g:my_vim_folder.'/spell/en.utf-8.add'
set colorcolumn=120             " Code is too long
set cursorline                  " highlight current line
set showbreak=>                 " mark broken line

set autoread                    " doesn't work
set mouse=a                     " use mouse in vim
set nrformats=bin               " for <C-a> <C-x>
" set nrformats+=alpha            " for a b c
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8              " text encoding
set textwidth=78                " when to wrap

set timeoutlen=600              " <leader> faster timeout
set hidden                      " really dangerous

" anything
set showcmd                     " show incomplete commands
set scrolloff=3                 " keeps a line at the bottom
set showmatch                   " Highlight matching bracket
set matchtime=1                 " Show match time
set gdefault                    " substitute whole line flag g
set history=1000                " command history
set backspace=indent,eol,start  " not necessary for me
set linebreak                   " doesn't break words

set laststatus=2                " always show
" name|type|read-flag|mod-flag|separator|column|%|line/total
set statusline=%t\ %y%r%#Slred#%m%#Statusline#%=%c,%P\ %l/%L

set undofile                       " set undo
set backup
set undolevels=3000                " undo more commands
set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')

if has('nvim')
    set shada='300,<60,s100,h
    set inccommand=split          " nice little feature
else
    set viminfo='300,<60,s100,h,n$XDG_CACHE_HOME/vim/viminfo
endif

" set splitbelow                  " not retarded, now default seems better ^^
" set splitright

set wildmenu                                  " auto completion
set wildchar=<tab>                            " standard
set wildmode=list:longest,full                " list longest matching
set wildignore+=*.o,*.exe,*.out,*.class,*.pyc " compiled files
set wildignore+=*.jpg,*jpeg,*.gif,*.png       " images
set wildignore+=*.tags,tags,*.nav,*.snm       " tags and latex
set wildignore+=*.aux,*.log,*.pdf,*.toc,*.lof " latex
set wildignore+=*.bbl,*.run.sml,*.bcf,*.blg   " latex
set wildignore+=*.run.xml,*.lot               " latex
set wildignore+=*.ipynb                       " latex
set wildignorecase                            " not certain yet

" re-sizing active window
set winwidth=35
set winheight=8
set winminheight=7              " min height
set winminwidth=12              " min width

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " case insensitive
set smartcase                   " Unless Capital letter

" Set list! Show special char
set listchars=tab:▸\ ,eol:¬,trail:%

" numbers and Indentation
set autoindent                  " not smart indentation
set relativenumber              " number also possible

" Tabs and wrapped lines
set expandtab                   " use spaces, not tabs
set softtabstop=4               " number of spaces when editing.
set shiftwidth=4                " soft==shift, for normal mode ><

set nowrapscan                  " don't miss end of file
set nojoinspaces

set virtualedit=block             " confuse myself with "all", set to "block" for visual

" change cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
