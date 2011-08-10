
function! s:Ident(line1, line2)
  let sw = &shiftwidth
  let id = repeat(" ", sw)
  for i in range(a:line1, a:line2)
    let l = id.getline(i)
    call setline(i, l)
  endfor
endfunction

function! s:BlockWrap(line1, line2, type)
  let ind1 = repeat(" ", indent(a:line1))."{"
  let ind2 = repeat(" ", indent(a:line2))."}"
  call s:Ident(a:line1, a:line2)
  call append(a:line1-1, ind1)
  call append(a:line2+1, ind2)
endfunction

command! -nargs=0 -range CSWrapBlock call s:BlockWrap(<line1>, <line2>, "")
vmap <S-C-J> :CSWrapBlock<cr>


