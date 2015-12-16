" Author ratazzi <ratazzi.potts@gmail.com>
" URL http://www.ratazzi.org/

set nocompatible
set shell=bash
set ttyfast
set noerrorbells
set visualbell
" modeline
set modelines=2
set laststatus=2
set title

" set synmaxcol=128
" set ttyscroll=3
" set lazyredraw " to avoid scrolling problems
set ttyfast ttymouse=xterm2 lazyredraw ttyscroll=3

" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
    source ~/.vim/vundles.vim
endif

" shortcut
let mapleader=","
map <leader>m <C-W>_
map <leader>g :CommandT<CR>
map <leader>b :CommandTBuffer<CR>
map <leader>t :tj<CR>
" inoremap jj <ESC>

" Location bindings
noremap <leader>e :lopen<CR>
noremap <leader>] :lnext<CR>
noremap <leader>[ :lprev<CR>

" paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" indent and tabstop
set autoindent
set smartindent
set tabstop=4
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set shiftround

" general options
" set textwidth=110
syntax on
filetype on
filetype plugin on
filetype indent on

set history=1000
set magic
set number
set ruler
set hlsearch
set incsearch
set showmode
" Show the (partial) command as it’s being typed
set showcmd
set nobackup
set showmatch
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936
set fileencoding=utf-8
set enc=utf-8 nobomb
" set fileformat=unix
set fileformats+=dos
set dictionary+=/usr/share/dict/words
" swapfile dirs
set dir=$HOME/.tmp//,$HOME/tmp//
set wildignore+=.DS_Store,*.sw?,.git,.svn,.hg
set wildignore+=*.pyc,*.egg,*.egg-info
set tags+=./tags,tags,$HOME/.tmp/tags,~/.vimtags
set ignorecase smartcase

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

if has('persistent_undo')
    silent !mkdir -p ~/.tmp/undo > /dev/null 2>&1
    set undofile
    set undodir=$HOME/.tmp/undo
    set undolevels=500
endif

" set noimd
" set ims
" au InsertEnter * set noimd
" au InsertLeave * set imd
" au FocusGained * set imd

" hide toolbar, menu {{{
if has("gui")
    set guioptions-=T
    set transparency=5
endif
" }}}

" fonts {{{
if has('mac')
    set t_Co=256
    " set guifont=Monaco:h14
    set guifont=PT\ Mono:h14
    " set guifont=Monoid:h12
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
    " set cursorline
    silent! colorscheme smyck
elseif &t_Co > 255 
    " xterm-256color
    silent! colorscheme smyck
else
    " xterm-color
    colorscheme default
endif
" }}}

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" autocmd {{{
autocmd! BufWritePost .vimrc source $HOME/.vimrc
au BufNewFile,BufRead *.pac set syntax=pac
au BufNewFile,BufRead *.yaml.sample,*.yml.sample :set ft=yaml
au BufNewFile,BufRead *.yaml,*.yaml.sample,*.yml,*.yml.sample :setlocal shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.md,*.mkd,*.markdown set ai formatoptions=tcronqn2 comments=n:>
au BufRead,BufNewFile *.css set ft=css syntax=css3 
au BufNewFile,BufRead *.rb,*.erb,Rakefile,Podfile,*.html set shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.js,*.coffee set shiftwidth=2 tabstop=2
au BufReadCmd *.ipa,*.apk,*.fla call zip#Browse(expand("<amatch>"))
au BufNewFile,BufRead *.py setlocal textwidth=79 nosmartindent
" autocmd BufWritePost *
"       \ if filereadable('tags') |
"       \   call system('ctags -a '.expand('%')) |
"       \ endif

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
set nofoldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
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

let g:NERDTreeWinPos = "right"

" vim: fdm=marker
