" Vundle {{{
" if has('vim_starting')
"     set nocompatible
"     set runtimepath+=~/.vim/bundle/neobundle.vim/
" endif
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" call neobundle#rc(expand('~/.vim/bundle/'))
" Bundle 'Shougo/neobundle.vim'
" Bundle 'Shougo/vimproc'

" original repos on github
Bundle 'gmarik/vundle'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'vim-scripts/tComment'
" Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/grep.vim'
" Bundle 'ahao/vimcdoc'

" ctrlp.vim
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" snipMate
" Bundle 'msanders/snipmate.vim'
" let g:snippets_dir = "$HOME/.vim/snippets"
Bundle "SirVer/ultisnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", expand('~/.vim/snippets/')]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vim-session
Bundle 'xolox/vim-misc'
" Bundle 'xolox/vim-session'
" set sessionoptions+=resize,winpos
let g:session_directory = expand('~/.tmp/sessions')
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Command-T
Bundle 'wincent/Command-T'
let g:CommandTMaxHeight=15

Bundle 'klen/python-mode'
let g:pymode_folding = 0
let g:pymode_motion = 0
let g:pymode_lint_ignore = "E302,E501,W901"
let g:pymode_rope = 0

" vim-javascript
Bundle "pangloss/vim-javascript"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

Bundle "mitsuhiko/vim-jinja"
Bundle "vim-scripts/iptables"
Bundle "groenewege/vim-less"
Bundle "vim-scripts/applescript.vim"
" Bundle "ratazzi/blackboard.vim"
Bundle "zaiste/tmux.vim"
Bundle "brandonbloom/vim-proto"
Bundle "tsaleh/vim-matchit"
Bundle "tpope/vim-markdown"
Bundle "mileszs/ack.vim"
Bundle "rodjek/vim-puppet"
Bundle "tshirtman/vim-cython"

" Rails
Bundle "tpope/vim-rails"

" easy-align
Bundle "junegunn/vim-easy-align"
vnoremap <silent> <Enter> :EasyAlign<Enter>

Bundle "Lokaltog/vim-powerline"
Bundle "junegunn/goyo.vim"
Bundle "dag/vim-fish"

" vim-startify
Bundle "mhinz/vim-startify"
let g:startify_session_dir = expand('~/.tmp/sessions')
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']

" NeoBundleCheck
" }}}
