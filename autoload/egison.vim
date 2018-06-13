set splitbelow

if has('nvim') || has('vim8')
    nnoremap <C-L> :call EgisonExec()<CR><CR>
endif

function! EgisonExec()
    let tmp = tempname()
    try
        let s:now_pos = getpos(".")
        let s:fin_pos = search(')', 'b')
        let s:start_pos = searchpair('(', '', ')', 'b')

        execute s:start_pos . "," . s:fin_pos . "write " . tmp
        call setpos('.', s:now_pos)

        let nowbuf_num = bufnr('%')
        let termbuf_num = bufnr('egison-term')

        if termbuf_num == -1
            execute "terminal egison"
            execute "file egison-term"
        else
            execute "b " . termbuf_num
        endif

        set modifiable
        let message = join(readfile(tmp,'b'), "\n")
        
        startinsert
        call feedkeys(message, "i")
        " stopinsert

        " execute "b " . nowbuf_num
        
    finally
        call delete(tmp)
    endtry
endfunction
