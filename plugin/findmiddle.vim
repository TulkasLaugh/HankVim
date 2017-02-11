function! GoToMiddle()
    let wholeLine = getline(line("."))
    let lineChars = split(wholeLine, '\zs')
    let n = 0
    while n < len(lineChars)
        let char = char2nr(get(lineChars, n))
        if char  == 9 || char == 32
            let n = n + 1
        else
            break
        endif
    endwhile
    let middleColumn = (n + strlen(getline(line(".")))) / 2
    call cursor(0,middleColumn)
endfunction
