if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

setlocal lisp
setlocal lispwords=test,define,execute,lambda,match,match-all
setlocal lispwords+=let,letrec,do,type,macro
setlocal comments=:;;;,:;;,:;,sr:#\|,mb:\|,ex:\|#
setlocal define=^\\s*(def\\k*
setlocal matchpairs+=<:>
setlocal formatoptions-=t
setlocal formatoptions+=rol
setlocal iskeyword+=+,-,*,/,:,=,$,&,!,?,@-@

let b:undo_ftplugin = "setlocal com< def< mps< fo< isk< lisp< lw<"
