" let g:ycm_autoclose_preview_window_after_completion = 1 " annoying
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 2
" Das hat mich 2 Tage meines Lebens gekostet
" let g:ycm_path_to_python_interpreter='/opt/homebrew/bin/python'
" let g:ycm_python_binary_path = '/opt/homebrew/bin/python3'
" let g:ycm_server_python_interpreter = '/opt/homebrew/bin/python3'

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Right>']
let g:ycm_key_list_previous_completion = ['<Up>', '<Left>']
let g:ycm_filetype_blacklist = {
            \ 'man': 1,
            \ 'netrw': 1,
            \ 'tagbar': 1,
            \ 'vimwiki': 1,
            \ 'infolog': 1,
            \ 'mail': 1
            \ }

let s:lsp = '/path/to/this/directory'
let g:ycm_language_server = [
            \   { 'name': 'haskell',
            \     'filetypes': [ 'haskell', 'hs', 'lhs' ],
            \     'cmdline': [ 'hie-wrapper', '--lsp' ],
            \     'project_root_files': [ '.stack.yaml', 'cabal.config', 'package.yaml' ]
            \   },
            \ ]



let g:netrw_banner = 1              " 0 it is really annoying
let g:netrw_browse_split = 4        " open in recent buffer
let g:netrw_list_hide = &wildignore " hide unnecessary files
let g:netrw_liststyle = 3           " tree style
let g:netrw_preview = 1             " preview vertical split
let g:netrw_special_syntax = 1      " don't know
let g:netrw_winsize = 27            " min window size
" move it
let g:netrw_home = $XDG_CACHE_HOME."/undo"

let g:tex_flavor = "latex"

let g:rainbow_active = 1

let g:tq_language=['en', 'de']
let g:tq_map_keys=0
let g:tq_use_vim_autocompletefunc=1
let g:tq_mthesaur_file=g:my_vim_folder . 'spell/mthesaur.txt'
" mthesaur_txt is not working, have to refresh sometimes
let g:tq_enabled_backends=['cilin_txt', 'openthesaurus_de', 'yarn_synsets', 'jeck_ru', 'openoffice_en', 'datamuse_com', 'mthesaur_txt']

" Haskell skills to weak for those keywords
" enable highlighting of ...
let g:haskell_enable_quantification = 1   " `forall`
let g:haskell_enable_recursivedo = 1      " `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " `proc`
let g:haskell_enable_pattern_synonyms = 1 " `pattern`
let g:haskell_enable_typeroles = 1        " type roles
let g:haskell_enable_static_pointers = 1  " `static`
let g:haskell_backpack = 1                " backpack keywords

let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_contrast_light="light"
let g:gruvbox_improved_warnings=1

let g:ale_linters = {
            \ 'cpp': ['clangtidy', 'cppcheck'],         
            \ 'haskell': [],                           
            \ 'java': [],                           
            \ }

let g:ale_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" let g:ale_fixers = {
" \   'tex': [
" \       'remove_trailing_lines',
" \   ],
" \}

nnoremap <leader>a :ALEToggle<cr>

let g:fzf_layout = { 'down': '40%' }

let g:firenvim_config = { 
            \ 'localSettings': {
                \ '.*': {
                    \ 'takeover': 'never',
                    \ },
                    \ }
                    \ }

let g:grammarous#show_first_error = 1
