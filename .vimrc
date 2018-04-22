" README
" Dependencies- powerline font, eslint, pylint, gcc
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein package manager
"""""""""""""""""""""""""""""""""""""""""""""""""""
    if &compatible
        set nocompatible
    endif

    set runtimepath^=/home/jiahong/.vim/./repos/github.com/Shougo/dein.vim
    call dein#begin(expand('~/.vim/bundle'))
    call dein#add('Shougo/dein.vim')
    " Plugins
    " call dein#add('Shougo/neocomplete.vim')
    " call dein#add('Shougo/neomru.vim')
    " call dein#add('Shougo/neosnippet.vim')
    " call dein#add('Shougo/neosnippet-snippets')

    call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'windows': 'tools\\update-dll-mingw',
        \     'cygwin': 'make -f make_cygwin.mak',
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake',
        \    },
        \ })

    """""""""""""""""""""""""""
    " Plugins
    """""""""""""""""""""""""""
    " surrounds word with adjective
    call dein#add('tpope/vim-surround')
    " git wrapper
    call dein#add('tpope/vim-fugitive')
    " shortcuts, [b ]b [e ]e
    call dein#add('tpope/vim-unimpaired')
    " commenting
    call dein#add('tomtom/tcomment_vim')

    " calls syntastic checkers
    call dein#add('scrooloose/syntastic')
    " NERDtree
    call dein#add('scrooloose/nerdtree')
    " laststatus=2
    call dein#add('bling/vim-airline')
    " fuzzy finder
    call dein#add('ctrlpvim/ctrlp.vim')

    " :Tagbar or F7 to toggle tags
    call dein#add('majutsushi/tagbar')
    " F9-10 for toggling list syntastic/EasyGrep
    call dein#add('milkypostman/vim-togglelist')

    " more % functions
    call dein#add('tmhedberg/matchit')
    " match html tags with soft highlight
    call dein#add('valloric/MatchTagAlways')
    " auto close tags
    call dein#add('alvan/vim-closetag')

    " ()
    call dein#add('jiangmiao/auto-pairs')
    " Graph style undo
    call dein#add('sjl/gundo.vim')
    " ctrl-n multi changing
    call dein#add('terryma/vim-multiple-cursors')
    " Easy moving
    call dein#add('lokaltog/vim-easymotion')
    " Editor settings
    call dein#add('editorconfig/editorconfig-vim')

    " EasyGrep for vim
    call dein#add('dkprice/vim-easygrep')
    " Camelcasing movement
    call dein#add('vim-scripts/camelcasemotion')
    " nav between tmux and vim splits with ctrl-hjkl
    call dein#add('christoomey/vim-tmux-navigator')
    " incremental searches
    call dein#add('haya14busa/incsearch.vim')
    " snippets
    " call dein#add('msanders/snipmate.vim')


    " Log files php?
    call dein#add('vim-scripts/log4j.vim')

    " Haskell
    call dein#add('eagletmt/ghcmod-vim', {'on_ft': 'haskell'})
    call dein#add('eagletmt/neco-ghc', {'on_ft' : 'haskell'})

    " HTML XML allml
    call dein#add('tpope/vim-ragtag')

    " Syntax
    call dein#add('pangloss/vim-javascript', {'on_ft':['javascript', 'javascript.jsx']})
    call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css', 'sass', 'html', 'javascript.jsx']})
    call dein#add('othree/html5-syntax.vim', {'on_ft':['html', 'htmldjango', 'javascript.jsx']})
    call dein#add('tpope/vim-markdown', {'on_ft':['markdown']})
    call dein#add('tpope/vim-haml', {'on_ft':['haml']})
    call dein#add('hdima/python-syntax', {'on_ft':['html']})
    call dein#add('vim-jp/vim-cpp', {'on_ft':['c']})
    call dein#add('wavded/vim-stylus', {'on_ft':['stylus']})
    call dein#add('mxw/vim-jsx', {'on_ft':['javascript.jsx']})
    call dein#add('justinmk/vim-syntax-extra', {'on_ft':['c']})
    call dein#add('octol/vim-cpp-enhanced-highlight', {'on_ft':['cpp']})

    " Themes
    call dein#add('chriskempson/base16-vim')
    call dein#add('vim-airline/vim-airline-themes')

    call dein#end()
    filetype plugin indent on

    " Install plugins on startup
    if dein#check_install()
      call dein#install()
    endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Specific Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""
    " To check what filetype it is ':set filetype?'
    autocmd FileType make setlocal noexpandtab
    autocmd FileType c setlocal cindent

    " Add '_' as a word separator in C/C++
    " autocmd FileType c setlocal iskeyword-=_
    " autocmd FileType cpp setlocal iskeyword-=_

    " matches '<' and '>', mainly for use when writing HTML.
    autocmd FileType html,eruby,htmldjango,php,xml setlocal mps+=<:> shiftwidth=2 tabstop=2
    autocmd FileType javascript.jsx setlocal mps+=<:>

    " Look up the type of the haskell expression under the cursor
    autocmd FileType haskell nnoremap <leader>t :GhcModType<CR>
    autocmd FileType haskell nnoremap <leader>c :GhcModTypeClear<CR>
    autocmd FileType haskell nnoremap <leader>i :GhcModTypeInsert<CR>

    " Set the syntax highlighting of log files to log4j
    autocmd BufRead,BufNew *.log set filetype=messages

    " set the spell checker on.
    autocmd FileType text,markdown,plaintex,html,xml,tex setlocal spell

    " set the syntax highlighting of jsx files
    autocmd BufRead,BufNew *.jsx set filetype=javascript.jsx syntax=javascript.jsx


"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:closetag_filenames = "*.jsx,*.html"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyGrep
"""""""""""""""""""""""""""""""""""""""""""""""""""
    " EasyGrep searches according to the current filetype.
    let g:EasyGrepMode = 2

    " Uses grep rather than vimgrep.
    let g:EasyGrepCommand = 1

    " Looks for a repository directory to search under, defaults to cwd if it can't find one.
    let g:EasyGrepRoot = "repository"

    " Exclude the following files and folders
    let g:EasyGrepFilesToExclude = ".o,.svn,.git,build,node_modules"

    " EasyGrep recursively searches from the root
    let g:EasyGrepRecursive = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" MatchTagAlways
