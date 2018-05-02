" TODO:
"   python YCM configuration
"   vimrc todo completion
"
" General-use:
"
" IDE-Like features:
"
" * note '-' in CTRL-x (for example) means ctrl 'followed' by x, NOT CTRL then - then x
" * note '\' here is the <leader> key
"
"   - CTRL-b 'GOTO' func/var definition (CTRL-o or CTRL-i to toggle back and
"   forth afterwards)
"
"   - \-b find all 'USAGES/REFERENCES' (python, java, typescript only)
"
"   - \-k get documentation
"
"   - CTRL-p 'FUZZY' finder (combine with ctrl-x or ctrl-v to open in new
"   split or vertical split respectively)
"
"   - :Grep find all 'USAGES/REFERENCES' - this is provided by another plugin
"   other than YCM (this works for any filetypes)
"
"   - \\w or \\b for easy movement (vim-easymotion)
"
"   - ctrl-n for multi-cursor (like sublime text)
"
"   - <F3> shows quick fix list - this combined with \-b opens the list of all
"   usages again
"
"   - gcc or gcb<number> to comment or block comment
"
"   - [b or ]b to switch prev and next tabs (buffers) in respectively
"
"   - vim surround
"
"   - <F4> Location list //todo
"
"   - <F5> shows unprintable characters
"
"   - <F6> Gundo (python2.6) undo graph-tree
"
"   - <F7> Tagbar toggle - shows an overview of the source code
"
"   - <F8> Nerd tree
"
"   - <F2> calls :set paste (paste mode)
"
" features:
"   - fugitive vim - git wrapper //todo
"
"   - TMUX friendly, remaps ctrl-hjkl to work cross TMUX panes and vim splits
"
" dependencies:
" * YCM dependencies:
"       - sudo apt-get install build-essential cmake
"       - sudo apt-get install python-dev python3-dev
"       - JDK8
" * Powerline fonts:
"       - http://powerline.readthedocs.io/en/master/installation.html#fonts-installation
" * Base16 colourscheme for terminal:
"       - https://github.com/chriskempson/base16-shell
" installs vim plugin manager (vim-plug)
" automatically in your first vim session
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !curl -fLo ~/.vim/.ycm_extra_conf.py --create-dirs
    \ https://raw.githubusercontent.com/jfong361/dotfiles/master/.ycm_extra_conf.py
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" HELP
"  Vim Plug
"    - PlugInstall to install plugins
"    - PlugUpdate to install or update plugins
"    - PlugClean to remove unused directories
"    - PlugUpgrade to upgrade vim-plug itself
"    - PlugStatus to check status of the plugins
"    - PlugDiff examine changes from the previous update and the pending changes
"    - PlugSnapshot Generate script for restoring the current snapshot of the plugins
"  YCM
"    - For C/C++ projects, YCM requires - https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion
call plug#begin('~/.vim/plugged')

    """""""""""""""""""""""""""
    " Plugins
    """""""""""""""""""""""""""
    " surrounds word with adjective
    Plug 'tpope/vim-surround'
    " git wrapper
    Plug 'tpope/vim-fugitive'
    " shortcuts, [b ]b [e ]e
    Plug 'tpope/vim-unimpaired'
    " commenting
    Plug 'tomtom/tcomment_vim'
    " plugin repeatable
    Plug 'tpope/vim-repeat'
    " doxygen generator
    Plug 'vim-scripts/DoxygenToolkit.vim'

    " NERDtree
    Plug 'scrooloose/nerdtree'
    " laststatus=2
    Plug 'bling/vim-airline'
    " fuzzy finder
    Plug 'ctrlpvim/ctrlp.vim'

    " YCM; this is configured only for c/c++ and Java (see github page for
    " more completers)
    Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --java-completer'}

    " :Tagbar or F7 to toggle tags
    Plug 'majutsushi/tagbar'
    " F9-10 for toggling list syntastic/EasyGrep/YCM GotoReferences
    Plug 'milkypostman/vim-togglelist'

    " more % functions
    Plug 'tmhedberg/matchit'
    " match html tags with soft highlight
    Plug 'valloric/MatchTagAlways'
    " auto close tags
    Plug 'alvan/vim-closetag'

    " () pair
    Plug 'jiangmiao/auto-pairs'
    " Graph style undo
    Plug 'sjl/gundo.vim'
    " ctrl-n multi changing
    Plug 'terryma/vim-multiple-cursors'
    " Easy moving
    Plug 'lokaltog/vim-easymotion'
    " Editor settings
    Plug 'editorconfig/editorconfig-vim'

    " EasyGrep for vim
    Plug 'dkprice/vim-easygrep'
    " nav between tmux and vim splits with ctrl-hjkl
    Plug 'christoomey/vim-tmux-navigator'
    " incremental searches
    Plug 'haya14busa/incsearch.vim'
    " snippets
    " Plug 'msanders/snipmate.vim'

    " Log files php?
    Plug 'vim-scripts/log4j.vim'

    " cmake completion
    Plug 'jansenm/vim-cmake'

    " Haskell
    Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
    Plug 'eagletmt/neco-ghc', {'for' : 'haskell'}

    " HTML XML allml
    Plug 'tpope/vim-ragtag'

    " Syntax plugins
    Plug 'pangloss/vim-javascript', {'for':['javascript', 'javascript.jsx']}
    Plug 'hail2u/vim-css3-syntax', {'for':['css', 'sass', 'html', 'javascript.jsx']}
    Plug 'othree/html5-syntax.vim', {'for':['html', 'htmldjango', 'javascript.jsx']}
    Plug 'tpope/vim-markdown', {'for':['markdown']}
    Plug 'tpope/vim-haml', {'for':['haml']}
    Plug 'hdima/python-syntax', {'for':['html']}
    Plug 'vim-jp/vim-cpp', {'for':['c']}
    Plug 'wavded/vim-stylus', {'for':['stylus']}
    Plug 'mxw/vim-jsx', {'for':['javascript.jsx']}
    Plug 'justinmk/vim-syntax-extra', {'for':['c']}
    Plug 'octol/vim-cpp-enhanced-highlight', {'for':['cpp']}

    " Themes
    Plug 'chriskempson/base16-vim'
    Plug 'vim-airline/vim-airline-themes'

