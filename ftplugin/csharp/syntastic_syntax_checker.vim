"============================================================================
"Description: Syntax checking plugin for syntastic.vim
"============================================================================

if exists("loaded_vim_csharp_syntax_checker")
    finish
endif
let loaded_vim_csharp_syntax_checker = 1

"bail if the user doesnt have ruby installed
if !executable("gmcs")
    finish
endif

function! SyntaxCheckers_cs_GetLocList()
    let makeprg = 'gmcs -checked --parse '.shellescape(expand('%'))
    let errorformat =  '%E%f(%l,%c): error %m,%W%f(%l,%c): warning %m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction
