" Vim global plugin
" Last Change: 2011 Jul 24
" Maintainer: ratazzi <ratazzi.potts@gmail.com>
" License: http://ratazzi.org/

let s:save_cpo = &cpo
set cpo&vim
let s:cwd = getcwd()

function s:GitShow()
    let s:cline = getline(line('.'))
    let s:commit = matchstr(s:cline, '[a-f0-9]\{40}')
    if strlen(s:commit) == 40
        let s:cmd = 'cd '.s:cwd.' && git show '.s:commit
        let s:rs = system(s:cmd)
        let s:diffbuf = tempname()
        exec 'split '.s:diffbuf
        set filetype=git
        for s:line in split(s:rs, "\n")
            call append(line('$') - 1, s:line)
        endfor
        call cursor(1, 1)
        write
    endif
endfunction

function s:GitCommitNext(flag)
    if a:flag == 1
        let s:flag = 'n'
    else
        let s:flag = 'nb'
    endif
    let [s:lnum, s:col] = searchpos('^commit\s', s:flag)
    call cursor(s:lnum, 1)
endfunction

function s:GitLog(gitdir)
    if strlen(a:gitdir) > 1
        let s:cwd = a:gitdir
    endif
    let s:cmd = 'cd '.s:cwd.' && git log -10'
    let s:diffbuf = tempname()
    exec 'edit '.s:diffbuf
    set filetype=git
    let s:log = system(s:cmd)
    for s:line in split(s:log, "\n")
        call append(line('$') - 1, s:line)
    endfor
    call cursor(1, 1)
    write
endfunction

if !exists(':GitLog')
    command -nargs=? -complete=dir GitLog :call s:GitLog(<q-args>)
    command GitShow :call s:GitShow()
    command GitCommitNext :call s:GitCommitNext(1)
    command GitCommitPrev :call s:GitCommitNext(-1)
    map <Space>l :GitLog<CR>
    map <Space>s :GitShow<CR>
    map <Space>n :GitCommitNext<CR>
    map <Space>p :GitCommitPrev<CR>
endif

let &cpo = s:save_cpo
