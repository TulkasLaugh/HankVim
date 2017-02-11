function! CreateDirectory()
    !mkdir -p %:h
    :w
endfunction