call plug#end ()

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
" Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""
    " Using powerline font
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " tabline options
    "let g:airline_theme='bubblegum'
    "let g:airline_theme='sol'
    let g:airline_theme='base16'
    "let g:airline_theme='solarized'
    "let g:airline_solarized_bg='dark'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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
    colorscheme base16-solarized-dark


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
    set foldcolumn=2
    set foldmethod=indent
    set foldenable

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
    "

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Doxygen
"""""""""""""""""""""""""""""""""""""""""""""""""""
" /// style docstring
" let g:DoxygenToolkit_commentType = "C++"

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


"""""""""""""""""""""""""""""""""""""""""""""""""""
" You complete me
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = '✖'
let g:ycm_warning_symbol = '❢'
" maps ctrl-b as goto definition
" note: ctrl-o jumps back to where you were, ctrl-i jumps forward
" to where the definition was (see :h jumplist)
nnoremap <C-b> :YcmCompleter GoTo<CR>
" maps leader-b as goto all usages - only for supported filetypes (python,
" java, and typescript)
" note: leader = \
nnoremap <leader>b :YcmCompleter GoToReferences<CR>
" autocomplete works in comments
let g:ycm_complete_in_comments=1
" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>k :YcmCompleter GetDoc<CR>
" closes the preview window - this isn't for autocompletion, but rather
" when you use YcmCompleter GetDoc; instead of closing the preview window
" manually, close it by exiting insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1
" default options
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
