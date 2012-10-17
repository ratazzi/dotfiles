" markdown filetype file
if exists("did_load_filetypes")
    finish
endif

augroup nginx
    au! Bufread,BufWrite nginx.conf,/etc/nginx/* setf nginx
augroup END

augroup keepalived
    au! Bufread,BufWrite keepalived.conf,/etc/keepalived/*,keepalived.conf.* setf keepalived
augroup END
