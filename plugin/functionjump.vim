function! AlignToFunction()
    if (&filetype == "cpp" || &filetype == "c" || &filetype == "java")
        let line = getline(".")
        if strlen(line) == 1
            let lineNumber = line(".") - 1
            call setpos(".", [0, lineNumber, 1])
        else
            call setpos(".", [0, line("."), 1])
        endif
    endif
endfunction
