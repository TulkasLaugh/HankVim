function! FormatAntOutput()
    :0,11d
    let positionList = searchpos("all")
    let x = positionList[0]
    :call cursor(x,0)
    :.,$d
    /[java\]
    :%s///g
    :%normal 6x
    :set ts=2 sts=2 noet
    :retab!
    :set ts=4 sts=4 noet
endfunction

function! FormatCurlyBrackets()
    :%s/{/^M{/g
    :$normal gg=G
endfunction

function! SmallIndent()
    :set ts=2 sts=2 sw=2 et
endfunction
