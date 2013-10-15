" Author ratazzi <ratazzi.potts@gmail.com>
" URL http://www.ratazzi.org/

" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on github
Bundle 'gmarik/vundle'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/grep.vim'
Bundle 'ahao/vimcdoc'

" ctrlp.vim
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" Taglist
Bundle 'vim-scripts/taglist.vim'
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let tlist_php_settings = 'php;c:Classes;f:Functions;d:Constants;j:Javascript Functions'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open = 0

" snipMate
Bundle 'msanders/snipmate.vim'
let g:snippets_dir = "$HOME/.vim/snippets"

" vim-session
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
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
Bundle "ratazzi/blackboard.vim"
Bundle "zaiste/tmux.vim"
Bundle "brandonbloom/vim-proto"
Bundle "tsaleh/vim-matchit"
Bundle "tpope/vim-markdown"
Bundle "samsonw/vim-task"
Bundle "mileszs/ack.vim"
Bundle "rodjek/vim-puppet"
Bundle "tshirtman/vim-cython"
Bundle "vim-scripts/Conque-Shell"

" Rails
Bundle "tpope/vim-rails"

" easy-align
Bundle "junegunn/vim-easy-align"
vnoremap <silent> <Enter> :EasyAlign<Enter>

Bundle "Lokaltog/vim-powerline"

" Bundle "vim-scripts/activity-log"
" let g:activity_log_location = '~/.tmp/activity/%Y.log'
" }}}

" shortcut
map <Space>m <C-W>_
" map <Space>g 2<C-]>
map <Space>g :CommandT<CR>
map <Space>b :CommandTBuffer<CR>
map <Space>t :TlistToggle<CR>
map <Space>f :NERDTreeToggle<CR>
map <Space>r :PromptVimTmuxCommand<CR>
inoremap jj <ESC>

" vimux
map <Leader>rp :PromptVimTmuxCommand<CR>
map <Leader>rl :PromptVimTmuxCommand<CR>
map <Leader>ri :InspectVimTmuxRunner<CR>
map <Leader>rq :CloseVimTmuxRunner<CR>
map <Leader>rx :CloseVimTmuxPanes<CR>
let VimuxUseNearestPane = 1
let VimuxHeight = "20"

" indent and tabstop
set autoindent shiftwidth=4
set cindent shiftwidth=4
set smartindent
set tabstop=4
set expandtab

" general options
" set textwidth=110
set helplang=cn
set history=100
set magic
set number
set ruler
set hlsearch
set incsearch
set showmode
set showcmd
set nocompatible
set nobackup
set showmatch
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936
set fileencoding=utf-8
set enc=utf-8
set fileformat=unix
set dictionary+=/usr/share/dict/words
" swapfile dirs
set dir=$HOME/.tmp//,$HOME/tmp//
set wildignore+=.DS_Store,*.sw?,.git,.svn,.hg
set wildignore+=*.pyc,*.egg,*.egg-info
set tags+=./tags,tags,$HOME/.tmp/tags
set modelines=2
set undofile
set undodir=$HOME/.tmp/undo
set undolevels=500
"set transparency=12
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" man
runtime ftplugin/man.vim

" NERDTree
let NERDTreeIgnore=['pyc']

" hide toolbar, menu {{{
if has("gui")
    "set guioptions-=e
    "set guioptions-=m
    set guioptions-=T
endif
" }}}

" fonts {{{
if has('mac')
    set t_Co=256
    set guifont=Monaco:h14
elseif has('win32')
    set guifont=Courier_New:h10:cANSI
    language messages en_US.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
else
    set guifont=Ubuntu\ Mono\ 13
    set guifontwide=WenQuanYi\ Micro\ Hei\ Mono\ 12
    if has('gui_running')
        set lines=35
        set columns=100
    endif
endif
" }}}

" colorscheme {{{
if has('gui_running')
    silent! colorscheme smyck
elseif &t_Co > 255 
    " xterm-256color
    silent! colorscheme smyck
else
    " xterm-color
    colorscheme default
endif
" }}}

" .vimrc auto reload {{{
autocmd! BufWritePost .vimrc source $HOME/.vimrc
if has('win32')
    autocmd! BufWritePost _vimrc source $HOME/_vimrc
    let NERDTreeIgnore=['ntuser', 'NTUSER']
endif
" }}}

" autocmd {{{
" tab to space
" au BufWrite *.php,*.py,*.yaml,*.html,*.css :%retab
" to unix
" au BufWrite *.* :set fileformat=unix

au BufNewFile,BufRead *.pac set syntax=pac
au BufNewFile,BufRead *.yaml.sample,*.yml.sample :set ft=yaml
au BufNewFile,BufRead *.yaml,*.yaml.sample,*.yml,*.yml.sample :setlocal shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.md,*.mkd,*.markdown set ai formatoptions=tcronqn2 comments=n:>
au BufRead,BufNewFile *.css set ft=css syntax=css3 
au BufNewFile,BufRead *.rb set shiftwidth=2 tabstop=2
au BufReadCmd *.ipa,*.apk call zip#Browse(expand("<amatch>"))

" Automating read-only access to existing files
autocmd SwapExists * let v:swapchoice = 'o'
" }}}

" 保存文件最后编辑位置 {{{
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" }}}

" When editing a file, always jump to the last known cursor position.
" And open enough folds to make the cursor is not folded
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim). 

" fold settings {{{
autocmd BufWinEnter *
            \ if line("'\"") <= line("$") |
            \   exe "normal! g`\"" | exe "normal! zv" |
            \ endif

set foldmethod=indent
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" }}}

" status line {{{
set laststatus=2
" set statusline=%1*[%n]\ %2*%f\ %3*%y\ [%{&fenc}]\ [%{&ff}]\ %=%4*line:%2*%l,%c\ \ \ %1*%P
" hi User1 guifg=#b2e974 guibg=black gui=bold ctermfg=149 cterm=bold
" hi User2 guifg=#60a3f6 guibg=black gui=bold ctermfg=75 cterm=bold
" hi User3 guifg=#e8cc8f guibg=black gui=bold ctermfg=222 cterm=bold
" hi User4 guifg=gray guibg=black gui=bold ctermfg=gray cterm=bold
" }}}

" keyboard, mouse in Linux, Win {{{
set mouse=a
set selection=exclusive
set selectmode=mouse,key

behave mswin
set backspace=indent,eol,start whichwrap+=<,>,[,]

vnoremap <BS> d

vnoremap <C-X> "+x
vnoremap <C-Del> "+x

vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

cmap <S-Insert> "+gP
cmap <S-Insert> <C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-C>:update<CR>
" }}}

" vimrc local
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif


" vim: fdm=marker
