" markdown filetype file
if exists("did_load_filetypes")
    finish
endif

" augroup markdown
"     au! BufRead,BufNewFile *.mkd setfiletype mkd
"     au! BufRead,BufNewFile *.md setfiletype mkd
" augroup END
" 
" augroup task
"     au! BufNewFile,BufRead todo.txt,*.todo,*.task,*.tasks  setfiletype task
" augroup END

augroup nginx
    au! Bufread,BufWrite nginx.conf,/etc/nginx/* setf nginx
augroup END

augroup keepalived
    au! Bufread,BufWrite keepalived.conf,/etc/keepalived/*,keepalived.conf.* setf keepalived
augroup END
