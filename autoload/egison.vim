set splitbelow

if has('nvim') || has('vim8')
    nnoremap <C-L> :call EgisonExec()<CR><CR>
endif

function! EgisonExec()
    let tmp = tempname()
    try
        let s:fin_pos = search(')', 'b')
        let s:start_pos = searchpair('(', '', ')', 'b')

        execute s:start_pos . "," . s:fin_pos . "write " . tmp

        let now_num = bufnr('.')
        let termbuf_num = bufnr('egison-term')

        if termbuf_num == -1
            execute "terminal egison"
            execute "file egison-term"
        else
            execute "b " . termbuf_num
        endif

        " set modifiable
        " execute "r " . tmp

    finally
        call delete(tmp)
    endtry
endfunction
