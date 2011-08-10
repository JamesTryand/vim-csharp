"============================================================================
"Description: Syntax checking plugin for syntastic.vim
"============================================================================


if exists("loaded_vim_csharp_syntax_checker")
    finish
endif

let loaded_vim_csharp_syntax_checker = 1
let loaded_csharp_syntax_checker = 1
let loaded_cs_syntax_checker = 1

"fail if the user doesnt have mono installed
if !executable("gmcs")
    finish
endif


function! SyntaxCheckers_cs_GetLocList()
    let makeprg = 'gmcs -checked --parse %'
    let errorformat =  '%-GCompilation failed%#,%E%f(%l\,%c): error %m,%W%f(%l\,%c): warning %m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

function! SyntaxCheckers_csharp_GetLocList()
  return SyntaxCheckers_cs_GetLocList()
endfunction