"""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'eruby' : 1,
        \ 'htmldjango' : 1,
        \ 'javascript.jsx': 1}


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic options
"""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:syntastic_check_on_open=1
    let g:syntastic_enable_signs=1
    let g:syntastic_always_populate_loc_list = 1

    let g:syntastic_error_symbol = '✖'
    let g:syntastic_warning_symbol = '❢'

    let g:syntastic_mode_map={'passive_filetypes':['python']}
    " Use pylint
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc'
    let g:syntastic_python_pylint_quiet_messages = { 'type' : 'style' }

    " Use eslint (uses ~/.eslintrc)
    let g:syntastic_javascript_checkers = ['eslint']

    " Use gcc, make and splint
    let g:syntastic_c_checkers = ['gcc', 'make']

    let g:syntastic_cpp_checkers = ["g++", "cmake"]
    let g:syntastic_cpp_compiler = ["g++", "cmake"]
	let g:syntastic_cpp_compiler_options = ' -std=c++11'

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""
    " Using powerline font
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " tabline options
    " let g:airline_theme='bubblegum'
    " let g:airline_theme='sol'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" """"""""""""""""""""""""""""""""""""""""""""""""""
"" Neocomplete options
""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " Disable AutoComplPop.
"    let g:acp_enableAtStartup = 0
"    " Use neocomplete.
"    let g:neocomplete#enable_at_startup = 1
"    " Use smartcase.
"    let g:neocomplete#enable_smart_case = 1
"    " Set minimum syntax keyword length.
"    let g:neocomplete#sources#syntax#min_keyword_length = 3
"    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"    
"    " Define dictionary.
"    let g:neocomplete#sources#dictionary#dictionaries = {
"        \ 'default' : '',
"        \ 'vimshell' : $HOME.'/.vimshell_hist',
"        \ 'scheme' : $HOME.'/.gosh_completions'
"            \ }
"    
"    " Define keyword.
"    if !exists('g:neocomplete#keyword_patterns')
"        let g:neocomplete#keyword_patterns = {}
"    endif
"    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"    
"    " Plugin key-mappings.
"    inoremap <expr><C-g>     neocomplete#undo_completion()
"    inoremap <expr><C-l>     neocomplete#complete_common_string()
"    
"    " Recommended key-mappings.
"    " <CR>: close popup and save indent.
"    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"    function! s:my_cr_function()
"      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"      " For no inserting <CR> key.
"      "return pumvisible() ? "\<C-y>" : "\<CR>"
"    endfunction
"    " <TAB>: completion.
"    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"    " <C-h>, <BS>: close popup and delete backword char.
"    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"    " Close popup by <Space>.
"    inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"    
"    " AutoComplPop like behavior.
"    let g:neocomplete#enable_auto_select = 1
"    
"    " Shell like behavior(not recommended).
"    "set completeopt+=longest
"    "let g:neocomplete#enable_auto_select = 1
"    "let g:neocomplete#disable_auto_complete = 1
"    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"    
"    " Enable omni completion.
"    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"    
"    " Enable heavy omni completion.
"    if !exists('g:neocomplete#sources#omni#input_patterns')
"      let g:neocomplete#sources#omni#input_patterns = {}
"    endif
"    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"    
"    " For perlomni.vim setting.
"    " https://github.com/c9s/perlomni.vim
"    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"    let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
"    let g:neocomplete#enable_at_startup = 1
"    let g:neocomplete#enable_auto_select = 1
"    let g:neocomplete#enable_smart_case = 1
"    let g:neocomplete#auto_completion_start_length = 2
"   
"    " increase limit for tag cache files
"    let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
"   
"    " fuzzy completion breaks dot-repeat more noticeably
"    " https://github.com/Shougo/neocomplete.vim/issues/332
"    let g:neocomplete#enable_fuzzy_completion = 0
"
"    " always use completions from all buffers
"    if !exists('g:neocomplete#same_filetypes')
"      let g:neocomplete#same_filetypes = {}
"    endif
"    let g:neocomplete#same_filetypes._ = '_'
"    
"    " enable omni-completion for Ruby and PHP
"    call neocomplete#util#set_default_dictionary(
"          \'g:neocomplete#sources#omni#input_patterns', 'ruby',
"          \'[^. *\t]\.\h\w*\|\h\w*::\w*')
"    call neocomplete#util#set_default_dictionary(
"          \'g:neocomplete#sources#omni#input_patterns',
"          \'php',
"          \'[^. \t]->\h\w*\|\h\w*::\w*')
"    
"    " from neocomplete.txt:
"    " ---------------------
"    
"    " Plugin key-mappings.
"    inoremap <expr> <C-g> neocomplete#undo_completion()
"    inoremap <expr> <C-l> neocomplete#complete_common_string()
"    
"    " Recommended key-mappings.
"    " <CR>: cancel popup and insert newline.
"    inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
"    " <TAB>: completion.
"    inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
"    " <C-h>, <BS>: close popup and delete backword char.
"    inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
"    inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
"    inoremap <expr> <C-y> neocomplete#close_popup()
"    inoremap <expr> <C-e> neocomplete#cancel_popup()
"
""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Neosnippet options
""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " Press ctrl + k to expand or jump to next field
"    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"    xmap <C-k>     <Plug>(neosnippet_expand_target)

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo options
"""""""""""""""""""""""""""""""""""""""""""""""""""
    nmap <F6> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar options
"""""""""""""""""""""""""""""""""""""""""""""""""""
    nmap <F7> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree options
