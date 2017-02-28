" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" Vundle {{{
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call plug#begin('~/.vim/plugged')

" call neobundle#begin(expand('~/.vim/bundle/'))
"
" PlugFetch 'Shougo/neobundle.vim'

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'mattn/emmet-vim'
" Plug 'vim-scripts/tComment'
" Plug 'tpope/vim-surround'
" Plug 'ahao/vimcdoc'

Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ctrlp.vim
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_relative = 1
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" vim-session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
set sessionoptions+=resize,winpos
let g:session_directory = expand('~/.tmp/sessions')
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Plug 'scrooloose/syntastic'
" " syntastic configuration
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_javascript_jshint_args = "--config ".$HOME."/.vim/conf/jshintrc"
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
" " let g:syntastic_auto_jump = 3
" let g:syntastic_python_python_exec = expand('~/.neovim/bin/python3')
"
" let g:syntastic_php_phpcs_args='--tab-width=0'
" let g:syntastic_mode_map = {
"     \ "mode": "active",
"     \ "active_filetypes": ["ruby", "python"],
"     \ "passive_filetypes": ["php"] }

Plug 'w0rp/ale'
" Write this in your vimrc file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\   'javascript': [''],
\}

" Write this in your vimrc file
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" {{{ Python
Plug 'hynek/vim-python-pep8-indent'
Plug 'mitsuhiko/vim-jinja'
Plug 'tshirtman/vim-cython'
" }}}

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

if !has('nvim')
    Plug 'Shougo/neocomplete.vim'
    let g:neocomplete#enable_at_startup = 1
else
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    let g:deoplete#enable_at_startup = 1
endif


" vim-javascript
Plug 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

Plug 'vim-scripts/iptables'
Plug 'vim-scripts/applescript.vim'
" Plug 'ratazzi/blackboard.vim'
Plug 'brandonbloom/vim-proto', {'for': 'proto'}
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-markdown'
Plug 'rodjek/vim-puppet', {'for': 'puppet'}
Plug 'honza/dockerfile.vim', {'for': 'dockerfile'}
Plug 'reedes/vim-colors-pencil'
" let g:airline_theme = 'pencil'
" set background=light

" Rails
Plug 'tpope/vim-rails'

" easy-align
Plug 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<Enter>

" {{{ airline
Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" vim-powerline symbols
" let g:airline_left_sep          = '⮀'
" let g:airline_left_alt_sep      = '⮁'
" let g:airline_right_sep         = '⮂'
" let g:airline_right_alt_sep     = '⮃'
" let g:airline_branch_prefix     = '⭠'
" let g:airline_readonly_symbol   = '⭤'
" let g:airline_linecolumn_prefix = '⭡'
let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = '«'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" 关闭状态显示空白符号计数,这个对我用处不大"
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#symbol = '!'
" }}}

Plug 'rking/ag.vim'
let g:ag_working_path_mode="r"
let g:ag_highlight=1

Plug 'dag/vim-fish'

" Coffee
Plug 'kchmck/vim-coffee-script'
autocmd BufWritePost *.coffee silent make!

" Swift
" Plug 'toyamarinyon/vim-swift'

" PlugLazy 'vim-scripts/c.vim', {
"       \ 'autoload' : {
"       \     'filetypes' : ['c', 'cpp'],
"       \    },
"       \ }
" let g:C_CCompiler = 'clang'
" let g:C_CplusCompiler = 'clang'
" let g:C_CFlags = '-Wall -g -O0 -c -Wimplicit-function-declaration'

" Plug 'gilligan/vim-lldb'

" Plug 'wakatime/vim-wakatime'

" Plug 'fatih/vim-go'

Plug 'xolox/vim-easytags'
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1

Plug 'CodeFalling/fcitx-vim-osx'
Plug 'vim-scripts/fcitx.vim'

Plug 'Raimondi/delimitMate'
" for python docstring ",优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0

" Plug 'vim-perl/vim-perl'

Plug 'kien/rainbow_parentheses.vim'
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

" 更高效的行内移动, f/F/t/T, 才触发
" quickscope
Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

Plug 'scrooloose/nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'jlanzarotta/bufexplorer'
map <leader>b :BufExplorer<CR>

" Plug 'fholgado/minibufexpl.vim'

" Plug 'Yggdroot/indentLine'

Plug 'saltstack/salt-vim'
" Force using the Django template syntax file
let g:sls_use_jinja_syntax = 1

" call neobundle#end()
call plug#end()

filetype plugin indent on

" PlugCheck
" }}}
