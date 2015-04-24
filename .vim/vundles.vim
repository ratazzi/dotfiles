" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" Vundle {{{
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" let g:make = 'gmake'
" if system('uname -o') =~ '^GNU/'
"     let g:make = 'make'
" endif
" NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'vim-scripts/tComment'
" NeoBundle 'tpope/vim-surround'
" NeoBundle 'vim-scripts/grep.vim'
" NeoBundle 'ahao/vimcdoc'

" ctrlp.vim
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_relative = 1
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0

NeoBundle "SirVer/ultisnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", expand('~/.vim/snippets/')]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vim-session
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
set sessionoptions+=resize,winpos
let g:session_directory = expand('~/.tmp/sessions')
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" " Command-T
" NeoBundle 'wincent/Command-T'
" let g:CommandTMaxHeight=15

NeoBundle 'klen/python-mode'
let g:pymode_folding = 0
let g:pymode_motion = 0
let g:pymode_lint = 1
let g:pymode_warnings = 1
" " let g:pymode_lint_cwindow = 0
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_ignore = "E302,E501,W901"
let g:pymode_rope = 0
let g:pymode_breakpoint_key = ''

" vim-javascript
NeoBundle "pangloss/vim-javascript"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

NeoBundle "mitsuhiko/vim-jinja"
NeoBundle "vim-scripts/iptables"
NeoBundle "groenewege/vim-less"
NeoBundle "vim-scripts/applescript.vim"
" NeoBundle "ratazzi/blackboard.vim"
" NeoBundle "zaiste/tmux.vim"
NeoBundle "brandonbloom/vim-proto"
NeoBundle "tsaleh/vim-matchit"
NeoBundle "tpope/vim-markdown"
NeoBundle "mileszs/ack.vim"
NeoBundle "rodjek/vim-puppet"
NeoBundle "tshirtman/vim-cython"
NeoBundle "honza/dockerfile.vim"
" NeoBundle "szw/vim-ctrlspace"

" Rails
NeoBundle "tpope/vim-rails"

" easy-align
NeoBundle "junegunn/vim-easy-align"
vnoremap <silent> <Enter> :EasyAlign<Enter>

NeoBundle "Lokaltog/vim-powerline"
NeoBundle "junegunn/goyo.vim"
NeoBundle "dag/vim-fish"

" vim-startify
NeoBundle "mhinz/vim-startify"
let g:startify_session_dir = expand('~/.tmp/sessions')
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']

" Coffee
NeoBundle "kchmck/vim-coffee-script"

" Swift
NeoBundle "toyamarinyon/vim-swift"

NeoBundleLazy 'vim-scripts/c.vim', {
      \ 'autoload' : {
      \     'filetypes' : ['c', 'cpp'],
      \    },
      \ }
" let g:C_CCompiler = 'clang'
" let g:C_CplusCompiler = 'clang'
let g:C_CFlags = '-Wall -g -O0 -c -Wimplicit-function-declaration'

" NeoBundle "gilligan/vim-lldb"

" NeoBundle 'wakatime/vim-wakatime'

" NeoBundle 'fatih/vim-go'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
" }}}
