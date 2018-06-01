set splitbelow

let g:tmp_path = "/tmp/.tmp.txt"

vnoremap <C-L> :w! g:tmp_path<CR>
let message = system('egison -t ' . g:tmp_path)
nnoremap <C-L> :echo message<CR>