"""""""""""""""""""""""""""""""""""""""""""""""""""
    map <F8> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Togglelist options
"""""""""""""""""""""""""""""""""""""""""""""""""""
    map <F3> :call ToggleQuickfixList()<CR>
    map <F4> :call ToggleLocationList()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor options
"""""""""""""""""""""""""""""""""""""""""""""""""""
    " Sets the encoding to the utf-8 character set
    set enc=utf-8
    set term=screen-256color
    set t_Co=256

    " latex settings
    set grepprg=grep\ -nH\ $*
    let g:tex_flavor='latex'
    let g:tex_indent_items=1

    " Y as y$
    nnoremap Y y$

    " Paste mode
    set pastetoggle=<F2>

    " Reload files changed externally to vim.
    set autoread

    " shows status line with filename, column/row coords, dirty bit
    set laststatus=2
    set ruler
    " sets xterm title to display the name of the file currently being edited
    set title
    " shows mode (i.e. insert mode etc)
    set showmode
    " shows the keystrokes currently waiting to be processed
    set showcmd
    " always reports the number of lines changed
    set report=0
    " flashes the screen instead of beeping the computer
    set visualbell t_vb=

    " Allow the backspace button to backspace over indents, eols and the start of insert.
    set backspace=indent,eol,start

    " searches are incremental
    set incsearch
    " show matching bracket briefly
    set showmatch

    " don't wrap long lines
    set nowrap

    " Show non-white space characters when using :set list
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

    " character to mark lines that exceed 80 characters
    set listchars+=extends:@

    " indent on new line is equal to indent on previous line
    set smartindent
    " tabstops are converted to spaces, ensuring the file always looks the same.
    set expandtab
    " tabstops set to 4 spaces
    set tabstop=4
    " width of an indent level
    set shiftwidth=4
    " smarttab uses shiftwidth at the start of a line and tabstop everywhere else.
    set smarttab

    " autoformats text, wraps lines, autoindents, continues comments etc.
    set formatoptions=croqn2

    " syntax colouration and highlighting
    syn on
    let base16colorspace=256
    if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
      source ~/.vimrc_background
    endif
    colorscheme base16-tomorrow-night


    " write a backup of the current file (with an appended ~) on each write
    set nobackup

    " Automatically change directory to the file in the current window.
    set autochdir

    "ignores the case in search patterns.
    set ignorecase
    set smartcase

    " Highlights matching terms when searching.
    set hlsearch

    " Turns the mouse off.
    set mouse=r

    " turn on line-numbers.
    set nu
    set rnu

    " folding commands.
    "" :set foldcolumn=2
    " set foldmethod=indent
    " set foldenable

    " tab autocompletion in the command space
    set wildmenu
    set wildmode=longest,full

    " Pressing F12 will refresh the syntax highlighting.
    map  <F12> <Esc>:syntax sync fromstart<CR>:noh<CR>

    " Toggles display of unprintable characters.
    nnoremap <F5> :set list!<CR>

    " So that the IME does not interfere with VIM.
    set iminsert=0
    set imsearch=0

    let $PATH = $PATH . ':' . expand('~/.cabal/bin')

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux-split-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier split navigation  - ctrl [hjkl]
" and changes behavior if tmux is on (ie, tmux will work with vim easy navi)

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
